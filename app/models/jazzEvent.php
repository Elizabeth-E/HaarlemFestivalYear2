<?php
namespace App\Models;

class JazzEvent extends AppModel
{
    private $ticketid;
    private $date;
    private $day;
    private $time;
    private $location;
    private $hall;
    private $artist;
    private $price;
    private $picture;
    

    public function __construct($ticketid, $date, $day, $time, $location, $hall, $artist, $price, $picture)
    {
        $this->ticketid = $ticketid;
        $this->date = $date;
        $this->day = $day;
        $this->time = $time;
        $this->location = $location;
        $this->hall = $hall;
        $this->artist = $artist;
        $this->price = $price;
        $this->picture = $picture;
       

    }

    public function getDate()
    {
        return $this->date;
    }
    public function getDay()
    {
        return $this->day;
    }
    public function getTime()
    {
        return $this->time;
    }
    public function getLocation()
    {
        return $this->location;
    }
    public function getHall()
    {
        return $this->hall;
    }
    public function getArtist()
    {
        return $this->artist;
    }
    public function getPrice()
    {
        return $this->price;
    }
    public function getPicture()
    {
        return $this->picture;
    }
    public function getTicketid()
    {
        return $this->ticketid;
    }

    public function toArray()
    {
        return [
            "ticketid" => $this->getTicketid(),
            "date" => $this->getDate(),
            "day" => $this->getDay(),
            "time" => $this->getTime(),
            "location" => $this->getLocation(),
            "hall" => $this->getHall(),
            "artist" => $this->getArtist(),
            "price" => $this->getPrice(),
            "picture" => $this->getPicture()
        ];
    }
}
?>