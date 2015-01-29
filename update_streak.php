<?php
  require 'db.php';

date_default_timezone_set('America/New_York');

function yesterday(){
    $now=date('Y-m-d');
    $yesterday= DateTime::createFromFormat('Y-m-d', $now,new DateTimeZone('America/New_York'));
    $yesterday->sub(new DateInterval('P1D'));
    $yesterday->setTime(0, 1);//set time for yesterday as 1 min past midnight
    return $yesterday;
}
function today(){
    $now=date('Y-m-d');
    $today= DateTime::createFromFormat('Y-m-d', $now,new DateTimeZone('America/New_York'));

    $today->setTime(0, 1);//set time for today as 1 min past midnight
    return $today;
}


    $id= $_GET['id'];



    $con=get_connection();
    $streakObj=get_streak($id);

$streak=$streakObj['streak'];//format is {"streak":[{"id":"1","streak":"0"}]}
print_r($streak[0]['last_try']);//format from db is 2015-01-15
echo"==<br>";
$last_try=DateTime::createFromFormat('Y-m-d', $streak[0]['last_try']);
$streak_num=$streak[0]['streak'];

$yesterday=yesterday();
$today=today();
echo"==<br>";
print_r($yesterday);
echo"==<br>";
print_r($today);
echo"==<br>";
print_r($last_try);

if($last_try < $yesterday){//last attempt was before yesterday
    echo "last try before yesterday";
    update_streak($con,1,$id);
}else if($last_try > $yesterday && $last_try < $today){
     $streak_num++;
    update_streak($con,$streak_num,$id);

}else{
    echo "did not update streak";//maybe doing more than once today
}

    mysqli_close($con);
    unset($_GET);

?>
