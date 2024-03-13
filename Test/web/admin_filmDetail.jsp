<%-- 
    Document   : admin_user
    Created on : Mar 11, 2024, 8:51:09 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/full_admin.css">
        <link rel="stylesheet" href="css/admin_user.css">
    </head>
    <body>
        <!-- history_online -->
        <div class="row infor_account">
            <div class="inforAccount_left">
                <div class="left_h1">
                    <h1>CHỨC NĂNG ADMIN</h1>
                </div>
                <div class="left_list">
                    <table>
                        <tr class="list2">
                            <td class="listName1"><a href="full_admin_user.jsp">QUẢN LÝ NGƯỜI DÙNG</a></td>
                            <td class="listIcon1"><a href="full_admin_user.jsp"><i class='bx bx-user'></i></a></td>
                        </tr>

                        <tr class="list1">
                            <td class="listName1"><a href="full_admin_film.jsp">QUẢN LÝ THÔNG TIN PHIM</a></td>
                            <td class="listIcon1"><a href="full_admin_film.jsp"><i class='bx bx-film' ></i></a></td>
                        </tr>
                        <tr class="list0">
                            <td class="listName0"><a href="#">QUẢN LÝ LỊCH CHIẾU</a></td>
                            <td class="listIcon0"><a href="#"><i class='bx bx-screenshot' ></i></a></td>
                        </tr>

                        <tr class="list1">
                            <td class="listName1"><a href="full_admin_ticket.jsp">QUẢN LÝ VÉ XEM PHIM</a></td>
                            <td class="listIcon1"><a href="full_admin_ticket.jsp"><i class='bx bx-detail'></i></a></td>
                        </tr>
                        <tr class="list1">
                            <td class="listName1"><a href="full_admin_service.jsp">QUẢN LÝ DỊCH VỤ BẮP NƯỚC</a></td>
                            <td class="listIcon1"><a href="full_admin_service.jsp"><i class='bx bx-food-menu'></i></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="inforAccount_right">
                <div class="right_header">
                    <h1>QUẢN LÝ LỊCH CHIẾU</h1>
                </div>

                <h1 style="margin-left: 0px;font-size: 25px;">Hiển thị lịch chiếu:</h1>
                <div class="bottom-content">
                    <!--Table-->
                    <div class="contain-table">
                        <table id="product-table-id" class="product-table">
                            <tr>
                                <th>ID</th>
                                <th>ScreenID</th>
                                <th>FilmID</th>
                                <th>FilmSlotID</th>
                                <th>MovieDate</th>
                                <th>Chức năng</th>
                            </tr>
                            <form action="" method="">
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>2024-03-06</td>
                                    <td>
                                        <input type="submit" value="Cập nhật" style="width: 100px">
                                        <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>2</td>
                                    <td>2</td>
                                    <td>2</td>
                                    <td>2024-03-06</td>
                                    <td>
                                        <input type="submit" value="Cập nhật" style="width: 100px">
                                        <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>3</td>
                                    <td>3</td>
                                    <td>3</td>
                                    <td>2024-03-06</td>
                                    <td>
                                        <input type="submit" value="Cập nhật" style="width: 100px">
                                        <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>4</td>
                                    <td>4</td>
                                    <td>4</td>
                                    <td>2024-03-07</td>
                                    <td>
                                        <input type="submit" value="Cập nhật" style="width: 100px">
                                        <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                    </td>
                                </tr>
                            </form>
                        </table> 
                    </div>
                </div> 
                <h1 style="margin-left: 0px;font-size: 25px;">Tạo thêm hoặc chỉnh sửa lịch chiếu:</h1>
                <div class="container" id="list">
                    <div id="register">
                        <form action="" method="post">
                            <div class="form_register">
                                <div class ="row">
                                    <div class="col-md-4 register">
                                        <p>Film ID</p>
                                        <input type="text" name="idFIlm"  placeholder="Nhập ID Film Ở Đây" value="${param.filmID}" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Screen ID</p>
                                        <input type="text" name="idScreen"  placeholder="Nhập ID Screen Ở Đây" value="${param.screenID}" required>
                                    </div
                                </div>
                            </div>
                            <div class ="row">
                                <div class="col-md-4 register">
                                    <p>Film Slot ID</p>
                                    <input type="text" name="filmSlotID"  placeholder="Nhập ID Slot Ở Đây" value="${param.screenID}" required>
                                </div>
                                <div class="col-md-4 register">
                                    <p>Movie Date</p>
                                    <input type="text" name="dateMoive"  placeholder="Nhập Ngày Chiếu Ở Đây" value="${param.screenID}" required>
                                </div>
                            </div>
                            <div id="submit_register">
                                <input type="submit" value="THÊM LỊCH CHIẾU">
                            </div>
                            <div id="submit_register">
                                <input type="submit" value="CẬP NHẬT LỊCH CHIẾU">
                            </div>                
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>     
</body>
</html>
