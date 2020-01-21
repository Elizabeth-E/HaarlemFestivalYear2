<?php
namespace App\Models;

class Ticket extends AppModel
{
    private $date;
    private $event_name;
    private $amount;

    public function __construct($date, $event_name, $amount)
    {
        $this->date = $date;
        $this->event_name = $event_name;
        $this->amount = $amount;
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