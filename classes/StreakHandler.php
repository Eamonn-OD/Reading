<?php
require_once("./classes/Db.php");

class StreakHandler {


function get_streak($id){
  $db=new Db();
  $sql="SELECT * FROM streak where id=" . $id;
  $result = $db->select($sql);
  if (!$result) {
        printf("Error: Retrieving streak\n");
        exit();
  }

  $data=array("streak" => array());
  foreach($result as $row ) {

        $y=array("id" => $row['id'],
                "streak" => $row['streak'],
                 "last_try" =>$row['last_try']
                );


        array_push($data["streak"],$y);


    }//end of foreach

  return $data;
}
//decides whether can add to a users streak -days user has used the system
function add_to_streak($id){

    $streak_data=$this->get_streak($id);
    $streak=$streak_data['streak'];//format is {"streak":[{"id":"1","streak":"0"}]}

    $last_try=DateTime::createFromFormat('Y-m-d', $streak[0]['last_try']);
    $streak_num=$streak[0]['streak'];

   $yesterday= $this->yesterday();
    $today= $this->today();


    if($last_try < $yesterday){//last attempt was before yesterday
     // echo "last try before yesterday";
      $this->update_streak(1,$id);
    }else if($last_try > $yesterday && $last_try < $today){
      //echo "last try was yesterday";
       $streak_num++;
      $this->update_streak($streak_num,$id);

    }else{
     // echo "last try was today";
        //maybe doing more than once today
    }



}//end of add_to_streak


function update_streak($streak,$id){
  $db=new Db();
  $sql="UPDATE streak SET streak=" .$streak.", last_try=sysdate() WHERE id=".$id;

  $db->query($sql);

}



function yesterday(){
    date_default_timezone_set('America/New_York');
    $now=date('Y-m-d');
    $yesterday= DateTime::createFromFormat('Y-m-d', $now,new DateTimeZone('America/New_York'));
    $yesterday->sub(new DateInterval('P1D'));
    $yesterday->setTime(0, 1);//set time for yesterday as 1 min past midnight
    return $yesterday;
}
function today(){
    date_default_timezone_set('America/New_York');
    $now=date('Y-m-d');
    $today= DateTime::createFromFormat('Y-m-d', $now,new DateTimeZone('America/New_York'));

    $today->setTime(0, 1);//set time for today as 1 min past midnight
    return $today;
}

}//end of class
