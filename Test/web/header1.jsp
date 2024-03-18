<%-- 
    Document   : header1
    Created on : Mar 7, 2024, 7:42:03 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* header */
            header{
                background-color: rgb(15, 29, 47);
                height: 60px;
                display: flex;
                color: white;
                font-weight: 400;
            }
            header p{
                margin-left: 70%;
            }
            header label{
                margin-top: 3%;
                margin-left: 3%;
                color: white;
                font-weight: 400;
            }
            .header{
                width: 100%;
                height: 140px;
                background-color: rgb(3,19,39);
                display:flex;
            }
            .header_img{
                padding-left: 4.7%;
                width: fit-content;
            }
            .header_img a img{
                width: 35%;
                border-radius:100%;
            }
            .header_list{
                margin-left: 120px;
                width: 50%;
            }
            .header_list ul{
                margin-top:8%;
                display: flex;
            }
            .header_list li{
                list-style:  none;
                margin-right: 6%;
            }
            .header_list a{
                text-decoration: none;
                font-size: 20px;
                color:white;
            }
            .header_list a:hover{
                color:orangered;
            }
            .header_account{
                width: 20%;
                margin-left: -100px;
            }
            .header_account ul{
                display: flex;
            }
            .sign{
                margin-top:20%;
            }
            .header_account li{
                list-style:  none;
                margin-right: 6%;
            }
            .sign a{
                text-decoration: none;
                font-size: 16px !important;
                color: rgb(81, 117, 150);
                font-weight: 600 !important;
                white-space: nowrap;         /* Ngăn chặn quá trình xuống dòng */
                overflow: hidden;            /* Ẩn phần vượt quá khung chứa */
                text-overflow: ellipsis;     /* Hiển thị dấu "..." khi vượt quá */
                max-width: 200px;
            }
            .sign a:hover{
                color:orangered;
            }
            .sign span {
                font-weight: bold;
                font-size: 20px;
                color: #17599E;
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <header>
            <p> HOTLINE: 0934 726 073 <label> GIỜ MỞ CỬA: 9:00 - 22:00</label></p>
        </header>
        <div class="header">
            <div class="header_img">
                <a href="home"><img src="images/logonew.jpg" alt="Cinema logo"/></a>
            </div>
            <div class="header_list">
                <ul>
                    <li><a  href="calendar">LỊCH CHIẾU</a></li>
                    <li><a  href="film">PHIM</a></li>
                    <li><a href="home">ƯU ĐÃI</a></li>
                    <li><a  href="ruleAccount">ĐIỀU KHOẢN</a></li>
                    <li><a href="updateAccount">THÀNH VIÊN</a></li>
                </ul>
            </div>
            <div class="header_account">
                <ul class="sign">   
                    <c:set var="user" value="${sessionScope.user}" scope="session"/>
                    <c:choose>
                        <c:when test="${not empty user}">
                            <li>
                                <a href="updateAccount">${user.name}</a></li>
                            <li><span>/</span></li>
                            <li>
                                <a href="logout">ĐĂNG XUẤT</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="login">ĐĂNG NHẬP</a>
                            </li>
                            <li><span>/</span></li>
                            <li>
                                <a href="register">ĐĂNG KÝ</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </body>
</html>