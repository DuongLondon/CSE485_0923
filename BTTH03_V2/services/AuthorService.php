<?php   
require_once '../models/Author.php';
class AuthorService{
    public function getAllAuthor(){
        //B1:ket noi database
        try{
            $conn = new PDO('mysql:host=localhost;dbname=quanlythuvien','root','');
            //B2:Truy van du lieu
            $sql="SELECT * FROM tacgia";
            $stmt = $conn->query($sql);
            //B3:Xu lý ket qua tra ve
            $authors = [];
            while($row=$stmt->fetch()){
                $author = new Author($row['id'],$row['tenTacGia']);
                $authors[]=$author;
            }
            return $authors;
        }catch(PDOException $e){
             return $authors=[];
        } 
    }
}