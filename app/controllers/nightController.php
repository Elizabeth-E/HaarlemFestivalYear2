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

class NightController extends AppController
{
    protected $model = "";
    protected $params = [];
    protected $language = "";

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        //Model for the At Night event
        $this->model = new Models\nightModel();

        //This is used to retrieve all images for the At Night event
        $images = $this->model->retrieveAtNightImages();
        $this->view->assign('images', $images);

        if(isset($_POST['add_ticket']))
            $this->setTicket();
        else if(isset($_POST['Delete_Tickets']))
            $this->deleteTickets();

        $this->checkShoppingCart();
    }

    //This is used to retrieve information for the At Night home page
    public function index(array $params)
    {   
        $this->view->assign("title", $this->getEventInfo(9)->getPageHeader());
        $this->view->assign("page_title", $this->getEventInfo(9)->getPageName());

        $this->view->assign("night_tour", $this->getEventInfo(10));
        $this->view->assign("beer_tour", $this->getEventInfo(11));
        $this->view->assign("cocktail_tour", $this->getEventInfo(12));
        $this->view->assign("hookah_tour", $this->getEventInfo(13));

        $this->view->display("at_night/at_night_home.tpl");
    }

    //This is used to get information for an event
    public function getEventInfo(int $eventId)
    {
        return $this->model->retrieveEventInfo($eventId);
    }

    //This is used to get information for the At Night ticket pages
    public function getTicketPageInfo($param)
    {
        $this->view->assign("title", $this->getEventInfo($param[0])->getPageHeader());
        $this->view->assign("page_title", $this->getEventInfo($param[0])->getPageName());
        $this->view->assign("page_id", $this->getEventInfo($param[0])->getPageId());

        //This is used to retrieve the name of the tour by selecting the first word of the header
        $tour_name = explode(" ", $this->getEventInfo($param[0])->getPageHeader());

        if(isset($_POST['language']))
            $this->language = $_POST['language'];
            
        $tickets = $this->getTickets($tour_name[0], $this->language);
        
        $this->view->assign("tickets", $tickets);

        $this->view->display("at_night/at_night_ticket_page.tpl");
    }

    //This is used to retrieve all tickets for the At Night events by using the name of the tour
    public function getTickets(string $tour_name, string $language)
    {
        return $this->model->retrieveAtNightTickets($tour_name, $language);
    }

    //Checks if the cart is empty or not
    private function checkShoppingCart()
    {
        $count = 0;

        if(isset($_SESSION['shoppingCart']))
        { 
            foreach($_SESSION['shoppingCart'] as $value)
                $count += 1;

            $this->view->assign('cart', $_SESSION['shoppingCart']);
        }  
        else
        {
            $this->view->assign('cart', null);
        } 
        
        $this->view->assign('cart_count', $count);
    }

    //This is used to get information for the At Night tour pages
    public function getTourPageInfo($param)
    {
        $this->view->assign("title", $this->getEventInfo($param[0])->getPageHeader());
        $this->view->assign("page_title", $this->getEventInfo($param[0])->getPageName());      
        $this->view->assign("description", $this->getEventInfo($param[0])->getPageDescription());

        $this->view->display("at_night/at_night_tour_page.tpl");
    }
    
    //This is used to set a ticket inside the cart
    private function setTicket()
    {
        $tourTicket = array($_POST['hidden_language'], $_POST['hidden_guide_name'], strtotime($_POST['hidden_date']), 'Haarlem At Night - ' . $_POST['hidden_event_name'],
        (int)$_POST['hidden_regular_amount'], (int)$_POST['hidden_family_amount']);

        if($_SESSION['shoppingCart'] != null)
        {
            $previous_tickets = [];

            foreach($_SESSION['shoppingCart'] as $value)
                $previous_tickets[] = $value;

            $previous_tickets[] = $tourTicket;

            $_SESSION['shoppingCart'] = $previous_tickets;
        }
        else
        {
            $_SESSION['shoppingCart'][] = $tourTicket;
        }
    }

    private function deleteTickets()
    {
        session_unset();
    }
}
?>