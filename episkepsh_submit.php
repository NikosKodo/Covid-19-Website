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

if(isset($_POST['visit']) && $_POST['visit']!='' && isset($_POST['number']) && $_POST['number']!='')
{
	$sql = "INSERT INTO episkepseis(visit, number) VALUES('".addslashes($_POST['visit'])."','".addslashes($_POST['number'])."')";
	//header("location: map.html");

	if($conn->query($sql))
	{
		$response['success'] = true;
	}
}

echo json_encode($response);

