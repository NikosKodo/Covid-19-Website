<?php

$con = mysqli_connect('localhost','root','','dogamai');

$filename = "specific.json";

$data = file_get_contents($filename);

$array = json_decode($data,true);

foreach ($array as $value) {

$query = "INSERT INTO `pois` (`id_pois`,`name`,`address`,`types`,`rating`,`rating_n`,`current_popularity`,`lat`,`lng`,`pois_date`) VALUES ('".$value['id']."','".$value ['name']."','".$value['address']."','".$value['types']."','".$value['rating']."','".$value['rating_n']."','".$value['current_popularity']."','".$value['lat']."','".$value['lng']."','".$value['pois_date']."')";

    mysqli_query($con,$query);
}

echo "data inserted";