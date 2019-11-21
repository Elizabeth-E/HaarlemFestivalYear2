<?php
namespace App\Models;

class NightModel extends AppModel 
{
    public function __construct()
    {
        parent::__construct();
    }

    //This is used to retrieve information from an event by using the event_Id to retrieve the data.
    public function retrieveEventInfoById(int $eventId)
    {
        $db = $this->database->prepare("SELECT page.id, page.page_name, page.page_description, page.header_title FROM page WHERE page.id = ?");
        $db->bind_param("i", $eventId);
        $db->execute();

        $result = $db->get_result();
        $eventInfo = null;

        while($row = $result->fetch_assoc())
            $eventInfo = new Page($row['id'], $row['page_name'], $row['page_description'], $row['header_title']);

        return $eventInfo;
    }

    //retrieves all images that belongs to the At Night event
    public function retrieveAtNightImages():array
    {
        $db = $this->database->prepare("SELECT * FROM picture WHERE `path` LIKE '%night%' ");
        $db->execute();
        $result = $db->get_result();

        //an array of pictures for the At Night event
        $images = array();

        while($row = mysqli_fetch_assoc($result))
            $images[] = $row;
        
        $db->close();
        return $images;
    }

    //retrieves tickets for the At Night event by using the name of a specific tour
    public function retrieveAtNightTickets($tour_name):array
    {
        $tickets = array();

        $db = $this->database->prepare("SELECT tour.tour_language, event.date, guides.name, event.amount FROM tour 
        INNER JOIN event
        ON tour.event_id = event.id
        INNER JOIN guides 
        ON tour.guides_id = guides.id 
        WHERE `tour_name` LIKE '%$tour_name%'
        ORDER BY event.date ASC");
        $db->execute();
        $result = $db->get_result();

        while($row = mysqli_fetch_assoc($result))
        {
            $ticket = new Ticket(0, 0, $row['tour_language'], $row['name'], $row['date'], $tour_name . ' Tour', $row['amount']);
            $tickets[] = $ticket;
        }

        return $tickets;
    }
}
?>