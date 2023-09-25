<?php
    $numbers = [
        'key1' => 12,
        'key2' => 30,
        'key3' => 4,'key4' => -123,
        'key5' => 1234,
        'key6' => -12565,
    ];

    // Lấy phần tử đầu tiên và phần tử cuối cùng
    $firstElement = reset($numbers);
    $lastElement = end($numbers);

    echo "Phần tử đầu tiên: " . $firstElement ;
    echo '<br>';
    echo "Phần tử cuối cùng: " . $lastElement ;
    echo '<br>';

    // Tìm số lớn nhất, số nhỏ nhất, tổng các giá trị
    $maximum = max($numbers);
    $minimum = min($numbers);
    $sum = array_sum($numbers);

    echo "Số lớn nhất: " . $maximum ;
    echo '<br>';
    echo "Số nhỏ nhất: " . $minimum ;
    echo '<br>';
    echo "Tổng các giá trị: " . $sum ;

    // Sắp xếp mảng theo chiều tăng, giảm các giá trị
    sort($numbers); // Sắp xếp tăng dần
    print_r($numbers);
    echo'<br>';

    rsort($numbers); // Sắp xếp giảm dần
    print_r($numbers);
    echo'<br>';

    // Sắp xếp mảng theo chiều tăng, giảm các key
    ksort($numbers); // Sắp xếp tăng dần theo key
    print_r($numbers);
    echo'<br>';

    krsort($numbers); // Sắp xếp giảm dần theo key
    print_r($numbers);

?>