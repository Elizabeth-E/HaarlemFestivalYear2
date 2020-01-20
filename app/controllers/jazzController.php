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

        $this->setBackground("jazz.jpg");

        $this->getCart();
    }

    public function index(array $params)
    {   
        $this->view->assign("title", "Jazz");

        $this->view->display("jazz/jazzhome.tpl");
    }

    public function artists_ajax(array $params)
    {   

        $allArtists = $this->model->getAllJazzArtists();

        foreach($allArtists as $artist)
        {
            // print_r($artist->toArray());
            // exit();
            $artists[] = $artist->toArray();
        }

        $this->view->assign("title", "Jazz");
        $this->view->assign("artists", $artists);
        $this->view->display("jazz/artists_ajax.tpl");
    }
    public function artist_page(array $params)
    {   
        // This passes the param to artist_page so artist_page_ajax has the correct param
        $artistName = $params[0];
        $artistURL = "/jazz/artist_page_ajax/";
        $artistPage = $artistURL.$artistName;

        $eventList = $this->model->getJazzEvents();


        $this->view->assign("title", "Jazz");
        $this->view->assign("artistPage", $artistPage);
        $this->view->display("jazz/artist_page.tpl");
    }
    public function artist_page_ajax(array $params)
    {   
        // This passes the param so artist_page_ajax loads the correct artist
        $artistName = $params[0];
        $artistName = str_replace("_"," ",$params[0]);

        //Gets the artist info for a specific artist and casts it to an array
        $artistInfo = $this->model->getJazzArtist($artistName);
        $artistInfo = $artistInfo->toArray();

        $artistTicket = $this->model->getArtistSpecificTicket($artistName);

        foreach($artistTicket as $ticket)
        {
            if($ticket->getLocation() == "Patronaat")
            {
                $artistMainTicket = $ticket->toArray();
            }
        }

        // Select 3 random artists
        $allArtists = $this->model->getAllJazzArtists();
        $crossSellingArtist = [];
        for ($i = 0; $i < 3; $i++) {
            $rndArtist = $allArtists[rand(0, count($allArtists) -1)];
            $crossSellingArtist[] = $rndArtist->toArray();
        }

        $this->view->assign("title", "Jazz");
        $this->view->assign("artistInfo", $artistInfo);
        $this->view->assign("artistTicket", $artistMainTicket);
        $this->view->assign("crossSelling", $crossSellingArtist);

        $this->view->display("jazz/artist_page_ajax.tpl");
    }

    public function tickets_ajax(array $params)
    {   
        $this->view->assign("title", "Jazz");

        $eventList = $this->model->getJazzEvents();

        $eventsPerDate = [
            "Thursday 26th July" => [],
            "Friday 27th July" => [],
            "Saturday 28th July" => [],
            "Sunday 29th July" => []
        ];

        foreach($eventList as $event)
        {
            switch(strtolower($event->getDay())) {
                case "thu":
                    $eventsPerDate["Thursday 26th July"][] = $event->toArray();
                    break;
                case "fri":
                    $eventsPerDate["Friday 27th July"][] = $event->toArray();
                    break;
                case "sat":
                    $eventsPerDate["Saturday 28th July"][] = $event->toArray();
                    break;
                case "sun":
                    $eventsPerDate["Sunday 29th July"][] = $event->toArray();
                    break;
                default:
                    break; 
            }
        }

        $this->view->assign("eventList", $eventsPerDate);
        $this->view->display("jazz/tickets_ajax.tpl");
    }

    public function timetable_ajax(array $params)
    {   
        $this->view->assign("title", "Jazz");

        $eventList = $this->model->getJazzEvents();

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