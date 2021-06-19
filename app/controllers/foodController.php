<?php
  namespace App\Controllers;
 
  use App\Models;
 
  class FoodController extends AppController
  {
    protected $model = "";
    protected $params = [];
    private $language = "";
    private $food_pages = [];

 
    public function __construct(string $action = NULL, array $params)
      {
          parent::__construct($action, $params);

          $this->action = $action;
          $this->params = $params;
          //Model for the At food event
          $this->model = new Models\foodModel();

          
          //This is used to retrieve all pages for the At Night event
          $lang = $this->getLanguage();
          $this->food_pages = $this->model->retrieveFoodPages($lang);

  		    $this->getCart();
          $this->setBackground("FoodHome.jpg");
   
      }
    //ctrl + K + C to comment paragraph!!!
  //loading food Home page
    public function index(array $param)
    {
        $restaurant_pages = array();

        foreach($this->food_pages as $page)
        {
            if($page->getPageName() == 'Haarlem Food')
            {
              $this->view->assign("title", $page->getPageHeader());
              $this->view->assign("page_title", $page->getPageName());
            }      

            if($page->getPageName() == "Fris Restaurant" || $page->getPageName() == "Specktakel Restaurant" || $page->getPageName() == "Ratatouille Restaurant" || $page->getPageName() == "ML Restaurant" || $page->getPageName() == "Mr.&Mrs. Restaurant" || $page->getPageName() == "Brinkman Restaurant" || $page->getPageName() == "Urban Restaurant" || $page->getPageName() == "Golden Bull Restaurant" )
            {
                $page_information = array();
                $page_information[] = $page;
                $page_information[] = $this->model->retrieveImageForPage($page->getPageId());
                $restaurant_pages[] = $page_information;
            }
            }
        $this->view->assign("restaurant_pages", $restaurant_pages);
        $this->view->display("food/food_home.tpl");
    
    }

    //This is used to get page information
     public function getPageInfo(array $params)
     {
         foreach($this->food_pages as $page)
         {
             if($page->getPageName() == ('Haarlem Food' . ' - ' . $params[0]))
             {
                $this->view->assign("title", $page->getPageHeader());
                $this->view->assign("page_title", $page->getPageName());    
                $this->view->assign("page_title_link", $params[0]);  
                $this->view->assign("description", $page->getPageDescription());
                $this->view->assign("food_images", $this->model->retrieveImageForPage($page->getPageId()));
             }
         }

         $this->view->display("food/food_detail.tpl");
     }

	 public function foodReservation(array $param)
    {
      $this->view->assign("RestaurantName", $param[0]);

      $amount = $this->model->retrieveAmountOfSeats(str_replace(' ', '_', $param[0]));
      $this->view->assign("amount", $amount);
        //title home page
        $this->view->assign("title", "Reservation");
        //display food home page
        $this->view->display("food/food_reservation.tpl");
    }

    private function comment()
      {
        foreach($this->food_pages as $page)
         {
           if($page->getPageName() == 'Haarlem Food')
            {
       if((strpos($_POST['hidden_event_name'], 'Food')) == true)
        {
            $comment = $_POST["hidden_comment"]; 
                      
            $this->model->comment($comment, $page->getPageId());
        }
      }
    }
    }
  }
?>