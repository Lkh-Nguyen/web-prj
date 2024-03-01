<%-- 
    Document   : login
    Created on : Jan 28, 2024, 10:03:07 PM
    Author     : HELLO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div id="login">
            <div>
                <button id="bt_login"><a href="#">ĐĂNG NHẬP</a></button>
                <button id="bt_register"><a href="full_register.jsp">ĐĂNG KÝ</a></button>
            </div>
            <c:set var="cookie" value="${pageContext.request.cookies} "/>
            <form action="LoginServlet" method="post">
                <div class="form_login">
                    <div class ="row">
                        <div class="col-md-4 email_login">
                            <p>Email</p>
                            <input type="text" name="email" id="email" placeholder="Nhập Email Ở Đây" value="${empty cookie.cEmail ? param.email : cookie.cEmail.value}" required>
                        </div>
                        <div class="col-md-4 matkhau_login">
                            <p>Mật Khẩu</p>
                            <input type="password" name="password" id="password" placeholder="Nhập Mật Khẩu Ở Đây" value="${param.password}" required minlength="8">
                        </div>
                    </div>
                    <div class="remember_me">
                        <input type="checkbox" name="rememberMe" id="rememberMe" ${cookie.cRememberMe.value!=null?'checked':''}>
                        <label for="rememberMe">Ghi nhớ tài khoản</label>
                    </div>
                    <h5 style="color: red">${requestScope.errorMessage}</h5>
                    <div id="submit_login">
                        <input type="submit" value="ĐĂNG NHẬP">
                    </div>
                    <div class="move_lookpass">
                        <a href="#">Tìm lại mật khẩu →</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
