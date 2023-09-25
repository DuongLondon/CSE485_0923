<?php
    function  convertToLowKey($arr){
        $result = array();
        foreach($arr as $item){
            if(is_string($item)){
                $item = strtolower($item);
            }
            $result[] = $item;
        }
        return $result;
    }

    $arr1 = ['1', 'B', 'C', 'E'];
    $arr2 = ['a', 0, null, false];  

    $result1 = convertToLowKey($arr1);
    $result2 = convertToLowKey($arr2);

    print_r($result1);
    echo'<br>';
    print_r($result2);



?>