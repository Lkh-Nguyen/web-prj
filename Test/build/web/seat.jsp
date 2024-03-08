<%-- 
    Document   : seat
    Created on : Mar 2, 2024, 10:21:54 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Model.FilmDetail"%>
<%@page import="Database.FilmDetailDB"%>
<%@page import="Database.TicketDB"%>
<%
    // Fetch filmDetailID from request parameter
    int filmDetailID = Integer.parseInt(request.getParameter("fdID"));

    // Retrieve FilmDetail object from the database
    FilmDetail filmDetail = FilmDetailDB.getFilmDetail(filmDetailID);
    // Set filmDetail as a request attribute for further use
    request.setAttribute("filmDetail", filmDetail);
    List<String> bookedSeats = TicketDB.getBookedSeats(filmDetailID);
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/seat.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <div class="full_seat">
            <h1 id="choose_seat">CHỌN GHẾ</h1>
            <div class="row">
                <div class="col-md-8 chair_left">
                    <div class="screen">
                        <p style="padding-top: 2px">Màn Hình</p>
                    </div>
                    <c:forEach var="i" begin="1" end="10" step="1">
                        <div class="seats">
                            <c:choose>
                                <c:when test="${i == 1}">
                                    <b style="margin-top:  12px;padding-right: 10px;font-size: 15px">A</b>
                                </c:when>
                                <c:when test="${i == 2}">
                                    <b style="margin-top:  12px;padding-right: 10px;font-size: 15px">B</b>
                                </c:when>
                                <c:when test="${i == 3}">
                                    <b style="margin-top:  12px;padding-right: 10px;font-size: 15px">C</b>
                                </c:when>
                                <c:when test="${i == 4}">
                                    <b style="margin-top:  12px;padding-right: 10px;font-size: 15px">D</b>
                                </c:when>
                                <c:when test="${i == 5}">
                                    <b style="margin-top:  12px;padding-right: 10px;font-size: 15px">E</b>
                                </c:when>
                                <c:when test="${i == 6}">
                                    <b style="margin-top:  12px;padding-right: 10px;font-size: 15px">F</b>
                                </c:when>
                                <c:when test="${i == 7}">
                                    <b style="margin-top:  12px;padding-right: 9px;font-size: 15px">G</b>
                                </c:when>
                                <c:when test="${i == 8}">
                                    <b style="margin-top:  12px;padding-right: 10px;font-size: 15px">H</b>
                                </c:when>
                                <c:when test="${i == 9}">
                                    <b style="margin-top:  12px;padding-right: 16px;font-size: 15px">I</b>
                                </c:when>
                                <c:when test="${i == 10}">
                                    <b style="margin-top:  12px;padding-right: 11px;font-size: 15px">J</b>
                                </c:when>
                            </c:choose>
                            <c:forEach var="j" begin="1" end="10" step="1">
                                <c:choose>
                                    <c:when test="${i == 1}">
                                        <div class="seat" onclick="toggleSeat(this, 'A${j}')" id="A${j}">A${j}</div>
                                    </c:when>
                                    <c:when test="${i == 2}">
                                        <div class="seat" onclick="toggleSeat(this, 'B${j}')" id="B${j}">B${j}</div>
                                    </c:when>
                                    <c:when test="${i == 3}">
                                        <div class="seat" onclick="toggleSeat(this, 'C${j}')" id="C${j}">C${j}</div>
                                    </c:when>
                                    <c:when test="${i == 4}">
                                        <div class="seat" onclick="toggleSeat(this, 'D${j}')" id="D${j}">D${j}</div>
                                    </c:when>
                                    <c:when test="${i == 5}">
                                        <div class="seat" onclick="toggleSeat(this, 'E${j}')" id="E${j}">E${j}</div>
                                    </c:when>
                                    <c:when test="${i == 6}">
                                        <c:choose>
                                            <c:when test="${j>=3 && j<=8}">
                                                <div class="seat4" onclick="toggleSeat1(this, 'F${j}')" id="F${j}">F${j}</div>
                                            </c:when>
                                            <c:when test="${j<=2 || j>8}">
                                                <div class="seat" onclick="toggleSeat(this, 'F${j}')" id="F${j}">F${j}</div>
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                    <c:when test="${i == 7}">
                                        <c:choose>
                                            <c:when test="${j>=3 && j<=8}">
                                                <div class="seat4" onclick="toggleSeat1(this, 'G${j}')" id="G${j}">G${j}</div>
                                            </c:when>
                                            <c:when test="${j<=2 || j>8}">
                                                <div class="seat" onclick="toggleSeat(this, 'G${j}')" id="G${j}">G${j}</div>
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                    <c:when test="${i == 8}">
                                        <c:choose>
                                            <c:when test="${j>=3 && j<=8}">
                                                <div class="seat4" onclick="toggleSeat1(this, 'H${j}')" id="H${j}">H${j}</div>
                                            </c:when>
                                            <c:when test="${j<=2 || j>8}">
                                                <div class="seat" onclick="toggleSeat(this, 'H${j}')" id="H${j}">H${j}</div>
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                    <c:when test="${i == 9}">
                                        <div class="seat" onclick="toggleSeat(this, 'I${j}')" id="I${j}">I${j}</div>
                                    </c:when>
                                    <c:when test="${i == 10}">
                                        <div class="seat" onclick="toggleSeat(this, 'J${j}')" id="J${j}">J${j}</div>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </c:forEach>
                    <form action="booking?fdID=${param.fdID}" method="post">
                        <input type="hidden" name="listSeat" value="" id="listSeat">
                        <input type="hidden" name="price" value="" id="price">
                        <input type="submit" value="Đặt vé" id="bt_datve">
                    </form>
                </div>
                <div class="col-md-3 chair_right">
                    <img src="${filmDetail.film.url}">
                    <p>Phim: <b><c:out value="${filmDetail.film.name}" /></b></p>
                    <p>Ngày: <b><c:out value="${filmDetail.movieDate}" /></b></p>
                    <p>Thời gian: <b>${filmDetail.getFilmSlot().getStartTime()} - ${filmDetail.getFilmSlot().getEndTime()}</b></p>
                    <p>Ghế: <b id="string_seat"></b></p>
                    <p>Số vé: <b id="number_ve">0</b> </p>
                    <p>Tổng tiền: <b id="sum_money">0</b> VNĐ</p>
                    <table>
                        <tr>
                            <td><div class="infor_seat1" style="margin-bottom: 10px;"> </div></td>
                            <td><b style="margin-left: 10px;">: Ghế thường</b></td>
                        </tr>
                        <tr>
                            <td><div class="infor_seat4" style="margin-bottom: 10px;"> </div></td>
                            <td><b style="margin-left: 10px">: Ghế VIP</b></td>
                        </tr>
                        <tr>
                            <td><div class="infor_seat2" style="margin-bottom: 10px;"> </div></td>
                            <td><b style="margin-left: 10px">: Ghế đang chọn</b></td>
                        </tr>
                        <tr>
                            <td><div class="infor_seat3" style="margin-bottom: 10px;"> </div></td>
                            <td><b style="margin-left: 10px">: Ghế đã đặt</b></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="back_film">
                <a href="calendar?fid=${filmDetail.film.id}"><i class='bx bx-arrow-back'></i> Đổi suất chiếu</a>
            </div>
        </div>
        <script>
            // Run the script when the page is loaded
            window.onload = function () {
                // Get the list of booked seats from JSP
                var bookedSeats = [
            <% for (int i = 0; i < bookedSeats.size(); i++) { %>
                '<%= bookedSeats.get(i) %>'<% if (i < bookedSeats.size() - 1) { %>,<% } %>
            <% } %>
                ];

                // Loop through each booked seat and change its class
                bookedSeats.forEach(function (seat) {
                    var seatElement = document.getElementById(seat);
                    if (seatElement) {
                        seatElement.onclick = null;
                        seatElement.classList.remove('seat');
                        seatElement.classList.remove('seat4');
                        seatElement.classList.add('seat3'); // Change the class to 'seat3'
                    }
                });
            };
            const selectedSeats = [];
            var money = 0;
            function toggleSeat(seatElement, seatLabel) {
                if (seatElement.classList.contains('selected')) {
                    const index = selectedSeats.indexOf(seatLabel);
                    if (index !== -1) {
                        selectedSeats.splice(index, 1);
                        money = money - 45000;
                    }
                } else {
                    selectedSeats.push(seatLabel);
                    money = money + 45000;
                }

                seatElement.classList.toggle('selected');
                updateSelectedSeatsInfo();
            }
            function toggleSeat1(seatElement, seatLabel) {
                if (seatElement.classList.contains('selected')) {
                    const index = selectedSeats.indexOf(seatLabel);
                    if (index !== -1) {
                        selectedSeats.splice(index, 1);
                        money = money - 55000;
                    }
                } else {
                    selectedSeats.push(seatLabel);
                    money = money + 55000;
                }

                seatElement.classList.toggle('selected');
                updateSelectedSeatsInfo();
            }

            function updateSelectedSeatsInfo() {
                const string_seat = document.getElementById('string_seat');
                string_seat.innerHTML = selectedSeats;
                var number_ve = document.getElementById("number_ve");
                number_ve.innerHTML = selectedSeats.length;
                var sum_money = document.getElementById("sum_money");
                sum_money.innerHTML = money;
                var listSeat = document.getElementById("listSeat");
                listSeat.value = selectedSeats;
                var price = document.getElementById("price");
                price.value = money;
            }


        </script>
    </body>
</html>
