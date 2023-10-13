<?php     
require_once '../services/AuthorService.php';
require_once '../services/AddAuthor.php';
class AuthorController{
    private Author $authorModel;
    public function index():void{
        //Gọi dữ liệu từ SongService
        $AuthorService = new AuthorService();
        $authors = $AuthorService->getAllAuthor();
        //Render dữ liệu lấy được ra home page
        include '../views/Author.php';
    }
    public function add() : void {
        $AuthorService = new AuthorService();
        $author_list = $AuthorService->getAllAuthor();
           echo "<pre>";
           print_r($author_list);
           echo "</pre>";
        if (isset($_POST['btnAdd'])) {
            $id = $_POST['id'];
            $tenTacGia = $_POST['tenTacGia'];
            $this->authorModel->AddAuthor($id, $tenTacGia);
        }
        include ('../views/AddAuthor.php');
    }
}
