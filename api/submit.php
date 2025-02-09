<?php
$host = "localhost";
$username = "root";
$password = "";

try 
{
    $conn = new PDO("mysql:host=$host;dbname=dogamai", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e)
{
    echo "Connection failed: " . $e->getMessage();
}

$response = array('success' => false);

if(isset($_POST['username']) && $_POST['username']!='' && isset($_POST['email']) && $_POST['email']!='' && isset($_POST['password']) && $_POST['password']!='')
{
	$sql = "INSERT INTO user(username, email, password) VALUES('".addslashes($_POST['username'])."', '".addslashes($_POST['email'])."', '".addslashes($_POST['password'])."')";
	header("location: insert_update.html");

	if($conn->query($sql))
	{
		$response['success'] = true;
	}
}

echo json_encode($response);