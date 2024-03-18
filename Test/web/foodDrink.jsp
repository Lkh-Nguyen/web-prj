<%-- 
    Document   : seat
    Created on : Mar 2, 2024, 10:21:54 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Database.ServiceDB" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/foodDrink.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <style>
            /* Style cho container chứa nút và giá trị số lượng */
            .quantity-container {
                display: flex;
                align-items: center;
            }

            /* Style cho nút tăng và giảm */
            .quantity-button {
                width: 25px;
                font-size: 1.2em;
                padding: 0.2em 0.5em;
                cursor: pointer;
                user-select: none;
                border: 1px solid #ccc;
                background-color: #fff;
            }

            /* Style cho hiển thị giá trị số lượng */
            .quantity-value {
                margin: 0 0.5em;
                font-size: 1.2em;
            }
        </style>
    </head>
    <body>
        <c:set  var="filmDetail" value="${sessionScope.filmDetail}" scope="session"/>
        <c:set var="listService" value="<%= ServiceDB.getAllServices() %>" />
        <div class="full_FoodDrink">
            <h1 id="choose_FoodDrink">CHỌN ĐỒ ĂN VÀ NƯỚC UỐNG</h1>
            <div style="display:flex">
                <div class="col-md-8 chair_left">
                    <c:set var="i" value="1"/>
                    <c:forEach var="c" items="${listService}">
                        <input type="hidden"  value="${c.id}" id="id${i}">
                        <input type="hidden"  value="${c.price}" id="price${i}">
                        <div class="container" id="movieList" >
                            <div class="contain-movie" >
                                <div class="movie-contain-img">
                                    <img src="${c.url}" alt="" class="movie-image">
                                </div>
                                <div class="movie-details">
                                    <h2>Combo ${i}</h2>
                                    <p>${c.name}</p>
                                    <p style="font-weight: bold">Giá: <label>${c.price}</label> VNĐ</p>
                                    <div class="quantity-container">
                                        <div class="quantity-container">
                                            <button class="quantity-button" onclick="decreaseQuantity${i}()">-</button>
                                            <span class="quantity-value" id="quantity${i}">0</span>
                                            <button class="quantity-button" onclick="increaseQuantity${i}()">+</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:set var="i" value="${i+1}"/>
                        </div>
                    </c:forEach>


                </div>

                <div class="col-md-3 chair_right">
                    <img src="${filmDetail.film.url}">
                    <p>Phim: <b> ${filmDetail.film.name}</b></p>
                    <p>Ngày: <b>${filmDetail.movieDate}</b></p>
                    <p>Thời gian: <b>${filmDetail.getFilmSlot().getStartTime()} - ${filmDetail.getFilmSlot().getEndTime()}</b></p>
                    <p>Ghế: <b id="string_seat">${sessionScope.listSeatString}</b></p>
                    <p>Số vé: <b id="number_ve">${sessionScope.ticketList.size()}</b> </p>
                    <p>Tổng tiền: <b id="sum_money">${sessionScope.price}</b> VNĐ</p>
                    <input type="hidden"  value="${sessionScope.price}" id="sum">
                </div>
            </div>  
            <form action="service" method="post">
                <input type="hidden" name="listSeat" value="" id="listSeat">
                <input type="hidden" name="price" value="" id="price">
                <input type="hidden" name="listServiceSize" value="${listService.size()}">
                <c:set var="i" value="1"/>
                <c:forEach var="c" items="${listService}">
                    <input type="hidden" name="full_FD${i}" value="" id="full_FD${i}">
                    <c:set var="i" value="${i+1}"/>
                </c:forEach>
                <input type="submit" value="Tiếp tục" id="bt_datve">
            </form>
        </div>


        <script>
            document.getElementById('listSeat').value = document.getElementById('string_seat').textContent;
            document.getElementById('price').value = document.getElementById('sum_money').textContent;
            // JavaScript để xử lý sự kiện khi nút được nhấn
            <c:set var="i" value="1"/>
            <c:forEach var="c" items="${listService}">
            function increaseQuantity${i}() {
                var quantityElement = document.getElementById('quantity${i}');
                var currentQuantity = parseInt(quantityElement.textContent);
                quantityElement.textContent = currentQuantity + 1;
                updateSumMoney();
            }

            function decreaseQuantity${i}() {
                var quantityElement = document.getElementById('quantity${i}');
                var currentQuantity = parseInt(quantityElement.textContent);
                if (currentQuantity >= 1) {
                    quantityElement.textContent = currentQuantity - 1;
                }
                updateSumMoney();
            }
            <c:set var="i" value="${i+1}"/>


            </c:forEach>

            function updateSumMoney() {
                var sumMoneyElement = parseInt(document.getElementById('sum').value);

                // Loop through each combo to calculate the total sum
            <c:set var="i" value="1"/>
            <c:forEach var="c" items="${listService}">
                var quantity = parseInt(document.getElementById('quantity${i}').textContent);
                var price = parseInt(document.getElementById('price${i}').value);
                sumMoneyElement += quantity * price;
                var id = document.getElementById('id${i}').value;
                var number = document.getElementById('quantity${i}').textContent;
                document.getElementById('full_FD${i}').value = id + ":" + number;
                <c:set var="i" value="${i+1}"/>
            </c:forEach>

                // Update the sum_money label with the calculated total sum
                document.getElementById('sum_money').textContent = sumMoneyElement;
                document.getElementById('price').value = document.getElementById('sum_money').textContent;
            }

            // Call the updateSumMoney function when the page is loaded
            window.onload = updateSumMoney;


        </script>
    </body>
</html>