<?php
require_once("./classes/Db.php");

class StreakHandler {
  private $date_format = 'Y-m-d H:i:s';

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


  $last_try=$this->make_date( 'Y-m-d',$streak[0]['last_try']);//need this format as it add time portion get error

    $streak_num=$streak[0]['streak'];

   $yesterday= $this->yesterday();
    $today= $this->today();
//echo "yesterday is ".$yesterday->format($this->date_format)."<br>";
// echo "today is ".$today->format($this->date_format)."<br>";
 //echo "last_try was ".$last_try->format($this->date_format)."<br>";


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
//echo $sql;
  $db->query($sql);

}



function yesterday(){
    $yesterday=$this->now();

    $yesterday->sub(new DateInterval('P1D'));//sets date obj to yesterday
    $yesterday->setTime(0, 1);//set time for yesterday as 1 min past midnight
    return $yesterday;
}
function today(){
    $today=$this->now();

    $today->setTime(0, 1);//set time for today as 1 min past midnight
    return $today;
}
  function now(){


    return $this->make_date( $this->date_format,null);


  }
  function make_date($format,$date){
    $tz_object = new DateTimeZone('America/New_York');
    if($date==null){



      $datetime = new DateTime();
      $datetime->setTimezone($tz_object);
      return $datetime;
    }
    return DateTime::createFromFormat($format, $date,$tz_object );
  }

}//end of class
