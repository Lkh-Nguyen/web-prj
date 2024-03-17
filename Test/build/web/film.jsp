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
    <style>
        .listPage {
            padding: 10px;
            text-align: center;
            list-style: none;
        }

        .listPage li {
            background: linear-gradient(120deg, #000000, #FF5733);
            color:#FF5733;
            padding: 15px 20px;
            display: inline-block;
            margin: 0 10px;
            cursor: pointer;
            border-radius: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        .listPage li:hover {
            transform: translateY(2px);
        }
        .listPage .active {
            background-color: #B192EF;
            color: #fff;
        }

    </style>
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
                        <a href="film?id=${film.id}" class="film-item">
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
                <ul class="listPage">
                </ul>
            </div>
        </div>
        <script>
            let thisPage = 1;
            let limit = 8;
            let list = document.querySelectorAll(".infor");
            function loadItem() {
                let beginGet = limit * (thisPage - 1);
                let endGet = limit * thisPage - 1;
                list.forEach((item, key) => {
                    if (key >= beginGet && key <= endGet) {
                        item.style.display = "block";
                    } else {
                        item.style.display = "none";
                    }
                });
                listPage();
            }
            loadItem();
            function listPage() {
                let count = Math.ceil(list.length / limit);
                document.querySelector('.listPage').innerHTML = '';

                if (thisPage != 1) {
                    let prev = document.createElement('li');
                    prev.innerText = 'PREV';
                    prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
                    document.querySelector('.listPage').appendChild(prev);
                }
                for (i = 1; i <= count; i++) {
                    let newPage = document.createElement('li');
                    newPage.innerText = i;
                    if (i == thisPage) {
                        newPage.classList.add('active');
                    }
                    newPage.setAttribute('onclick', "changePage(" + i + ")");
                    document.querySelector('.listPage').appendChild(newPage);
                }

                if (thisPage != count) {
                    let next = document.createElement('li');
                    next.innerText = 'NEXT';
                    next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
                    document.querySelector('.listPage').appendChild(next);
                }
            }
            function changePage(i) {
                thisPage = i;
                loadItem();
                let scrollPosition = window.scrollY;
                window.scrollTo(0, scrollPosition);
            }
        </script>
    </body>
</html>
