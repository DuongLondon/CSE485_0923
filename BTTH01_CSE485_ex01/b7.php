<?php
$array = [12, 5, 200, 10, 125, 60, 90, 345, -123, 100, -125, 0];
$result = [];
foreach($array as $number){
    if($number>=100 && $number<=200 && $number%5==0){
        $result[]=$number;
    }
}
print_r($result);
?>