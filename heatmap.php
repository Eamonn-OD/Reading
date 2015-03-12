<?php

require_once( './classes/StreakHandler.php');


 $sh=new StreakHandler();
 $streak=$sh->get_streak(1);//hard-coding user_id for now

/*$test=array(
    "itemSelector" => "#start-a",
    "domain" => "month",
    "range" =>  12,
    "displayLegend" => false
);*/
$date = new DateTime();
$x=$date->getTimestamp();

$y=$x-100000;
    $y1=$x-900000;
    $y2=$x-1000000;

$test=array(
	"".$y => 1,
	"".$y1 => 5,
	"".$y2 => 10
);



header('Content-Type: application/json');
echo json_encode($test);




?>
