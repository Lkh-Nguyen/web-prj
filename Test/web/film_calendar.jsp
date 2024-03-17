<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lịch Chiếu Phim</title>
        <link rel="stylesheet" href="./css/film_calendar.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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
            text-decoration: none;
        }
        .back_film a:hover{
            margin-left: 5px;
            color: rgb(111,98,71);
            font-size: 20px;
            align-items: center;
            text-decoration: none;
        }
    </style>
    <body>
        <c:set var="filmDetailList" value="${filmDetailList}"></c:set>
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
            <a href="film"><i class='bx bx-arrow-back'></i>Quay lại phim</a>
        </div>
        <script>
            var movies = [
            <c:forEach var="filmDetail" items="${filmDetailList}" varStatus="loop">
            {
            title: "<c:out value="${filmDetail.film.name}" />",
                    date: "<c:out value="${filmDetail.movieDate}" />",
                    start_time: "<c:out value="${filmDetail.filmSlot.startTime}" />",
                    end_time: "<c:out value="${filmDetail.filmSlot.endTime}" />",
                    room: "<c:out value="${filmDetail.screen.name}" />",
                    image: "<c:out value="${filmDetail.film.url}" />",
                    fdID: "<c:out value="${filmDetail.id}" />" // Add the fdid property
            }
                <c:if test="${!loop.last}">,</c:if>
            </c:forEach>
            ];

            const movieList = document.getElementById("movieList");
            const dateInput = document.getElementById("date");
            // Khởi tạo Flatpickr để tạo date picker
            flatpickr(dateInput, {
                dateFormat: "Y-m-d",
                onChange: (selectedDates, dateStr) => {
                    renderMovies(dateStr);
                }
            });
            // Hàm để hiển thị phim dựa trên ngày được chọn
            function renderMovies(selectedDate) {
                movieList.innerHTML = "";
                const selectedMovies = movies.filter(movie => movie.date === selectedDate);
                if (selectedMovies.length === 0) {
                    const noMovieElement = document.createElement("div");
                    noMovieElement.classList.add("no-movie");
                    noMovieElement.textContent = "Không có suất chiếu cho ngày này.";
                    movieList.appendChild(noMovieElement);
                } else {
                    const movieGroups = {};
                    selectedMovies.forEach((movie) => {
                        const movieKey = movie.title + movie.date;
                        if (movieKey in movieGroups) {
                            movieGroups[movieKey].times.push({
                                start_time: movie.start_time,
                                end_time: movie.end_time,
                                room: movie.room,
                                fdID: movie.fdID
                            });
                        } else {
                            movieGroups[movieKey] = {
                                title: movie.title,
                                date: movie.date,
                                image: movie.image,
                                times: [{
                                        start_time: movie.start_time,
                                        end_time: movie.end_time,
                                        room: movie.room,
                                        fdID: movie.fdID
                                    }],
                                
                            };
                        }
                    });
                    for (const [key, movie] of Object.entries(movieGroups)) {
                        const movieElement = document.createElement("div");
                        movieElement.classList.add("movie");
                        let timesHtml = "";
                        if (movie.times.length > 1) {
                            timesHtml = movie.times.map(time => `
                        <div class="time-option">
                            <button class="time-btn">
                                 <a href="booking?fdID=` + time.fdID + `"class="time-link" data-room="` + time.room + `">`
                                        + time.start_time + `-` + time.end_time + `
                                    <p class="room">Phòng Chiếu:` + time.room + `</p>
                                </a>
                            </button>
                        </div>`
                            ).join('');
                        } else {
                            timesHtml = `
            <div class="time-option">
                <button class="time-btn">
                    <a href="booking?fdID=` + movie.times[0].fdID + `" class="time-link" data-room="` + movie.times[0].room + `">`
                                    + movie.times[0].start_time + `-` + movie.times[0].end_time +
                                    ` <p class="room"> Phòng Chiếu:` + movie.times[0].room + `</p>
                    </a>
                </button>
            </div>
        `;
                        }

                        movieElement.innerHTML = `
        <h2 class="movie-title">` + movie.title + `</h2>
        <div class="movie-content">
            <img src="` + movie.image + `" alt="` + movie.title + `" class="movie-image">
            <div class="movie-details">
                <div class="time-options">
    ` + timesHtml + `
                </div>
            </div>
        </div>
    `;
                        movieList.appendChild(movieElement);
                    }

                    const timeButtons = document.querySelectorAll(".time-btn");
                    timeButtons.forEach(button => {
                        button.addEventListener("click", () => {
                            const selectedTime = button.textContent.split(' - ')[0];
                            const selectedRoom = button.getAttribute("data-room");
                            //alert(`Bạn đã chọn khung giờ: ${selectedTime}, Phòng Chiếu: ${selectedRoom}`);
                            //window.location.href = `ChonGhe.jsp?start_time=${selectedTime}&room=${selectedRoom}`;
                            //Truyền trang jsp
                        });
                    });
                }
            }

            const currentDate = new Date();
            const currentDateString = currentDate.toISOString().slice(0, 10);
            renderMovies(currentDateString);



        </script>
    </body>
</html>

