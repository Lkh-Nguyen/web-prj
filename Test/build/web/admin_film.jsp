<%-- 
  eated on : Mar 11, 2024, 8:51:09 AM
    Author  Document   : admin_user
    Cr     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                        <tr class="list0">
                            <td class="listName0"><a href="adminListFilm">QUẢN LÝ THÔNG TIN PHIM</a></td>
                            <td class="listIcon0"><a href="#"><i class='bx bx-film' ></i></a></td>
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
                    <h1>QUẢN LÝ THÔNG TIN PHIM</h1>
                </div>
                <h1 style="margin-left: 0px;font-size: 25px;">Hiển thị thông tin phim:</h1>
                <div class="bottom-content">
                    <!--Table-->
                    <div class="contain-table">
                        <table id="product-table-id" class="product-table">
                            <tr>
                                <th>ID</th>
                                <th>Name </th>
                                <th>Type</th>
                                <th>Duration</th>
                                <th>Start Date</th>
                                <th>Rate</th>
                                <th>Director</th>
                                <th>languge</th>
                                <th>Url Image</th>
                                <th>Chức năng</th>
                            </tr>
                            <c:forEach items="${sessionScope.filmList}" var="film">
                                <tr>
                                    <td>${film.id}</td>
                                    <td>${film.name}</td>
                                    <td>${film.type}</td>
                                    <td>${film.duration} phút</td>
                                    <td>${film.startDate}</td>
                                    <td>${film.rate}</td>
                                    <td>${film.director}</td>
                                    <td>${film.language}</td>
                                    <td><img src="${film.url}" style="width: 190px;height: 280px;"></td>

                                    <td>
                                        <form action="adminUpdateFilm" method="get">
                                            <c:set var="filmId" value="${film.id}" />
                                            <input type="hidden" name="filmId" value="${filmId}" />
                                            <input type="submit" value="Cập nhật" style="width: 100px">
                                        </form>
                                        <form action="adminDeleteFilm" method="post">
                                            <c:set var="filmId" value="${film.id}" />
                                            <input type="hidden" name="filmId" value="${filmId}" />
                                            <input type="submit" value="Xóa dữ liệu" style="width: 100px">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table> 
                    </div>
                </div>
                <div class="container" id="list"> 
                    <h1 style="margin-left: -80px;font-size: 25px">Tạo thêm hoặc chỉnh sửa phim:</h1>
                    <div id="register">
                        <c:set var="film" value="${requestScope.film}"></c:set>
                        <c:set var="uploadedFilePath" value="${requestScope.urlId}"></c:set>
                        <c:if test="${not empty film}">
                            <c:set var="actionValue" value="adminUpdateFilm"></c:set>
                        </c:if>
                        <c:if test="${empty film}">
                            <c:set var="actionValue" value="adminAddFilm"></c:set>
                        </c:if>
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
                                            <input type="submit" value="Upload"/>
                                            <input type="hidden" name="check" value="2"/>
                                        </form>
                                    </c:if>                                   
                                </div>
                                <form action="${actionValue}" method="post">
                                    <div class="col-md-4 register">
                                        <p>URL Ảnh Film </p>
                                        <c:if test="${not empty film}">
                                            <c:if test="${not empty uploadedFilePath}">                                  
                                                <input type="text" name="urlFilm" placeholder="Nhập Url Ảnh Của Phim" value="nameFile/${uploadedFilePath}" required>                  
                                            </c:if>
                                            <c:if test="${empty uploadedFilePath}">
                                                <input type="text" name="urlFilm" placeholder="Nhập Url Ảnh Của Phim" value="${film.url}" required>
                                            </c:if>  
                                        </c:if>
                                        <c:if test="${empty film}">
                                            <c:if test="${not empty uploadedFilePath}">                                  
                                                <input type="text" name="urlFilm" placeholder="Nhập Url Ảnh Của Phim" value="nameFile/${uploadedFilePath}" required>                  
                                            </c:if>
                                            <c:if test="${empty uploadedFilePath}">
                                                <input type="text" name="urlFilm" placeholder="Nhập Url Ảnh Của Phim" value="" required>
                                            </c:if>  
                                        </c:if>

                                    </div>
                            </div> 
                            <div class ="row">
                                <c:if test="${not empty film}">
                                    <div class="col-md-4 register">
                                        <p>Name Film</p>
                                        <input type="text" name="name"  placeholder="Nhập Tên Film Ở Đây" value="${film.name}" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Type Film</p>
                                        <input type="text" name="type" placeholder="Nhập Thể Loại Ở Đây" value="${film.type}" required>
                                    </div>
                                </c:if>
                                <c:if test="${empty film}">
                                    <div class="col-md-4 register">
                                        <p>Name Film</p>
                                        <input type="text" name="name"  placeholder="Nhập Tên Film Ở Đây" value="" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Type Film</p>
                                        <input type="text" name="type" placeholder="Nhập Thể Loại Ở Đây" value="" required>
                                    </div>
                                </c:if>

                            </div>

                            <div class ="row">
                                <c:if test="${not empty film}">
                                    <div class="col-md-4 register">
                                        <p>Duration Film</p>
                                        <input type="number" name="duration"  placeholder="Nhập Thời Lượng Ở Đây" value="${film.duration}" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>StartDate Film</p>
                                        <input type="text" name="startDate" placeholder="Nhập Ngày Khởi Chiếu Ở Đây" value="${film.startDate}" required>
                                    </div>
                                </c:if>
                                <c:if test="${empty film}">
                                    <div class="col-md-4 register">
                                        <p>Duration Film</p>
                                        <input type="number" name="duration"  placeholder="Nhập Thời Lượng Ở Đây" value="" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>StartDate Film</p>
                                        <input type="date" name="startDate" placeholder="Nhập Ngày Khởi Chiếu Ở Đây" value="" required>
                                    </div>
                                </c:if>

                            </div>  

                            <div class ="row">
                                <c:if test="${not empty film}">
                                    <div class="col-md-4 register">
                                        <p>Actor Film</p>
                                        <input type="text" name="actor"  placeholder="Nhập Tên Diễn Viên Ở Đây" value="${film.actor}" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Rate Film</p>
                                        <input type="text" name="rate" placeholder="Nhập Độ Tuổi Ở Đây" value="${film.rate}" required>
                                    </div>
                                </c:if>
                                <c:if test="${empty film}">
                                    <div class="col-md-4 register">
                                        <p>Actor Film</p>
                                        <input type="text" name="actor"  placeholder="Nhập Tên Diễn Viên Ở Đây" value="" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Rate Film</p>
                                        <input type="text" name="rate" placeholder="Nhập Độ Tuổi Ở Đây" value="" required>
                                    </div>
                                </c:if>

                            </div>  

                            <div class ="row">
                                <c:if test="${not empty film}">
                                    <div class="col-md-4 register">
                                        <p>Director Film</p>
                                        <input type="text" name="director"  placeholder="Nhập Đạo Diễn Ở Đây" value="${film.director}" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Language Film</p>
                                        <input type="text" name="language" placeholder="Nhập Ngôn Ngữ Ở Đây" value="${film.language}" required>
                                    </div>
                                </c:if>
                                <c:if test="${empty film}">
                                    <div class="col-md-4 register">
                                        <p>Director Film</p>
                                        <input type="text" name="direction"  placeholder="Nhập Đạo Diễn Ở Đây" value="" required>
                                    </div>
                                    <div class="col-md-4 register">
                                        <p>Language Film</p>
                                        <input type="text" name="language" placeholder="Nhập Ngôn Ngữ Ở Đây" value="" required>
                                    </div>
                                </c:if>

                            </div>  

                            <div class="row">

                                <div class="col-md-5">
                                    <div class="address_register">
                                        <p>Detail Film</p>
                                        <textarea id="address" name="detail" rows="6" cols="60" placeholder="Nhập Chi Tiết Phim Ở Đây" style="resize: none;border: solid 1px grey;">${param.address}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-4 register">
                                    <p style="margin-left: 20px">Url Trailer Film</p>
                                    <c:if test="${not empty film}">
                                        <input type="text" name="urlTrailer" style="margin-left: 20px"placeholder="Nhập Url Trailer Phim Ở Đây" value="${film.url}" required>
                                    </c:if>
                                    <c:if test="${empty film}">
                                        <input type="text" name="urlTrailer" style="margin-left: 20px"placeholder="Nhập Url Trailer Phim Ở Đây" value="" required>
                                    </c:if>

                                </div>
                            </div>   

                            <c:if test="${not empty film}">
                                <div id="submit_register">
                                    <input type="hidden" name="filmId" value="${film.id}">
                                    <input type="submit" value="CẬP NHẬT THÔNG TIN">
                                </div> 
                            </c:if>
                            <c:if test="${empty film}">
                                <div id="submit_register">

                                    <input type="submit" value="THÊM FILM">
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
