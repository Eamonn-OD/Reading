<?php

require_once( './classes/StreakHandler.php');


 $sh=new StreakHandler();
 $streak=$sh->get_streak(1);//hard-coding user_id for now






header('Content-Type: application/json');
echo json_encode($streak);




?>
