<?php
    $array = ['programming', 'php', 'basic', 'dev', 'is', 'program is PHP'];
    $chuoidainhat = '';
    $chuoingannhat = '';
    foreach($array as $string){
        if(strlen($string)>strlen($chuoidainhat)){
            $chuoidainhat = $string;
        }
        if(strlen($string)<strlen($chuoingannhat)||$chuoingannhat == ''){
            $chuoingannhat = $string;
        }
    }
    echo "Chuỗi lớn nhất là $chuoidainhat, độ dài = " . strlen($chuoidainhat) ;
    echo'<br>';
    echo "Chuỗi nhỏ nhất là $chuoingannhat, độ dài = " . strlen($chuoingannhat);

?>