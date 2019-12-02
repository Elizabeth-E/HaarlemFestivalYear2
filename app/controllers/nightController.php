<?php
namespace App\Controllers;

use App\Models;

class NightController extends AppController
{
    protected $model = "";
    protected $params = [];
    protected $language = "";
    protected $at_night_pages = [];
    protected $shopping_cart = NULL;

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        //Model for the At Night event
        $this->model = new Models\nightModel();

        $shopping_cart = $this->getCart(); 


        //This is used to retrieve all pages for the At Night event
        $this->at_night_pages = $this->model->retrieveAtNightPages();
        $this->view->assign('pages', $this->at_night_pages);
    }

    //This is used to retrieve information for the At Night home page
    public function index(array $params)
    {   
        $home_pages = array();

        foreach($this->at_night_pages as $page)
        {
            if($page->getPageHeader() == "At Night - Haarlem Festival")
            {
                $this->view->assign("title", $page->getPageHeader());
                $this->view->assign("page_title", $page->getPageName());
            }      

            if($page->getPageName() == "Night Tour" || $page->getPageName() == "Beer Tour" || $page->getPageName() == "Cocktail Tour" || $page->getPageName() == "Hookah Tour")
            {
                $page_information = array();
                $page_information[] = $page;
                $page_information[] = $this->model->retrieveImageForPage($page->getPageId());
                $home_pages[] = $page_information;
            }
        }

        $this->view->assign("home_pages", $home_pages);

        $this->view->display("at_night/at_night_home.tpl");
    }

     //This is used to get information for the At Night tour pages
     public function getTourPageInfo($param)
     {
         $tour_name = explode('_', $param[0]); 

         foreach($this->at_night_pages as $page)
         {
             if($page->getPageName() == ($tour_name[0] . ' - ' . $tour_name[1]))
             {
                $this->view->assign("title", $page->getPageHeader());
                $this->view->assign("page_id", $page->getPageId());
                $this->view->assign("page_title", $page->getPageName());    
                $this->view->assign("page_title_link", $tour_name[1]);  
                $this->view->assign("description", $page->getPageDescription());
                $this->view->assign("tour_images", $this->model->retrieveImageForPage($page->getPageId()));
             }
         }
 
         $this->view->display("at_night/at_night_tour_page.tpl");
     }
     
    //This is used to get information for the At Night ticket pages
    public function getTicketPageInfo($param)
    {
        foreach($this->at_night_pages as $page)
        {
            if($page->getPageName() == ($param[0] . " Tickets"))
            {
                $this->view->assign("title", $page->getPageHeader());
                $this->view->assign("page_title", $page->getPageName());
                $this->view->assign("page_id", $page->getPageId());
                $tour_name = explode(" ", $param[0]);

                if(isset($_POST['language']))
                    $this->language = $_POST['language'];

                $tickets = $this->getTickets($tour_name[4], $this->language);
        
                $this->view->assign("language_images", $this->model->retrieveImageForPage($page->getPageId()));
                $this->view->assign("tickets", $tickets);
            }
        }

        $this->view->display("at_night/at_night_ticket_page.tpl");
    }

    //This is used to retrieve all tickets for the At Night events by using the name of the tour
    private function getTickets(string $tour_name, string $language)
    {
        return $this->model->retrieveAtNightTickets($tour_name, $language);
    }
}
?>