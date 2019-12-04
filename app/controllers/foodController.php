<?php
namespace App\Controllers;
 
use App\Models;
 
class FoodController extends AppController
{
    protected $model = "";
    protected $params = [];
 
    public function __construct(string $action = "", array $params)
    {
        parent::__construct($action, $params);
 
        $this->params = $params;
 
        $this->model = new Models\foodModel();
        $this->action = $action;
 
    }
//ctrl + K + C to comment paragraph!!!
 
 
    //loading food Home page
    public function index(array $param)
    {
        //title home page
        $this->view->assign("title", "Food - Haarlem Festival");
        //display food home page
        $this->view->display("food/food_home.tpl");
    }
    public function comment(array $params)
    {
         //title home page
         $this->view->assign("title", "Food - Haarlem Festival");
 
         $comment = $_POST["Comment"];
 
        $this->view->display("food/food_home.tpl");
    }
}
?>