<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../public/css/bootstrap.css">
    <link rel="stylesheet" href="">
    <link rel="stylesheet" href="../public/bootstrap-icons-1.11.1/bootstrap-icons.css">
</head>
<body>
    <?php
   require_once '../controllers/AuthorController.php'
    ?>
<div class="container">
              <h1 class="text-center text-uppercase text-primary"> Danh sách các tác giả </h1>
               <a href="<?=DOMAIN.'Services/AddAuthor.php'?>" class='btn btn-success my-2 mx-2'>Add Author</a>
            <table class='table my-2 mx-2'>
                <thead>
                    <tr>
                        <th scope='col'>id</th>
                        <th scope='col'>Tên Tác Giả</th>
                        <th scope='col'>Edit</th>
                        <th scope='col'>Sửa/Xoá</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    foreach($authors as $author){
                    ?>
                        <tr>
                            <td><?=$author->getId()?></td>
                            <td><?=$author->getTenTacGia()?></td>
                            <td><a href='detail.php?$author->getId()'><i class='bi bi-eye'></i></a></td>
                            <td>
                                <a href='/Services/EditAuthor.php' class='btn btn-info'>Sửa
                                </a>
                                <a onclick="return confirm('Bạn có muốn xoá không ?');" href='RemoveSong.php?$author->getId()'class='btn btn-danger'>Xoá
                                </a>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>
</body>
</html>