<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/adminFunction.css">


    </head>
    <body>
        <c:set var="user" value="${sessionScope.user}" />
        <c:set var="role" value="${user.role}" />

        <!-- history_online -->
        <div class="row infor_account">
            <div class="inforAccount_left">
                <div class="left_h1">
                    <h1>TÀI KHOẢN</h1>
                </div>
                <div class="left_list">
                    <table>
                        <tr class="list2">
                            <td class="listName1"><a href="updateAccount">THÔNG TIN TÀI KHOẢN</a></td>
                            <td class="listIcon1"><a href="updateAccount"><i class='bx bx-user' ></i></a></td>
                        </tr>

                        <tr class="list1">
                            <td class="listName1"><a href="changePass">THAY ĐỔI MẬT KHẨU</a></td>
                            <td class="listIcon1"><a href="changePass"><i class='bx bxs-lock-open-alt'></i></a></td>
                        </tr>

                        <tr class="list1">
                            <td class="listName1"><a href="full_historyOnline.jsp">LỊCH SỬ GIAO DỊCH ONLINE</a></td>
                            <td class="listIcon1"><a href="full_historyOnline.jsp"><i class='bx bx-history' ></i></a></td>
                        </tr>
                        <tr class="list0">
                            <td class="listName0"><a href="#">CHỨC NĂNG ADMIN </a></td>
                            <td class="listIcon0"><a href="#"><i class='bx bx-data'></i></a></td>
                        </tr>
                    </table>
                </div>
            </div>

            
                <div class="inforAccount_right">
                    <div class="right_header">
                        <h1>CHỨC NĂNG ADMIN</h1>
                    </div>
                        <c:if test="${role eq '2'}">
                    <div class="container" id="movieList">
                        <!-- Trong phần container của movieList -->
                        <div class="block" id="userBlock">
                            <h2><a href="adminListUser">QUẢN LÝ NGƯỜI DÙNG</a></h2>
                            <!-- Nội dung khối User -->
                        </div>

                        <div class="block" id="filmBlock">
                            <h2><a href="adminListFilm">QUẢN LÝ THÔNG TIN PHIM</a></h2>
                            <!-- Nội dung khối Film -->
                        </div>

                        <div class="block" id="filmDetailBlock">
                            <h2><a href="adminListFilmDetail">QUẢN LÝ LỊCH CHIẾU</a></h2>
                            <!-- Nội dung khối Film Detail -->
                        </div>

                        <div class="block" id="ticketBlock">
                            <h2><a href="adminListTicket">QUẢN LÝ VÉ XEM PHIM</a></h2>
                            <!-- Nội dung khối Ticket -->
                        </div>

                        <div class="block" id="serviceBlock">
                            <h2><a href="adminListService">QUẢN LÝ DỊCH VỤ BẮP NƯỚC</a></h2>
                            <!-- Nội dung khối Service -->
                        </div>
                    </div>

                    
            </c:if>
            <c:if test="${role eq '1'}">
                <div id="noHistory" style="color:red;text-align: center">
                    <h3>Bạn không có quyền truy cập</h3>
                </div>
            </c:if>
            </div> 
        </div>
    </body>
</html>
