<?php
namespace App\Controllers;

use Framework\TemplateEngine;

abstract class AppController 
{
    protected $view = "";
    protected $action = "";
    protected $params = [];

    // Default layout & background
    protected $layout = VIEWS . "layouts" . DS . "default" . DS;
    protected $background = BASE_URL . "/img/backgrounds/home.jpg";

    public function __construct(string $action = "", array $params)
    {    
        // Set the corresponding View and Action
        $this->action = $action;
        $this->params = $params;
        $this->view = new TemplateEngine(); // Initiate template engine

        $this->view->assign("layout", $this->layout);
        $this->view->assign("background", $this->background);
        $this->view->assign("www", BASE_URL);

        $this->setBackground("home.jpg");
    }

    protected function setLayout(string $layout)
    {
        // Change layout
        $this->layout = VIEWS . "layouts" . DS . $layout . DS;
        $this->view->assign("layout", $this->layout);
    }

    protected function setBackground(string $background)
    {
        $this->background = BASE_URL . "/img/backgrounds/" . $background;
        $this->view->assign("background", $this->background);
    }

    protected function getUrlSelf() : string
    {
        $url = $_SERVER["REQUEST_SCHEME"] . "://" . $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
        return $url;
    }

    public function dispatch()
    {
        if ( ! empty($this->action))
        {
            $this->{$this->action}($this->params); // Dispatch to provided action
        }
    }
    
    public function getCart()
    {
        $cartController = new CartController("index", []);

        $this->view->assign("cart_count", count($cartController->checkShoppingCart()));
        $this->view->assign("cart", $cartController->checkShoppingCart());
        $this->view->assign("total_payment", $cartController->calculateTotalPayment());

        $this->view->assign("alert", $cartController->checkError());
        $this->view->assign("alertType", $cartController->getErrorType());
        $this->view->assign("alertMessage", $cartController->getErrorMessage());
        
        return $cartController;
    }
}
?>