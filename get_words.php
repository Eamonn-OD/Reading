<?php
  require 'db.php';








header('Content-Type: application/json');
echo json_encode(get_words());




?>
