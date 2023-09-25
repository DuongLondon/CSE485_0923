<<<<<<< HEAD
<?php
$arrs=['PHP','HTML','CSS','JS'];

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<table class="table table-bordered border-primary" style="height: 100px;width:100px">
        <thead>
            <tr>
                <th>Tên khoá học</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><?php echo $arrs[0]?></td>
            </tr>
            <tr>
                <td><?php echo $arrs[1]?></td>
            </tr>
            <tr>
                <td><?php echo $arrs[2]?></td>
            </tr>
            <tr>
                <td><?php echo $arrs[3]?></td>
            </tr>
        </tbody>
    </table>
</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>