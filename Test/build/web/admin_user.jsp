<%-- 
    Document   : admin_user
    Created on : Mar 11, 2024, 8:51:09 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="css/full_admin.css">
    <link rel="stylesheet" href="css/admin_user.css">
    <style>
        #scrollToTopBtn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 99;
            font-size: 18px;
            border: none;
            outline: none;
            background-color: #00A8FF;
            color: white;
            cursor: pointer;
            padding: 15px;
            border-radius: 4px;
            opacity: 0.1;
            transition: opacity 0.3s;
        }

        #scrollToTopBtn:hover {
            opacity: 1;
        }
    </style>
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
                    <td class="listName0"><a href="full_admin_user.jsp">QUẢN LÝ NGƯỜI DÙNG</a></td>
                    <td class="listIcon0"><a href="#"><i class='bx bx-user'></i></a></td>
                </tr>

                <tr class="list1">
                    <td class="listName1"><a href="adminListFilm">QUẢN LÝ THÔNG TIN PHIM</a></td>
                    <td class="listIcon1"><a href="full_admin_film.jsp"><i class='bx bx-film' ></i></a></td>
                </tr>
                <tr class="list1">
                    <td class="listName1"><a href="adminListFilmDetail">QUẢN LÝ LỊCH CHIẾU</a></td>
                    <td class="listIcon1"><a href="full_admin_filmDetail.jsp"><i class='bx bx-screenshot' ></i></a></td>
                </tr>

                <tr class="list1">
                    <td class="listName1"><a href="adminListTicket">QUẢN LÝ VÉ XEM PHIM</a></td>
                    <td class="listIcon1"><a href="full_admin_ticket.jsp"><i class='bx bx-detail'></i></a></td>
                </tr>
                <tr class="list1">
                    <td class="listName1"><a href="adminListService">QUẢN LÝ DỊCH VỤ BẮP NƯỚC</a></td>
                    <td class="listIcon1"><a href="full_admin_service.jsp"><i class='bx bx-food-menu'></i></a></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="inforAccount_right">
        <div class="right_header">
            <h1>QUẢN LÝ NGƯỜI DÙNG</h1>
        </div>
        <h1 style="margin-left: 0px; font-size: 25px; color: #007BFF; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">Hiển thị thông tin người dùng:</h1>
        <div class="bottom-content">
<!--Table-->
            <div class="contain-table">
                <table id="product-table-id" class="product-table">
                    <tr>
                        <th>ID</th>
                        <th>Ten</th>
                        <th>Giới tính</th>
                        <th>Ngày Sinh</th>
                        <th>CMND</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Địa chỉ</th>
                        <th>Vai trò</th>
                        <th>Chức năng</th>
                    </tr>
                    <c:forEach items="${sessionScope.userList}" var="user">
                        <c:set var="role" value="${user.role}" />
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.gender}</td>
                            <td>${user.dateOfBirth}</td>
                            <td>${user.cmnd}</td>
                            <td>${user.phoneNumber}</td>
                            <td>${user.email}</td>
                            <td>${user.password}</td>
                            <td>${user.address}</td>
                            <td>
                                <c:if test="${role eq '1'}">Guest</c:if>
                                <c:if test="${role eq '2'}">Admin</c:if>
                            </td>
                            <td>
                                <form action="adminUpdateUser" method="get">
                                    <c:set var="userId" value="${user.id}" />
                                    <input type="hidden" name="userId" value="${userId}" />
                                    <button type="submit" class="update-button">Cập nhật</button>
                                </form>
                                <form action="adminDeleteUser" method="post">
                                    <c:set var="userId" value="${user.id}" />
                                    <input type="hidden" name="userId" value="${userId}" />
                                    <button type="submit" class="add-button">Xóa dữ liệu</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table> 
            </div>
        </div>
        <div class="container" id="list"> 
            <h1 style="margin-left: -75px; font-size: 25px; color: #007BFF; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">Tạo thêm hoặc chỉnh sửa người dùng:</h1>
            <c:set var="user" value="${requestScope.user}"></c:set>
            <c:if test="${not empty user}">
                <c:set var="actionValue" value="adminUpdateUser"></c:set>
            </c:if>
            <c:if test="${empty user}">
<c:set var="actionValue" value="adminAddUser"></c:set>
            </c:if>
            <div id="register">
                <form action="${actionValue}" method="post">
                    <div class="form_register">
                        <div class ="row">
                            <div class="col-md-4 register">
                                <p>Họ Tên</p>
                                <c:if test="${not empty user}">
                                    <input type="text" name="name"  placeholder="Nhập Họ Tên Ở Đây" value="${user.name}" required>
                                </c:if>
                                <c:if test="${empty user}">
                                    <input type="text" name="name"  placeholder="Nhập Họ Tên Ở Đây" value="${param.name}" required>
                                </c:if>

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
                                <c:if test="${not empty user}">
                                   <input type="date" name="DOB" placeholder="Chọn Ngày Sinh Ở Đây" required value="${user.dateOfBirth}">
                                </c:if>
                                <c:if test="${empty user}">
                                    <input type="date" name="DOB" placeholder="Chọn Ngày Sinh Ở Đây" required value="${param.DOB}">
                                </c:if>

                            </div>
                            <div class="col-md-4 register">
                                <p>Số CMND</p>
                                <c:if test="${not empty user}">
                                     <input type="text" name="CMND" placeholder="Nhập Số CMND Ở Đây" value="${user.cmnd}" pattern="[0-9]{12}" title="Số CMND phải gồm 12 chữ số.">
                                </c:if>
                                <c:if test="${empty user}">
                                     <input type="text" name="CMND" placeholder="Nhập Số CMND Ở Đây" value="${param.CMND}" pattern="[0-9]{12}" title="Số CMND phải gồm 12 chữ số.">
                                </c:if>

                            </div>
                        </div>
                        <div class ="row">
                            <div class="col-md-4 register">
                                <p>Số Điện Thoại</p>
<c:if test="${not empty user}">
                                    <input type="text" name="phone" placeholder="Nhập Số Điện Thoại Ở Đây" required value="${user.phoneNumber}" pattern="[0-9]{10}" title="Số điện thoại phải gồm 10 chữ số.">
                                </c:if>
                                <c:if test="${empty user}">
                                    <input type="text" name="phone" placeholder="Nhập Số Điện Thoại Ở Đây" required value="${param.phone}" pattern="[0-9]{10}" title="Số điện thoại phải gồm 10 chữ số.">
                                </c:if>

                            </div>
                            <!-- Receive error message here -->
                            <div class="col-md-4 register">
                                <p>Email</p>
                                <c:if test="${not empty user}">
                                     <input type="email" name="email" placeholder="Nhập Email Ở Đây" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" title="Vui lòng nhập địa chỉ email hợp lệ. Ví dụ: example@example.com" value="${user.email}">
                                </c:if>
                                <c:if test="${empty user}">
                                     <input type="email" name="email" placeholder="Nhập Email Ở Đây" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" title="Vui lòng nhập địa chỉ email hợp lệ. Ví dụ: example@example.com" value="${param.email}">
                                </c:if>

                                <h5 style="color:red">${requestScope.emailError}</h5>
                            </div>
                        </div>
                        <div class ="row">
                            <div class="col-md-4 register">
                                <p>Mật Khâu</p>
                                <c:if test="${not empty user}">
                                    <input type="password" name="password" placeholder="Nhập Mật Khẩu Ở Đây" minlength="8" required value="${user.password}">
                                </c:if>
                                <c:if test="${empty user}">
                                    <input type="password" name="password" placeholder="Nhập Mật Khẩu Ở Đây" minlength="8" required value="${param.password}">
                                </c:if>

                            </div>
                            <div class="col-md-4 register">
                                <p>Xác Nhận Mật Khẩu</p>
                                <c:if test="${not empty user}">
                                    <input type="password" name="repassword" placeholder="Nhập Lại Mật Khẩu" required value="${user.password}">
                                </c:if>
                                <c:if test="${empty user}">
<input type="password" name="repassword" placeholder="Nhập Lại Mật Khẩu" required value="${param.repassword}">
                                </c:if>

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
                        <c:if test="${not empty user}">
                            <div id="submit_register">
                                <input type="hidden" name="userId" value="${user.id}">
                                <button type="submit" class="update-button-large">CẬP NHẬT THÔNG TIN</button>
                            </div> 
                        </c:if>
                        <c:if test="${empty user}">
                            <div id="submit_register">
                                <button type="submit" class="add-button-large">THÊM NGƯỜI DÙNG</button>
                            </div>
                        </c:if>                
                    </div>
                </form>
            </div>
        </div>     
    </div>
</div>

<button id = "scrollToTopBtn" hidden> Scroll to Top </button>
<script>
    const btnScrollToTop = document.getElementById("scrollToTopBtn");
    const docEL = document.documentElement;

    document.addEventListener("scroll",()=> {
        const scrollToTal = docEL.scrollHeight - docEL.clientHeight;
        if ((docEL.scrollTop/scrollToTal)>= 0.4){
            btnScrollToTop.hidden = false;
        }   
        else{
btnScrollToTop.hidden = true;
        }
    }
    );
    
    btnScrollToTop.addEventListener('click',()=>{
        docEL.scrollTo({
            top :0,
            behavior:'smooth'
        });
    });
</script> 
</body>
</html>
