<?php
namespace App\Models;

class Ticket extends AppModel
{
    public double $price;
    public int $nrOfPeople;
    public string $language;
    public string $guide_name;
    public $datetime date;
    public string $event_name;

    public function __construct($price, $nrOfPeople, $language, $guide_name, $date, $event_name)
    {
        $this->price = $price;
        $this->nrOfPeople = $nrOfPeople;
        $this->language = $language;
        $this->guide_name = $guide_name;
        $this->date = $date;
        $this->event_name = $event_name;
    }
}
?>