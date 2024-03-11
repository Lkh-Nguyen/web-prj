<%-- 
    Document   : history_online
    Created on : Feb 6, 2024, 8:55:58 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/adminFunction.css">
        

    </head>
    <body>
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
                            <td class="listName1"><a href="inforCard">THÔNG TIN THẺ THÀNH VIÊN</a></td>
                            <td class="listIcon1"><a href="inforCard"><i class='bx bxs-id-card' ></i></i></a></td>
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
                    <h1>LỊCH SỬ GIAO DỊCH ONLINE</h1>
                </div>
                <div class="container" id="movieList">
                    <!-- Danh sách phim sẽ được tạo bằng JavaScript và thêm vào đây -->
                </div>

            </div>     
        </div>
    </body>
</html>