<%-- 
Document   : register
Created on : Jan 28, 2024, 10:03:26 PM
Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/register.css">
    </head>
    <body>
        <div id="register">
            <div>
                <button id="bt_login"><a href="login">ĐĂNG NHẬP</a></button>
                <button id="bt_register"><a href="#">ĐĂNG KÝ</a></button>
            </div>

            <form action="register" method="post">
                <div class="form_register">
                    <div class ="row">
                        <div class="col-md-4 register">
                            <p>Họ Tên</p>
                            <input type="text" name="name"  placeholder="Nhập Họ Tên Ở Đây" value="${param.name}" required>
                        </div>
                        <div class="col-md-4 register_radio">
                            <p>Giới tính</p>
                            <input type="radio" name="gender" value="Male" ${param.gender == null || param.gender == 'Male' ? 'checked' : ''}> Nam 
                            <input type="radio" name="gender" value="Female" ${param.gender == 'Female' ? 'checked' : ''}> Nữ
                        </div>
                    </div>
                    <div class ="row">
                        <div class="col-md-4 register">
                            <p>Ngày Sinh</p>
                            <input type="date" name="DOB" placeholder="Chọn Ngày Sinh Ở Đây" required value="${param.DOB}">
                        </div>
                        <div class="col-md-4 register">
                            <p>Số CMND</p>
                            <input type="text" name="CMND" placeholder="Nhập Số CMND Ở Đây" value="${param.CMND}" pattern="[0-9]{12}" title="Số CMND phải gồm 12 chữ số.">
                        </div>
                    </div>
                    <div class ="row">
                        <div class="col-md-4 register">
                            <p>Số Điện Thoại</p>
                            <input type="text" name="phone" placeholder="Nhập Số Điện Thoại Ở Đây" required value="${param.phone}" pattern="[0-9]{10}" title="Số điện thoại phải gồm 10 chữ số.">
                        </div>
                        <!-- Receive error message here -->
                        <div class="col-md-4 register">
                            <p>Email</p>
                            <input type="email" name="email" placeholder="Nhập Email Ở Đây" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" title="Vui lòng nhập địa chỉ email hợp lệ. Ví dụ: example@example.com" value="${param.email}">
                            <h5 style="color:red">${requestScope.emailError}</h5>
                        </div>
                    </div>
                    <div class ="row">
                        <div class="col-md-4 register">
                            <p>Mật Khâu</p>
                            <input type="password" name="password" placeholder="Nhập Mật Khẩu Ở Đây" minlength="8" required value="${param.password}">
                        </div>
                        <div class="col-md-4 register">
                            <p>Xác Nhận Mật Khẩu</p>
                            <input type="password" name="repassword" placeholder="Nhập Lại Mật Khẩu" required value="${param.repassword}">
                            <h5 style="color:red">${requestScope.repasswordError}</h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="address_register">
                                <p>Địa Chỉ</p>
                                <textarea id="address" name="address" rows="4" cols="31" placeholder="Nhập Địa Chỉ Ở Đây" style="resize: none">${param.address}</textarea>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="col-md-12 register_radio">
                                <p>Vai Trò</p>
                                <label class="radio-container">
                                    <input type="radio" name="role" value="Guest" ${param.role == null || param.role == 'Guest' ? 'checked' : ''}>Guest
                                    <span class="checkmark"></span>
                                </label>
                                <label class="radio-container">
                                    <input type="radio" name="role" value="Admin" ${param.role == 'Admin' ? 'checked' : ''}>Admin 
                                    <span class="checkmark"></span>
                                </label>         
                            </div>
                        </div>
                    </div>                   
                    <div class="row">
                        <div class="checkbox">
                            <label> <input type="checkbox" name="check" required>Tôi đã đọc và đồng ý với các <a href="#">điều khoản</a></label>
                        </div>
                    </div>
                    <div id="submit_register">
                        <input type="submit" value="ĐĂNG KÝ">
                    </div>
                    <h5 style="color:red">${requestScope.registerStatus}</h5>
                </div>

            </form>
        </div>
    </body>
</html>
