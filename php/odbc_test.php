<?php

try { 
  echo "Trying connection...";
  // $bd = new PDO('odbc:smart_maxdb');
  // $db = new PDO('odbc:Driver=/app/lib/libsdbodbc.so;ServerDB=smart;ServerNode=192.168.3.1:7210', 'DBA', 'EDMARDBA');
  $db = new PDO('odbc:maxdb');
  // $c = odbc_connect('Driver=maxdb;ServerDB=smart;ServerNode=192.168.3.1:7210', 'DBA', 'EDMARDBA');
  echo "Succesful connected!";

  $res = $db->query('SELECT * FROM cnv LIMIT 10');

  print_r($res->fetch(PDO::FETCH_ASSOC));

/* $sql = 'SELECT * FROM cnv LIMIT 10';
$e = odbc_exec($c, $sql);
$row = odbc_fetch_array($e); */

// print_r($row);

} catch(PDOException $e) {
  print_r($e->getMessage());
}
