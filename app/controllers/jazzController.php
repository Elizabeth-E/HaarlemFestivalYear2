<?php
namespace App\Controllers;

use App\Models;

class JazzController extends AppController
{
    protected $model = "";
    protected $params = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;

        $this->model = new Models\JazzEventService();

        $this->getCart();
    }

    public function index(array $params)
    {   
        $this->view->assign("title", "Jazz");

        $this->view->display("jazz/jazzhome.tpl");
    }

    public function artists_ajax(array $params)
    {   
        $this->view->assign("title", "Jazz");

        $this->view->display("jazz/artists_ajax.tpl");
    }

    public function tickets_ajax(array $params)
    {   
        $this->view->assign("title", "Jazz");

        $eventList = $this->model->getJazzEvent();

        // Turn list of events to a nested array representation for Smarty templates
        $jul26 = [];
        $jul27 = [];
        $jul2 = [];
        foreach($eventList as $event)
        {
            if(strcmp($event->getDay(), "thu")){
                $jul26[] = $event->toArray();
            }
            if(strcmp($event->getDay(), "fri")){
                $jul27[] = $event->toArray();
            }
            else{
                $jul28[] = $event->toArray(); 
            }
            
        }

    
        $this->view->assign("jul26", $jul26);
        $this->view->assign("jul27", $jul27);
        $this->view->assign("jul28", $jul28);
        $this->view->display("jazz/tickets_ajax.tpl");
    }

    public function timetable_ajax(array $params)
    {   
        $this->view->assign("title", "Jazz");

        $eventList = $this->model->getJazzEvent();

        // Turn list of events to a nested array representation for Smarty templates
        $timeTable = [];
        foreach($eventList as $event)
        {
            $timeTable[] = $event->toArray();
        }

        $this->view->assign("timeTable", $timeTable);
        $this->view->display("jazz/timetable_ajax.tpl");
    }
}
?>