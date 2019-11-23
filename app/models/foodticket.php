<?php
namespace App\Models;

class FoodTicket extends Ticket
{
    private $food_price;

    public function __construct($language, $guide_name, $date, $event_name, $amount, $food_price)
    {
        parent::__construct($language, $guide_name, $date, $event_name, $amount);

        $this->food_price = $food_price;
    }

    public function setFoodPrice(int $food_price)
    {
        $this->food_price = $food_price;
    }

    public function getFoodPrice()
    {
        return $this->food_price;
    }
}
?>