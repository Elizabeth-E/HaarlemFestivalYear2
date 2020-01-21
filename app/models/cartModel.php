<?php
namespace App\Models;

class CartModel extends AppModel 
{
    public function __construct()
    {
        parent::__construct();
    }

    //This is used to retrieve information from all pages
    public function retrieveCartPages($lang):array
    {
        $db = $this->database->prepare("SELECT * FROM page WHERE page.header_title LIKE '%Festival%'");
        $db->execute();

        $result = $db->get_result();
        $pages = [];

        while($row = $result->fetch_assoc())
        {
            $pageName = $row['page_name_'.$lang]; 
            $pageDescription = $row['page_description_'.$lang];

            $page = new Page($row['id'], $pageName, $pageDescription, $row['header_title']);
            $pages[] = $page;
        }

        return $pages;
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

        while($row = mysqli_fetch_assoc($result))
            $image = new Picture($row['id'], $row['name'], $row['path']);

        return $image;
    }
}