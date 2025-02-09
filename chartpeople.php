
<?php

    $conn = mysqli_connect('localhost','root','','dogamai');
    $sql = "SELECT name,current_popularity FROM pois";
    $result = mysqli_query($conn, $sql);
    while($row = mysqli_fetch_assoc($result))
    {
	   $dataPoints[] = array("Country"=>$row['name'], "y"=>$row['current_popularity']);
    }
?>

<!DOCTYPE HTML>
<html>
<head>

<head>
		<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chart Admin</title>
    <link rel="stylesheet" href="chart.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>

<script>
window.onload = function() 
 {
    var chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        subtitles: [{
            text: "Covid-19 Website"
        }],
        data: [{
            type: "doughnut",
            yValueFormatString: "#,##0.\"\"",
            indexLabel: "{Country}  ( {y} people)",
            dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
        }]
    });
  chart.render();
 }
</script>
</head>
<body>


   <h1 style="text-align:center;color:gray">THE NUMBER OF VISITS FOR EACH PLACE</h1>
   <h2 style="text-align:center;color:gray">Pie Chart for Visits</h2>
   
   <div id="chartContainer" style="height: 370px; width: 100%;"></div>


<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>         
