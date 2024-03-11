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
                        <tr class="list0">
                            <td class="listName0"><a href="#">QUẢN LÝ NGƯỜI DÙNG</a></td>
                            <td class="listIcon0"><a href="#"><i class='bx bx-user'></i></a></td>
                        </tr>

                        <tr class="list1">
                            <td class="listName1"><a href="full_admin_film.jsp">QUẢN LÝ THÔNG TIN PHIM</a></td>
                            <td class="listIcon1"><a href="full_admin_film.jsp"><i class='bx bx-film' ></i></a></td>
                        </tr>
                        <tr class="list1">
                            <td class="listName1"><a href="full_admin_filmDetail.jsp">QUẢN LÝ LỊCH CHIẾU</a></td>
                            <td class="listIcon1"><a href="full_admin_filmDetail.jsp"><i class='bx bx-screenshot' ></i></a></td>
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
                    <h1>QUẢN LÝ NGƯỜI DÙNG</h1>
                </div>
                <h1 style="margin-left: 0px;font-size: 25px;">Hiển thị thông tin người dùng:</h1>
                <div class="bottom-content">
                    <!--Table-->
                    <div class="contain-table">
                        <table id="product-table-id" class="product-table">
                            <tr>
                                <th>ID</th>
                                <th>Ten</th>
                                <th>Giới tính</th>
                                <th>CMND</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Địa chỉ</th>
                                <th>Vai trò</th>
                                <th>Chức năng</th>
                            </tr>
                            <form action="" method="">
                                <tr>
                                    <td>1</td>
                                    <td>Le Kim Hoàng Nguyên</td>
                                    <td>Nam</td>
                                    <td>0123456789</td>
                                    <td>0934726073</td>
                                    <td>lkh@gmail.com</td>
                                    <td>123456789</td>
                                    <td>650/7 Trần Cao Vân</td>
                                    <td>User</th>
                                    <td>
                                        <input type="submit" value="Cập nhật" style="width: 100px">
                                        <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Hoàng Nguyên</td>
                                    <td>Nam</td>
                                    <td>0123456789</td>
                                    <td>0934726073</td>
                                    <td>lkh@gmail.com</td>
                                    <td>123456789</td>
                                    <td>650/7 Trần Cao Vân</td>
                                    <td>User</th>
                                    <td>
                                        <input type="submit" value="Cập nhật" style="width: 100px">
                                        <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Hoàng Nguyên</td>
                                    <td>Nam</td>
                                    <td>0123456789</td>
                                    <td>0934726073</td>
                                    <td>lkh@gmail.com</td>
                                    <td>123456789</td>
                                    <td>650/7 Trần Cao Vân</td>
                                    <td>User</th>
                                    <td>
                                        <input type="submit" value="Cập nhật" style="width: 100px">
                                        <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Hoàng Nguyên</td>
                                    <td>Nam</td>
                                    <td>0123456789</td>
                                    <td>0934726073</td>
                                    <td>lkh@gmail.com</td>
                                    <td>123456789</td>
                                    <td>650/7 Trần Cao Vân</td>
                                    <td>User</th>
                                    <td>
                                        <input type="submit" value="Cập nhật" style="width: 100px">
                                        <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                    </td>
                                </tr>
                            </form>
                        </table> 
                    </div>
                </div>
                <div class="container" id="list"> 
                    <h1 style="margin-left: -80px;font-size: 25px">Tạo thêm hoặc chỉnh sửa người dùng:</h1>
                    <div id="register">
                        <form action="" method="post">
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
                                            <textarea id="address" name="address" rows="4" cols="60" placeholder="Nhập Địa Chỉ Ở Đây" style="resize: none">${param.address}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="col-md-12 register_radio">
                                            <p>Vai Trò</p>
                                            <label class="radio-container">
                                                <input type="radio" name="role" value="Guest" ${param.role == null || param.role == 'Guest' ? 'checked' : ''}>Guest
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio-container" style="margin-left: 40px">
                                                <input type="radio" name="role" value="Admin" ${param.role == 'Admin' ? 'checked' : ''}>Admin 
                                                <span class="checkmark"></span>
                                            </label>         
                                        </div>
                                    </div>
                                </div>                   
                                <div id="submit_register">
                                    <input type="submit" value="thêm người dùng">
                                </div>
                                 <div id="submit_register">
                                    <input type="submit" value="cập nhật thông tin">
                                </div>                
                            </div>
                        </form>

                    </div>

                </div>     
            </div>
        </div>
    </body>
</html>
