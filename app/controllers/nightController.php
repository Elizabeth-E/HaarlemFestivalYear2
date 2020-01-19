<?php
namespace App\Controllers;

use App\Models;

class NightController extends AppController
{
    private $model = "";
    protected $params = [];
    private $language = "";
    private $at_night_pages = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        //Model for the At Night event
        $this->model = new Models\nightModel();

        //This is used to retrieve all pages for the At Night event
        $this->at_night_pages = $this->model->retrieveAtNightPages();

        $this->getCart();

        $this->setBackground("night.jpg");
    }

    //This is used to retrieve information for the At Night home page
    public function index(array $params)
    {   
        $tour_pages = array();

        foreach($this->at_night_pages as $page)
        {
            if(strpos($page->getPageHeader(), 'At Night') !== false)
            {
                $this->view->assign("title", $page->getPageHeader());
                $this->view->assign("page_title", $page->getPageName());
            }      

            if($page->getPageName() == "Night Tour" || $page->getPageName() == "Beer Tour" || $page->getPageName() == "Cocktail Tour" || $page->getPageName() == "Hookah Tour")
            {
                $page_information = array();
                $page_information[] = $page;
                $page_information[] = $this->model->retrieveImageForPage($page->getPageId());
                $tour_pages[] = $page_information;
            }
        }

        $this->view->assign("tour_pages", $tour_pages);
        $this->view->display("at_night/at_night_home.tpl");
    }

     //This is used to get information for the At Night tour pages
     public function getTourPageInfo(array $params)
     {
         foreach($this->at_night_pages as $page)
         {
             if($page->getPageName() == ('Haarlem At Night' . ' - ' . $params[0]))
             {
                $this->view->assign("title", $page->getPageHeader());
                $this->view->assign("page_title", $page->getPageName());    
                $this->view->assign("page_title_link", $params[0]);  
                $this->view->assign("description", $page->getPageDescription());
                $this->view->assign("tour_images", $this->model->retrieveImageForPage($page->getPageId()));
                $this->view->assign("locations", $this->model->retrieveLocationForMap($page->getPageId()));
             }
         }

         $this->view->display("at_night/at_night_tour_page.tpl");
     }
     
    //This is used to get information for the At Night ticket pages
    public function getTicketPageInfo(array $params)
    {
        $tour_name = explode(' - ', $params[0]);

        foreach($this->at_night_pages as $page)
        {
            if($page->getPageName() == ($params[0] . " Tickets"))
            {
                $this->view->assign("title", $page->getPageHeader());
                $this->view->assign("page_title", $page->getPageName());
                $this->view->assign("tour_page", $tour_name[1]);
                $tourType = explode(" ", $params[0]);

                if(isset($_POST['language']))
                    $this->language = $_POST['language'];

                $this->view->assign("language_images", $this->model->retrieveImageForPage($page->getPageId()));
                $this->view->assign("tickets", $this->model->retrieveAtNightTickets($tourType[4], $this->language));
            }
        }

        $this->view->display("at_night/at_night_ticket_page.tpl");
    }
}
?>