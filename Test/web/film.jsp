<%-- 
    Document   : Film
    Created on : Mar 4, 2024, 3:34:00 PM
    Author     : DUYAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/film.css"> 
        <link rel="stylesheet" href="css/search_bar.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="javascript/search_bar.js"></script>
    </head>
    <body>
        <div style="clear: both">
            <h1 id="film_h1">PHIM ĐANG CHIẾU</h1>
            <div class="searchBox">
                <input class="searchInput" onkeyup="searchFilm()" type="text" id="search" placeholder="Search">
                <button class="searchButton" href="#">
                    <i class="material-icons">
                        search
                    </i>
                </button>
                <div class="dropdown-content" id="dropdown-content">
                    <c:forEach var="film" items="${requestScope.list}">
                        <a href="#" class="film-item">
                            <c:out value="${film.name}" />
                        </a>
                    </c:forEach>
                </div>
            </div>
                <div class="film">
                    <c:set var="i" value="0"/>
                    <c:forEach items="${requestScope.list}" var="c">
                        <c:if test="${i % 4 == 0}">
                            <div class="row">
                            </c:if>
                            <c:set var="i" value="${i+1}"/>
                            <div class="col-md-3 infor">
                                <a href="film?id=${c.id}"><img src="${c.url}" alt=""></a>
                                <h1>${c.name}</h1>

                                <p style="margin-bottom: 1px ;">THỂ LOẠI: ${c.type}</br>
                                <p style="margin-bottom: -3px ;">THỜI GIAN: ${c.duration} minutes | 

                                    <c:if test="${c.rate eq 'C18'}">
                                        <label style="color: red;font-size: 16px;font-weight: bold">${c.rate}</label>
                                    </c:if>
                                    <c:if test="${c.rate eq 'C16'}">
                                        <label style="color: orange;font-size: 16px;font-weight: bold">${c.rate}</label>
                                    </c:if>
                                    <c:if test="${c.rate eq 'C13'}">
                                        <label style="color: rgb(255,214,64);font-size: 16px;font-weight: bold">${c.rate}</label>
                                    </c:if>
                                    <c:if test="${c.rate eq 'P'}">
                                        <label style="color: rgb(107,226,66);font-size: 16px;font-weight: bold">${c.rate}</label>
                                    </c:if>
                                </p>
                                <p>KHỞI CHIẾU: ${c.startDate} </p>
                                <button><a href="calendar?fid=${c.id}">ĐẶT VÉ</a></button>
                            </div>
                            <c:if test="${i % 4 == 0}">
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
        </div>
    </body>
</html>
