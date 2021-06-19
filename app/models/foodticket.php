<?php
namespace App\Models;

class FoodTicket extends Ticket
{
	private no_of_adults;
	private no_of_kids;
	private time;
	private $comment;
    private food_price;

    public function __construct($date, $event_name, $amount, $no_of_adults, $no_of_kids, $time, $comment, $food_price)
    {
        parent::__construct($date, $event_name, $amount);

       $this->no_of_adults = $no_of_adults;
       $this->no_of_kids = $no_of_kids;
       $this->time = $time;
       $this->comment = $comment;
	   $this->food_price = $food_price;
    }
    public function getFoodPrice()
    {
        return $this->food_price;
    }
    public function getNoAdults()
    {
        return $this->no_of_adults;
    }
    public function getNoKids()
    {
        return $this->no_of_kids;
    }
    public function getComment()
    {
        $this->comment = $comment;
    }
    public function setTime(datetime $time())
    {
        $this->time = $time;
    }
    public function setNoAdults(int $no_of_adults)
    {
        $this->no_of_adults = $no_of_adults;
    }
     public function setNoKids(int $no_of_kids)
    {
        $this->no_of_kids = $no_of_kids;
    }
    public function setFoodPrice(int $food_price)
    {
        $this->food_price = $food_price;
    }
    public function setComment(string $comment)
    {
        $this->comment = $comment;
    }
    public function getTime()
    {
        return $this->time;
    }
}
?>