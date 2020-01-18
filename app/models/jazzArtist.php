<?php
namespace App\Models;

class JazzArtist extends AppModel
{
    private $artist;
    private $description;
    private $picture;


    public function __construct($artist, $description, $picture)
    {
        $this->artist = $artist;
        $this->price = $description;
        $this->picture = $picture;

    }
    public function getArtist()
    {
        return $this->artist;
    }
    public function getDescription()
    {
        return $this->description;
    }
    public function getPicture()
    {
        return $this->picture;
    }

    public function toArray()
    {
        return [
            "artist" => $this->getArtist(),
            "description" => $this->getPrice()
            "picture" => $this->getPicture()
        ];
    }
}
?>