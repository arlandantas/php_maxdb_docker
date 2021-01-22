<?php

try { 
  echo "Trying connection...";
  $db = new PDO('odbc:Driver=maxdb;ServerDB=smart;ServerNode=192.168.3.1:7210', 'DBA', 'EDMARDBA');
  echo "Succesful connected!";
  
  $res = $db->query('SELECT * FROM cnv LIMIT 10');
  
  echo json_encode($res->fetch(PDO::FETCH_ASSOC));
  
// $c = odbc_connect('Driver=maxdb;ServerDB=smart;ServerNode=192.168.3.1:7210', 'DBA', 'EDMARDBA');
/* $sql = 'SELECT * FROM cnv LIMIT 10';
$e = odbc_exec($c, $sql);
$row = odbc_fetch_array($e); */

// print_r($row);

} catch(PDOException $e) {
  print_r($e->getMessage());
}
