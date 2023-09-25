<?php
    $numbers = [78, 60, 62, 68, 71, 68, 73, 85, 66, 64, 76, 63, 75, 76, 73, 68, 62, 73, 72,
    65, 74, 62, 62, 65, 64, 68, 73, 75, 79, 73];

    $tong_gia_tri = 0;
    $do_dai_mang = count($numbers);
    foreach($numbers as $gia_tri){
        $tong_gia_tri+=$gia_tri;
    }
    $gia_tri_trung_binh = $tong_gia_tri/$do_dai_mang;
    echo $gia_tri_trung_binh;
    echo '<br>Các số có giá trị lớn hơn giá trị trung bình là : ';
    foreach($numbers as $gia_tri){
        if($gia_tri>$gia_tri_trung_binh){
            echo $gia_tri.', ';
        }
    }
    echo '<br>Các số có giá trị nhỏ hơn giá trị trung bình là : ';
    foreach($numbers as $gia_tri){
        if($gia_tri<=$gia_tri_trung_binh){
            echo $gia_tri.', ';
        }
    }
?>