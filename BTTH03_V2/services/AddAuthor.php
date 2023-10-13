<?php  
require_once '../models/Author.php';
class AddAuthorService{
    public function AddAuthor($id, $tenTacGia)
    {
        $conn = new PDO('mysql:host=localhost;dbname=quanlythuvien','root','');
//            Truy vấn kiểm tra trùng tên bài hát
        $query_check = "SELECT * FROM tacgia WHERE id = '$id' AND tenTacGia = '$tenTacGia";
        $stmt = $conn->query($query_check);
        if ($stmt->rowCount() > 0) {
            header('Location:views/AddAuthor.php ' . $tenTacGia . ' đã tồn tại');
            exit();
        }
        try {
//            Truy vấn thêm bài hát
            $query = "INSERT INTO tacgia(id, tentacGia) VALUES ('$id', '$tenTacGia')";
            $stmt = $conn->query($query);
            header('Location: ?c=song&s=t&noti=Thêm thành công tác giả <b>' . $tenTacGia . '</b>');
        } catch (PDOException $e) {
            echo "Lỗi: " . $e->getMessage();
        }
    }
}