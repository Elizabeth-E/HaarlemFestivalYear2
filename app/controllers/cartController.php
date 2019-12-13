<?php
namespace App\Controllers;

const VAT = 0.21;

class CartController extends AppController
{
    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

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
                $total += $ticket[6];

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
            //need to add this to alert thingy
            echo $e->getMessage();
        }     
    }

    //This is used to create a ticket. This method will also check if the user has selecting more than one ticket, and if the tickets are available.
    private function createTicket()
    {
        if((strpos($_POST['hidden_event_name'], 'Night')) !== false || (strpos($_POST['hidden_event_name'], 'Beer')) !== false || (strpos($_POST['hidden_event_name'], 'Cocktail')) !== false || (strpos($_POST['hidden_event_name'], 'Hookah')) !== false)
                $ticket = array($_POST['hidden_language'], $_POST['hidden_guide_name'], strtotime($_POST['hidden_date']), 'Haarlem At Night - ' . $_POST['hidden_event_name'], (int)$_POST['hidden_regular_amount'], (int)$_POST['hidden_family_amount'], (float)$_POST['hidden_total_payment']);
        
        $this->addTicket($ticket);
    }

    //Adds the ticket to the cart
    private function addTicket(array $ticket)
    {
        if(isset($_SESSION['shoppingCart']) != null)
        {
            $previous_tickets = [];
    
            foreach($_SESSION['shoppingCart'] as $value)
                $previous_tickets[] = $value;
    
            $previous_tickets[] = $ticket;
    
            $_SESSION['shoppingCart'] = $previous_tickets;
        }
       else
       {
            $_SESSION['shoppingCart'][] = $ticket;
       }
    }

    //Checks the amount of users which can be involved in an activity
    private function isAvailable():bool
    {
        if((strpos($_POST['hidden_event_name'], 'Night')) !== false || (strpos($_POST['hidden_event_name'], 'Beer')) !== false || (strpos($_POST['hidden_event_name'], 'Cocktail')) !== false || (strpos($_POST['hidden_event_name'], 'Hookah')) !== false)
            if((int)$_POST['hidden_amount'] - (((int)$_POST['hidden_family_amount'] * 4)) + (int)$_POST['hidden_regular_amount'] > 0)
                return true;

        return false;
    }

    //Checks if the user has selected a ticket type
    private function userSelectedTickets():bool
    {
        if((strpos($_POST['hidden_event_name'], 'Night')) !== false || (strpos($_POST['hidden_event_name'], 'Beer')) !== false || (strpos($_POST['hidden_event_name'], 'Cocktail')) !== false || (strpos($_POST['hidden_event_name'], 'Hookah')) !== false)
            if((int)$_POST['hidden_family_amount'] || (int)$_POST['hidden_regular_amount'] != 0)
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
            $deleteTicket = array($_POST['hidden_cart_language'], $_POST['hidden_cart_guide'], $_POST['hidden_cart_date'], $_POST['hidden_cart_event_name'], $_POST['hidden_cart_regular'], $_POST['hidden_cart_family'], $_POST['hidden_cart_total']);

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

        $this->view->assign("title", "Haarlem Festival - My tickets");
        $this->view->assign("page_title", "My tickets");

        $this->view->assign("tickets", $_SESSION['shoppingCart']);
        $this->view->assign("cost", $this->calculateTotalPayment());
        $this->view->assign("cost_with_VAT", $this->calculateTotalPayment() * VAT);

        $this->view->display("cart/reviewPage.tpl");
    }
}
?>