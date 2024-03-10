<%-- 
    Document   : history_online
    Created on : Feb 6, 2024, 8:55:58 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/history_online.css">
        <link rel="stylesheet" href="css/historyOnline_right.css">
        

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
                            <td class="listName0"><a href="#">LỊCH SỬ GIAO DỊCH ONLINE</a></td>
                            <td class="listIcon0"><a href="#"><i class='bx bx-history' ></i></a></td>
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

            </div>     
        </div>
        <script>
            const movies = [
                {
                    bill_id: "789",
                    id_user: "1",
                    date_put: "2024-03-05",
                    title: "Mai",
                    date: "2024-03-07",
                    start_time: "10:00 AM",
                    end_time: "11:30 AM",
                    room: 'Phòng 1',
                    bench: 'D07',
                    image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain"
                },
                {
                    bill_id: "789",
                    id_user: "1",
                    date_put: "2024-03-05",
                    title: "Mai",
                    date: "2024-03-07",
                    start_time: "10:00 AM",
                    end_time: "11:30 AM",
                    room: 'Phòng 1',
                    bench: 'D09',
                    image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain"
                },
                {
                    bill_id: "456",
                    id_user: "1",
                    date_put: "2024-03-07",
                    title: "Fast and Furious",
                    date: "2024-03-09",
                    start_time: "10:00 AM",
                    end_time: "11:30 AM",
                    room: 'Phòng 1',
                    bench: 'D08',
                    image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain"
                }                       // Thêm các phim khác vào đây
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
                            `<button class="button-ticket"><a href="full_historyOnline_detail.jsp" target="_blank">
                    <div class="contain-movie">
                        <div class="movie-contain-img">
                            <img src="` + movie.image + `" alt="` + movie.title + `" class="movie-image">
                        </div>
                        <div class="movie-details">
                            <h1>Vé đã đặt - ` + id_user + `</h1>
                            <h2>Tên phim: ` + movie.title + `</h2>
                            <p class="movie-info">Ngày đặt: ` + movie.date_put + `</p>
                            <p class="movie-info">Thời gian: ` + movie.start_time + ` <span>đến</span> ` + movie.end_time + `</p>
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
        </script>
    </body>
</html>
