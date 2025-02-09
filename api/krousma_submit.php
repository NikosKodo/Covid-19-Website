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

$response2 = array('success' => false);

if(isset($_POST['krousma_visit']) && $_POST['krousma_visit']!='' && isset($_POST['date2']) && $_POST['date2']!='' && isset($_POST['cases']) && $_POST['cases']!='')

{
	$sql = "INSERT INTO krousma(krousma_visit,date2,cases) VALUES('".addslashes($_POST['krousma_visit'])."','".addslashes($_POST['date2'])."','".addslashes($_POST['cases'])."')";
	
	if($conn->query($sql))
	{
		$response2['success'] = true;
	}
}

echo json_encode($response2);