<?php
  require_once( './classes/WordHandler.php');


 $wh=new WordHandler();
 $words=$wh->get_words();





header('Content-Type: application/json');
echo json_encode($words);




?>
