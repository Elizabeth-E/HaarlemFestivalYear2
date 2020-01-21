<?php
namespace App\Models;

class Picture extends AppModel
{
    private $image_Id;
    private $image_name;
    private $image_path;

    public function __construct($image_Id, $image_name, $image_path)
    {
        $this->image_Id = $image_Id;
        $this->image_name = $image_name;
        $this->image_path = $image_path;
    }

    public function getImageId()
    {
        return $this->image_Id;
    }

    public function getImageName()
    {
        return $this->image_name;
    }

    public function getImagePath()
    {
        return $this->image_path;
    }

    public function setImageId(int $image_Id)
    {
        $this->image_Id = $image_Id;
    }

    public function setImageName(string $image_name)
    {
        $this->image_name = $image_name;
    }

    public function setImagePath(string $image_path)
    {
        $this->image_path = $image_path;
    }
}
?>