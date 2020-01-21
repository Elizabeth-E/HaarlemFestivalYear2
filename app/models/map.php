<?php
namespace App\Models;

class Map extends AppModel
{
    private $location_id;
    private $location_name;
    private $latitude;
    private $longitude;

    public function __construct($location_id, $location_name, $latitude, $longitude)
    {
        $this->location_id = $location_id;
        $this->location_name = $location_name;
        $this->latitude = $latitude;
        $this->longitude = $longitude;
    }

    public function setLocationId(int $location_id)
    {
        $this->location_id = $location_id;
    }

    public function setLocationName(string $location_name)
    {
        $this->location_name = $location_name;
    }

    public function setLatitude(float $latitude)
    {
        $this->latitude = $latitude;
    }

    public function setLongitude(float $longitude)
    {
        $this->longitude = $longitude;
    }

    public function getLocationId()
    {
        return $this->location_id;
    }

    public function getLocationName()
    {
        return $this->location_name;
    }

    public function getLatitude()
    {
        return $this->latitude;
    }

    public function getLongitude()
    {
        return $this->longitude;
    }
}
?>