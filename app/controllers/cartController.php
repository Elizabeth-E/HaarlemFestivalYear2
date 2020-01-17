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
        $this->cartPages = $this->model->retrieveCartPages();
        
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
 
        if(isset($_SESSION['shoppingCart']) != null)
            foreach($_SESSION['shoppingCart'] as $ticket)     
                $total += $ticket[1];
 
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
 
    //This is used to create a ticket. This method will also check if the user has selecting more than one ticket, and if the tickets are available.
    private function createTicket()
    {
        try{
            if((strpos($_POST['hidden_event_name'], 'Night')) !== false || (strpos($_POST['hidden_event_name'], 'Beer')) !== false || (strpos($_POST['hidden_event_name'], 'Cocktail')) !== false || (strpos($_POST['hidden_event_name'], 'Hookah')) !== false)
                $ticket = array('Haarlem At Night - ' . $_POST['hidden_event_name'], (float)$_POST['hidden_total_payment'], strtotime($_POST['hidden_date']), $_POST['hidden_language'], $_POST['hidden_guide_name'], (int)$_POST['hidden_regular_amount'], (int)$_POST['hidden_family_amount'], (float)$_POST['hidden_regular_price'], (float)$_POST['hidden_family_price']);
            
            if($this->checkDuplicateTicket($ticket))
            {
                $key = $this->retrieveKey($ticket);

                if(strpos($_SESSION['shoppingCart'][$key][0], 'Night') !== false && ((int)$_POST['hidden_amount'] - (($_SESSION['shoppingCart'][$key][5] + $ticket[5]) + (($_SESSION['shoppingCart'][$key][6] * 4) + ($ticket[6] * 4))) >= 0)){
                $ticket = array('Haarlem At Night - ' . $_POST['hidden_event_name'], (float)$_POST['hidden_total_payment'], strtotime($_POST['hidden_date']), $_POST['hidden_language'], $_POST['hidden_guide_name'], (int)$_POST['hidden_regular_amount'], (int)$_POST['hidden_family_amount'], (float)$_POST['hidden_regular_price'], (float)$_POST['hidden_family_price']);      
				else if((strpos($_POST['hidden_event_name'], 'Restaurant')) !== false)
			$ticket = array($_POST['hidden_event_name'], (float)$_POST['hidden_total_payment'], $_POST['no_of_adults'], $_POST['no_of_kids'], strtotime($_POST['hidden_time']),
			strtotime ($_POST['hidden_date']), $_POST['hidden_comment'], (float)$_POST['hidden_food_price']);

            if($this->checkDuplicateTicket($ticket)){
                $key = array_search($ticket, $_SESSION['shoppingCart']);
    
                if(strpos($_POST['hidden_event_name'], 'Night') !== false && ((int)$_POST['hidden_amount'] - (($_SESSION['shoppingCart'][$key][5] + $ticket[5]) + (($_SESSION['shoppingCart'][$key][6] * 4) + ($ticket[6] * 4))) >= 0)){
                    $_SESSION['shoppingCart'][$key][5] += $ticket[5];
                    $_SESSION['shoppingCart'][$key][6] += $ticket[6];
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
                    
            {foreach($_SESSION['shoppingCart'] as $value)
                if(strpos($value[0], 'Night') != false)
                {
                    if($value[0] == $ticket[0] && $value[2] == $ticket[2] && $value[3] == $ticket[3] && $value[4] == $ticket[4])
                    return true;
                }

				else  if(strpos($value[0], 'Restaurant') != false)
                {
                    if($value[0] == $ticket[0] && $value[1] == $ticket[1] && $value[2] == $ticket[2] && $value[3] == $ticket[3] 
					&& $value[4] == $ticket[4] && $value[5] == $ticket[5] && $value[6] == $ticket[6])

                    return true;
                }
				}
        return false;
		
    }
 
    //Checks the amount of users which can be involved in an activity
    private function isAvailable():bool
    {
        if((strpos($_POST['hidden_event_name'], 'Night')) !== false || (strpos($_POST['hidden_event_name'], 'Beer')) !== false || (strpos($_POST['hidden_event_name'], 'Cocktail')) !== false || (strpos($_POST['hidden_event_name'], 'Hookah')) !== false)
            if((int)$_POST['hidden_amount'] - (((int)$_POST['hidden_family_amount'] * 4)) + (int)$_POST['hidden_regular_amount'] >= 0)
                return true;
 
 else if((strpos($_POST['hidden_event_name'], 'Restaurant')) !== false )
			if((int)$_POST['hidden_amount'] - (((int)$_POST['no_of_adults'] * 10)) + (int)$_POST['no_of_kids'] >= 0)
                return true;

        return false;
    }
 
    //Checks if the user has selected a ticket type
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
 
    //Deletes the tickets inside the cart
    private function deleteAllTickets()
    {
        unset($_SESSION['shoppingCart']);
    }
 
    //Search the array to find and delete the ticket which the user has selected
    private function deleteSingleTicket()
    {
        if(strpos($_POST['hidden_cart_event_name'], 'Night') !== false)
            $deleteTicket = array($_POST['hidden_cart_event_name'], $_POST['hidden_cart_total'], $_POST['hidden_cart_date'], $_POST['hidden_cart_language'], $_POST['hidden_cart_guide'], $_POST['hidden_cart_regular'], $_POST['hidden_cart_family'], $_POST['hidden_cart_regular_price'], $_POST['hidden_cart_family_price']); 
        $key = $this->retrieveKey($deleteTicket);

			else  if((strpos($_POST['hidden_event_name'], 'Restaurant')) !== false)
				$deleteticket = array($_POST['no_of_adults'], $_POST['no_of_kids'], $_POST['hidden_time'], $_POST['hidden_event_name'], $_POST['hidden_date'], $_POST['hidden_comment'], $_POST['hidden_food_price'], $_POST['hidden_total_payment']);

        $key = array_search($deleteTicket, $_SESSION['shoppingCart']);
        unset($_SESSION['shoppingCart'][$key]);
    }
 
    //Deletes the tickets after 24 hours
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
}
?>
