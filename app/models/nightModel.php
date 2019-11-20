<?php
namespace App\Models;

class NightModel extends AppModel 
{
    public function __construct()
    {
        parent::__construct();
    }

    public function retrieveEventInfoById(int $eventId)
    {
        $db = $this->database->prepare("SELECT page.id, page.page_name, page.page_description, page.header_title FROM page WHERE page.id = ?");
        $db->bind_param("i", $eventId);
        $db->execute();

        $result = $db->get_result();
        $eventInfo = null;

        while($row = $result->fetch_assoc())
        {
            $eventInfo = new Page($row['id'], $row['page_name'], $row['page_description'], $row['header_title']);
        }

        return $eventInfo;
    }
}
?>