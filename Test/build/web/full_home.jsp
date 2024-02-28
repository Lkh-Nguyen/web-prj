<%-- 
    Document   : home
    Created on : Jan 28, 2024, 10:04:04 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <!--Embed css here-->
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/banner.css">
        <link rel="stylesheet" href="css/UuDai.css">
        <link rel="stylesheet" href="css/footer.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>  
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="banner.jsp" %>
        <%@include file="UuDai.jsp" %>
        <%@include file="footer.jsp" %>
    </body>
</html>
