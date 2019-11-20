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
}
?>