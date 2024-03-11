<%-- 
    Document   : payment.jsp
    Created on : Mar 9, 2024, 10:33:34 AM
    Author     : DUYAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment</title>
        <style>
            .payment-header {
                font-size: 20px;
                font-weight: 600;
                font-family: Arial, Helvetica, sans-serif;
                text-transform: uppercase;
                background-color: #7E8DAA;
                color: whitesmoke;
                line-height: 40px;
                text-align: center;
                margin-bottom: 20px;
            }
            .payment-protocol{
                display: flex;
                align-items: center;
                justify-content: space-evenly;
                margin: 25px 0px;
                font-weight: 600;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 14px;
            }
            .payment-content{
                position: relative;
                border: 2px solid #7E8DAA;
                box-shadow: 1px 2px 3px;
            }
            .payment-first{
                font-size: 20px;
                font-weight: 600;
                background-color: white;
                color:tan;
                position: absolute;
                top:-13px;
                left: 20px;
            }
            .payment-detail{
                margin: 15px 0px 15px 25px;
            }
            .payment-detail .first{
                font-weight: 600;
                padding-top: 10px;
                padding-right: 70px;
            }
            .continue{
                text-align: center;
                margin-top: 20px;
            }
            .continue button{
                padding: 10px;
                font-weight: 600;
                text-transform: uppercase;
                background-color: #7E8DAA;
                border-radius: 5px;
                border: none;
                color: white;
                cursor: pointer;
            }
            .continue button:hover{
                background-color: orangered;
            }
            .cardForm {
                width: 400px;
                margin: 0 auto;
                text-align: center;
                margin-top: 20px;
                border: 1px solid #7E8DAA;
                border-radius: 4px;
                padding: 20px;
                background-color: #f9f9f9;
            }
            .cardForm h2 {
                font-size: 18px;
                font-weight: 600;
                color: #FF6347;
                text-transform: uppercase;
                margin-bottom: 20px;
                animation: sparkle 2s linear infinite;
            }
            @keyframes sparkle {
                0% {
                    color: #FF6347;
                }
                25% {
                    color: #ffd700;
                }
                50% {
                    color: #FF6347;
                }
                75% {
                    color: #00FFFF;
                }
                100% {
                    color: #FF6347;
                }
            }
            .cardForm-label {
                font-weight: 600;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 14px;
                margin-top: 10px;
                display: block;
                text-align: left;
            }
            .cardForm-input {
                padding: 5px;
                border-radius: 5px;
                border: 1px solid #7E8DAA;
                margin-top: 5px;
                width: calc(100% - 12px);
            }
            .cardForm-buttons {
                text-align: center;
                margin-top: 20px;
            }
            .cardForm-buttons button {
                margin: 0 10px;
                padding: 10px 20px;
                font-weight: 600;
                text-transform: uppercase;
                background-color: #7E8DAA;
                border-radius: 5px;
                border: none;
                color: white;
                cursor: pointer;
            }
            .cardForm-buttons button:hover {
                background-color: orangered;
            }
            /* Dialog styles */
            dialog {
                width: 300px;
                padding: 20px;
                border-radius: 5px;
                background-color: #f9f9f9;
                text-align: center;
            }
            dialog button {
                padding: 10px 20px;
                font-weight: 600;
                text-transform: uppercase;
                background-color: #7E8DAA;
                border-radius: 5px;
                border: none;
                color: white;
                cursor: pointer;
                margin: 10px;
            }
            dialog button:hover {
                background-color: orangered;
            }
        </style>
    </head>
    <body>
        <div class="payment-header">Phương thức thanh toán</div>
        <div class="payment-protocol">
            <input type="radio" name="payment" value="0" required>Thanh toán bằng thẻ rạp</input>
            <input type="radio" name="payment" value="1" required>Thanh toán bằng thẻ ATM</input>
            <input type="radio" name="payment" value="2" required>Thanh toán qua Internet Banking/VISA</input>
        </div>
        <div class="payment-content">
            <div class="payment-first">Nội dung thanh toán</div>
            <div class="payment-detail">
                <table>
                    <tr>
                        <td class="first">Phim:</td>
                        <td>${filmDetail.film.name}</td>
                    </tr>
                    <tr>
                        <td class="first">Ngày:</td>
                        <td>${filmDetail.movieDate}</td>
                    </tr>
                    <tr>
                        <td class="first">Thời gian:</td>
                        <td>${filmDetail.getFilmSlot().getStartTime()} - ${filmDetail.getFilmSlot().getEndTime()}</td>
                    </tr>
                    <tr>
                        <td class="first">Ghế:</td>
                        <td>${sessionScope.listSeatString}</td>
                    </tr>
                    <tr>
                        <td class="first">Số vé:</td>
                        <td>${sessionScope.ticketList.size()}</td>
                    </tr>
                    <tr>
                        <td class="first">Dịch vụ:</td>
                        <td>
                            <c:forEach var="serviceEntry" items="${sessionScope.orderedService}">
                                <c:set var="service" value="${serviceEntry.key}" />
                                <c:set var="amount" value="${serviceEntry.value}" />
                                ${service.name} - ${amount} <br>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <td class="first">Tổng tiền:</td>
                        <td>${sessionScope.price} VNĐ</td>
                    </tr>
                </table>
            </div>
        </div>


        <div class="continue">
            <button id="continueButton" onclick="showCardForm()">Tiếp tục</button>
            <p id="paymentWarning" style="color: red; display: none;">Vui lòng chọn phương thức thanh toán</p>
        </div>
        <!-- Form cho thanh toán bằng thẻ rạp -->
        <div class="cardForm" id="cardForm" style="display: none;">
            <h2>Thẻ Five Stars</h2> 
            <label for="cardNumber" class="cardForm-label">Số thẻ:</label>
            <input type="text" id="cardNumber" name="cardNumber" class="cardForm-input"><br>
            <label for="expiryDate" class="cardForm-label">Ngày hết hạn:</label>
            <input type="text" id="expiryDate" name="expiryDate" class="cardForm-input"><br>
            <label for="cvv" class="cardForm-label">CVV:</label>
            <input type="text" id="cvv" name="cvv" class="cardForm-input"><br>
            <div class="cardForm-buttons">
                <button onclick="hideCardForm()">Quay lại</button>
                <button onclick="showConfirmationDialog()">Thanh toán</button>
            </div>
        </div>
        <!-- Form cho thanh toán bằng thẻ ATM -->
        <div class="cardForm" id="atmForm" style="display: none;">
            <h2>Thẻ ATM</h2>
            <label for="atmCardNumber" class="cardForm-label">Số thẻ:</label>
            <input type="text" id="atmCardNumber" name="atmCardNumber" class="cardForm-input"><br>
            <label for="bankName" class="cardForm-label">Ngân hàng:</label>
            <input type="text" id="bankName" name="bankName" class="cardForm-input"><br>
            <label for="cardHolderName" class="cardForm-label">Tên chủ thẻ:</label>
            <input type="text" id="cardHolderName" name="cardHolderName" class="cardForm-input"><br>
            <div class="cardForm-buttons">
                <button onclick="hideCardForm()">Quay lại</button>
                <button onclick="showConfirmationDialog()">Thanh toán</button>
            </div>
        </div>
        <!-- Form cho thanh toán qua Internet Banking/VISA -->
        <div class="cardForm" id="internetBankingForm" style="display: none;">
            <h2>Thanh toán qua Internet Banking/VISA</h2>
            <img src="qr_code_image.jpg" alt="QR Code" style="width: 200px;">
            <div class="cardForm-buttons">
                <button onclick="hideCardForm()">Quay lại</button>
                <button onclick="showConfirmationDialog()">Thanh toán</button>
            </div>
        </div>
        <!-- Dialog for confirmation -->
        <form id="paymentForm" method="post" action="payment">
            <dialog id="confirmationDialog">
                Bạn có chắc chắn thanh toán chưa?
                <div>
                    <button onclick="confirmPayment()">OK</button>
                    <button onclick="cancelPayment(event)">Huỷ</button>
                </div>
            </dialog>
        </form>
        <script>

            function showCardForm() {
                var paymentMethod = document.querySelector('input[name="payment"]:checked');
                if (paymentMethod) {
                    document.getElementById('paymentWarning').style.display = 'none';
                    document.getElementById('continueButton').style.display = 'none';
                    if (paymentMethod.value === "0") { // Thanh toán bằng thẻ rạp
                        document.getElementById('cardForm').style.display = 'block';
                    } else if (paymentMethod.value === "1") { // Thanh toán bằng thẻ ATM
                        document.getElementById('atmForm').style.display = 'block';
                    } else if (paymentMethod.value === "2") { // Thanh toán qua Internet Banking/VISA
                        document.getElementById('internetBankingForm').style.display = 'block';
                    }
                } else {
                    document.getElementById('paymentWarning').style.display = 'block';
                }
            }
            function hideCardForm() {
                document.getElementById('cardForm').style.display = 'none';
                document.getElementById('atmForm').style.display = 'none';
                document.getElementById('internetBankingForm').style.display = 'none';
                document.getElementById('continueButton').style.display = 'block';
            }
            function showConfirmationDialog() {
                var dialog = document.getElementById('confirmationDialog');
                dialog.showModal();
            }
            function confirmPayment() {
                var form = document.getElementById('paymentForm');
                form.submit();
            }
            function cancelPayment(event) {
                event.preventDefault(); // Prevents the default form submission
                var dialog = document.getElementById('confirmationDialog');
                dialog.close();
            }

        </script>
    </body>
</html>

