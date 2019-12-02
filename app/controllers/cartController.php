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
    }

    //This method contains every button that can be used to perform a another method in the cart
    public function cartButtons()
    {
        if(isset($_POST['add_ticket']))
           $this->setTicket();
        else if(isset($_POST['delete_tickets']))
           $this->deleteAllTicket();
    }

    public function calculateTotalPayment(): float
    {
        $total = 0.00;

        if(isset($_SESSION['shoppingCart']) != null)
            foreach($_SESSION['shoppingCart'] as $value)     
                $total += (float)$value[6];

        return $total;
    }

    //This is used to return any items inside the shoppingCart variable
    public function checkShoppingCart():array
    {
        $cart = array();

        if(isset($_SESSION['shoppingCart']))
            foreach($_SESSION['shoppingCart'] as $value)
                $cart[] = $value;
        
        return $cart; 
    }

    //This is used to set a ticket inside the cart
    private function setTicket()
    {
        $ticket = $this->createTicket();

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

    //This is used to create a ticket. The ticket will be created based on which event the user has select it from.
    private function createTicket():array
    {
        $ticket = null;

        if((strpos($_POST['hidden_event_name'], 'Night')) !== false || (strpos($_POST['hidden_event_name'], 'Beer')) !== false || (strpos($_POST['hidden_event_name'], 'Cocktail')) !== false || (strpos($_POST['hidden_event_name'], 'Hookah')) !== false)
        {
            $ticket = array($_POST['hidden_language'], $_POST['hidden_guide_name'], strtotime($_POST['hidden_date']), 'Haarlem At Night - ' . $_POST['hidden_event_name'],
            (int)$_POST['hidden_regular_amount'], (int)$_POST['hidden_family_amount'], (int)$_POST['hidden_total_payment']);
        }     
       
        return $ticket;
    }

    //This is used to delete the tickets inside the cart
    private function deleteAllTicket()
    {
        unset($_SESSION['shoppingCart']);
    }
}
?>