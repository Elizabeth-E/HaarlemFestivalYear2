<?php
namespace App\Models;

class TourTicket extends Ticket
{
    private $regular_ticket_price;
    private $family_ticket_price;
    private $language;
    private $guide_name;

    public function __construct($language, $guide_name, $date, $event_name, $amount, $regular_ticket_price, $family_ticket_price)
    {
        parent::__construct($date, $event_name, $amount);

        $this->language = $language;
        $this->guide_name = $guide_name;
        $this->regular_ticket_price = $regular_ticket_price;
        $this->family_ticket_price = $family_ticket_price;
    }

    public function setRegularTicketPrice(int $regular_ticket_price)
    {
        $this->regular_ticket_price = $regular_ticket_price;
    }

    public function setFamilyTicketPrice(int $family_ticket_price)
    {
        $this->family_ticket_price;
    }

    public function setLanguage(string $language)
    {
        $this->language = $language;
    }

    public function setGuideName(string $guide_name)
    {
        $this->guide_name = $guide_name;
    }

    public function getRegularTicketPrice()
    {
        return $this->regular_ticket_price;
    }

    public function getFamilyTicketPrice()
    {
        return $this->family_ticket_price;
    }

    public function getLanguage()
    {
        return $this->language;
    }

    public function getGuideName()
    {
        return $this->guide_name;
    }
}
?>