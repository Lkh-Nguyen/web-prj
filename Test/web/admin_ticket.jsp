<%-- 
    Document   : admin_user
    Created on : Mar 11, 2024, 8:51:09 AM
    Author     : HELLO
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/full_admin.css">
        <link rel="stylesheet" href="css/admin_user.css">
    </head>
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
                        <tr class="list1">
                            <td class="listName1"><a href="adminListFilmDetail">QUẢN LÝ LỊCH CHIẾU</a></td>
                            <td class="listIcon1"><a href="full_admin_filmDetail.jsp"><i class='bx bx-screenshot' ></i></a></td>
                        </tr>

                        <tr class="list0">
                            <td class="listName0"><a href="#">QUẢN LÝ VÉ XEM PHIM</a></td>
                            <td class="listIcon0"><a href="#"><i class='bx bx-detail'></i></a></td>
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
                    <h1>QUẢN LÝ VÉ XEM PHIM</h1>
                </div>
                <h1 style="margin-left: 0px;font-size: 25px;">Hiển thị thông tin vé xem phim:</h1>
                <div class="bottom-content">
                    <!--Table-->
                    <div class="contain-table">
                        <table id="product-table-id" class="product-table">

                            <tr>
                                <th>ID</th>
                                <th>Bill ID</th>
                                <th>Film Detail ID</th>
                                <th>Screen Seat ID</th>
                                <th>Chức năng</th>
                            </tr>
                            <c:forEach items="${sessionScope.ticketList}" var="ticket">
                                <tr>
                                    <td>${ticket.id}</td>
                                    <td>${ticket.bill.id}</td>
                                    <td>${ticket.filmDetail.id}</td>
                                    <td>${ticket.screenSeat.id}</td>
                                    <td>
                                        <form action="adminUpdateTicket" method="get">
                                            <input type="hidden" name="ticketId" value="${ticket.id}" />
                                            <input type="submit" value="Cập nhật" style="width: 100px">
                                        </form>
                                        <form action="adminDeleteTicket" method="post">
                                            <input type="hidden" name="ticketId" value="${ticket.id}" />
                                            <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                         
                        </table> 
                    </div>
                </div> 
                <h1 style="margin-left: 0px;font-size: 25px">Tạo thêm và chỉnh sử vé xem phim:</h1>
                <div class="container" id="movieList">  
                    <div id="register">
                        <c:set var="ticket" value="${requestScope.ticket}"></c:set>
                        <c:if test="${not empty ticket}">
                            <c:set var="actionValue" value="adminUpdateTicket"></c:set>
                        </c:if>
                        <c:if test="${empty ticket}">
                            <c:set var="actionValue" value="adminAddTicket"></c:set>
                        </c:if>
                        <form action="${actionValue}" method="post">
                            <div class="form_register">

                                <div class ="row">
                                    <c:if test="${not empty ticket}">                                       
                                        <div class="col-md-4 register">
                                            <p>Bill ID</p>
                                            <select name="billId">
                                                <option value="${ticket.bill.id}">${ticket.bill.id}</option>
                                                <c:forEach items="${sessionScope.billList}" var="bill">

                                                    <option value="${bill.id}">${bill.id}</option>
                                                </c:forEach>
                                            </select>                                         
                                        </div>
                                    </c:if>
                                    <c:if test="${empty ticket}">
                                        <div class="col-md-4 register">
                                            <p>Bill ID</p>

                                            <select name="billId">
                                                <option>Hãy Chọn Bill Id : </option>
                                                <c:forEach items="${sessionScope.billList}" var="bill">
                                                    <option value="${bill.id}">${bill.id}</option>
                                                </c:forEach>
                                            </select>                                        
                                        </div>
                                    </c:if>

                                </div>
                                <div class ="row">
                                    <c:if test="${not empty ticket}">
                                        <div class="col-md-4 register">
                                            <p>Film Detail ID</p>
                                            <select name="filmDetailId">
                                                <option value="${ticket.filmDetail.id}">${ticket.filmDetail.id}</option>
                                                <c:forEach items="${sessionScope.filmDetailList}" var="filmDetail">
                                                    <option value="${filmDetail.id}">${filmDetail.id}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-4 register">
                                            <p>Screen Seat ID</p>
                                            <select name="screenSeatId">
                                                 <option value="${ticket.screenSeat.id}">${ticket.screenSeat.id}</option>
                                                <c:forEach items="${sessionScope.screenSeatList}" var="screenSeat">
                                                    <option value="${screenSeat.id}">${screenSeat.id}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </c:if>
                                    <c:if test="${empty ticket}">
                                        <div class="col-md-4 register">
                                            <p>Film Detail ID</p>
                                            <select name="filmDetailId">
                                                <option>  Hãy Chọn Film Detail Id  </option>
                                                <c:forEach items="${sessionScope.filmDetailList}" var="filmDetail">
                                                    <option value="${filmDetail.id}">${filmDetail.id}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-4 register">
                                            <p>Screen Seat ID</p>
                                            <select name="screenSeatId">
                                                <option>  Hãy Chọn Screen Seat Id : </option>
                                                <c:forEach items="${sessionScope.screenSeatList}" var="screenSeat">
                                                    <option value="${screenSeat.id}">${screenSeat.id}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </c:if>

                                </div>
                                <c:if test="${not empty ticket}">

                                    <div id="submit_register">
                                        <input type="hidden" name="ticketId" value="${ticket.id}" />
                                        <input type="submit" value="CẬP NHẬT THÔNG TIN">
                                    </div>   
                                </c:if>
                                <c:if test="${empty ticket}">
                                    <div id="submit_register">
                                        <input type="submit" value="THÊM KIẾM VÉ">
                                    </div>
                                </c:if>

                            </div>
                        </form>
                    </div> 
                </div>
            </div>     
        </div>
    </body>
</html>
