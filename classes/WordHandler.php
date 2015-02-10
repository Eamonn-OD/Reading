<?php
require_once("./classes/Db.php");

class WordHandler {


  /*private $db;

  function __construct() {
    echo "in constructor of WordHandler";
       $this->$db=new Db();
   }*/


  function get_sentences($id){
    $db=new Db();

     $sentences=array();
    $sql="SELECT * FROM sentences where word_id=" . $id;
     $result = $db->select($sql);
    if (!$result) {
        printf("Error: Retrieving sentences\n");
        exit();
    }

     foreach($result as $row ) {

         array_push($sentences,$row['sentence']);



     }


    return $sentences;
  }//end of get_sentences


  function get_words(){
  $db=new Db();
    $result=$db->select("SELECT * FROM words order by num_successful asc limit 15");
    if (!$result) {
        printf("Error: Retrieving words\n");
        exit();
    }
    $data=array("words" => array());
    foreach($result as $row) {

        $y=array("word_id" => $row['word_id'],
                "word" => $row['word'],
                "type" => $row['type'],
                "image" => $row['image'],
                "sentences" => $this->get_sentences($row['word_id']));


        array_push($data["words"],$y);


    }//end of foreach

    return $data;
  }



}


