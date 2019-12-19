<?php
namespace App\Models;

class CartModel extends AppModel 
{
    public function __construct()
    {
        parent::__construct();
    }

    //This is used to retrieve information from all pages
    public function retrieveCartPages():array
    {
        $db = $this->database->prepare("SELECT page.id, page.page_name, page.page_description, page.header_title FROM page 
        WHERE page.header_title LIKE '%Festival%'");
        $db->execute();

        $result = $db->get_result();
        $pages = [];

        while($row = $result->fetch_assoc())
        {
            $page = new Page($row['id'], $row['page_name'], $row['page_description'], $row['header_title']);
            $pages[] = $page;
        }

        return $pages;
    }
}