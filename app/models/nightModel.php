<?php
namespace App\Models;

class NightModel extends AppModel 
{
    public function __construct()
    {
        parent::__construct();
    }

    //This is used to retrieve information from all pages that belongs to the At Night event
    public function retrieveAtNightPages():array
    {
        $db = $this->database->prepare("SELECT page.id, page.page_name, page.page_description, page.header_title FROM page 
        WHERE page.page_name LIKE '%Night%' 
        OR page.page_name LIKE '%Beer%' 
        OR page.page_name LIKE '%Cocktail%'
        OR page.page_name LIKE '%Hookah%'");
        $db->execute();

        $result = $db->get_result();
        
        $event_pages = [];

        while($row = $result->fetch_assoc())
        {
            $event_page = new Page($row['id'], $row['page_name'], $row['page_description'], $row['header_title']);
            $event_pages[] = $event_page;
        }

        return $event_pages;
    }

    //retrieves the image for a specific page
    public function retrieveImageForPage(int $page_id):array
    {
        $db = $this->database->prepare("SELECT * FROM picture_has_page WHERE `page_id` = ?");
        $db->bind_param("i", $page_id);
        $db->execute();
        $result = $db->get_result();

        $images_for_page = [];

        while($row = mysqli_fetch_assoc($result))
        {
            $image = $this->retrieveImage($row['picture_id']);
            $images_for_page[] = $image;
        }
        
        $db->close();
        return $images_for_page;
    }

    private function retrieveImage(int $picture_id)
    {
        $db = $this->database->prepare("SELECT * FROM picture WHERE `id` = ?");
        $db->bind_param("i", $picture_id);
        $db->execute();
        $result = $db->get_result();

        $image = null;

        if($result->num_rows > 0)
        {
            $data = $result->fetch_assoc();
            $image = new Picture($data['id'], $data['name'], $data['path']);
        }

        return $image;
    }

    //retrieves tickets for the At Night event by using the name of a specific tour
    public function retrieveAtNightTickets(string $tour_name, string $language):array
    {
        $tickets = array();
        $sql = "";

        if($language == 'Dutch' || $language == 'English' || $language == 'Chinese'){
            $sql = "SELECT tour.tour_language, event.date, guides.name, event.amount FROM tour 
            INNER JOIN event ON tour.event_id = event.id
            INNER JOIN guides ON tour.guides_id = guides.id 
            WHERE `tour_name` LIKE '%$tour_name%' AND `tour_language` = '$language'
            ORDER BY event.date ASC";            
        }
        else{
            $sql = "SELECT tour.tour_language, event.date, guides.name, event.amount FROM tour 
            INNER JOIN event ON tour.event_id = event.id
            INNER JOIN guides ON tour.guides_id = guides.id 
            WHERE `tour_name` LIKE '%$tour_name%'
            ORDER BY event.date ASC";   
        }
        
        $db = $this->database->prepare($sql);       
        $db->execute();
        $result = $db->get_result();       

        while($row = mysqli_fetch_assoc($result)){
            $ticket = new TourTicket($row['tour_language'], $row['name'], $row['date'], $tour_name . ' Tour', $row['amount'], $this->retrieveTicketPrice(2), $this->retrieveTicketPrice(1));
            $tickets[] = $ticket;
        }

        return $tickets;
    }

    //This is used to retrieve the price of a ticket type
    private function retrieveTicketPrice(int $ticket_Id)
    {
        $price = 0;

        $db = $this->database->prepare("SELECT price FROM ticket_type WHERE id=?");
        $db->bind_param("i", $ticket_Id);
        $db->execute();

        $result = $db->get_result();

        if($result->num_rows > 0)
        {
            $data = $result->fetch_assoc();
            $price = $data['price'];
        }

        return $price;
    }

    //retrieves locations for a page
    public function retrieveLocationForMap(int $pageId): array
    {
        $db = $this->database->prepare("SELECT * FROM page_has_map WHERE `page_id` = ?");
        $db->bind_param("i", $pageId);
        $db->execute();

        $result = $db->get_result();

        $locations = array();

        while($row = $result->fetch_assoc())
            $locations[] = $this->retrieveLocationInfo($row['map_id']);

        return $locations;
    }

    //retrieves information for a location
    private function retrieveLocationInfo(int $location_id)
    {
        $db = $this->database->prepare("SELECT * FROM map WHERE `location_id` = ?");
        $db->bind_param('i', $location_id);
        $db->execute();

        $result = $db->get_result();

        $location = null;

        if($result->num_rows > 0)
        {
            $data = $result->fetch_assoc();
            $location = new Map($data['location_Id'], $data['location_name'], $data['latitude'], $data['longitude']);
        }

        return $location;
    }
}
?>