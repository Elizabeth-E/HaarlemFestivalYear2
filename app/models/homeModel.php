<?php
namespace App\Models;

class HomeModel extends AppModel 
{
    public function __construct()
    {
        parent::__construct();
    }

    public function listUsers()
    {
        $dbHandle = $this->database->prepare("SELECT * FROM accounts ORDER BY username ASC");
        $dbHandle->execute();
        $result = $dbHandle->get_result();

        if ($result->num_rows !== 0)
        {
            $userList = [];
            while ($row = $result->fetch_assoc())
            {
                $userList[] = [
                    "id" => $row["id"],
                    "username" => $row["username"]
                ];
            }

            return $userList;
        }
        else
        {
            echo "No results!";
            return null;
        }

        $dbHandle->close();
    }
}
?>