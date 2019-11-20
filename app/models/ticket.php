<?php
namespace App\Models;

class Ticket extends AppModel
{
    private $price;
    private $nrOfPeople;
    private $language;
    private $guide_Id;
    private $date;
    private $event_name;

    public function __construct(double $price, int $nrOfPeople, string $language, int $guide_name, datetime $date, string $event_name)
    {
        $this->price = $price;
        $this->nrOfPeople = $nrOfPeople;
        $this->language = $language;
        $this->guide_Id = $guide_Id;
        $this->date = $date;
        $this->event_name = $event_name;
    }

    public function setPrice(double $price)
    {
        $this->price = $price;
    }

    public function setNrOfPeople(int $nrOfPeople)
    {
        $this->nrOfPeople = $nrOfPeople;
    }

    public function setLanguage(string $language)
    {
        $this->language = $language;
    }

    public function setGuideName(int $guide_Id)
    {
        $this->guide_Id = $guide_Id;
    }

    public function setDate(datetime $date)
    {
        $this->date = $date;
    }

    public function setEventName(string $event_name)
    {
        $this->event_name = $event_name;
    }

    public function getPrice()
    {
        return $this->price;
    }

    public function getNrOfPeople()
    {
        return $this->nrOfPeople;
    }

    public function getLanguage()
    {
        return $this->language;
    }

    public function getGuideName()
    {
        return $this->guide_Id;
    }

    public function getDate()
    {
        return $this->date;
    }

    public function getEventName()
    {
        return $this->event_name;
    }
}
?>