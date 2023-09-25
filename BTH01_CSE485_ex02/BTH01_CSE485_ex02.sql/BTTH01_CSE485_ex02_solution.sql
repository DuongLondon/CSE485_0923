-- TRUY VẤN
-- a. Liệt kê các bài viết về các bài hát thuộc thể loại Nhạc trữ tình (2 đ)
    SELECT * FROM baiviet,theloai WHERE ten_tloai = "Nhac tru tinh";
    
-- b. Liệt kê các bài viết của tác giả “Nhacvietplus” (2 đ)
    SELECT * FROM baiviet,tacgia WHERE ten_tacgia = 'Nhacvietplus';

-- c. Liệt kê các thể loại nhạc chưa có bài viết cảm nhận nào. (2 đ)
    SELECT tl.ma_tloai, tl.ten_tloai
    FROM theloai tl
    LEFT JOIN baiviet bv ON tl.ma_tloai = bv.ma_tloai
    WHERE bv.ma_bviet IS NULL;

-- d. Liệt kê các bài viết với các thông tin sau: mã bài viết, tên bài viết, tên bài hát, tên tác giả, tên thể loại, ngày viết. (2 đ)
    SELECT bv.ma_bviet, bv.tieude, bv.ten_bhat, tg.ten_tacgia, tl.ten_tloai, bv.ngayviet
    FROM baiviet bv
    JOIN tacgia tg ON bv.ma_tgia = tg.ma_tacgia
    JOIN theloai tl ON bv.ma_tloai = tl.ma_tloai;

-- e. Tìm thể loại có số bài viết nhiều nhất (2 đ)
    SELECT tl.ma_tloai, tl.ten_tloai, COUNT(bv.ma_bviet) AS so_bai_viet
    FROM theloai tl
    LEFT JOIN baiviet bv ON tl.ma_tloai = bv.ma_tloai
    GROUP BY tl.ma_tloai
    ORDER BY so_bai_viet DESC
    LIMIT 1;

-- f. Liệt kê 2 tác giả có số bài viết nhiều nhất (2 đ)
    SELECT tg.ma_tacgia, tg.ten_tacgia, COUNT(bv.ma_bviet) AS so_bai_viet
    FROM tacgia tg
    LEFT JOIN baiviet bv ON tg.ma_tacgia = bv.ma_tgia
    GROUP BY tg.ma_tacgia
    ORDER BY so_bai_viet DESC
    LIMIT 2;

-- g. Liệt kê các bài viết về các bài hát có tựa bài hát chứa 1 trong các từ “yêu”, “thương”, “anh”, “em” (2 đ)
    SELECT bv.ma_bviet, bv.tieude, bv.ten_bhat, bv.ngayviet, tg.ten_tacgia, tl.ten_tloai
    FROM baiviet bv
    JOIN tacgia tg ON bv.ma_tgia = tg.ma_tacgia
    JOIN theloai tl ON bv.ma_tloai = tl.ma_tloai
    WHERE bv.tieude LIKE '%yeu%' OR bv.tieude LIKE '%thuong%' OR bv.tieude LIKE '%anh%' OR bv.tieude LIKE '%em%';

-- h. Liệt kê các bài viết về các bài hát có tiêu đề bài viết hoặc tựa bài hát chứa 1 trong các từ “yêu”, “thương”, “anh”, “em” (2 đ)
    SELECT bv.ma_bviet, bv.tieude, bv.ten_bhat, bv.ngayviet, tg.ten_tacgia, tl.ten_tloai
    FROM baiviet bv
    JOIN tacgia tg ON bv.ma_tgia = tg.ma_tacgia
    JOIN theloai tl ON bv.ma_tloai = tl.ma_tloai
    WHERE bv.tieude LIKE '%yêu%' OR bv.tieude LIKE '%thương%' OR bv.tieude LIKE '%anh%' OR bv.tieude LIKE '%em%' OR bv.ten_bhat LIKE '%yêu%' OR bv.ten_bhat LIKE '%thương%' OR bv.ten_bhat LIKE '%anh%' OR bv.ten_bhat LIKE '%em%';

-- i. Tạo 1 view có tên vw_Music để hiển thị thông tin về Danh sách các bài viết kèm theo Tên thể loại và tên tác giả (2 đ)
    CREATE VIEW vw_Music AS
    SELECT bv.ma_bviet, bv.tieude, bv.ten_bhat, tg.ten_tacgia, tl.ten_tloai, bv.ngayviet
    FROM baiviet bv
    JOIN tacgia tg ON bv.ma_tgia = tg.ma_tacgia
    JOIN theloai tl ON bv.ma_tloai = tl.ma_tloai;

-- j. Tạo 1 thủ tục có tên sp_DSBaiViet với tham số truyền vào là Tên thể loại và trả về danh sách Bài viết của thể loại đó. Nếu thể loại không tồn tại thì hiển thị thông báo lỗi. (2 đ)
    DELIMITER //

CREATE PROCEDURE sp_DSBaiViet(IN p_TheLoai VARCHAR(255))
BEGIN
    DECLARE ma_tloai INT;

    -- Kiểm tra xem thể loại có tồn tại hay không
    SELECT ma_tloai INTO ma_tloai
    FROM theloai
    WHERE ten_tloai = ten_tloai;

    -- Nếu không tìm thấy thể loại, hiển thị thông báo lỗi
    IF ma_tloai IS NULL THEN
        SELECT 'Thể loại không tồn tại' AS ErrorMsg;
    ELSE
        -- Nếu tìm thấy thể loại, trả về danh sách bài viết của thể loại đó
        SELECT ma_bviet, tieude, noidung
        FROM baiviet
        WHERE ten_tloai = ten_tloai;
    END IF;
END //

DELIMITER ;

-- k. Thêm mới cột SLBaiViet vào trong bảng theloai. Tạo 1 trigger có tên tg_CapNhatTheLoai để khi thêm/sửa/xóa bài viết thì số lượng bài viết trong bảng theloai được cập nhật theo. (2 đ)
    ALTER TABLE theloai ADD COLUMN SLBaiViet INT DEFAULT 0;

    DELIMITER //

    CREATE TRIGGER tg_CapNhatTheLoai_AfterInsert
    AFTER INSERT ON baiviet
    FOR EACH ROW
    BEGIN
        UPDATE theloai
        SET SLBaiViet = SLBaiViet + 1
        WHERE ma_tloai = NEW.ma_tloai;
    END //

    CREATE TRIGGER tg_CapNhatTheLoai_AfterUpdate
    AFTER UPDATE ON baiviet
    FOR EACH ROW
    BEGIN
        UPDATE theloai
        SET SLBaiViet = SLBaiViet + 1
        WHERE ma_tloai = NEW.ma_tloai;
        
        UPDATE theloai
        SET SLBaiViet = SLBaiViet - 1
        WHERE ma_tloai = OLD.ma_tloai;
    END //

    CREATE TRIGGER tg_CapNhatTheLoai_AfterDelete
    AFTER DELETE ON baiviet
    FOR EACH ROW
    BEGIN
        UPDATE theloai
        SET SLBaiViet = SLBaiViet - 1
        WHERE ma_tloai = OLD.ma_tloai;
    END //

    DELIMITER ;

-- l. Bổ sung thêm bảng Users để lưu thông tin Tài khoản đăng nhập và sử dụng cho chức năng Đăng nhập/Quản trị trang web. (5 đ)
    CREATE TABLE users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        username VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL
    );
