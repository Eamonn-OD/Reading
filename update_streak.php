<?php

require_once( './classes/StreakHandler.php');


  $id= $_GET['id'];

//TODO:sanitize input


 $sh=new StreakHandler();
 $streak=$sh->add_to_streak($id);


unset($_GET);

?>
