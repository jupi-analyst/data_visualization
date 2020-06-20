<?php
$db_host = "localhost";
$db_user = "root";
$db_passwd = "apmsetup";
$db_name = "cardata";

mysql_connect($db_host,$db_user,$db_passwd);
mysql_select_db($db_name);
mysql_query('set session character_set_connection=utf8;');
mysql_query('set session character_set_results=utf8;');
mysql_query('set session character_set_client=utf8;');

$result = mysql_query("SELECT * FROM cars;");
$rows = array();
while($row = mysql_fetch_array($result))
{
$JSONdata =array("Letter" => urlencode($row['Letter']),"Freq" => urlencode($row['Freq']));
  array_push($rows,$JSONdata);
}
  
echo (strip_tags(urldecode(json_encode($rows))));

?>
