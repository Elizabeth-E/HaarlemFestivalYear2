<?php
namespace App\Models;

class FoodTicket extends Ticket
{
	private no_of_adults;
	private no_of_kids;
	private time;
	private comment;
    private $food_price;

    public function __construct($date, $event_name, $amount, no_of_adults, no_of_kids, time, comment, $food_price)
    {
        parent::__construct($date, $event_name, $amount);

       $this->no_of_adults = $no_of_adults;
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