<?php
namespace App\Models;

class JazzArtist extends AppModel
{
    private $artist;
    private $description;
    private $picture;
    private $urlSafeArtistName;

    public function __construct($artist, $description, $picture)
    {
        $this->artist = $artist;
        $this->description = $description;
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

    public function getUrlSafeArtistName() {
        return str_replace(" ", "_", $this->artist);
    }

    public function toArray()
    {
        return [
            "artist" => $this->getArtist(),
            "description" => $this->getDescription(),
            "picture" => $this->getPicture(),
            "urlSafeArtistName" => $this->getUrlSafeArtistName()
        ];
    }
}
?>