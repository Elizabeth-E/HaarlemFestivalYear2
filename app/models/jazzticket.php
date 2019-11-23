<?php
namespace App\Models;

class TourTicket extends Ticket
{
    private $one_day_access_price;
    private $three_day_access_price;
    private $patronaat_main_price;
    private $patronaat_second_third_price;

    public function __construct($language, $guide_name, $date, $event_name, $amount, $one_day_access_price, $three_day_access_price, $patronaat_main_price, $patronaat_second_third_price)
    {
        parent::__construct($language, $guide_name, $date, $event_name, $amount);

        $this->one_day_access_price = $one_day_access_price;
        $this->three_day_access_price = $three_day_access_price;
        $this->patronaat_main_price = $patronaat_main_price;
        $this->patronaat_second_third_price = $patronaat_second_third_price;
    }

    public function setOneDayAccessPrice(int $one_day_access_price)
    {
        $this->one_day_access_price = $one_day_access_price;
    }

    public function setThreeDayAccessPrice(int $three_day_access_price)
    {
        $this->three_day_access_price = $three_day_access_price;
    }

    public function setPatronaatMainPrice()
    {
        $this->patronaat_main_price = $patronaat_main_price;
    }

    public function setPatronaatSecondThirdPrice()
    {
        $this->patronaat_second_third_price = $patronaat_second_third_price;   
    }

    public function getOneDayAccessPrice()
    {
        return $this->one_day_access_price;
    }

    public function getThreeDayAccessPrice()
    {
        return $this->three_day_access_price;
    }

    public function getPatronaatMainPrice()
    {
        return $this->patronaat_main_price;

    public function getPatronaatSecondThirdPrice()
    {
        return $this->patronaat_second_third_price;   
    }
}
?>