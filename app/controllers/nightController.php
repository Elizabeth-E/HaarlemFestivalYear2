<?php
namespace App\Controllers;

use App\Models;

class NightController extends AppController
{
    protected $model = "";
    protected $params = [];
    protected $language = "";
    protected $pages = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        //Model for the At Night event
        $this->model = new Models\nightModel();

        //This is used to retrieve all pages for the At Night event
        $this->pages = $this->model->retrieveAtNightPages();
        $this->view->assign('pages', $this->pages);
    }

    //This is used to retrieve information for the At Night home page
    public function index(array $params)
    {   
        $home_pages = array();

        foreach($this->pages as $page)
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

    //This is used to get information for the At Night tour pages
    public function getTourPageInfo($param)
    {
        $this->view->assign("title", $this->getEventInfo($param[0])->getPageHeader());
        $this->view->assign("page_id", $this->getEventInfo($param[0])->getPageId());
        $this->view->assign("page_title", $this->getEventInfo($param[0])->getPageName());    
        $this->view->assign("page_title_link", explode("-", $this->getEventInfo($param[0])->getPageName()));  
        $this->view->assign("description", $this->getEventInfo($param[0])->getPageDescription());

        $tour_images = [];

        //retrieves the correct images based on which tour the user has selected
        foreach ($this->images as $tour_image) {
            if (strpos($this->getEventInfo($param[0])->getPageName(), "Night Tour") && strpos($tour_image['path'], 'nighttour'))
                $tour_images[] = $tour_image;
            else if(strpos($this->getEventInfo($param[0])->getPageName(), "Beer Tour") && strpos($tour_image['path'], 'beertour'))
               $tour_images[] = $tour_image;
            else if(strpos($this->getEventInfo($param[0])->getPageName(), "Cocktail Tour") && strpos($tour_image['path'], 'cocktailtour'))
               $tour_images[] = $tour_image;
            else if(strpos($this->getEventInfo($param[0])->getPageName(), "Hookah Tour") && strpos($tour_image['path'], 'hookahtour'))
               $tour_images[] = $tour_image;
        }
        
        $this->view->assign("tour_images", $tour_images);

        $this->view->display("at_night/at_night_tour_page.tpl");
    }
}
?>