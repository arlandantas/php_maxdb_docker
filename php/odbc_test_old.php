<?php

try { 
  echo "Trying connection...";
  // $bd = new PDO('odbc:smart_maxdb');
  $bd = new PDO('odbc:maxdb');
  echo "Succesful connected!";
} catch(PDOException $e) {
  echo $e->getTrace();
}
