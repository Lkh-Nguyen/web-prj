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
        <link rel="stylesheet" href="css/history_online.css">
        <link rel="stylesheet" href="css/newcss.css">
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

                        <tr class="list0">
                            <td class="listName0"><a href="#">LỊCH SỬ GIAO DỊCH ONLINE</a></td>
                            <td class="listIcon0"><a href="#"><i class='bx bx-history' ></i></a></td>
                        </tr>
                        <tr class="list1">
                            <td class="listName1"><a href="adminFunction">CHỨC NĂNG ADMIN </a></td>
                            <td class="listIcon1"><a href="adminFunction"><i class='bx bx-data'></i></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="inforAccount_right">
                <div class="right_header">
                    <h1>LỊCH SỬ GIAO DỊCH ONLINE</h1>
                </div>
                <div class="container">
                    <div class="header-content">
                    </div>
                    <div class="content">
                        <!--Xác nhận đặt vé thành công-->
                        <div class="left-content">
                            <h2>FIVESTAR CINEMAS</h2>
                            <h4>FIVESTAR ĐÀ NẴNG</h4>
                            <p>Trung tâm giải trí FiveStar: Đường Bạch Đằng, Phường Phước Hòa, TP Đà Nẵng 0934 726 073</p>
                            <h4 style="color: red;font-weight: bold;padding-bottom: 5px;">XÁC NHẬN ĐẶT VÉ THÀNH CÔNG</h4>
                            <h4 style="padding-bottom: 10px;">MÃ ĐẶT VÉ: 126469103</h4> <!--Lấy từ SQL-->
                            <p>Phim: MAI</p>
                            <p id="currentDate">Suất chiếu: </p> <!--Gồm ngày và giờ-->
                            <p>Rạp: FIVESTAR ĐÀ NẴNG</p>
                            <p>Phòng: 03</p>
                            <p>Số ghế: D07, D08, D09</p>
                        </div>
                        <!--Thông tin phim-->
                        <div class="right-content">
                            <img style="margin-left: 24%; width: 75%;" src="./images/qr.png" />
                        </div>
                    </div>
                    <div class="bottom-content">
                        <!--Table-->
                        <div class="contain-table">
                            <table id="product-table-id" class="product-table">
                                <tr>
                                    <th>STT</th>
                                    <th>MẶT HÀNG</th>
                                    <th>ĐVT</th>
                                    <th>SỐ LƯỢNG</th>
                                    <th>ĐƠN GIÁ</th>
                                    <th>THÀNH TIỀN (VND)</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>65000</td>
                                    <td>Vé</td>
                                    <td>1</td>
                                    <td>65000</td>
                                    <td>65000</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>COMBO 1 BẮP LỚN + 1 NƯỚC 240z (PHOMAI)</td>
                                    <td>Combo</td>
                                    <td>1</td>
                                    <td>89000</td>
                                    <td>89000</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>COMBO 1 BẮP LỚN + 1 NƯỚC 240z (PHOMAI)</td>
                                    <td>Combo</td>
                                    <td>1</td>
                                    <td>89000</td>
                                    <td>89000</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>COMBO 1 BẮP LỚN + 1 NƯỚC 240z (PHOMAI)</td>
                                    <td>Combo</td>
                                    <td>1</td>
                                    <td>89000</td>
                                    <td>89000</td>
                                </tr>
                                <tr>
                                    <td>25</td>
                                    <td>COMBO 1 BẮP LỚN + 1 NƯỚC 240z (PHOMAI)</td>
                                    <td>Combo</td>
                                    <td>1</td>
                                    <td>89000</td>
                                    <td>89000</td>
                                </tr>
                                <tr>
                                    <td>25</td>
                                    <td>COMBO 1 BẮP LỚN + 1 NƯỚC 240z (PHOMAI)</td>
                                    <td>Combo</td>
                                    <td>1</td>
                                    <td>89000</td>
                                    <td>89000</td>
                                </tr>
                                <tfoot>
                                <td colspan="5">TỔNG TIỀN (VND) : </td>
                                <td id="total-cell" colspan="1"></td>
                                </tfoot>
                            </table>
                            <p style="padding-top: 15px;">Cảm ơn Quý khách đã xem phim tại FIVESTAR Cinemas. Chúc Quý khách một buổi
                                xem phim vui vẻ.</p>
                            <p style="color: red; padding-top: 15px;">Rạp không giải quyết các vấn đề xem phim không đúng độ tuổi
                            </p>
                        </div>
                    </div>
                    <!--Thông tin các mặt hàng-->
                    <div class="footer-content">
                        <!--Số điện thoại-->
                        <!--Link web phim-->
                    </div>
                </div>
            </div>
        </div>
        <script>

            //Tính tiền 
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy tất cả các ô trong cột "THÀNH TIỀN" trong bảng
                const totalPriceCells = document.querySelectorAll('#product-table-id tr td:nth-child(6)');
                let total = 0;
                // Lặp qua từng ô "THÀNH TIỀN", chuyển về kiểu dữ liệu INT
                totalPriceCells.forEach(cell => {
                    const price = parseInt(cell.innerText.replace(/\D/g, ''));
                    total += price;
                });

                // Hiển thị tổng tiền trong ô "TỔNG TIỀN" của tfoot
                const totalCell = document.querySelector('#total-cell');
                totalCell.innerText = total.toLocaleString('vi-VN') + ' đ';
            });
        </script>
        <!-- history_online -->
    </body>
</html>
