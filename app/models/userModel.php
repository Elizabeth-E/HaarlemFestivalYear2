<?php
namespace App\Models;

class UserModel extends AppModel 
{
	private $salt = "";
	private $userId = 0;
	private $username = "";
	private $email = "";
	private $role = "";
	private $isActivated = false;

	public function __construct()
	{
		parent::__construct();
		
		$this->salt = \Framework\getConfig("password_salt");
	}

	public function generateValidationToken(string $email) : string
	{
		$randomToken = (string) rand() . ";" . $email . ";" . (string) date("d/m/Y");
		$validationToken = md5($randomToken);

		return $validationToken;
	}

	public function register(string $username, string $email, string $password, 
		string $validationToken, string $firstname, string $lastname)
	{
		$password = sha1($password . $this->salt);

		

		$dbHandle = $this->database->prepare("INSERT INTO user (username, password, email, validation_token, firstname, lastname, birthdate) VALUES (?,?,?,?,?,?,?)");
		$dbHandle->bind_param("sssssss", $username, $password, $email, $validationToken, $firstname, $lastname);
		$dbHandle->execute();
		
		$dbHandle->close();
	}

	public function setValidationToken(string $email) : string
	{
		$validationToken = $this->generateValidationToken($email);
		
		$dbHandle = $this->database->prepare("UPDATE user SET validation_token = ? WHERE email = ?");
		$dbHandle->bind_param("ss", $validationToken, $email);
		$dbHandle->execute();
		$dbHandle->close();

		return $validationToken;
	}

	public function checkPassword(string $pass1, string $pass2) : bool
	{
		if (strcmp($pass1, $pass2) === 0) 
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public function userExists(string $email) : bool
	{
		$dbHandle = $this->database->prepare("SELECT email from user where email = ?");
		$dbHandle->bind_param("s", $email);
		$dbHandle->execute();

		$result = $dbHandle->get_result();

		if ($result->num_rows == 0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	Public function checkCredentials(string $email, string $password) : bool
	{
		$password = sha1($password . $this->salt);

		$dbHandle = $this->database->prepare("
		SELECT user.email, user.is_activated, role.role
		FROM user, user_roles AS role
		WHERE email = ? and password = ? AND role.id = user.user_roles_id");
		$dbHandle->bind_param("ss", $email, $password);
		$dbHandle->execute();

		$result = $dbHandle->get_result();

		if ($result->num_rows == 0)
		{
			return false;
		}
		else
		{
			$userData = $result->fetch_assoc();

			$this->userId = $userData["id"];
			$this->username = $userData["username"];
			$this->email = $userData["email"];
			$this->isActivated = $userData["activation_status"];
			$this->role = $userData["role"];

			return true;
		}

		$dbHandle->close();
	}

	public function checkValidationToken(string $email, string $validationToken) : bool
	{
		$dbHandle = $this->database->prepare("SELECT validation_token FROM user WHERE email = ? and validation_token = ? ");
		$dbHandle->bind_param("ss", $email, $validationToken);
		$dbHandle->execute();

		$result = $dbHandle->get_result();

		if ($result->num_rows > 0)
		{
			while ($row = $result->fetch_assoc())
			{
				if (strcmp($row["validation_token"], $validationToken) === 0) 
				{
					return true;
				}
			}
		}
		$dbHandle->close();

		return false;
	}

	public function activateAccount(string $email, string $validationToken) : bool
	{
		$status = false;

		if ($this->checkValidationToken($email, $validationToken))
		{
			$dbHandle = $this->database->prepare("UPDATE user SET activation_status = 1 WHERE validation_token = ? AND email = ?");
			$dbHandle->bind_param("ss", $validationToken, $email);
			
			$status = $dbHandle->execute();
			
			$dbHandle->close();
		}
		return $status;
	}

	public function changePassword(string $password, string $email)
	{
		$password = sha1($password . $this->salt);

		$dbHandle = $this->database->prepare("UPDATE user SET password = ? WHERE email = ?");
		$dbHandle->bind_param("ss", $password, $email);
		$dbHandle->execute();
		$dbHandle->close();
	}


	public function getUsername() : string
	{
		return $this->username;
	}

	public function getEmail() : string
	{
		return $this->email;
	}

	public function getRole() : string
	{
		return $this->role;
	}
	public function getUserId() : string
	{
		return $this->userId;
	}

	public function getActivationStatus() : bool
	{
		return boolval($this->isActivated);
	}

	public function getProfile(string $email) : array
	{
		$email=\Framework\CryptXOR($email);

		$dbHandle = $this->database->prepare("SELECT username, email, firstname, lastname, birthdate, registration_date FROM user WHERE email = ?");
		$dbHandle->bind_param("s", $email);
		$dbHandle->execute();

		$result = $dbHandle->get_result();

		$profile = [];
		if ($result->num_rows > 0)
		{
			$profile = $result->fetch_assoc();
		}

		return $profile;
	} 

	public function updateProfile($email, $firstname, $lastname)
	{
		$dbHandle = $this->database->prepare("UPDATE user SET email = ?, firstname = ?, lastname = ?, birthdate = ? WHERE email = ?");
		$dbHandle->bind_param("sssss", $email, $firstname, $lastname, $email);
		$dbHandle->execute();
		
		$dbHandle->close();
	}
}  