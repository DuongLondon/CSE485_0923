<?php
    function convertToUpper($arr){
        $result = array();
        foreach($arr as $item){
            if(is_string($item)){
                $item = strtoupper($item);
            }
            $result[] = $item;
        }
        return $result;
    }

    $arr1 = ['1', 'b', 'c', 'd'];
    $arr2 = ['a', 0, null, false];

    $result1 = convertToUpper($arr1);
    $result2 = convertToUpper($arr2);

    print_r($result1);
    echo '<br>';
    print_r($result2);

    
?>