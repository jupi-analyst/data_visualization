<?php 

//json 으로 만들어진 데이터를 서버에서 불러온다.

$string = file_get_contents("sampleData.json");
echo $string;

?>