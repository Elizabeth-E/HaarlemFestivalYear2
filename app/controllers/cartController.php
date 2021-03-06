<?php
namespace App\Controllers;
 
use App\Models;

const VAT = 0.21;
 
class CartController extends AppController
{
    private $cartPages = [];
    private $errorType = "";
    private $errorMessage = ""; 

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;
 
        $this->model = new Models\cartModel();
        $lang = $this->getLanguage();
        $this->cartPages = $this->model->retrieveCartPages($lang);
        
        $this->cartButtons();
        $this->checkShoppingCartTimer();
    }
 
    //This method contains every button that can be used to perform a another method in the cart
    private function cartButtons()
    {
        if(isset($_POST['add_ticket']))
           $this->checkTicket();
        else if(isset($_POST['delete_single']))
           $this->deleteSingleTicket();
        else if(isset($_POST['delete_tickets']))
           $this->deleteAllTickets();
    }
 
    //Calculates the total price of all items inside the cart
    public function calculateTotalPayment(): float
    {
        $total = 0.00;
        if(isset($_SESSION['shoppingCart']) != null) {
            foreach($_SESSION['shoppingCart'] as $ticket) {
                // Handle jazz tickets
                if (isset($ticket['eventType']) && ($ticket['eventType'] == 'jazz' || $ticket['eventType'] == 'allday')) {
                    $total += $ticket['price'] * $ticket["tickets"];
                }
                else {
                    $total += $ticket[1];
                }
            }
        }

        return $total;
    }
 
    //Returns any items inside the shoppingCart variable
    public function checkShoppingCart():array
    {
        $cart = array();
 
        if(isset($_SESSION['shoppingCart']))
            foreach($_SESSION['shoppingCart'] as $ticket)
                $cart[] = $ticket;
        
        return $cart; 
    }
 
    //Checks if the ticket can be added into the cart
    private function checkTicket()
    {
        try
        {
            if($this->userSelectedTickets())
                if($this->isAvailable())
                    $this->createTicket();
                else 
                   throw new \Exception("Only " . $_POST['hidden_amount'] . " people can be added to this activity");
            else
                throw new \Exception("Please select a ticket");            
        }
        catch(\Exception $e)
        {
            $this->errorType = "Warning";
            $this->errorMessage = $e->getMessage();
            $this->checkError();
        }     
    }

    private function isInCart(array $ticket) : int {
        // See if there are items in the shopping cart
        if ( ! isset($_SESSION['shoppingCart']) || count($_SESSION['shoppingCart']) == 0) {
            return -1;
        }

        // Look for tickets
        foreach ($_SESSION['shoppingCart'] as $key => $item) {
            // Only needed untill we all use the better ticket format
            if (isset($item['eventType']) && $item['eventType'] == 'jazz') {
                if ($item['event'] == $ticket['event']) {
                    return $key;
                }
            }
        }
        return -1;        
    }

    public function add_to_cart(array $params) {
        try {
            // See if minimal required info is there
            if ( isset($_POST['ticketid']) && isset($_POST['event']) && isset($_POST['amount']) && 
                isset($_POST['tickets']) && isset($_POST['type']) && isset($_POST['amount']) ) {

                // Make sure at least one ticket has been submitted
                if (intval($_POST['tickets']) <= 0) {
                    throw new \Exception("Please select at least one ticket.");    
                }

                // Fill base ticket
                $ticket = [
                    "event" => $_POST['event'],
                    "eventType" => $_POST['type'],
                    "day" => $_POST['day'],
                    "price" => $_POST['price'],
                    "totalPrice" => $_POST['amount'],
                    "tickets" => $_POST['tickets'],
                    "ticketid" => $_POST['ticketid'],
                ];

                // Add Jazz specific data
                if ($ticket["eventType"] == "jazz") {
                    $ticket["time"] = $_POST['time'];
                    $ticket["img"] = $_POST['img'];
                    $ticket["location"] = $_POST['location'];
                    $ticket["artist"] = $_POST['name'];
                }

                // Update existing ticket with new price
                $ticketIndex = $this->isInCart($ticket);
                if ($ticketIndex >= 0) {
                    $_SESSION['shoppingCart'][$ticketIndex]['price'] += $ticket['price'];
                    $_SESSION['shoppingCart'][$ticketIndex]['tickets'] += $ticket['tickets'];
                } 
                else  // Add new ticket
                {
                    $_SESSION['shoppingCart'][] = $ticket;
                }

                exit("[success]Ticket has been created!");
            } else {
                throw new \Exception("Not all ticket data is supplied!");
            }
        } catch(\Exception $e){
            exit($e->getMessage());
        }
    }
 
    /*This is used to create a ticket. This method will also check if the user has selecting more than one ticket, and 
    if the tickets are still available.*/
    private function createTicket()
    {
        try{
            if((strpos($_POST['hidden_event_name'], 'Night')) !== false || (strpos($_POST['hidden_event_name'], 'Beer')) !== false || (strpos($_POST['hidden_event_name'], 'Cocktail')) !== false || (strpos($_POST['hidden_event_name'], 'Hookah')) !== false)
                $ticket = array('Haarlem At Night - ' . $_POST['hidden_event_name'], (float)$_POST['hidden_total_payment'], strtotime($_POST['hidden_date']), $_POST['hidden_language'], $_POST['hidden_guide_name'], (int)$_POST['hidden_regular_amount'], (int)$_POST['hidden_family_amount'], (float)$_POST['hidden_regular_price'], (float)$_POST['hidden_family_price']);
            else if((strpos($_POST['hidden_event_name'], 'Restaurant')) !== false)
                $ticket = array($_POST['hidden_event_name'], (float)$_POST['hidden_total_payment'], (int)$_POST['no_of_adults'], (int)$_POST['no_of_kids'], strtotime($_POST['hidden_time']), strtotime ($_POST['hidden_date']), $_POST['hidden_comment'], (float)$_POST['hidden_food_price']);
            
            if($this->checkDuplicateTicket($ticket)){
                $key = $this->retrieveKey($ticket);
    
                if(strpos($_SESSION['shoppingCart'][$key][0], 'Night') !== false && ((int)$_POST['hidden_amount'] - (($_SESSION['shoppingCart'][$key][5] + $ticket[5]) + (($_SESSION['shoppingCart'][$key][6] * 4) + ($ticket[6] * 4))) >= 0)){
                    $_SESSION['shoppingCart'][$key][1] += $ticket[1];
                    $_SESSION['shoppingCart'][$key][5] += $ticket[5];
                    $_SESSION['shoppingCart'][$key][6] += $ticket[6];          
                }
                else
                    throw new \Exception("Only " . $_POST['hidden_amount'] . " people can be added to this activity");
            }
            else
                $_SESSION['shoppingCart'][] = $ticket;       
        }
        catch(\Exception $e){
            $this->errorType = "Warning";
            $this->errorMessage = $e->getMessage();
            $this->checkError();
        }
    }

    //Returns a key from the shoppingCart array if the array contains the same ticket
    private function retrieveKey(array $ticket):int
    {
        $key = 0;

        foreach($_SESSION['shoppingCart'] as $value)
            if(strpos($value[0], 'Night') !== false)
            {
                if($value[0] == $ticket[0] && $value[2] == $ticket[2] && $value[3] == $ticket[3] && $value[4] == $ticket[4]) //checks the event of the ticket, date, language, and guide
                    $key = key($_SESSION['shoppingCart']);

                next($_SESSION['shoppingCart']);
            }                               

        return $key;
    }

    //Checks if the ticket already exist in the shoppingCart array
    private function checkDuplicateTicket(array $ticket): bool
    {
        if(isset($_SESSION['shoppingCart']))
            foreach($_SESSION['shoppingCart'] as $value)
                if(strpos($value[0], 'Night') !== false)
                    if($value[0] == $ticket[0] && $value[2] == $ticket[2] && $value[3] == $ticket[3] && $value[4] == $ticket[4]) //checks the event of the ticket, date, language, and guide
                        return true;
				else if(strpos($value[0], 'Restaurant') != false)
                    if($value[0] == $ticket[0] && $value[1] == $ticket[1] && $value[2] == $ticket[2] && $value[3] == $ticket[3] && $value[4] == $ticket[4] && $value[5] == $ticket[5] && $value[6] == $ticket[6])
                        return true;
 
        return false;		
    }
 
    //Checks the amount of users which can be involved in an activity
    private function isAvailable():bool
    {
        if((strpos($_POST['hidden_event_name'], 'Night')) !== false || (strpos($_POST['hidden_event_name'], 'Beer')) !== false || (strpos($_POST['hidden_event_name'], 'Cocktail')) !== false || (strpos($_POST['hidden_event_name'], 'Hookah')) !== false)
            if((int)$_POST['hidden_amount'] - (((int)$_POST['hidden_family_amount'] * 4)) + (int)$_POST['hidden_regular_amount'] >= 0)
                return true;
       else if((strpos($_POST['hidden_event_name'], 'Restaurant')) !== false)
			if((int)$_POST['hidden_amount'] - (((int)$_POST['no_of_adults'] * 10)) + (int)$_POST['no_of_kids'] >= 0)
                return true;

        return false;
    }
 
    //Checks if the user has selected a ticket.
    private function userSelectedTickets():bool
    {
        if((strpos($_POST['hidden_event_name'], 'Night')) !== false || (strpos($_POST['hidden_event_name'], 'Beer')) !== false || (strpos($_POST['hidden_event_name'], 'Cocktail')) !== false || (strpos($_POST['hidden_event_name'], 'Hookah')) !== false)
            if((int)$_POST['hidden_family_amount'] || (int)$_POST['hidden_regular_amount'] != 0)
                return true;	
		else if(strpos($_POST['hidden_event_name'], 'Restaurant') != false)
            if((int)$_POST['no_of_adults'] != 0 || (int)$_POST['no_of_kids'] != 0 || (int)$_POST['hidden_amount'] != 0)
                return true;

        return false;
    }
 
    //Deletes all tickets inside the shoppingCart session.
    private function deleteAllTickets()
    {
        unset($_SESSION['shoppingCart']);
    }
 
    /*This method will first check which event the selected ticket belongs to and put the variables in an array. The array will be send to
    the retrieveKey method and returns the position in the shoppingCart session which the user wants to delete*/
    private function deleteSingleTicket()
    {
        if(strpos($_POST['hidden_cart_event_name'], 'Night') !== false)
            $deleteTicket = array($_POST['hidden_cart_event_name'], $_POST['hidden_cart_total'], $_POST['hidden_cart_date'], $_POST['hidden_cart_language'], $_POST['hidden_cart_guide'], $_POST['hidden_cart_regular'], $_POST['hidden_cart_family'], $_POST['hidden_cart_regular_price'], $_POST['hidden_cart_family_price']);     
		else  if((strpos($_POST['hidden_event_name'], 'Restaurant')) !== false)
            $deleteticket = array($_POST['no_of_adults'], $_POST['no_of_kids'], $_POST['hidden_time'], $_POST['hidden_event_name'], $_POST['hidden_date'], $_POST['hidden_comment'], $_POST['hidden_food_price'], $_POST['hidden_total_payment']);
                
        $key = $this->retrieveKey($deleteTicket);
        unset($_SESSION['shoppingCart'][$key]);
    }
 
    //If the shoppingCart session exist for 24 hours, it will be deleted by using the deleteAllTickets method.
    private function checkShoppingCartTimer()
    {
        if(!empty($_SESSION['shoppingCart']))
        {
            if (isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY'] > 86400))
                $this->deleteAllTickets();
 
            $_SESSION['LAST_ACTIVITY'] = time(); // update last activity time stamp
        }
    }
 
    //Calculates all the ticket cost with VAT and redirect the user to the review page
    public function confirmTickets()
    {     
        $this->getCart();

        if(isset($_SESSION['shoppingCart']))
            $this->view->assign("tickets", $_SESSION['shoppingCart']);
        else
            $this->view->assign("tickets", null);
            
        $this->view->assign("cost", $this->calculateTotalPayment());
        $this->view->assign("cost_with_VAT", $this->calculateTotalPayment() * VAT);

        foreach($this->cartPages as $page)
        {
            if(strpos($page->getPageHeader(), 'Review') !== false)
            {
                $this->view->assign("title", $page->getPageHeader());
                $this->view->assign("page_title", $page->getPageName());
            }
        }
        
        $this->setBackground("reviewBackground.jpg");
        $this->view->display("cart/reviewPage.tpl");
    }

    //This is used to send the error messages to the alert template
    public function checkError(): bool
    {
        if($this->errorType != null && $this->errorMessage != null)
            return true;

        return false;
    }

    //returns error message
    public function getErrorMessage(): string
    {
        return $this->errorMessage;
    }

    //returns error type
    public function getErrorType(): string
    {
        return $this->errorType;
    }

    /*checks if the user has already logged in in order to checkout. If they have, they will be redirected to the payment view.
     Else, they will need to login first*/
    public function checkout()
    {
        if(isset($_SESSION['userId']))
            header("Refresh:0; url=" . BASE_URL . "/checkout", true, 200);  
        else 
            header("Refresh:0; url=" . BASE_URL . "/user/login", true, 200);  
    }
}
?>
