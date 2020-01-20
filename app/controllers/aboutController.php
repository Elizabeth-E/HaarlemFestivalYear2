<?php
namespace App\Controllers;
 
use App\Models;

class AboutController extends AppController
{
    protected $pages = [];
    protected $aboutPages = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);
        
        $this->model = new Models\cartModel();
        $lang = $this->getLanguage();
        $this->pages = $this->model->retrieveCartPages($lang);

        $this->getCart();
    }

    public function index(array $params)
    {
        foreach($this->pages as $page)
            if(strpos($page->getPageHeader(), 'About') !== false)
                $aboutPages[] = $page;
        
        $this->view->assign("title", $aboutPages[0]->getPageHeader());
        $this->view->assign("page_title", $aboutPages[0]->getPageName());
        $this->view->assign("first_page_description", explode(';', $aboutPages[0]->getPageDescription()));

        $this->view->assign("page_title_2", $aboutPages[1]->getPageName());
        $this->view->assign("images", $this->model->retrieveImageForPage($aboutPages[1]->getPageId()));
        $this->view->assign("second_page_description", explode(';', $aboutPages[1]->getPageDescription()));

        $this->view->assign("page_title_3", $aboutPages[2]->getPageName());
        $this->view->assign("third_page_description", explode(';', $aboutPages[2]->getPageDescription()));

        $this->view->display("home/about.tpl");
    }
}