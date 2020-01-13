<?php
namespace App\Models;

class TimetableJazz extends AppModel
{
    public $jazzEvent = [];

    public function __construct()
    {
        parent::__construct();

    }

    public function getTimetableEvent()
    {
        $jazzEvent = new JazzEvent($row['date'], $row['day'], $row['time'], $row['location'], $row['hall'], $row['artist'], $row['price']);

        SELECT event.name, event.date, concert.concert_name, ticket_type.price FROM ((((event INNER JOIN concert ON event.id = concert.event_id) INNER JOIN event_has_ticket ON event.id = event_has_ticket.event_id) INNER JOIN ticket ON event_has_ticket.ticket_id = ticket.id) INNER JOIN ticket_type ON ticket.ticket_type_id = ticket_type.id); 

        //this works
        SELECT concert.concert_name FROM concert INNER JOIN artist_has_concert ON concert.id = artist_has_concert.concert_id;
        
        //pulls concert name and artist name
        SELECT concert.concert_name, artist.artist_name FROM ((concert INNER JOIN artist_has_concert ON concert.id = artist_has_concert.concert_id) INNER JOIN artist ON artist_has_concert.artist_id = artist.id);


        //query for checking dates when entering data
        SELECT event.name, event.date, ticket.date FROM ((event INNER JOIN event_has_ticket ON event.id = event_has_ticket.event_id) INNER JOIN ticket ON event_has_ticket.ticket_id = ticket.id)

        SELECT event.name, event.date, ticket_type.price FROM (((event INNER JOIN event_has_ticket ON event.id = event_has_ticket.event_id) INNER JOIN ticket ON event_has_ticket.ticket_id = ticket.id) INNER JOIN ticket_type ON ticket.ticket_type_id = ticket_type.id)


        //the eventual query... tam tam taaaam
        // c = concert, e = event
        SELECT e.e_name, e.e_date, c.c_name, c.a_name, e.t_price 
        FROM (
            SELECT concert.concert_name as c_name, concert.event_id as c_event_id, artist.artist_name as a_name
            FROM ((concert INNER JOIN artist_has_concert ON concert.id = artist_has_concert.concert_id) 
            INNER JOIN artist ON artist_has_concert.artist_id = artist.id)
        ) as c
        INNER JOIN (
            SELECT event.name as e_name, event.id as e_id, event.date as e_date, ticket_type.price as t_price
            FROM (((event INNER JOIN event_has_ticket ON event.id = event_has_ticket.event_id) 
                    INNER JOIN ticket ON event_has_ticket.ticket_id = ticket.id)
                         INNER JOIN ticket_type ON ticket.ticket_type_id = ticket_type.id)

        ) as e ON c.c_event_id = e.e_id
    }
?>
