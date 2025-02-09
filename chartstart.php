<?php 

$username = "root";
$password = "";
$database = "dogamai";

try {
  $pdo = new PDO("mysql:host=localhost;database=$database", $username, $password);
  // Set the PDO error mode to exception
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e){
  die("ERROR: Could not connect. " . $e->getMessage());
}

?>

<!DOCTYPE html>
    <html>
	<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/cerulean/bootstrap.min.css">
	</head>

    <body>
        
    <?php 
// Attempt select query execution
try{
  $sql = "SELECT * FROM dogamai.episkepseis";   
  $result = $pdo->query($sql);
  if($result->rowCount() > 0) {
    while($row = $result->fetch()) {
        echo $row["id_episkepshs"];
    }
  unset($result);
  } else {
    echo "No records matching your query were found.";
  }
} catch(PDOException $e){
  die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}
 
// Close connection
unset($pdo);
?>







    </body>