<%-- 
    Document   : ruleAccount
    Created on : Mar 9, 2024, 10:05:50 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.0/css/boxicons.min.css">
        <link rel="stylesheet" href="./css/ruleAccount.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>Document</title>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="row_container">
            <div class="table_container">
                <div class="blank_div"></div>
                <a href="#" class="cell" onclick="showText('gioithieu')">
                    <i class="bx bx-info-circle"></i> GIỚI THIỆU
                </a>
                <div class="blank_div"></div>
                <a href="#" class="cell" onclick="showText('dieukhoanchung')">
                    <i class="bx bx-help-circle"></i> ĐIỀU KHOẢN CHUNG
                </a>
                <div class="blank_div"></div>
                <a href="#" class="cell" onclick="showText('dieukhoangiaodich')">
                    <i class="bx bx-dollar-circle"></i> ĐIỀU KHOẢN GIAO DỊCH
                </a>
                <div class="blank_div"></div>
                <a href="#" class="cell" onclick="showText('thanhtoan')">
                    <i class="bx bx-credit-card"></i> CHÍNH SÁCH THANH TOÁN
                </a>
                <div class="blank_div"></div>
                <a href="#" class="cell" onclick="showText('baomat')">
                    <i class="bx bx-shield"></i> CHÍNH SÁCH BẢO MẬT
                </a>
                <div class="blank_div"></div>
                <a href="#" class="cell" onclick="showText('cauhoi')">
                    <i class="bx bx-question-circle"></i> CÂU HỎI THƯỜNG GẶP
                </a>
                <div class="blank_div"></div>
                <a href="#" class="cell" onclick="showText('tuyendung')">
                    <i class="bx bx-user-plus"></i> TUYỂN DỤNG
                </a>
            </div>
            <div class="text_container">
                <div id="gioithieuText"  style="display: block">
                    <h1 style="color:red">GIỚI THIỆU</h1>
                    <h3 class="poem-gioithieu">"Fivestar Cinema, cụm rạp 5 phòng chiếu lần đầu tiên xuất hiện"</h3>
<h3 class="poem-gioithieu">tại Đà Nẵng, đem đến cho bạn những trải nghiệm điện ảnh</h3>
                    <h3 class="poem-gioithieu">tươi mới tuyệt hảo với mức giá ưu đãi nhất."</h3>
                    <h4 class="content-text">Chào mừng bạn đến với Fivestar Cinema!</h6>
                        <h4 class="content-text">Chúng tôi muốn kể cho bạn câu chuyện về mình là ai, giá trị nào là cốt lõi
                            và cách chúng tôi đem đến cho khách hàng những cảm xúc trọn vẹn nhất. </h4>
                        <h4 class="content-text">Lần đầu tiên xuất hiện tại Đà Nẵng, Fivestar Cinema đem đến 5 phòng chiếu
                            phim
                            được trang bị những công nghệ hiện đại nhất. Thưởng thức phim tại Fivestar Cinema là bạn được
                            sống
                            trong không gian hình ảnh chân thực với thiết kế màn hình uốn cong cực đại, phản chiếu tốt từ
                            mọi hướng nhìn. Âm thanh cực đã đến từ công nghệ Dolby danh tiếng cho trải nghiệm thính giác vô
                            cùng sống động. Phòng chiếu sang trọng với công nghệ ghế da cao cấp cùng các tiện nghi được đáp
                            ứng phù hợp nhất. </h4>
                        <h4 class="content-text">Fivestar Cinema, được thiết kế với phong cách chủ đạo mang hơi thở của
                            những
                            thập kỷ trước đem đến cảm giác mới lạ nhưng lại vô cùng thân thuộc. Và tất nhiên rồi, bạn sẽ
                            luôn có những bức ảnh tuyệt vời trong không gian đậm chất vintage tại đây. Thông qua hệ thống
                            website, bạn có thể cập nhật thông tin của những bộ phim mới nhất, đầy đủ và chi tiết cho từng
                            suất chiếu và nhanh chóng đặt vé trực tuyến để xem những suất chiếu đầu tiên của các siêu phẩm
                            điện ảnh.</h4>
                        <h4 class="content-text">Fivestar Cinema trân trọng giá trị của sự kết nối và đề cao trải nghiệm của
                            khách hàng. Chúng tôi được truyền cảm hứng và sẽ lan tỏa cảm hứng đó đến khán giả của mình thông
                            qua những thước phim tuyệt phẩm và chất lượng phục vụ chu đáo. </h4>
                </div>
                <div id="dieukhoanchungText" style="display: none">
                    <h1 style="color:red">ĐIỀU KHOẢN CHUNG</h1>
                    <h4 class="content-text">Chào mừng bạn đến với Website chính thức của Fivestar Cinema www.Fivestar.vn.
                        Việc sử
dụng website này đồng nghĩa với việc bạn đồng ý theo những thỏa thuận dưới đây. Nếu bạn không đồng
                        ý, xin vui lòng ngưng sử dụng website.</h4>
                    <h2 class="title-gioithieu">1. Rủi ro cá nhân khi truy cập </h2>
                    <h4 class="content-text">Khi truy cập trang web này, bạn đồng ý chấp nhận mọi rủi ro. Fivestar Cinema
                        cũng
                        như các bên đối tác xây dựng trang web sẽ không chịu trách nhiệm về bất kỳ tổn thất nào do hậu quả
                        trực tiếp, hay gián tiếp; những thất thoát, chi phí (bao gồm chi phí pháp lý, chi phí tư vấn hoặc
                        các khoản chi tiêu khác) có thể phát sinh trực tiếp hay gián tiếp do truy cập trang web hoặc tải dữ
                        liệu về máy; những tổn hại gặp phải do virus, hành động phá hoại trực tiếp hay gián tiếp của hệ
                        thống máy tính khác, đường dây điện thoại, phần cứng, phần mềm, các lỗi kỹ thuật khác gây cản trở
                        việc truyền tải qua máy vi tính hoặc kết nối mạng.</h4>
                    <h2 class="title-gioithieu">2. Sử dụng thông tin</h2>
                    <h4 class="content-text">Mọi thông tin, dữ liệu cá nhân bạn chuyển đến trang web này dưới bất kỳ lí do,
                        hình thức nào đều trở thành tài sản của Fivestar Cinema và sẽ được bảo mật. Thông tin của bạn sẽ chỉ
                        được sử dụng với mục đích liên lạc hoặc cập nhật lịch chiếu, khuyến mại của Fivestar Cinema qua
                        email
                        hoặc bưu điện.</h4>

                    <h2 class="title-gioithieu">3. Quyền sử dụng của thành viên</h2>
                    <h4 class="content-text">Thành viên tham gia website Fivestar Cinema không được đăng tải những nội dung
                        hình ảnh, từ ngữ mang tính khiêu dâm, đồi trụy, tục tĩu; phỉ báng hoặc hăm dọa người khác; vi phạm
                        luật pháp hoặc dẫn tới trách nhiệm pháp lý. Fivestar Cinema sẽ không chịu trách nhiệm hay có nghĩa
                        vụ
                        đối với các nội dung này và sẽ phối hợp với cơ quan pháp luật nếu được yêu cầu. </h4>

                    <h2 class="title-gioithieu">4. Nội dung </h2>
                    <h4 class="content-text">Fivestar Cinema là một website được cung cấp vì lợi ích của khách hàng và mang
                        tính phi thương mại. Tất cả những thông tin được đăng tải đều phản ánh trung thực tính chất sự việc,
tuy nhiên Fivestar Cinema và các bên liên quan không đảm bảo tính chính xác, độ tin cậy cũng như
                        việc
                        sử dụng kết quả của sự việc trên trang web. Fivestar Cinema luôn cố gắng cập nhật thường xuyên nội
                        dung
                        trang website cũng như luôn có thể thay đổi bất kì lúc nào để phù hợp.</h4>

                    <h2 class="title-gioithieu">5. Bản quyền và sửa đổi</h2>
                    <h4 class="content-text">Fivestar Cinema nắm giữ bản quyền của trang web này. Việc chỉnh sửa, sắp xếp,
                        loại bỏ thông tin trang thuộc về thẩm quyền của Fivestar. Mọi chỉnh sửa, thay đổi, phân phối hoặc
                        tái
                        sử dụng những nội dung trong trang này vì bất kì mục đích nào khác được xem như vi phạm quyền lợi
                        hợp pháp của Fivestar. </h4>
                    <h2 class="title-gioithieu">6. Liên kết ngoài </h2>
                    <h4 class="content-text">Trang web này có thể được liên kết với những trang khác, Fivestar Cinema không
                        trực tiếp hoặc gián tiếp tán thành, tổ chức, tài trợ, đứng sau hoặc sát nhập với những trang đó, trừ
                        khi điều này được nêu ra rõ ràng. Khi truy cập vào trang web, bạn phải hiểu và chấp nhận rằng
                        Fivestar
                        Cinema không thể kiểm soát và chịu trách nhiệm nội dung của tất cả những trang liên kết với website
                        này. </h4>

                    <h2 class="title-gioithieu">7. Luật áp dụng</h2>
                    <h4 class="content-text">
                        Mọi hoạt động phát sinh từ trang web có thể sẽ được phân tích và đánh giá theo luật pháp Việt Nam
                        và toà án Thành phố Đà Nẵng. Vì vậy bạn phải đồng ý tuân theo các điều khoản riêng của các toà
                        án này.
                    </h4>
                </div>
                <div id="dieukhoangiaodichText" style="display: none">
                    <h1 style=" color:red">ĐIỀU KHOẢN GIAO DỊCH</h1>
                    <h2 class="title-gioithieu">1. Phạm vi áp dụng</h2>
                    <h4 class="content-text">Những quy định dưới đây áp dụng riêng cho chức năng Đặt vé trực tuyến tại
                        Website Fivestar Cinema. Sử dụng chức năng này đồng nghĩa với việc quý khách chấp nhận các điều
                        khoản về đặt chỗ mua vé cũng như các chỉ dẫn, điều khoản, điều kiện đã đăng tải trên Website.
Nếu Quý khách không đồng ý với bất kì điều khoản nào, xin vui lòng dừng sử dụng chức năng này.
                    </h4>

                    <h2 class="title-gioithieu">2. Điều kiện sử dụng </h2>
                    <h4 class="content-text">Để sử dụng chức năng Đặt vé trực tuyến, Quý khách phải đăng kí tài khoản
                        với những thông tin xác thực về bản thân và cập nhật khi có thay đổi. Các tài khoản đã đăng kí
                        sẽ được công nhận là thành viên của Fivestar Cinema và sở hữu bao gồm: tài khoản cá nhân, mật khẩu,
                        các hoạt động giao dịch trên Website Fivestar Cinema. Khi tài khoản có dấu hiệu bị truy cập trái
                        phép, vui lòng thông báo ngay cho chúng tôi để được hướng dẫn xử lý kịp thời. Chúng tôi không
                        chịu trách nhiệm với những thiệt hại, mất mát về tài khoản do quý khách không tuân thủ quy định
                        hoặc thông báo chậm trễ. </h4>

                    <h2 class="title-gioithieu">3. Quy định về đặt vé trực tuyến</h2>
                    <h4 class="content-text">- Tính năng đặt vé trực tuyến trên chỉ dành cho thành viên Fivestar Cinema.
                    </h4>
                    <h4 class="content-text">- Tất cả các phim tại Fivestar Cinema đều được mở bán vé trực tuyến trước ngày
                        công chiếu chính thức. Nếu bạn muốn mua vé suất chiếu chưa được hiển thị trên website, vui lòng
                        liên hệ Hotline 0236 3630 689 để được tư vấn. </h4>
                    <h4 class="content-text">- Thời gian đóng chức năng đặt vé trực tuyến là 15 phút trước giờ chiếu
                        phim. Ngoài thời gian này, quý khách vui lòng liên hệ trực tiếp tại rạp để mua vé. </h4>
                    <h4 class="content-text">- Thời gian một phiên đặt vé kể từ lúc quý khách bắt đầu chọn ghế là 5
                        phút. Sau thời gian này, số hế đã chọn của quý khách sẽ bị hủy. Quý khách có thể đặt tối đa 8
                        chỗ trong mỗi lần giao dịch. </h4>
                    <h4 class="content-text">- Trước khi tiến thành các bước thanh toán, Quý khách vui lòng kiểm tra kỹ
                        các thông tin về rạp chiếu, tên phim, số ghế, giờ chiếu và số tiền. Sau khi xác nhận thông tin
                        đặt vé, quý khách bấm vào ô “Thanh toán” để thực hiện giao dịch. Mã xác nhận đặt vé của Quý
                        khách sẽ được gửi về số điện thoại và Email (theo đăng kí thông tin thành viên). </h4>
<h4 class="content-text">- Nếu Quý khách không nhận được tin nhắn xác nhận đặt vé và mã giao dịch,
                        vui lòng kiểm tra thông tin số điện thoại cung cấp (trong thông tin đăng kí thành viên) trước
                        khi liên lạc với Fivestar Cinema. Email xác nhận thông tin đặt vé của Quý khách có thể bị chuyển
                        vào Hộp thư rác (Spam), quý khách vui lòng kiểm tra trong trường hợp không nhận được email xác
                        nhận đặt vé. </h4>
                    <h4 class="content-text">- Quý khách không thể thay đổi số ghế, suất chiếu khi đã xác nhận đặt vé và
                        thanh toán giao dịch. Tuy nhiên, trong những trường hợp bất khả kháng xảy ra liên quan đến thay
                        đổi chương trình; trục trặc kỹ thuật, phần mềm; sự cố về phần cứng, cơ sở vật chất, Fivestar Cinema
                        có quyền hoàn trả lại vé (trong trường hợp hủy suất chiếu) hoặc thực hiện đổi, chuyển vé của bạn
                        qua suất chiếu khác theo yêu cầu của khách hàng.</h4>

                    <h2 class="title-gioithieu">4. Giá vé</h2>
                    <h4 class="content-text">
                        - Giá vé được niêm yết tại Fivestar Cinema là giá vé cuối cùng đã bao gồm thuế Giá trị gia tăng
                        (VAT).
                        Giá vé có thể thay đổi tùy vào thời điểm, phim và chương trình khuyến mãi kèm theo. Giá vé sẽ hiển
                        thị trong trình đặt vé Trực tuyến khi quý khách tiến hành xác nhận thông tin đặt vé.
                    </h4>
                    <h4 class="content-text">
                        - Giá vé khi đặt trực tuyến là giá vé người lớn. Các loại vé khác như vé Trẻ em, Người cao tuổi, Học
                        sinh – Sinh viên, vui lòng giao dịch trực tiếp tại rạp.
                    </h4>
                    <h2 class="title-gioithieu">5. Giá trị giao dịch và hình thức thanh toán</h2>
                    <h4 class="content-text">
                        - Fivestar Cinema cung cấp các hình thức thanh toán: Thẻ thanh toán nội địa (ATM) và Thẻ thanh toán
                        quốc tế (VISA), thẻ quà tặng hoặc điểm thưởng.
                    </h4>
                    <h4 class="content-text">- Để đảm bảo an toàn khi thanh toán, Quý khách lưu ý: </h4>
                    <h4 class="content-text" style="padding-left: 3px;"> + Đối với đặt vé trực tuyến, chỉ thực hiện thanh
                        toán tại cửa sổ liên kết từ Fivestar Cinema chuyển đến </h4>
                    <h4 class="content-text" style="padding-left: 3px;">
+ Khi phát hiện các giao dịch trái phép trên thẻ thành viên của mình, Quý khách vui lòng liên hệ cho
                        bộ phận Chăm sóc khách hàng để được xử lý kịp thời.
                    </h4>
                    <h4 class="content-text" style="padding-left: 3px;">
                        + Kiểm tra tài khoản ngân hàng thường xuyên để kiểm soát mọi giao dịch từ thẻ của mình.
                    </h4>
                    <h2 class="title-gioithieu">6. Giao dịch</h2>
                    <h4 class="content-text">
                        Khách hàng khi thực hiện giao dịch trực tuyến phải đăng nhập bằng tài khoản thành viên và thực hiện
                        theo trình tự sau:
                    </h4>
                    <h4 class="content-text">
                        - Bước 1: Lựa chọn suất chiếu theo phim hoặc theo rạp
                    </h4>
                    <h4 class="content-text">
                        - Bước 2: Lựa chọn ghế ngồi
                    </h4>
                    <h4 class="content-text">
                        - Bước 3: Thanh toán bằng các hình thức thanh toán được Fivestar hỗ trợ như Thẻ ATM, thẻ VISA, điểm
                        thưởng, thẻ quà tặng.
                    </h4>
                    <h4 class="content-text">
                        - Bước 4: Nhận mã đặt chỗ qua tin nhắn SMS và Email
                    </h4>
                    <h4 class="content-text">
                        - Bước 5: Nhận vé đã đặt tại rạp xem phim. Quý khách vui lòng xuất trình tin nhắn tại quầy Ticket
                        Box để nhận vé.
                    </h4>
                    <h2 class="title-gioithieu">7. Thay đổi, hủy bỏ giao dịch đặt vé</h2>
                    <h4 class="content-text">
                        - Vé đã thanh toán thành công qua trình đặt vé trực tuyến không thể hủy, thay đổi thông tin hoặc
                        hoàn trả.
                    </h4>
                    <h4 class="content-text">
                        - Hệ thống đặt vé trực tuyến của Fivestar Cinema liên kết với nhiều đối tác gồm: Cổng thanh toán
                        VNPAY
                        và các ngân hàng nội địa, các tổ chức tín dụng quốc tế. Tình trạng thanh toán của Quý khách phụ
                        thuộc vào kết nối mạng, truyền dẫn, nhận và trả tín hiệu của các đối tác liên kết. Fivestar Cinema
                        chỉ
                        thực hiện hoàn tiền trong trường hợp tài khoản ngân hàng của bạn đã bị trừ tiền nhưng không được xác
nhận đặt vé thành công (cũng như không nhận được tin nhắn, email thông báo). Trong trường hợp đó,
                        Quý khách vui lòng liên hệ ngay với bộ phận Chăm sóc khách hàng của Fivestar Cinema để được hỗ trợ
                        xử
                        lý.
                    </h4>
                    <h4 class="content-text">
                        - Sau khi đã xác nhận các thông tin của khách hàng cung cấp về giao dịch không thành công, tùy vào
                        từng loại tài khoản khách hàng sử dụng mà việc hoàn tiền sẽ có thời gian khác nhau (không tính Thứ
                        Bảy, Chủ Nhật và các ngày lễ).
                    </h4>
                    <h2 class="title-gioithieu">8. Quy định về bảo mật</h2>
                    <h4 class="content-text">
                        - Fivestar Cinema trong giao dịch luôn tôn trọng khách hàng cũng như các thông tin mang tính cá nhân
                        của khách hàng, vì vậy mọi thông tin tài khoản của khách hàng đều được bảo mật an toàn.
                    </h4>
                    <h4 class="content-text">
                        - Bên cạnh đó, bằng việc sử dụng dịch vụ đặt vé và các tài nguyên khác của website Fivestar Cinema,
                        Quý
                        khách có nghĩa vụ đảm bảo tính bảo mật, bản quyền của đơn vị. Quý khách không được dùng bất cứ
                        chương trình, công cụ hay hình thức nào khác để can thiệp làm thay đổi cấu trúc dữ liệu. Fivestar
                        Cinema nghiêm cấm các hành vi can thiệp, phá hoại, xâm nhập, sao chép trái phép dữ liệu của hệ thống
                        cũng như phát tán, cổ vũ các cá nhân, tổ chức thực hiện các hành vi tương tự. Tùy vào mức độ nghiêm
                        trọng của sự việc, Fivestar Cinema sẽ tước bỏ các quyền lợi và thực hiện truy tố trước pháp luật.
                    </h4>
                    <h2 class="title-gioithieu">9. Quy định về xác thực thông tin</h2>
                    <h4 class="content-text">
                        Khách hàng có trách nhiệm cung cấp thông tin đầy đủ và chính xác khi tham gia giao dịch tại Fivestar
                        Cinema. Trong trường hợp khách hàng nhập sai thông tin tại trang thông tin trong tài khoản cá nhân,
                        Fivestar Cinema có quyền từ chối thực hiện giao dịch. Ngoài ra, trong mọi trường hợp, khách hàng đều
                        có
                        quyền đơn phương chấm dứt giao dịch.
                    </h4>
                    <h2 class="title-gioithieu">10. Quy định về chấm dứt thỏa thuận</h2>
<h4 class="content-text">
                        - Trong trường hợp có bất kỳ thiệt hại nào phát sinh do việc vi phạm Quy Định sử dụng trang web,
                        chúng tôi có quyền đình chỉ hoặc khóa tài khoản của quý khách vĩnh viễn. Nếu quý khách không hài
                        lòng với trang web hoặc bất kỳ điều khoản, điều kiện, quy tắc, chính sách, hướng dẫn, hoặc cách thức
                        vận hành của Fivestar Cinema, vui lòng ngưng sử dụng website này.
                    </h4>
                    <h4 class="content-text">
                        Xin quý khách lưu ý chỉ mua hàng khi chấp nhận và hiểu rõ những quy định trên. Nếu cần hỗ trợ thêm
                        thông tin, quý khách vui lòng liên hệ bộ phận Chăm sóc khách hàng của Fivestar Cinema.
                    </h4>
                </div>
                <div id="thanhtoanText" style="display: none">
                    <h1 style=" color:red">CHÍNH SÁCH THANH TOÁN</h1>
                    <h2 class="title-gioithieu">1.Quy định về giao dịch</h2>
                    <h4 class="content-text">
                        Đối với giao dịch đặt vé trực tuyến trên website, Fivestar Cinema hỗ trợ các hình thức thanh toán
                        sau:
                    </h4>
                    <h4 class="content-text">
                        - Điểm thưởng thẻ thành viên, thẻ quà tặng Fivestar Cinema
                    </h4>
                    <h4 class="content-text">
                        - Thẻ ATM
                    </h4>
                    <h4 class="content-text">
                        - Thẻ tín dụng VISA/ Mastercard
                    </h4>
                    <h2 class="title-gioithieu">2. Chi tiết các hình thức thanh toán</h2>
                    <h4 class="content-text">
                        - Thẻ ATM (Thẻ ghi nợ/ thanh toán / trả trước nội địa): Để thanh toán bằng thẻ ngân hàng nội địa,
                        thẻ của khách hàng phải được đăng ký sử dụng tính năng thanh toán trực tuyến, hoặc ngân hàng điện tử
                        của Ngân hàng. Giao dịch phải được ghi nhận thành công từ thông báo cấp phép thành công do hệ thống
                        cổng thanh toán trả về (đảm bảo số dư/hạn mức và xác thực khách hàng theo quy định sử dụng của thẻ)
                    </h4>
                    <h4 class="content-text">
                        - Thẻ tín dụng, thẻ thanh toán quốc tế, thẻ trả trước quốc tế: Thẻ tín dụng/ghi nợ/trả trước VISA,
                        MasterCard, JCB của các Ngân hàng trong nước và nước ngoài phát hành. Giao dịch phải được ghi nhận
cấp phép thành công do đúng hệ thống cổng thanh toán trả về (đảm bảo số dư/ hạn mức và xác thực
                        khách hàng theo quy định sử dụng của thẻ).
                    </h4>
                    <h2 class="title-gioithieu">3. Danh sách thẻ được chấp nhận thanh toán trực tuyến</h2>
                    <h4 class="content-text">
                        (Cập nhật theo thông báo của nhà cung cấp dịch vụ)
                    </h4>
                    <h4 class="content-text">
                        Thẻ quốc tế: VISA, MasterCard, JCB
                    </h4>
                    <h4 class="content-text">
                        Thẻ nội địa: Ngân hàng Ngoại thương Vietcombank
                    </h4>
                    <h4 class="content-text">
                        - Ngân hàng Công thương Vietinbank
                    </h4>
                    <h4 class="content-text">
                        - Ngân hàng Đầu tư và Phát triển Việt Nam BIDV
                    </h4>
                    <h4 class="content-text">
                        - Ngân hàng Nông nghiệp và Phát triển nông thôn Agribank
                    </h4>
                    <h4 class="content-text">
                        - Ngân hàng TMCP Sài Gòn Thương Tín Sacombank
                    </h4>
                </div>
                <div id="baomatText" style="display: none">
                    <h1 style=" color:red">CHÍNH SÁCH BẢO MẬT THÔNG TIN KHÁCH HÀNG</h1>
                    <h2 class="title-gioithieu">1. Mục đích và phạm vi thu thập thông tin</h2>
                    <h4 class="content-text">
                        - Thông tin cá nhân các tài khoản thành viên của Fivestar Cinema được thực hiện trên cơ sở khách
                        hàng
                        tự nguyện cung cấp tại website Fivestar Cinema với các nội dung: Họ tên, giới tính, năm sinh, số
                        CMND,
                        địa chỉ, số điện thoại di động, email.
                    </h4>
                    <h4 class="content-text">
                        + Cung cấp sản phẩm, dịch vụ theo nhu cầu của khách hàng
                    </h4>
                    <h4 class="content-text">
                        + Liên hệ xác nhận khi khách hàng đăng ký sử dụng dịch vụ, xác lập giao dịch trên website Fivestar
                        Cinema
                    </h4>
                    <h4 class="content-text">
                        + Thực hiện việc quản lý website Fivestar: gửi thông tin cập nhật về website, các chương trình
                        khuyến
                        mại, ưu đãi/ tri ân tới khách hàng
                    </h4>
<h4 class="content-text">
                        + Bảo đảm quyền lợi của khách hàng khi phát hiện các hành động giả mạo, phá hoại tài khoản, lừa đảo
                        khách hàng
                    </h4>
                    <h4 class="content-text">
                        - Để tránh nghi ngờ, trong quá trình giao dịch thanh toán tại website Fivestar Cinema, chúng tôi chỉ
                        lưu giữ thông tin chi tiết về đơn hàng đã thanh toán của khách hàng, các thông tin về tài khoản ngân
                        hàng của khách hàng sẽ không được lưu giữ.
                    </h4>
                </div>
                <div id="cauhoiText" style="display: none">
                    <h1 style=" color:red">CÂU HỎI THƯỜNG GẶP</h1>
                    <h2 class="title-gioithieu">BẮP NƯỚC</h2>
                    <h2 class="title-gioithieu" style="font-style: italic;">Có bao nhiêu loại kích cỡ bắp và nước?</h2>
                    <h4 class="content-text">Tại Fivestar Cinema bạn có thể lựa chọn bắp và nước với các kích cỡ sau:</h4>
                    <h4 class="content-text">- 3 kích cỡ nước: vừa 16oz, lớn 22oz & siêu lớn 32oz</h4>
                    <h4 class="content-text">- 2 kích cỡ bắp: vừa 32oz và lớn 44oz</h4>
                    <h2 class="title-gioithieu" style="font-style: italic;">Có những loại combo bắp, nước nào?</h2>
                    <h4 class="content-text">Khi lựa chọn combo bắp nước tại Fivestar Cinema, bạn có thể tham khảo các đề
                        xuất sau:</h4>
                    <h4 class="content-text">- Combo 1: 1 nước lớn size L</h4>
                    <h4 class="content-text">- Combo 2: 1 bắp lớn</h4>
                    <h4 class="content-text">- Combo 1 extra: 1 bắp vừa + 1 nước lớn </h4>
                    <h4 class="content-text">- Combo 2 extra: 1 bắp lớn + 2 nước lớn </h4>
                    <h2 class="title-gioithieu">PHIM</h2>
                    <h2 class="title-gioithieu" style="font-style: italic;">Có bao nhiêu phân loại phim và ký hiệu?</h2>
                    <h4 class="content-text">Căn cứ Thông tư số 12/2015/TT-BVHTTDL của Bộ trưởng Bộ Văn hóa, Thể thao và Du
                        lịch có hiệu lực thi hành từ ngày 01/01/2017, Tiêu chí phân loại phim theo lứa tuổi được quy định
                        như sau:</h4>
                    <h4 class="content-text">P: Phim được phép phổ biến rộng rãi đến mọi đối tượng</h4>
                    <h4 class="content-text">C13: Phim cấm phổ biến đến khán giả dưới 13 tuổi</h4>
<h4 class="content-text">C16: Phim cấm phổ biến đến khán giả dưới 16 tuổi</h4>
                    <h4 class="content-text">C18: Phim cấm phổ biến đến khán giả dưới 18 tuổi</h4>
                    <h4 class="content-text">Khách hàng vui lòng chứng thực được độ tuổi phù hợp với phim được phân loại như
                        trên. Fivestar Cinema có quyền từ chối việc bán vé hoặc vào phòng chiếu nếu khách hàng không tuân
                        thủ đúng theo quy định.</h4>
                    <h2 class="title-gioithieu">QUY ĐỊNH</h2>
                    <h2 class="title-gioithieu" style="font-style: italic;">Đồ ăn, thức uống từ bên ngoài có được phép mang
                        vào Fivestar Cinema không?</h2>
                    <h4 class="content-text">Để đảm bảo vệ sinh và an toàn thực phẩm, chỉ thức ăn và đồ uống được mua tại
                        Fivestar Cinema mới được đem vào rạp chiếu phim.</h4>
                    <h4 class="content-text">Fivestar Cinema mong bạn sẽ tôn trọng quy định này cũng như các quy định chung
                        của phòng chiếu để đảm bảo trải nghiệm xem phim tốt nhất cho bạn và những khán giả xung quanh.</h4>
                    <h4 class="content-text">Movie Gift thích hợp làm quà tặng người thân, bạn bè, đối tác,...</h4>
                    <h2 class="title-gioithieu">VÉ</h2>
                    <h2 class="title-gioithieu" style="font-style: italic;">Có những phương thức mua vé gì tại Fivestar
                        Cinema?</h2>
                    <h4 class="content-text">Có 3 cách thức mua vé tại FiveStar Cinema:</h4>
                    <h4 class="content-text">- Mua vé trực tiếp tại quầy Ticket Box tại sảnh lễ tân Fivestar Cinema.</h4>
                    <h4 class="content-text">- Mua vé Online trên website <a href="full_home.jsp"><https://fivestar.vn/></a>
                        hoặc các đơn vị đối tác của fivestar.</h4>
                    <h4 class="content-text">- Mua vé Online qua App điện thoại Fivestar Cinema</h4>
                    <h4 class="content-text">- Khi mua vé với số lượng lớn, vui lòng liên hệ hotline 0236 3630 689 để được
                        tư vấn.</h4>
                </div>
                <div id="tuyendungText" style="display: none">
                    <h1 style=" color:red">KHỞI NGHIỆP CÙNG FIVESTAR</h1>
                    <h4 class="content-text">Metiz Cinema đặt nền móng ở con người, mỗi nhân viên làm việc tại đây đều sẽ
                        cảm nhận được sự gắn kết, chuyên nghiệp cũng như được đào tạo và nâng cao kỹ năng chuyên môn. Để làm
được những điều đó, Metiz Cinema mong muốn tìm người đồng hành với phẩm chất và tính cách phù hợp ở
                        những vị trí sau:</h4>
                    <h4 class="content-text">1. Part time cashier - Số lượng: 15</h4>
                    <h4 class="content-text" style="font-style: italic;">Mô tả công việc</h4>
                    <h4 class="content-text">- Trực quầy thu ngân, bán hàng tại quầy bán bắp nước, quầy vé.</h4>
                    <h4 class="content-text">- Tư vấn chọn phim và chỗ ngồi, các gói combo.</h4>
                    <h4 class="content-text">- Trông giữ quầy đồ tại Rạp.</h4>
                    <h4 class="content-text">- Soát vé, hướng dẫn chỗ ngồi, kiểm tra vệ sinh rạp.</h4>
                    <h4 class="content-text">- Xuất vé khi khách hàng đặt online trên hệ thống.</h4>
                    <h4 class="content-text">- Trả lời các câu hỏi của khách về lịch chiếu, đặt vé qua điện thoại.</h4>
                    <h4 class="content-text" style="font-style: italic;">Yêu cầu</h4>
                    <h4 class="content-text">- Là Sinh viên các trường Đại học tại Đà Nẵng. </h4>
                    <h4 class="content-text">- Nhanh nhẹn, giao tiếp tốt, ngoại hình ưa nhìn.</h4>
                    <h4 class="content-text">- Trung thực, yêu thích các công việc ngành dịch vụ.</h4>
                    <h4 class="content-text">- Sẵn sàng làm các ca linh động từ 8h00-24h00, làm việc vào các ngày cuối tuần,
                        Lễ, Tết. </h4>
                    <h4 class="content-text">- Độ tuổi từ 19 đến 22 tuổi.</h4>
                    <h4 class="content-text">Bước 1: Tìm hiểu thật kỹ về vị trí, mô tả công việc và yêu cầu</h4>
                    <h4 class="content-text">Bước 2: Nộp hồ sơ</h4>
                    <h4 class="content-text">Bước 3 : Chờ phản hồi từ Fivestar Cinema</h4>
                    <h4 class="content-text">Cảm ơn bạn đã quan tâm đến tuyển dụng của Fivestar Cinema. Chúc bạn may mắn và
                        hẹn gặp bạn tại “nhà chung” Fivestar Cinema.</h4>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script>
            function showText(id) {
                var texts = document.querySelectorAll('.text_container div');

                texts.forEach(function (text) {
                    text.style.display = 'none';
                });
                var selectedText = document.getElementById(id + 'Text');
                selectedText.style.display = 'block';
            }
        </script>
    </body>

</html>