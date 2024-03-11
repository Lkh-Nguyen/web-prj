<%-- 
    Document   : historyOnline_detail
    Created on : Mar 10, 2024, 10:07:44 AM
    Author     : HELLO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/historyOnline_detail.css">
    </head>
    <body>
        <c:set var="bill" value="${requestScope.bill}"/>
        <c:set var="filmDetail" value="${requestScope.filmDetail}"/>
        <c:set var="ticketList" value="${requestScope.ticketList}"/>
        <%int rowNum = 1;%>
        <div class="history">
            <div class="right_header">
                <h1>LỊCH SỬ GIAO DỊCH ONLINE</h1>
            </div>
            <div class="container">
                <div class="content">
                    <!--Xác nhận đặt vé thành công-->
                    <div class="left-content">
                        <h2>FIVESTAR CINEMAS</h2>
                        <h4>FIVESTAR ĐÀ NẴNG</h4>
                        <p>Trung tâm giải trí FiveStar: Đường Bạch Đằng, Phường Phước Hòa, TP Đà Nẵng 0934 726 073</p>
                        <h4 style="color: red;font-weight: bold;padding-bottom: 5px;">XÁC NHẬN ĐẶT VÉ THÀNH CÔNG</h4>
                        <h4 style="padding-bottom: 10px;">MÃ ĐẶT VÉ: ${bill.id}</h4> <!--Lấy từ SQL-->
                        <p>Phim: ${filmDetail.film.name}</p>
                        <p>Ngày: ${bill.date}</p>
                        <p id="currentDate">Suất chiếu: ${filmDetail.getFilmSlot().getStartTime()} - ${filmDetail.getFilmSlot().getEndTime()}</p> <!--Gồm ngày và giờ-->
                        <p>Rạp: FIVESTAR ĐÀ NẴNG</p>
                        <p>Phòng: ${filmDetail.screen.name}</p>
                        <p>Số ghế: ${requestScope.listSeatString}</p>
                    </div>
                    <!--Thông tin phim-->
                    <div class="right-content">
                        <img style="margin-left: 24%; width: 75%;" src="./nameService/qr.png" />
                    </div>
                </div>
                <div class="bottom-content">
                    <!--Table-->
                    <div class="contain-table">
                        <table id="product-table-id" class="product-table">
                            <tr>
                                <th>STT</th>
                                <th>MẶT HÀNG</th>
                                <th>ĐVT</th>
                                <th>SỐ LƯỢNG</th>
                                <th>ĐƠN GIÁ</th>
                                <th>THÀNH TIỀN (VND)</th>
                            </tr>
                            <c:forEach var="ticket" items="${ticketList}" varStatus="rowNum">
                                <tr>
                                    <!-- Update STT -->
                                    <td><%=rowNum++%></td>
                                    <td>${ticket.screenSeat.type == 'VIP' ? 'Ghế VIP' : 'Ghế Standard'}</td>
                                    <td>Vé</td>
                                    <td>1</td>
                                    <td>${ticket.screenSeat.price}</td>
                                    <td>${ticket.screenSeat.price}</td>
                                </tr>
                            </c:forEach>
                            <c:forEach var="entry" items="${orderedService}" varStatus="loop">
                                <tr>
                                    <td><%=rowNum++%></td>
                                    <td>${entry.key.name}</td>
                                    <td>Combo</td>
                                    <td>${entry.value}</td>
                                    <td>${entry.key.price}</td>
                                    <td>${entry.key.price * entry.value}</td>
                                </tr>
                            </c:forEach>
                            <tfoot>
                            <td colspan="5">TỔNG TIỀN (VND) : ${bill.totalPrice} VNĐ</td>
                            <td id="total-cell" colspan="1"></td>
                            </tfoot>
                        </table>
                        <p style="padding-top: 15px;">Cảm ơn Quý khách đã xem phim tại FIVESTAR Cinemas. Chúc Quý khách một buổi
                            xem phim vui vẻ.</p>
                        <p style="color: red; padding-top: 15px;">Rạp không giải quyết các vấn đề xem phim không đúng độ tuổi
                        </p>
                        <div class="middle-content">
                            <p>Tel:+(84) 934 726 073</p>
                            <p style="padding-left: 50%;">Web:<a href="home"> www.FiveStarCinemas.vn</a>
                            </p>
                        </div>
                    </div>
                </div>
                <!--Thông tin các mặt hàng-->
                <div class="footer-content">
                    <a href="historyOnline"><i class='bx bx-arrow-back'></i> Quay trở lại.</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
