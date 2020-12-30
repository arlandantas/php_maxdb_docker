<?php

try { 
  echo "Trying connection...";
  $bd = new PDO('odbc:smart_maxdb');
  echo "Succesful connected!";
} catch(PDOException $e) {
  echo $e->getMessage();
}