<%-- 
  eated on : Mar 11, 2024, 8:51:09 AM
    Author  Document   : admin_user
    Cr     : HELLO
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/full_admin.css">
        <link rel="stylesheet" href="css/admin_service.css">
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
                            <td class="listName1"><a href="adminListUser">QUẢN LÝ NGƯỜI DÙNG</a></td>
                            <td class="listIcon1"><a href="full_admin_user.jsp"><i class='bx bx-user'></i></a></td>
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
                        <tr class="list0">
                            <td class="listName0"><a href="adminListService">QUẢN LÝ DỊCH VỤ BẮP NƯỚC</a></td>
                            <td class="listIcon0"><a href="#"><i class='bx bx-food-menu'></i></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="inforAccount_right">
                <div class="right_header">
                    <h1>QUẢN LÝ DỊCH VỤ BẮP NƯỚC</h1>
                </div>
                <h1 style="margin-left: 0px;font-size: 25px;">Hiển thị thông tin dịch vụ:</h1>
                <div class="bottom-content">
                    <!--Table-->
                    <div class="contain-table">
                        <table id="product-table-id" class="product-table">
                            <tr>
                                <th>Tên dịch vụ</th>
                                <th>Giá tiền</th>
                                <th>URL ảnh</th>
                                <th>Chức năng</th>
                            </tr>
                            <c:forEach items="${sessionScope.serviceList}" var="service">
                                <tr>
                                    <td>${service.name}</td>
                                    <td>${service.price}</td>
                                    <td><img src="nameService/${service.url}" style="width: 50px;height: 50px;"></td>
                                    <td>
                                        <form action="adminUpdateService" method="get">
                                            <input type="hidden" name="serviceId" value="${service.id}" />
                                            <input type="submit" value="Cập nhật" style="width: 100px">
                                        </form>
                                        <form action="adminDeleteService" method="post">
                                            <input type="hidden" name="serviceId" value="${service.id}" />
                                            <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table> 
                    </div>
                </div>
                <div class="container" id="list"> 
                    <h1 style="margin-left: -80px;font-size: 25px">Tạo thêm hoặc chỉnh sửa dịch vụ:</h1>
                    <div id="register">
                        <div class="form_register">
                            <div class ="row">
                                <div class="col-md-4 register1">
                                    <p>Thêm file ảnh ở dưới</p>
                                    <c:if test="${not empty uploadedFilePath}">
                                        <div>
                                            <img src="nameFile/${uploadedFilePath}" style="width: 190px;height: 270px;">
                                        </div>                   
                                    </c:if>
                                    <c:if test="${empty uploadedFilePath}">
                                        <form method="post" action="UploadFile" enctype="multipart/form-data">
                                            <input type="file" name="file" size="60"/><br/>
                                            <input type="submit"  value="Upload"/>
                                            <input type="hidden" name="check" value="1"/>
                                        </form>
                                    </c:if>                                   
                                </div>
                                <c:set var="service" value="${requestScope.service}"></c:set>
                                <c:if test="${not empty service}">
                                    <c:set var="actionValue" value="adminUpdateService"></c:set>
                                </c:if>
                                <c:if test="${empty service}">
                                    <c:set var="actionValue" value="adminAddService"></c:set>
                                </c:if>
                                <form action="${actionValue}" method="post">
                                    <div class="col-md-4 register">
                                        <p>URL Ảnh Service</p>
                                        <c:if test="${not empty service}">
                                            <c:if test="${not empty uploadedFilePath}">
                                                <input type="text" name="urlService" placeholder="Nhập Url Ảnh Của Dịch Vụ" value="nameFile/${uploadedFilePath}" required>                  
                                            </c:if>
                                            <c:if test="${empty uploadedFilePath}">
                                                <input type="text" name="urlService" placeholder="Nhập Url Ảnh Của Dịch Vụ" value="nameFile/${service.url}" required>
                                            </c:if> 
                                        </c:if>
                                        <c:if test="${empty service}">
                                            <c:if test="${not empty uploadedFilePath}">
                                                <input type="text" name="urlService" placeholder="Nhập Url Ảnh Của Dịch Vụ" value="nameFile/${uploadedFilePath}" required>                  
                                            </c:if>
                                            <c:if test="${empty uploadedFilePath}">
                                                <input type="text" name="urlService" placeholder="Nhập Url Ảnh Của Dịch Vụ" value="" required>
                                            </c:if> 
                                        </c:if>

                                    </div>
                            </div> 
                            <div class ="row">
                                <c:if test="${not empty service}">
                                    <div class="col-md-4 register">
                                        <p>Tên Dịch Vụ</p>
                                        <input type="text" name="nameService"  placeholder="Nhập Tên Dịch Vụ Ở Đây" value="${service.name}" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Giá Tiền</p>
                                        <input type="number" min="0" name="priceService" placeholder="Nhập Giá Tiền Ở Đây" value="${service.price}" required>
                                    </div>
                                </c:if>
                                <c:if test="${empty service}">
                                    <div class="col-md-4 register">
                                        <p>Tên Dịch Vụ</p>
                                        <input type="text" name="nameService"  placeholder="Nhập Tên Dịch Vụ Ở Đây" value="" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Giá Tiền</p>
                                        <input type="number" min="0" name="priceService" placeholder="Nhập Giá Tiền Ở Đây" value="" required>
                                    </div>
                                </c:if>

                            </div>  
                            <c:if test="${not empty service}">
                                <div id="submit_register">
                                    <input type="hidden" name="serviceId" value="${service.id}" />
                                    <input type="submit" value="CẬP NHẬT THÔNG TIN">
                                </div>
                            </c:if>
                            <c:if test="${empty service}">
                                <div id="submit_register">
                                    <input type="submit" value="THÊM DỊCH VỤ">
                                </div>
                            </c:if>


                        </div>
                        </form>

                    </div>
                </div>
            </div>     
        </div>
    </body>
</html>
