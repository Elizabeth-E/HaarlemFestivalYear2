<?php
namespace App\Models;

class CheckoutService extends AppModel
{
    public $eventList = [];

    public function __construct()
    {
        parent::__construct();

    }

    public function addUser(string $firstName, string $lastName, string $email)
    {
        $dbHandle = $this->database->prepare("INSERT INTO user (email, firstname, lastname) VALUES (?,?,?)");
        $dbHandle->bind_param("sss", $email, $firstName, $lastName);
        $dbHandle->execute();
    }
}
?>