<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/UuDai.css">
    </head>
    <body>
        <div class="Uudai" style="margin-top: 35%;">
            <div class="film-content row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="img-container">
                                <h3 class="title-content">Khuyến mãi hấp dẫn</h3>
                                <div class="detail-content">
                                    <p>Khám phá ngay hàng trăm lợi ích dành cho bạn trong chuyên mục Khuyến mãi & Ưu đãi hấp dẫn của Metiz Cinema.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <c:if test="${requestScope.list == null}">
                            <%
                                request.getRequestDispatcher("UuDaiFilm").forward(request, response);
                            %>
                        </c:if> 
                        <c:set var="i" value="0" />
                        <c:forEach items="${requestScope.list}" var="c">
                            <c:set var="i" value="${i+1}" />
                            <c:if test="${i <= 2}">
                                <div class="col-md-6">
                                    <div class="img-container">
                                        <img src="${c.url}" alt="Phim${i}" class="img-fluid" />
                                        <div class="info">
                                            <h3><a href="film?id=${c.id}" class="film-item">Chi tiết</a></h3>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row mt-3">
                        <c:set var="i" value="0" />
                        <c:forEach items="${requestScope.list}" var="c">
                            <c:set var="i" value="${i+1}" />
                            <c:if test="${i > 2 && i <= 6}">
                                <div class="col-md-6">
                                    <div class="img-container">
                                        <img src="${c.url}" alt="Phim${i}" class="img-fluid" />
                                        <div class="info">
                                            <h3><a href="film?id=${c.id}" class="film-item">Chi tiết</a></h3>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
