<?php

function get_connection(){
        $con=mysqli_connect("localhost","admin","ndTyD4haSXTpzsQX","reading1");
        // Check connection
        if (mysqli_connect_errno()) {
          echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }
        return $con;
    }
function do_select($con,$sql){
    $result = mysqli_query($con,"SELECT * FROM words");
    if (!$result) {
        printf("Error: %s\n", mysqli_error($con));
        exit();
    }
    return $result;
}
function get_sentences($id){
  $con=mysqli_connect("localhost","admin","ndTyD4haSXTpzsQX","reading1");
        // Check connection
   if (mysqli_connect_errno()) {
       echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
   $sentences=array();
    $sql="SELECT * FROM sentences where word_id=" . $id;
     $result = mysqli_query($con,$sql);
    if (!$result) {
        printf("Error: %s\n", mysqli_error($con));
        exit();
    }

     while($row = mysqli_fetch_assoc($result)) {
      // if($row['sentence']){
         array_push($sentences,$row['sentence']);//$row['sentence']);
      // }


     }
  mysqli_free_result($result);
  mysqli_close($con);

    return $sentences;
}
function get_words(){
    $con=mysqli_connect("localhost","admin","ndTyD4haSXTpzsQX","reading1");
        // Check connection
   if (mysqli_connect_errno()) {
       echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }


   $sql="SELECT * FROM words order by num_successful asc limit 15";
  $result = mysqli_query($con,$sql);
    if (!$result) {
        printf("Error: %s\n", mysqli_error($con));
        exit();
    }

    $data=array("words" => array());
    while($row = mysqli_fetch_assoc($result)) {

        $y=array("word_id" => $row['word_id'],
                "word" => $row['word'],
                "type" => $row['type'],
                "image" => $row['image'],
                "sentences" => get_sentences($row['word_id']));

        //echo $y["word"];
        array_push($data["words"],$y);


    }//end of while
    mysqli_free_result($result);
    mysqli_close($con);
    return $data;
}
function get_word_by_id($id){
   $con=mysqli_connect("localhost","admin","ndTyD4haSXTpzsQX","reading1");
        // Check connection
   if (mysqli_connect_errno()) {
       echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
  $sql="SELECT * FROM words where word_id=" . $id;
  $result = mysqli_query($con,$sql);
    if (!$result) {
        printf("Error: %s\n", mysqli_error($con));
        exit();
    }
  $row = mysqli_fetch_assoc($result);
  mysqli_free_result($result);
  mysqli_close($con);
  return $row;
}



function update_word_score($con,$word){
//echo "\n"
  $sql="UPDATE words SET num_attempted=" .$word['num_attempted'].
                 ", num_successful=".$word['num_successful'] .
    ", last_try=sysdate()".
                 " WHERE word_id=".$word['word_id'];
    echo $sql;
    $result=mysqli_query($con,$sql);

}

//======SQL for streak
function get_streak($id){
   $con=mysqli_connect("localhost","admin","ndTyD4haSXTpzsQX","reading1");
        // Check connection
   if (mysqli_connect_errno()) {
       echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }
  $sql="SELECT * FROM streak where id=" . $id;
  $result = mysqli_query($con,$sql);
    if (!$result) {
        printf("Error: %s\n", mysqli_error($con));
        exit();
    }
 // $row = mysqli_fetch_assoc($result);
   $data=array("streak" => array());
    while($row = mysqli_fetch_assoc($result)) {

        $y=array("id" => $row['id'],
                "streak" => $row['streak'],
                 "last_try" =>$row['last_try']
                );

        //echo $y["word"];
        array_push($data["streak"],$y);


    }//end of while
  mysqli_free_result($result);
  mysqli_close($con);
  return $data;
}
function update_streak($con,$streak,$id){
//echo "\n"
  $sql="UPDATE streak SET streak=" .$streak.

    ", last_try=sysdate()".
                 " WHERE id=".$id;
    echo $sql;
    $result=mysqli_query($con,$sql);

}

//===end SQL for streak==

  ?>
