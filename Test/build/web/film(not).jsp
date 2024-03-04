<%-- 
    Document   : film
    Created on : Mar 1, 2024, 10:05:19 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/film.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <h1 id="film_h1">PHIM ĐANG CHIẾU</h1>
        <div class="film">
            <div class="row">
                <div class="col-md-3 infor">
                    <a href=""><img src="nameFilm/mai.jpg" alt=""></a>
                    <h1>MAI(T18)</h1>
                    <p style="margin-bottom: 1px ;">THỂ LOẠI: TÌNH CẢM</br>
                    <p style="margin-bottom: -3px ;">THỜI GIAN: 180p | <label style="color: red">C18</label></p>
                    <p>KHỞI CHIẾU: 10-02-2024</p>
                    <button>ĐẶT VÉ</button>
                </div>
                <div class="col-md-3 infor">
                    <a href=""><img src="nameFilm/mai1.jpg" alt=""></a>
                    <h1>MAI(T18)</h1>
                    <p style="margin-bottom: 1px ;">THỂ LOẠI: TÌNH CẢM</br>
                    <p style="margin-bottom: -3px ;">THỜI GIAN: 180p | <label style="color: red">C18</label></p>
                    <p>KHỞI CHIẾU: 10-02-2024</p>
                    <button>ĐẶT VÉ</button>
                </div>
                <div class="col-md-3 infor">
                    <a href=""><img src="nameFilm/mai2.jpg" alt=""></a>
                    <h1>MAI(T18)</h1>
                    <p style="margin-bottom: 1px ;">THỂ LOẠI: TÌNH CẢM</br>
                    <p style="margin-bottom: -3px ;">THỜI GIAN: 180p | <label style="color: red">C18</label></p>
                    <p>KHỞI CHIẾU: 10-02-2024</p>
                    <button>ĐẶT VÉ</button>
                </div>
                <div class="col-md-3 infor">
                    <a href=""><img src="nameFilm/mai3.jpg" alt=""></a>
                    <h1>MAI(T18)</h1>
                    <p style="margin-bottom: 1px ;">THỂ LOẠI: TÌNH CẢM</br>
                    <p style="margin-bottom: -3px ;">THỜI GIAN: 180p | <label style="color: red">C18</label></p>
                    <p>KHỞI CHIẾU: 10-02-2024</p>
                    <button>ĐẶT VÉ</button>
                </div>
            </div>
        </div>
    </body>
</html>
