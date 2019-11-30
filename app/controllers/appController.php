<?php
namespace App\Controllers;

use Framework\TemplateEngine;

abstract class AppController 
{
    protected $view = "";
    protected $action = "";
    protected $params = [];

    // Default layout
    protected $layout = VIEWS . "layouts" . DS . "default" . DS;

    public function __construct(string $action = "", array $params)
    {
        // Set the corresponding View and Action
        $this->action = $action;
        $this->params = $params;
        $this->view = new TemplateEngine(); // Initiate template engine

        $this->view->assign("layout", $this->layout);
        $this->view->assign("www", BASE_URL);

        if(isset($_POST['add_ticket']))
            $this->setTicket();
        else if(isset($_POST['delete_tickets']))
            $this->deleteTickets();
    
        $this->checkShoppingCart();
    }

    protected function setLayout(string $layout)
    {
        // Change layout
        $this->layout = VIEWS . "layouts" . DS . $layout . DS;
        $this->view->assign("layout", $this->layout);
    }


    protected function getUrlSelf() : string
    {
        $url = $_SERVER["REQUEST_SCHEME"] . "://" . $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
        return $url;
    }

    public function dispatch()
    {
        if ( ! empty($this->action))
        {
            $this->{$this->action}($this->params); // Dispatch to provided action
        }
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