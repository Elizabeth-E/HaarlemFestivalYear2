<?php
namespace App\Controllers;

use App\Models;

class HomeController extends AppController
{
    protected $model = "";
    protected $params = [];
    protected $pages = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        $this->model = new Models\homeModel();
        $this->pages = $this->model->retrieveHomePage();

        $this->getCart();
    }

    public function index(array $params)
    {   
        $this->view->assign("title", $this->pages[0]->getPageHeader());
        $this->view->assign("page_title", $this->pages[0]->getPageName());

        $this->view->assign("home_images", $this->model->retrieveImageForPage($this->pages[0]->getPageId()));

        $this->view->display("home/index.tpl");
    }
}
?>