<?php
namespace App\Models;

class JazzEvent extends AppModel
{
    private $date;
    private $day;
    private $time;
    private $location;
    private $hall;
    private $artist;
    private $price;

    public function __construct($date, $day, $time, $location, $hall, $artist, $price)
    {
        $this->date = $date;
        $this->day = $day;
        $this->time = $time;
        $this->location = $location;
        $this->hall = $hall;
        $this->artist = $artist;
        $this->price = $price;

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
}
?>