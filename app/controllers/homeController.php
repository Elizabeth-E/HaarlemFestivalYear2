<?php
namespace App\Controllers;

use App\Models;

class HomeController extends AppController
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
        $this->view->assign("title", "Home");

        $this->view->display("home/index.tpl");
    }
}
?>