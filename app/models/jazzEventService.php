<?php
namespace App\Models;

class JazzEventService extends AppModel
{
    public $eventList = [];

    public function __construct()
    {
        parent::__construct();

    }

    public function getJazzEvent()
    {
        $dbHandle = $this->database->prepare("
        SELECT e.event, e.event_date, c.artist, e.price 
        FROM (
            SELECT concert.concert_name as concert, concert.event_id as c_event_id, artist.artist_name as artist
            FROM ((concert INNER JOIN artist_has_concert ON concert.id = artist_has_concert.concert_id) 
            INNER JOIN artist ON artist_has_concert.artist_id = artist.id)
        ) as c
        INNER JOIN (
            SELECT event.name as event, event.id as e_id, event.date as event_date, ticket_type.price as price
            FROM (((event INNER JOIN event_has_ticket ON event.id = event_has_ticket.event_id) 
                    INNER JOIN ticket ON event_has_ticket.ticket_id = ticket.id)
                    INNER JOIN ticket_type ON ticket.ticket_type_id = ticket_type.id)

        ) as e ON c.c_event_id = e.e_id");
        
        $dbHandle->execute();
        $result = $dbHandle->get_result();

        while($row = $result->fetch_assoc()) {
            $explodedEvent = explode("_", $row["event"]);

            // Event time calculations
            $startDate = strtotime($row["event_date"]);
            $eventDate = date("d M", $startDate);
            $eventStartTime = date("H:i", $startDate);
            $eventEndTime = date("H:i", $startDate + 60 * 60); // Event time +1 hour

            $eventData = [
                'date' => $eventDate,
                'time' => $eventStartTime.' - '.$eventEndTime,
                'artist' => $row["artist"],
                'price' => floatval($row["price"]),
                'day' => $explodedEvent[1],
                'location' => $explodedEvent[2],
                'hall' => @$explodedEvent[3].' '.@$explodedEvent[4] // Ignore errors '@' 
            ];

            // Add event to array
            $eventList[] = new JazzEvent(
                $eventData['date'],
                $eventData['day'],
                $eventData['time'],
                $eventData['location'],
                $eventData['hall'],
                $eventData['artist'],
                $eventData['price']
            );                
        }

        $dbHandle->close();
        return $eventList;
    }
    public function getJazzArtist($artist)
    {
        $dbHandle = $this->database->prepare("SELECT * FROM artist WHERE artist.artist_name = ?");
        $dbHandle->bind_param("s", $artist);
        $dbHandle->execute();
        $result = $dbHandle->get_result();

        while($dbArtist = $result->fetch_assoc()) {
        // Add event to array
        $artistPageInfo = new JazzArtist(
            $dbArtist['artist_name'],
            $dbArtist['artist_info'],
            $dbArtist['artist_picture'] 
        );  
        }
        return $artistPageInfo;



    }
}
?>
