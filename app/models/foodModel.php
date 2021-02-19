<?php
namespace App\Models;
 
class FoodModel extends AppModel
{
 
    private $comment = "";
 
    public function __construct()
    {
        parent::__construct();
         
    }
    //This is used to retrieve information of all pages that belongs to the food event
public function retrieveFoodPages($lang):array
    {
         $db = $this->database->prepare("SELECT * FROM page 
        WHERE page.page_name_en  LIKE '%Specktakel%'
        OR page.page_name_en  LIKE '%Ratatouille%' 
        OR page.page_name_en  LIKE '%ML%'
        OR page.page_name_en  LIKE '%Fris%'
        OR page.page_name_en  LIKE '%Mr.&Mrs.%'
        OR page.page_name_en  LIKE '%Brinkman%'
        OR page.page_name_en  LIKE '%Urban%'
        OR page.page_name_en  LIKE '%Golden%'
        OR page.page_name_en  LIKE '%Food%'");
        $db->execute();
        $result = $db->get_result();       
        $event_pages = [];
        while($row = $result->fetch_assoc())
        {
            $event_page = new Page($row['id'], $row['page_name_'.$lang], $row['page_description_'.$lang], $row['header_title']);
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

    public function comment(string $comment)
{  
    $dbHandle = $this->database->prepare("INSERT INTO food (reservation_comments) VALUES (?)");
    $dbHandle->bind_param("s", $comment);
    $dbHandle->execute();
    $dbHandle->close();
}
public function retrieveAmountOfSeats(string $RestaurantName)
{
     $db = $this->database->prepare("SELECT amount FROM event WHERE `name` = ?");
        $db->bind_param("s", $RestaurantName);
        $db->execute();
        $result = $db->get_result();
            $AmountOfSeats = 0;
         if($result->num_rows > 0)
        {
            $data = $result->fetch_assoc();
            $AmountOfSeats = $data['amount'] ;        
        }
        return $AmountOfSeats;
}
}