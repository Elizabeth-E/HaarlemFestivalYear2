<?php
namespace App\Models;

class Ticket extends AppModel
{
    private $language;
    private $guide_name;
    private $date;
    private $event_name;
    private $amount;

    protected function __construct($language, $guide_name, $date, $event_name, $amount)
    {
        $this->language = $language;
        $this->guide_name = $guide_name;
        $this->date = $date;
        $this->event_name = $event_name;
        $this->amount = $amount;
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