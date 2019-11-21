<?php
namespace App\Models;

class Ticket extends AppModel
{
    private $price;
    private $nrOfPeople;
    private $language;
    private $guide_name;
    private $date;
    private $event_name;
    private $amount;

    public function __construct($price, $nrOfPeople, $language, $guide_name, $date, $event_name, $amount)
    {
        $this->price = $price;
        $this->nrOfPeople = $nrOfPeople;
        $this->language = $language;
        $this->guide_name = $guide_name;
        $this->date = $date;
        $this->event_name = $event_name;
        $this->amount = $amount;
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

    public function setGuideName(string $guide_name)
    {
        $this->guide_name = $guide_name;
    }

    public function setDate(datetime $date)
    {
        $this->date = $date;
    }

    public function setEventName(string $event_name)
    {
        $this->event_name = $event_name;
    }

    public function setAmount(int $amount)
    {
        $this->amount = $amount;
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
        return $this->guide_name;
    }

    public function getDate()
    {
        return $this->date;
    }

    public function getEventName()
    {
        return $this->event_name;
    }

    public function getAmount()
    {
        return $this->amount;
    }
}
?>