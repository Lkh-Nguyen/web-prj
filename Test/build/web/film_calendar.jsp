<%-- 
    Document   : pick_film
    Created on : Mar 7, 2024, 7:23:54 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lịch Chiếu Phim</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link rel="stylesheet" href="./css/film_calendar.css">
    </head>
    <style>
        .back_film{
            margin-left: 20%;
            margin-right: 20%;
            margin-top: 4%;
            margin-bottom: 2%;
            width: 60%;
            height: 50px;
            background-color: rgb(205,193,151);
            padding-top: 12px;
            align-items: center;
        }
        .back_film a{
            margin-left: 5px;
            color: rgb(111,98,71);
            font-size: 20px;
            align-items: center;
        }
        .back_film a:hover{
            margin-left: 5px;
            color: rgb(111,98,71);
            font-size: 20px;
            align-items: center;
        }
    </style>
    <body>
        <%
    // Lấy ngày tháng năm hiện tại
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentDate = dateFormat.format(new Date());
        %>
        <div class="container">
            <div class="date-picker">
                <label for="date"></label>
                <input type="text" id="date" placeholder="<%= currentDate %>">
                <h3></h3>
            </div>
            <div class="movie-list" id="movieList">
                <!-- Dữ liệu về phim sẽ được thêm vào đây bằng JavaScript -->
            </div>
        </div>
        <div class="back_film">
            <a href="FilmServlet"><i class='bx bx-arrow-back'></i>Quay lại phim</a>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script src="./javascript/film_calendar.js"></script>
    </body>
</html>

