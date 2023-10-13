<?php   
require_once APP_ROOT.'config/config.php';
class Author{
    private $id;
    private $tenTacGia;
    //hàm tạo
    public function __construct($id,$tenTacGia){
        $this->id = $id;
        $this->tenTacGia=$tenTacGia;
    }
    //getters/setters
    public function setId($id){
        $this->id = $id;
    }
    public function setTenTacGia($tenTacGia){
        $this->tenTacGia = $tenTacGia;
    }
    public function getId(){
        return $this->id;
    }
    public function getTenTacGia(){
        return $this->tenTacGia;
    }

    public function AddAuthor($id, $tenTacGia)
        {
            $conn = new PDO('mysql:host=localhost;dbname=quanlythuvien','root','');
//            Truy vấn kiểm tra trùng tên bài hát
            $query_check = "SELECT * FROM tacgia WHERE tenTacGia = '$tenTacGia'";
            $stmt = $conn->query($query_check);
            if ($stmt->rowCount() > 0) {
                header('Location: ?c=song&a=add&s=f&noti=Tác Giả ' . $tenTacGia . ' đã tồn tại');
                exit();
            }
            try {
                $query = "INSERT INTO tacgia(id, tenTacGia) VALUES ('$id', '$tenTacGia',)";
                $stmt = $conn->query($query);
                header('Location: ?c=song&s=t&noti=Thêm tác giả thành công <b>' . $tenTacGia . '</b>');
            } catch (PDOException $e) {
                echo "Lỗi: " . $e->getMessage();
            }
        }
}