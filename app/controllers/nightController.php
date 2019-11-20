<?php
namespace App\Controllers;

use App\Models;

class NightController extends AppController
{
    protected $model = "";
    protected $params = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        $this->model = new Models\nightModel();

        $images = $this->model->retrieveAtNightImages();
        $this->view->assign('images', $images);
    }

    public function index(array $params)
    {   
        $this->view->assign("title", $this->getEventInfo(9)->getPageHeader());
        $this->view->assign("page_title", $this->getEventInfo(9)->getPageName());

        $this->view->assign("night_tour", $this->getEventInfo(10));
        $this->view->assign("beer_tour", $this->getEventInfo(11));
        $this->view->assign("cocktail_tour", $this->getEventInfo(12));
        $this->view->assign("hookah_tour", $this->getEventInfo(13));

        $this->view->display("at_night/at_night_home.tpl");
    }

    public function getEventInfo(int $eventId)
    {
        $event = $this->model->retrieveEventInfoById($eventId);
        return $event;
    }
}
?>