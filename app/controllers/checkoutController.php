<?php
namespace App\Controllers;

use App\Models;

class CheckoutController extends AppController
{
    protected $model = "";
    protected $params = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;
    }

    public function index(array $params)
    {   
        $this->view->assign("title", "Checkout");

        $this->view->display("cart/checkout.tpl");
    }
}
?>