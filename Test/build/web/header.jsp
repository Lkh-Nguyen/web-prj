<%-- 
    Document   : header
    Created on : Jan 28, 2024, 9:41:53 PM
    Author     : HELLO
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/header.css">
        
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <header>
                <p> HOTLINE: 0934 726 073</p>
                <label> GIỜ MỞ CỬA: 9:00 - 22:00</label>
            </header>
            <div class="">			
                <div class="menu" >		
                    <nav class="navbar"  role="navigation">
                        <div class="row">		
                            <div class="col-md-2 logo">	
                                <a href="home"><img src="images/logonew.jpg" alt="Cinema logo"/></a>
                            </div>		
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="collapse navbar-collapse row main-nav">
                                <ul class="nav navbar-nav dropdown col-md-8 sub-nav">
                                    <li class="dropdown"><a class="dropdown-toggle" href="#">LỊCH CHIẾU</a></li>
                                    <li class="dropdown"><a class="dropdown-toggle" href="FilmServlet">PHIM</a></li>
                                    <li class="dropdown"><a class="dropdown-toggle" href="#">ƯU ĐÃI</a></li>
                                    <li class="dropdown"><a class="dropdown-toggle" href="#">TIN TỨC PHIM</a></li>
                                    <li class="dropdown"><a class="dropdown-toggle" href="#">THÀNH VIÊN</a></li>
                                    <ul class="nav navbar-nav navbar-right col-md-4 sign">   
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

                                </ul>
                            </div>
                        </div>
                    </nav>			
                </div> 
            </div>
        </div>
    </body>
</html>