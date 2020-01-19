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
        $this->getCart();
    }

    public function index(array $params)
    {   
        $preTotal = $this->calculateTotalPayment();
        $totalPayment = $preTotal + ($preTotal * VAT);


        $this->view->assign("title", "Checkout");
        $this->view->assign("totalPayment", $totalPayment);

        $this->view->display("cart/checkout.tpl");
    }
    public function dummy(array $params)
    {   
        $this->view->assign("title", "Checkout test");

        $this->view->display("cart/dummypage.tpl");
    }
    public function calculateTotalPayment(): float
    {
        $total = 0.00;
 
        if(isset($_SESSION['shoppingCart']) != null)
            foreach($_SESSION['shoppingCart'] as $ticket)     
                $total += $ticket[1];
 
        return $total;
    }
}
?>