<%-- 
    Document   : admin_user
    Created on : Mar 11, 2024, 8:51:09 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/full_admin.css">
        <link rel="stylesheet" href="css/admin_user.css">
    </head>
        <style>
        #scrollToTopBtn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 99;
            font-size: 18px;
            border: none;
            outline: none;
            background-color: #00A8FF;
            color: white;
            cursor: pointer;
            padding: 15px;
            border-radius: 4px;
            opacity: 0.1;
            transition: opacity 0.3s;
        }

        #scrollToTopBtn:hover {
            opacity: 1;
        }
    </style>
    <body>
        <!-- history_online -->
        <div class="row infor_account">
            <div class="inforAccount_left">
                <div class="left_h1">
                    <h1>CHỨC NĂNG ADMIN</h1>
                </div>
                <div class="left_list">
                    <table>
                        <tr class="list2">
                            <td class="listName1"><a href="adminListUser">QUẢN LÝ NGƯỜI DÙNG</a></td>
                            <td class="listIcon1"><a href="full_admin_user.jsp"><i class='bx bx-user'></i></a></td>
                        </tr>

                        <tr class="list1">
                            <td class="listName1"><a href="adminListFilm">QUẢN LÝ THÔNG TIN PHIM</a></td>
                            <td class="listIcon1"><a href="full_admin_film.jsp"><i class='bx bx-film' ></i></a></td>
                        </tr>
                        <tr class="list0">
                            <td class="listName0"><a href="#">QUẢN LÝ LỊCH CHIẾU</a></td>
                            <td class="listIcon0"><a href="#"><i class='bx bx-screenshot' ></i></a></td>
                        </tr>

                        <tr class="list1">
                            <td class="listName1"><a href="adminListTicket">QUẢN LÝ VÉ XEM PHIM</a></td>
                            <td class="listIcon1"><a href="full_admin_ticket.jsp"><i class='bx bx-detail'></i></a></td>
                        </tr>
                        <tr class="list1">
                            <td class="listName1"><a href="adminListService">QUẢN LÝ DỊCH VỤ BẮP NƯỚC</a></td>
                            <td class="listIcon1"><a href="full_admin_service.jsp"><i class='bx bx-food-menu'></i></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="inforAccount_right">
                <div class="right_header">
                    <h1>QUẢN LÝ LỊCH CHIẾU</h1>
                </div>

                <h1 style="margin-left: 0px;font-size: 25px ; color: #007BFF; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">Hiển thị lịch chiếu:</h1>
                <div class="bottom-content">
                    <!--Table-->
                    <div class="contain-table">
                        <table id="product-table-id" class="product-table">
                            <tr>
                                <th>ID</th>
                                <th>Screen ID</th>
                                <th>Film ID</th>
                                <th>FilmSlot ID</th>
                                <th>Movie Date</th>
                                <th>Chức năng</th>
                            </tr>
                            <c:forEach items="${filmDetailList}" var="filmDetail">
                                <tr>
                                    <td>${filmDetail.id}</td>
                                    <td>${filmDetail.screen.id}</td>
                                    <td>${filmDetail.film.id}</td>
                                    <td>${filmDetail.filmSlot.id}</td>
                                    <td>${filmDetail.movieDate}</td>
                                    <td>
                                        <form action="adminUpdateFilmDetail" method="get">
                                            <c:set var="filmDetailId" value="${filmDetail.id}" />
                                            <input type="hidden" name="filmDetailId" value="${filmDetailId}" />
                                            <button type="submit" class="update-button">Cập nhật</button>
                                        </form>
                                        <form action="adminDeleteFilmDetail" method="post">
                                            <c:set var="filmDetailId" value="${filmDetail.id}" />
                                            <input type="hidden" name="filmDetailId" value="${filmDetailId}" />
                                            <button type="submit" class="add-button">Xóa dữ liệu</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>


                            </form>
                        </table> 
                    </div>
                </div> 
                <h1 style="margin-left: 0px;font-size: 25px ; color: #007BFF; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">Tạo thêm hoặc chỉnh sửa lịch chiếu:</h1>
                <div class="container" id="list">
                    <div id="register">
                        <c:set var="filmDetail" value="${requestScope.filmDetail}"></c:set>
                        <c:if test="${not empty filmDetail}">
                            <c:set var="actionValue" value="adminUpdateFilmDetail"></c:set>
                        </c:if>
                        <c:if test="${empty filmDetail}">
                            <c:set var="actionValue" value="adminAddFilmDetail"></c:set>
                        </c:if>
                        <form action="${actionValue}" method="post">
                            <div class="form_register">
                                <div class ="row">
                                    <c:if test="${not empty filmDetail}">
                                        <div class="col-md-4 register">
                                            <p>Film </p>
                                            <select name="idFilm" class="select-btn">
                                                <option value="${filmDetail.film.id}">${filmDetail.film.name}</option>
                                                <c:forEach items="${sessionScope.filmList}" var="film">
                                                    <option value="${film.id}">${film.name}</option>
                                                </c:forEach>
                                            </select> 
                                        </div>
                                        <div class="col-md-4 register">
                                            <p>Screen </p>
                                            <select name="idScreen" class="select-btn">
                                               <option value="${filmDetail.screen.id}">${filmDetail.screen.name}</option>
                                                <c:forEach items="${sessionScope.screenList}" var="screen">
                                                    <option value="${screen.id}">${screen.name}</option>
                                                </c:forEach>
                                            </select> 
                                        </div>
                                    </c:if>
                                    <c:if test="${empty filmDetail}">
                                        <div class="col-md-4 register">
                                            <p>Film </p>
                                            <select name="idFilm" class="select-btn">
                                                <option>Hãy Chọn Film : </option>
                                                <c:forEach items="${sessionScope.filmList}" var="film">
                                                    <option value="${film.id}">${film.name}</option>
                                                </c:forEach>
                                            </select> 
                                        </div>
                                        <div class="col-md-4 register">
                                            <p>Screen </p>
                                            <select name="idScreen" class="select-btn">
                                                <option>Hãy Chọn Screen : </option>
                                               <c:forEach items="${sessionScope.screenList}" var="screen">
                                                    <option value="${screen.id}">${screen.name}</option>
                                                </c:forEach>
                                            </select> 
                                        </div>
                                    </c:if>
                            </div>
                            <div class ="row">
                                <c:if test="${not empty filmDetail}">
                                    <div class="col-md-4 register">
                                        <p>Film Slot </p>
                                            <select name="filmSlotID" class="select-btn">
                                                <option value="${filmDetail.filmSlot.id}">${filmDetail.filmSlot.startTime}-${filmDetail.filmSlot.endTime}</option>
                                                <c:forEach items="${sessionScope.slotList}" var="slot">
                                                    <option value="${slot.id}">${slot.startTime}-${slot.endTime}</option>
                                                </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Movie Date</p>
                                        <input type="date" name="dateMoive"  placeholder="Nhập Ngày Chiếu Ở Đây" value="${filmDetail.movieDate}" required>
                                    </div>
                                </c:if>
                                <c:if test="${empty filmDetail}">
                                    <div class="col-md-4 register">
                                       <p>Film Slot </p>
                                       <select name="filmSlotID" class="select-btn">
                                                <option>Hãy Chọn Slot Film</option>
                                                <c:forEach items="${sessionScope.slotList}" var="slot">
                                                    <option value="${slot.id}">${slot.startTime}-${slot.endTime}</option>
                                                </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Movie Date</p>
                                        <input type="date" name="dateMoive"  placeholder="Nhập Ngày Chiếu Ở Đây" value="${param.movieDate}" required>
                                    </div>
                                </c:if>
                            </div>
                            </div>
                            <c:if test="${not empty filmDetail}">
                                <div id="submit_register">
                                    <input type="hidden" name="filmDetailId" value="${filmDetailId}" />
                                    <input type="submit" value="CẬP NHẬT LỊCH CHIẾU">

                                </div>
                            </c:if>
                            <c:if test="${empty filmDetail}">
                                <div id="submit_register">
                                    <button type="submit" class="add-button-large">THÊM LỊCH CHIẾU</button>
                                </div>
                            </c:if>


                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>   
    
<button id = "scrollToTopBtn" hidden> Scroll to Top </button>
<script>
    const btnScrollToTop = document.getElementById("scrollToTopBtn");
    const docEL = document.documentElement;

    document.addEventListener("scroll",()=> {
        const scrollToTal = docEL.scrollHeight - docEL.clientHeight;
        if ((docEL.scrollTop/scrollToTal)>= 0.4){
            btnScrollToTop.hidden = false;
        }   
        else{
btnScrollToTop.hidden = true;
        }
    }
    );
    
    btnScrollToTop.addEventListener('click',()=>{
        docEL.scrollTo({
            top :0,
            behavior:'smooth'
        });
    });
</script> 
</body>
</html>
