<%-- 
Document   : film_detail
Created on : Mar 4, 2024, 11:23:12 PM
Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/film_detail.css"> 
        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <c:set var="film" value="${requestScope.film}"></c:set>
            <div class="film_detail" style="margin-bottom: 50px">
                <div class="container">
                    <div class="image">
                        <img
                            id="movieImage"
                            src="${film.url}"
                        alt="Ảnh của bạn"
                        />
                    <div class="image-buttons">
                        <button class="like-btn">
                            <i class="fas fa-thumbs-up"></i> Like
                        </button>
                        <button class="like-btn"><i class="fas fa-share"></i> Chia sẻ</button>
                    </div>
                </div>
                <div class="content">
                    <h2 style="margin-bottom: 10px">${film.getName()}</h2>
                    <p style="margin-bottom: 10px">
                        <strong>Đạo diễn:</strong> 
                        ${film.director}
                    </p>
                    <p style="margin-bottom: 10px">
                        <strong>Diễn viên:</strong> 
                        ${film.actor}
                    </p>
                    <p style="margin-bottom: 10px"><strong>Thể loại:</strong> ${film.type}</p>
                    <p style="margin-bottom: 10px"><strong>Ngày phát hành:</strong> ${film.startDate}</p>
                    <p style="margin-bottom: 10px"><strong>Thời lượng:</strong> ${film.duration} phút</p>
                    <p style="margin-bottom: 10px"><strong>Ngôn ngữ:</strong> ${film.language}</p>
                    <p>
                        <strong style="margin-bottom: 10px">Rated:</strong> 
                        <c:if test="${film.rate eq 'C18'}">
                            <label style="color: red;font-size: 16px;font-weight: bold">${film.rate}</label> - PHIM CẤM PHỔ BIẾN ĐẾN KHÁN GIẢ DƯỚI 18 TUỔI
                        </c:if>
                        <c:if test="${film.rate eq 'C16'}">
                            <label style="color: orange;font-size: 16px;font-weight: bold">${film.rate}</label> - PHIM CẤM PHỔ BIẾN ĐẾN KHÁN GIẢ DƯỚI 16 TUỔI
                        </c:if>
                        <c:if test="${film.rate eq 'C13'}">
                            <label style="color: rgb(255,214,64);font-size: 16px;font-weight: bold">${film.rate}</label> - PHIM CẤM PHỔ BIẾN ĐẾN KHÁN GIẢ DƯỚI 13 TUỔI
                        </c:if>
                        <c:if test="${film.rate eq 'P'}">
                            <label style="color: rgb(107,226,66);font-size: 16px;font-weight: bold">${film.rate}</label> - PHIM ĐƯỢC PHÉP PHỔ BIẾN RỘNG RÃI ĐẾN MỌI ĐUỐI TƯỢNG            
                        </c:if>
                    </p>
                    <div class="sub-buttons">
                        <button class="sub-button" onclick="showDetail()">CHI TIẾT</button>
                        <button class="sub-button" onclick="showTrailer()">TRAILER</button>
                        <button class="sub-button" onclick="showReview()">ĐÁNH GIÁ</button>
                    </div>
                </div>
                    <div><button class="order-btn"><a href="calendar?fid=${film.id}">ĐẶT VÉ</a></button></div> 
            </div>
            <div class="hidden-container" id="hiddenDetail">
                <div id="detail" class="hidden1">
                    <!-- Nội dung chi tiết -->
                    <p style="margin:0px 390px">
                        ${film.detail}
                    </p>
                </div>
            </div>

            <div class="hidden-container" id="hiddenTrailer">
                <div id="trailer" class="hidden" style="display: none">
                    <!-- Video trailer -->
                    <iframe
                        width="500"
                        height="300"
                        src="${film.trailer}"
                        title='Phim "Bà Thím Báo Thù" Trailer | Khởi Chiếu 01.03.2024'
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        allowfullscreen
                        ></iframe>
                </div>
            </div>

            <div class="hidden-container" id="hiddenReview" style="margin-bottom: 50px">
                <div id="review" class="hidden" style="display: none">
                    <!-- Form đánh giá -->
                    <textarea id="comment" placeholder="Nhập ý kiến của bạn"></textarea>
                    <button onclick="postComment()">Đăng ý kiến</button>
                </div>
            </div>
        </div>
        <div class="back_film">
            <a href="film">Đổi Phim</a>
        </div>
        <script>
            function showDetail() {
                document.getElementById("detail").style.display = "block";
                document.getElementById("trailer").style.display = "none";
                document.getElementById("review").style.display = "none";


                document.getElementById("hiddenDetail").classList.add("active");
                document.getElementById("hiddenTrailer").classList.remove("active");
                document.getElementById("hiddenReview").classList.remove("active");
            }

            function showTrailer() {
                document.getElementById("detail").style.display = "none";
                document.getElementById("trailer").style.display = "block";
                document.getElementById("review").style.display = "none";

                document.getElementById("hiddenDetail").classList.remove("active");
                document.getElementById("hiddenTrailer").classList.add("active");
                document.getElementById("hiddenReview").classList.remove("active");
            }

            function showReview() {
                document.getElementById("detail").style.display = "none";
                document.getElementById("trailer").style.display = "none";
                document.getElementById("review").style.display = "block";

                document.getElementById("hiddenDetail").classList.remove("active");
                document.getElementById("hiddenTrailer").classList.remove("active");
                document.getElementById("hiddenReview").classList.add("active");
            }

            function postComment() {
                var comment = document.getElementById("comment").value;
                // Xử lý đăng comment ở đây
                alert("Bạn đã đăng comment: " + comment);
            }

            function addComment() {
                const commentInput = document.getElementById("comment");
                const commentText = commentInput.value.trim();

                if (commentText !== "") {
                    const commentContainer = document.getElementById("comments");
                    const newComment = document.createElement("div");
                    newComment.classList.add("comment");
                    newComment.innerText = commentText;
                    commentContainer.appendChild(newComment);

                    commentInput.value = "";
                }
            }
            function displayComments() {
                var commentSection = document.getElementById("commentSection");
                commentSection.innerHTML = "";

                comments.forEach(function (comment, index) {
                    var commentDiv = document.createElement("div");
                    commentDiv.classList.add("comment");
                    commentDiv.innerHTML =
                            "<strong>Ý kiến " + (index + 1) + ":</strong> " + comment;
                    commentSection.appendChild(commentDiv);
                });
            }

            // Gọi hàm để hiển thị các ý kiến đã có khi trang load
            displayComments();
        </script>
    </body>
</html>

