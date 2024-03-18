<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/footer.css">

    </head>
    <body>
        <footer>
            <div class="footer1"></div>
            <div class="footer2">
                <a href="https://www.facebook.com/"><img src="images/social1.png" alt=""></a>
                <a href="https://www.youtube.com/"><img src="images/social2.png" alt=""></a>
                <a href="https://www.instagram.com/"><img src="images/social3.png" alt=""></a>
            </div>
            <div class="footer3">
                <div class="row">
                    <div class="col-md-2 footer3_address">
                        <h1>fivestar</h1>
                        <h2 >CINEMA</h2>
                        <p>FPT UNIVERSITY, NGŨ HÀNH SƠN, TP ĐÀ NẴNG</p>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-2 footer3_metizcinema">
                        <h1>FIVESTAR CINEMA</h1>
                        <div class="metizcinema_list1">
                            <p><a href="javascript:void(0);" onclick="showSection('gioithieu')">GIỚI THIỆU</a></p>
                            <p><a href="javascript:void(0);" onclick="showSection('tuyendung')">TUYỂN DỤNG</a></p>
                            <p><a href="javascript:void(0)" onclick="showSection('dieukhoangiaodich')">ĐIỀU KHOẢN GIAO DỊCH</a></p>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-2 footer3_metizcinema">
                        <h1>THÔNG TIN CHUNG</h1>
                        <div class="metizcinema_list1">
                            <p><a href="javascript:void(0)" onclick="showSection('dieukhoanchung')">ĐIỀU KHOẢN CHUNG</a></p>
                            <p><a href="javascript:void(0)" onclick="showSection('cauhoi')">CÂU HỎI THƯỜNG GẶP</a></p>
                            <p><a href="javascript:void(0)" onclick="showSection('thanhtoan')">CHÍNH SÁCH THANH TOÁN</a></p>
                        </div>
                    </div>
                    <div class="col-md-2 hello">
                        <a href="https://www.google.com/maps/place/%C4%90%E1%BA%A1i+h%E1%BB%8Dc+FPT+%C4%90%C3%A0+N%E1%BA%B5ng/@16.0210554,108.1677695,13z/data=!4m10!1m2!2m1!1zZnB0IMSRw6AgbuG6tW5uZw!3m6!1s0x3142116949840599:0x365b35580f52e8d5!8m2!3d15.9688859!4d108.2608913!15sCg9mcHQgxJHDoCBu4bq1bmciA4gBAZIBEnByaXZhdGVfdW5pdmVyc2l0eeABAA!16s%2Fg%2F11fl0yz7tc?hl=vi-VN&entry=ttu">
                            <img src="images/logo2.png" alt="">
                        </a>
                        <a href="https://www.google.com/maps/place/%C4%90%E1%BA%A1i+h%E1%BB%8Dc+FPT+%C4%90%C3%A0+N%E1%BA%B5ng/@16.0210554,108.1677695,13z/data=!4m10!1m2!2m1!1zZnB0IMSRw6AgbuG6tW5uZw!3m6!1s0x3142116949840599:0x365b35580f52e8d5!8m2!3d15.9688859!4d108.2608913!15sCg9mcHQgxJHDoCBu4bq1bmciA4gBAZIBEnByaXZhdGVfdW5pdmVyc2l0eeABAA!16s%2Fg%2F11fl0yz7tc?hl=vi-VN&entry=ttu"><label>XEM BẢN ĐỒ</label></a>
                    </div>
                </div>
                <div class="row footer3_infor">
                    <div class="col-md-7 footer3_list">
                        <p>Tên Nhóm: FiveStar Cinema _ FPT University</p>
                        <p>Ngày Bắt Đầu: 01/01/2024 Đến 31/03/2024.</p>
                        <p>Nơi Thực Hiện: FPT University,Quận Ngũ Hành Sơn, Thành phố Đà Nẵng</p>
                        <p>Điện thoại: 0934726073</p>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-2 footer3_img">
                        <img src="images/logo3.png" alt="">
                    </div>
                </div>
            </div>
            <div class="row footer4">
                <div class="col-md-4">
                    <p>MỘT SỐ SẢN PHẨM ĐẾN TỪ KHỞI PHÁT, LTD.</p>
                </div>
                <div class="col-md-3 footer4_img">
                    <img src="images/logonew.jpg" alt="">
                </div>
                <div class="col-md-4">
                    <p>BẢN QUYỀN @ 2024 FIVESTAR CINEMA.</p>
                </div>
            </div>
        </footer>
        <script>
            function showSection(sectionName) {
                // Tạo một đối tượng XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                // Xác định chức năng khi yêu cầu được gửi thành công
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // In ra nội dung trả về từ ruleAccount.jsp

                        // Tự động nhấn vào nút tương ứng
                        var link = document.querySelector('.cell[onclick="showText(\'' + sectionName + '\')"]');
                        if (link) {
                            link.click();
                        }
                    }
                };

                // Gửi yêu cầu GET đến ruleAccount.jsp
                xhttp.open("GET", "ruleAccount", true);
                xhttp.send();
            }
        </script>
    </body>
</html>