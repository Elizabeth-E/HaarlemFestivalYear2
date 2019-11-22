<?php
namespace App\Controllers;

use App\Models;

if(session_id() == '' || !isset($_SESSION)) {
    session_start();
}

class CartController extends AppController
{
    protected $model = "";
    protected $params = [];
    public $shoppingCart = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        //Model for the cart
        $this->model = new Models\cartModel();
    }

    public function index(array $params)
    {
        $this->view->assign("shoppingCart", $shoppingCart);
        $this->view->display("cart/cart.tpl");
    }

    public function setTicket()
    {
        if(isset($_POST['Select_Ticket']))
        {
            echo $_POST['hidden_price']."<br>";;
            echo $_POST['hidden_nrOfPeople']."<br>";;
            echo $_POST['hidden_language']."<br>";;
            echo $_POST['hidden_guide']."<br>";;
            echo $_POST['hidden_date']."<br>";
            echo $_POST['hidden_eventName']."<br>";;
            echo $_POST['hidden_amount'];
        }
    }
}
?>