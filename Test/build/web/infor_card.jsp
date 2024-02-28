<%-- 
    Document   : infor_card
    Created on : Feb 6, 2024, 8:56:56 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/infor_card.css">
    </head>
    <body>
       <!-- infor_Account -->
    <div class="row infor_account">
        <div class="inforAccount_left">
            <div class="left_h1">
                <h1>TÀI KHOẢN</h1>
            </div>
            <div class="left_list">
                <table>
                    <tr class="list2">
                        <td class="listName1"><a href="full_updateAccount.jsp">THÔNG TIN TÀI KHOẢN</a></td>
                        <td class="listIcon1"><a href="full_updateAccount.jsp"><i class='bx bx-user' ></i></a></td>
                    </tr>
                
                    <tr class="list1">
                        <td class="listName1"><a href="full_changePass.jsp">THAY ĐỔI MẬT KHẨU</a></td>
                        <td class="listIcon1"><a href="full_changePass.jsp"><i class='bx bxs-lock-open-alt'></i></a></td>
                    </tr>
                    <tr class="list0">
                        <td class="listName0"><a href="#">THÔNG TIN THẺ THÀNH VIÊN</a></td>
                        <td class="listIcon0"><a href="#"><i class='bx bxs-id-card' ></i></i></a></td>
                    </tr>
           
                    <tr class="list1">
                        <td class="listName1"><a href="full_historyOnline.jsp">LỊCH SỬ GIAO DỊCH ONLINE</a></td>
                        <td class="listIcon1"><a href="full_historyOnline.jsp"><i class='bx bx-history' ></i></a></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="inforAccount_right">
            <div class="right_header">
                <h1>THAY ĐỔI MẬT KHẨU</h1>
            </div>
            <div style="text-align: center;">
                <h2>SEVER ĐANG BẢO TRÌ</h2>
            </div>
        
        </div>
    </div>
  <!-- infor_Account -->
    </body>
</html>
