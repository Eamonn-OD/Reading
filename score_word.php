<?php
    require 'db.php';

   $id= $_POST['word_id'];
    $result=$_POST['result'];//whether word is correct or incorrect

echo $id . " " .$result;


    $con=get_connection();
    $word=get_word_by_id($id);
echo "word_id=".$word['word_id'];
    $num_attempted=$word['num_attempted'];
    $num_successful=$word['num_successful'];
    $num_attempted++;
    $word['num_attempted']=$num_attempted;

    if($result == "correct"){
     // echo "correct answer";
        $num_successful++;
        $word['num_successful']=$num_successful;

    }


    update_word_score($con,$word);
   echo "updated ".$word['word'];

    mysqli_close($con);
unset($_POST);
?>
