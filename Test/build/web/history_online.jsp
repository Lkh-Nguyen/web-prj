<%-- 
    Document   : history_online
    Created on : Feb 6, 2024, 8:55:58 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/history_online.css">
        <link rel="stylesheet" href="css/historyOnline_right.css">
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

    </head>
    <body>
        <!-- history_online -->
        <div class="row infor_account">
            <div class="inforAccount_left">
                <div class="left_h1">
                    <h1>TÀI KHOẢN</h1>
                </div>
                <div class="left_list">
                    <table>
                        <tr class="list2">
                            <td class="listName1"><a href="updateAccount">THÔNG TIN TÀI KHOẢN</a></td>
                            <td class="listIcon1"><a href="updateAccount"><i class='bx bx-user' ></i></a></td>
                        </tr>

                        <tr class="list1">
                            <td class="listName1"><a href="changePass">THAY ĐỔI MẬT KHẨU</a></td>
                            <td class="listIcon1"><a href="changePass"><i class='bx bxs-lock-open-alt'></i></a></td>
                        </tr>
                        <tr class="list1">
                            <td class="listName1"><a href="inforCard">THÔNG TIN THẺ THÀNH VIÊN</a></td>
                            <td class="listIcon1"><a href="inforCard"><i class='bx bxs-id-card' ></i></i></a></td>
                        </tr>

                        <tr class="list0">
                            <td class="listName0"><a href="historyOnline">LỊCH SỬ GIAO DỊCH ONLINE</a></td>
                            <td class="listIcon0"><a href="historyOnline"><i class='bx bx-history' ></i></a></td>
                        </tr>
                        <tr class="list1">
                            <td class="listName1"><a href="adminFunction">CHỨC NĂNG ADMIN </a></td>
                            <td class="listIcon1"><a href="adminFunction"><i class='bx bx-data'></i></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="inforAccount_right">
                <div class="right_header">
                    <h1>LỊCH SỬ GIAO DỊCH ONLINE</h1>
                </div>
                <div class="container" id="movieList">
                    <!-- Danh sách phim sẽ được tạo bằng JavaScript và thêm vào đây -->
                </div>
                <!-- Phân trang -->
                <ul class="listPage">
                </ul>
            </div>     
        </div>
        <c:set var="billTicketMap" value="${requestScope.billTicketMap}" />
        <script>
            const movies = [
            <c:forEach var="entry" items="${billTicketMap}">
                <c:set var="bill" value="${entry.key}" />
                <c:forEach var="ticket" items="${entry.value}">
            {
            bill_id: "${bill.id}",
                    id_user: "${bill.user.id}",
                    date_put: "${bill.date}",
                    title: "${ticket.filmDetail.film.name}",
                    date: "${ticket.filmDetail.movieDate}",
                    start_time: "${ticket.filmDetail.filmSlot.startTime}",
                    end_time: "${ticket.filmDetail.filmSlot.endTime}",
                    room: '${ticket.filmDetail.screen.name}',
                    bench: '${ticket.screenSeat.name}',
                    image: "${ticket.filmDetail.film.url}"
            },
                </c:forEach>
            </c:forEach>
            ];
            const movieList = document.getElementById("movieList");
            function renderMovies() {
            const groupedMovies = {};
            // Gộp các ghế cùng id_user thành 1 vé
            movies.forEach(movie => {
            if (!(movie.id_user in groupedMovies) && !(movie.bill_id in groupedMovies)) {
            groupedMovies[movie.id_user, movie.bill_id] = {
            bill_id: movie.bill_id,
                    title: movie.title,
                    date: movie.date,
                    date_put: movie.date_put,
                    start_time: movie.start_time,
                    end_time: movie.end_time,
                    room: movie.room,
                    bench: [movie.bench],
                    image: movie.image
            };
            } else {
            groupedMovies[movie.id_user, movie.bill_id].bench.push(movie.bench);
            }
            });
            movieList.innerHTML = "";
            for (const id_user in groupedMovies) {
            const movie = groupedMovies[id_user];
            const movieContainer = document.createElement("div");
            movieContainer.classList.add("movie-container");
            const movieElement = document.createElement("div");
            movieElement.classList.add("movie");
            movieElement.innerHTML =
                    `<button class="button-ticket"><a href="billDetail?bID=` + movie.bill_id + `" target="_blank">
                    <div class="contain-movie">
                        <div class="movie-contain-img">
                            <img src="` + movie.image + `" alt="` + movie.title + `" class="movie-image">
                        </div>
                        <div class="movie-details">
                            <h4>Hóa đơn - ` + id_user + `</h4>
                            <h5>Tên phim: ` + movie.title + `</h5>
                            <p class="movie-info">Ngày đặt: ` + movie.date_put + `</p>
                            <p class="movie-info">Thời gian: ` + movie.start_time + ` <span>-</span> ` + movie.end_time + `</p>
                            <p class="movie-info">Rạp chiếu: ` + movie.room + `</p>
                            <p class="movie-info">Ghế chiếu: ` + movie.bench.join(', ') + `</p>
                            <p class="movie-info">Ngày chiếu: ` + movie.date + `</p>
                        </div>
                    </div>
                    </a></button>
                `;
            movieContainer.appendChild(movieElement);
            movieList.appendChild(movieContainer);
            }
            }
            renderMovies();
            // Phân trang
            let thisPage = 1;
            let limit = 3;
            let list = document.querySelectorAll(".movie");
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
