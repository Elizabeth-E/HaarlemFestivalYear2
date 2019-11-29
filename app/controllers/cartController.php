<?php
namespace App\Controllers;

use App\Models;

if(session_id() == '' || !isset($_SESSION)) {
    session_start();
}

if(!isset($_SESSION['shoppingCart']))
{
    $_SESSION['shoppingCart'] = array();
}

class CartController extends AppController
{
    protected $model = "";
    protected $params = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;
    }
    
    //This is used to count how items are inside the cart
    public function countShoppingCart(): int
    {
        $count = 0;

        if(isset($_SESSION['shoppingCart']))
            foreach($_SESSION['shoppingCart'] as $value)
                $count += 1;  
        
        return $count;
    }

    //This is used to return any items inside the shoppingCart variable
    public function checkShoppingCart(): array
    {
        $cart = array();

        if(isset($_SESSION['shoppingCart']))
            foreach($_SESSION['shoppingCart'] as $value)
                $cart[] = $value;
  
        return $cart;
    }

    //This is used to set a ticket inside the cart
    public function setTicket()
    {
        //if statements
        $ticket = array($_POST['hidden_language'], $_POST['hidden_guide_name'], strtotime($_POST['hidden_date']), 'Haarlem At Night - ' . $_POST['hidden_event_name'],
        (int)$_POST['hidden_regular_amount'], (int)$_POST['hidden_family_amount']);

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