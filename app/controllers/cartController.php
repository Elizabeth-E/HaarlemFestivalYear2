<?php
namespace App\Controllers;

class CartController extends AppController
{
    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        $this->cartButtons();
    
        $this->checkShoppingCart();
    }

    //This method contains every button that can be used to perform a another method in the cart
    private function cartButtons()
    {
        if(isset($_POST['add_ticket']))
           $this->setTicket();
        else if(isset($_POST['delete_tickets']))
           $this->deleteTickets();
    }
    //This is used to return any items inside the shoppingCart variable
    public function checkShoppingCart()
    {
        $cart = array();
        $count = 0;

        if(isset($_SESSION['shoppingCart']))
            foreach($_SESSION['shoppingCart'] as $value)
            {
                $count += 1;  
                $cart[] = $value;
            }
        
        $this->view->assign("cart_count", $count);
        $this->view->assign("cart", $cart);  
    }

    //This is used to set a ticket inside the cart
    public function setTicket()
    {
        if(strpos($_POST['hidden_event_name'], 'Night') || strpos($_POST['hidden_event_name'], 'Beer') || strpos($_POST['hidden_event_name'], 'Cocktail') || strpos($_POST['hidden_event_name'], 'Hookah'))
        {
            $ticket = array($_POST['hidden_language'], $_POST['hidden_guide_name'], strtotime($_POST['hidden_date']), 'Haarlem At Night - ' . $_POST['hidden_event_name'],
            (int)$_POST['hidden_regular_amount'], (int)$_POST['hidden_family_amount'], (int)$_POST['hidden_total_payment']);
        }
        
        if($_SESSION['shoppingCart'] != null)
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

    //This is used to delete the tickets inside the cart
    public function deleteTickets()
    {
        session_unset();
    }
}
?>