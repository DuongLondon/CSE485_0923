<?php
$array1 = [
    [77, 87],
    [23, 45]
];
$array2 = [
    'giá trị 1', 'giá trị 2'
];

$result = []; // Mảng kết quả

// Sử dụng vòng lặp để truy cập từng phần tử
for ($i = 0; $i < count($array1); $i++) {
    $result[$i] = array_merge([$array2[$i]], $array1[$i]);
}

// In ra mảng kết quả
print_r($result);
?>