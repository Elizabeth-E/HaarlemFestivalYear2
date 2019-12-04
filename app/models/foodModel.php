<?php
namespace App\Models;
 
class FoodModel extends AppModel
{
 
    private $comment = "";
 
    public function __construct()
    {
        parent::__construct();
         
    }
     
 
    public function comment(string $comment)
{  
    $dbHandle = $this->database->prepare("INSERT INTO food (reservation_comments) VALUES (?)");
    $dbHandle->bind_param("sssss", $comment);
    $dbHandle->execute();
     
    $dbHandle->close();
}
 
}