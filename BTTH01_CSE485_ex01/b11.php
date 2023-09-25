<?php
    $array = array(1, 2, 3, 4, 5);

    // Xóa phần tử thứ 3
    unset($array[3]);
    
    // Đảm bảo key của mảng là tuần tự
    $array = array_values($array);
    
    // In ra mảng sau khi xóa
    print_r($array);
?>