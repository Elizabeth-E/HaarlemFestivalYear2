<?php
namespace App\Controllers;

use App\Models;

session_start();

class CartController extends AppController
{
    protected $model = "";
    protected $params = [];
    protected $_SESSION['shoppingCart'] = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        //Model for the At Night event
        $this->model = new Models\cartModel();
    }

    public function index(array $params)
    {
        $this->view->assign("shoppingCart", $_SESSION['shoppingCart']);
        $this->view->display("cart/cart.tpl");
    }

    public function setTicket(int $id, array $tickets)
    {
        $_SESSION['shoppingCart'] = $tickets[$id];
        //header("Refresh: 0");
        echo $_SESSION['shoppingCart'];
    }
}
?>