CREATE TABLE [User] (
ID INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(255) NOT NULL,
Gender NVARCHAR(10) CHECK (Gender IN ('Male', 'Female')) NOT NULL,
DateOfBirth DATE NOT NULL,
CMND CHAR(12) CHECK (LEN(CMND) = 12),
PhoneNumber NVARCHAR(15) CHECK (LEN(PhoneNumber) = 10) NOT NULL,
Email NVARCHAR(255) UNIQUE NOT NULL,
Password NVARCHAR(255) NOT NULL,
Address NVARCHAR(255),
Role INT CHECK (Role IN (1, 2)), -- Restricting values to 1 or 2
CONSTRAINT CHK_Email CHECK (Email LIKE '%@%.%'), -- Basic email format validation
CONSTRAINT CHK_Password_Length CHECK (LEN(Password) >= 8) -- Minimum password length
);
INSERT INTO [User] (Name, Gender, DateOfBirth, CMND, PhoneNumber, Email, Password, Address, Role) 
VALUES 
('Le Kim Hoang Nguyen', 'Male', '2004-09-23', NULL, '0763905056', 'lkh@gmail.com', '01234567', NULL, 1),
('John Doe', 'Male', '1990-05-15', '123456789012', '1234567890', 'john@example.com', 'password123', '123 Main St, Cityville', 1),
('Jane Smith', 'Female', '1985-08-20', '987654321098', '0987654321', 'jane@example.com', 'securepassword', '456 Elm St, Townsville', 1),
('Alice Johnson', 'Female', '1992-10-08', '456789012345', '5551234567', 'alice@example.com', 'strongPassword123', '789 Oak St, Villagetown', 2),
('Hoàng Công Minh', 'Male', '2004-09-23', '046204001781', '0763905056', 'congminh23092004@gmail.com','23092004',NULL, 2),
('Meabu', 'Male', '2004-09-23', NULL, '0763905056', 'never1sts@gmail.com', 'bin123456', NULL, 1);
CREATE TABLE Film (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Url NVARCHAR(MAX) NOT NULL,
    Name NVARCHAR(255) NOT NULL UNIQUE,
    Type NVARCHAR(MAX) NOT NULL,
    Duration INT NOT NULL,
    StartDate DATE NOT NULL,
    Actor NVARCHAR(MAX) NOT NULL,
    Detail NVARCHAR(MAX) NOT NULL,
    Trailer NVARCHAR(MAX),
    Rate NVARCHAR(50) NOT NULL,
	director NVARCHAR(MAX) NOT NULL,
	[language] NVARCHAR(MAX) NOT NULL,
);
INSERT INTO Film
VALUES 
	('nameFilm/mai.jpg', 
	N'MAI (T18)',
	N'Tình cảm,Tâm Lý',
	130 ,
	'2024-02-10', 
	N'Phương Anh Đào, Tuấn Trần, Trấn Thành, Hồng Đào, Uyển n, Ngọc Giàu, Việt Anh, Quốc Khánh, Quỳnh Lý, Khả Như, Anh Đức, Thanh Hằng, Ngọc Nga, Lộ Lộ, Kiều Linh, Ngọc Nguyễn, Quỳnh Anh, Anh Thư.',
	N'MAI xoay quanh câu chuyện về cuộc đời của một người phụ nữ cùng tên với bộ phim. Trên First-look Poster, Phương Anh Đào tạo ấn tượng mạnh với cái nhìn tĩnh lặng, xuyên thấu, đặc biệt, trên bờ môi nữ diễn viên là hình ảnh cô đang nằm nghiêng trên mặt nước. Được phủ một màn sương mờ ảo, poster đậm chất nghệ thuật của Mai gây tò mò với lời tựa: “Quá khứ chưa ngủ yên, ngày mai liệu sẽ đến?”.',
	'https://www.youtube.com/embed/VweAKEjYw8c',
	'C18',
	N'Trấn Thành',
	N'Phụ đề Tiếng Anh'
	);
INSERT INTO Film
VALUES 
	('nameFilm/bathimbt.jpg', 
	N'BÀ THÍM BÁO THÙ (T16)',
	N'Hành động,Hài',
	112 ,
	'2024-03-01', 
	N'Ra Mi Ran, Gong Myung, Yeom Hye Ran, Ahn Eun Jin,...',
	N'Kẻ lừa tiền “quay xe”, cầu cứu sự trợ giúp từ chính nạn nhân mà mình đã lừa đảo! Đang chật vật vay mượn khắp nơi để tiếp tục duy trì cửa tiệm giặt ủi sau hoả hoạn, Duk Hee nhận được cú điện thoại từ Son, tự xưng là nhân viên ngân hàng với lời hứa hẹn sẽ cấp cho cô một khoản vay với lãi suất ưu đãi. Tuy nhiên, Son yêu cầu Duk Hee phải gửi trước cho anh ta một khoản tiền gọi là “phí vay mượn”. Sau khi chuyển tiền, người phụ nữ tội nghiệp mới bàng hoàng nhận ra mình vừa trở thành nạn nhân của một kẻ chuyên lừa đảo qua điện thoại di động. Cú lừa này đã khiến Duk Hee mất toàn bộ tài sản và đối mặt với nguy cơ bị tống ra đường cùng hai đứa con. Giận dữ, oán trách nhưng Duk Hee nghĩ rằng cô sẽ không thể tìm được danh tính của Son. Cho tới một ngày nọ, Son bỗng chủ động liên lạc với Duk Hee và đưa ra một lời cầu cứu thảm thiết…',
	'https://www.youtube.com/embed/YtVCAPv6nvk',
	'C16',
	N'Park Young Ju',
	N'Phụ đề Tiếng Anh'
	);
INSERT INTO Film
VALUES 
	('nameFilm/dune.jpg', 
	N'DUNE - HÀNH TINH CÁT - PHẦN HAI (T16)',
	N'Phiêu lưu,Hành động,Tâm Lý',
	165 ,
	'2024-03-01', 
	N'Denis Villeneuve, Jon Spaihts, Frank Herbert',
	N'“Dune: Hành Tinh Cát – Phần 2” sẽ tiếp tục khám phá hành trình đậm chất thần thoại của Paul Atreides khi anh đồng hành cùng Chani và những người Fremen trên chặng đường trả thù những kẻ đã hủy hoại gia đình mình. Đối mặt với những lựa chọn giữa tình yêu của cuộc đời mình và số phận của vũ trụ, Paul phải ngăn chặn viễn cảnh tương lai tồi tệ chỉ mình anh nhìn thấy.',
	'https://www.youtube.com/embed/0ZqTYVYcx4k',
	'C16',
	N'Denis Villeneuve',
	N'Phụ đề Tiếng Việt'
	);
INSERT INTO Film
VALUES 
	('nameFilm/cuncungdainao.jpg', 
	N'CÚN CƯNG ĐẠI NÁO NHÀ HÁT (P)',
	N'Phiêu lưu,Hài,Hoạt hình',
	75 ,
	'2024-02-16', 
	N'Anna Starshenbaum; Diomid Vinogradov; Garik Kharlamov',
	N'“Chú chó lang tham Samson vô tình lạc vào nhà hát opera Bolshoi nổi tiếng bậc nhất thủ đô Moscow hoa lệ. Vướng vào vụ trộm chiếc vương miện kim cương của nữ diễn viên Anastasia; Samson cùng nàng cún Margot xinh đẹp của Anastasia dấn thân vào cuộc phiêu lưu đại náo nhà hát, truy lùng bọn cướp và giành lại món nữ trang quý giá.',
	'https://www.youtube.com/embed/1uFF5yZKJQg',
	'P',
	N'Vasiliy Rovenskiy',
	N'Phụ đề Tiếng Việt'
	);
INSERT INTO Film
VALUES 
	('nameFilm/gaplaichibau.jpg', 
	N'GẶP LẠI CHỊ BẦU (T13)',
	N'Tình cảm,Gia đình',
	114 ,
	'2024-02-10', 
	N'Diệu Nhi, Anh Tú, Lê Giang, Quốc Khánh, Ngọc Phước',
	N'“Gặp Lại Chị Bầu” xoay quanh Phúc, một thanh viên trẻ với đam mê diễn xuất nhưng phải trải qua cuộc sống muôn vàn khó khăn. Anh tình cờ lưu lạc đến xóm trọ của bà Lê và cùng những người bạn ở đây trải qua những ngày tháng thanh xuân đáng nhớ nhất cuộc đời.',
	'https://www.youtube.com/embed/Gggw9jwr1h4',
	'C13',
	N'Đoàn Nhất Trung',
	N'Phụ đề Tiếng Việt'
	);
INSERT INTO Film
VALUES 
	('nameFilm/pororo.jpg', 
	N'PORORO HÀNH TRÌNH SIÊU SAO ÂM NHẠC (P) (LỒNG TIẾNG VIỆT)',
	N'Hoạt hình',
	80 ,
	'2024-02-23', 
	N'Jung Mi-sook, Hong So-young, Lee Sun, Imiza',
	N'“Pororo và những người bạn của anh ấy sắp sửa chiến thắng trong một cuộc thi ca hát mà họ tham gia cho vui. Liệu Pororo và những người bạn của anh ấy có thoát khỏi sự phiền nhiễu của Big Ben và cuối cùng giành chiến thắng trong cuộc thi siêu sao âm nhạc?',
	'https://www.youtube.com/embed/UGq70nzS_Lw',
	'P',
	N'Yoon Je-wan',
	N'Lồng tiếng Việt'
	);
INSERT INTO Film
VALUES 
	('nameFilm/thosantp.jpg', 
	N'THỢ SĂN THÀNH PHỐ - SIÊU CHẤT THIÊN THẦN (T18)',
	N'Hành động,Hài,Hoạt hình',
	95 ,
	'2024-03-01', 
	N'Akira Kamiya, Kazue Ikura, Harumi Ichiryūsai, Tesshō Genda, Mami Koyama, Keiko Toda',
	N'“Tay súng đánh thuê khét tiếng Ryo Saeba gặp phải một kẻ phản diện từng quen, anh phải chiến đấu với những con người đã biến cỗ máy nano thành siêu chiến binh, còn được gọi là Angel Dust.',
	'https://www.youtube.com/embed/ETg9gBshQuI',
	'C18',
	N'Kazuyoshi Takeuchi, Kenji Kodama',
	N'Phụ đề Tiếng Việt'
	);
INSERT INTO Film
VALUES 
	('nameFilm/quythaydau.jpg', 
	N'QUỶ THAY ĐẦU (T18)',
	N'Kinh dị',
	95 ,
	'2024-03-01', 
	N'Freya Allan, Ruby Barker, Jeremy Irvine, Peter Mullan, Saffron Burrows, Julika Jenkins, Ned Dennehy...',
	N'“Phim theo chân Iris (Freya Allan), một cô gái trẻ bị người cha góa vợ (Peter Mullan) đối xử ghẻ lạnh. Sau khi ông qua đời, cô trở thành người thừa kế quán rượu xuống cấp đã tồn tại hàng thế kỷ ở Berlin. Bất ngờ xem được lời trăn trối của người cha qua đoạn băng video còn sót lại, Iris phát hiện một bí mật kinh hoàng về mụ ác quỷ 400 năm tuổi bị nhốt dưới tầng hầm với tên gọi Baghead. Khuôn mặt của bà ta được che giấu bởi một chiếc bao tải cũ, và có khả năng triệu hồi người chết bằng xương bằng thịt. Nhờ đó, Iris có thể kiếm tiền trên thân xác của Baghead bằng hàng loạt giao dịch gọi hồn. Để xoa dịu nỗi đau mất người thân, nhiều khách hàng đã tìm tới Iris và chấp nhận trả giá đắt với hai nghìn đô la tiền mặt để đổi lấy 2 phút nói chuyện cùng người đã khuất. Giống như cha mình, Iris bị cám dỗ bởi đồng tiền và ra sức khai thác sức mạnh siêu nhiên của Baghead, nhưng cô sớm phát hiện ra việc vi phạm những quy tắc cấm có thể gây ra hậu quả khủng khiếp. Cùng với người bạn thân Katie (Ruby Barker thủ vai), Iris phải chiến đấu để giữ quyền kiểm soát Baghead và tìm ra cách tiêu diệt bà ta trước khi đẩy tất cả vào sự trừng phạt của quỷ.',
	'https://www.youtube.com/embed/MOQMR8mF-bw',
	'C18',
	N'Alberto Corredor',
	N'Phụ đề Tiếng Việt'
	);
INSERT INTO Film
VALUES 
	('nameFilm/senboss.jpg', 
	N'SEN BOSS SUM VẦY (P)',
	N'Hài,Tâm Lý',
	120 ,
	'2024-02-23', 
	N'Youn Yuh-jung, Yoo Hai-jin, Kim Yun-jin , Chung Sung-hwa, Kim Seo-hyung, Daniel Philip Henney, Lee Hyun-woo, Tang Joon-sang, Yoon Chae-na',
	N'“Chuyện phim mở ra một góc nhìn ấm áp, thú vị về chuỗi liên kết bất ngờ được hình thành giữa các nhân vật khác nhau thông qua tình yêu chung của họ dành cho những chú chó. Đó là sự liên kết bất chấp thế hệ, ngành nghề, tính cách: giữa một kiến trúc sư nổi tiếng toàn cầu (Youn Yuh-jung) và một người giao hàng trẻ đang chật vật kiếm sống (Tang Jun-sang); giữa một người đàn ông độc thân ghét động vật (Yoo Hai-jin) và một nữ bác sĩ thú y quên mình để cứu chữa các chú chó bị bỏ rơi (Kim Seo-hyung); giữa một cặp vợ chồng hiếm muộn (Kim Yun-jin, Jung Sung-hwa) và cô con gái nhỏ được nhận nuôi từ cô nhi viện (Yoon Chae-na); giữa một nhạc sĩ trẻ đang chăm sóc “boss” của bạn gái (Lee Hyun woo) và người yêu cũ của bạn gái đột nhiên xuất hiện với những yêu cầu kỳ quặc (Daniel Henney). Tất cả họ đều gặp nhau trong những tình huống oái ăm nhưng cũng không kém phần “cười ra nước mắt”.',
	'https://www.youtube.com/embed/Vo-I9QAsuKg',
	'P',
	N'Kim Douck-min',
	N'Phụ đề Tiếng Việt'
	);
INSERT INTO Film
VALUES 
	('nameFilm/kungfu.jpg', 
	N'KUNG FU PANDA 4 (P) (LỒNG TIẾNG)',
	N'Hài,Hoạt hình',
	95 ,
	'2024-03-08', 
	N'Jack Black, Dustin Hoffman, James Hong, Awkwafina.',
	N'“Sau khi Po được chọn trở thành Thủ lĩnh tinh thần của Thung lũng Bình Yên, Po cần tìm và huấn luyện một Chiến binh Rồng mới, trong khi đó một mụ phù thủy độc ác lên kế hoạch triệu hồi lại tất cả những kẻ phản diện mà Po đã đánh bại về cõi linh hồn.',
	'https://www.youtube.com/embed/lMdj-q-3iV8',
	'P',
	N'Mike Mitchell',
	N'Lồng Tiếng Việt'
	);
INSERT INTO Film
VALUES 
	('nameFilm/Vangod.jpg', 
	N'DANH HỌA VAN GOGH (T16)',
	N'Lãng mạn,Tiểu Sử',
	152 ,
	'2024-03-09', 
	N'Bernard Le Coq, Jacques Dutronc, Alexandra London, Corinne Bourdon, Gérard Séty.',
	N'Đến Auvers-sur-Oise vào cuối tháng 5 năm 1890 để được bác sĩ Gachet chữa trị, Van Gogh sẽ sống những ngày cuối đời giữa tình yêu và tuyệt vọng. Giai đoạn cuối cùng của cuộc đời ông là ý nghĩa nhất vì ông sẽ tạo ra hàng trăm bức tranh và bản vẽ. Làm việc trong đau khổ, luôn nhớ nhung mối tình với người phụ nữ Marguerite và cô gái điếm Cathy, nỗi hoang mang trước thất bại được chia sẻ với anh trai Théo và cô em dâu Johanna, sức nóng của mùa hè năm ngoái, tất cả đều dẫn ông đến cái chết đã được dự đoán trước này…',
	'https://www.youtube.com/embed/lMdj-q-3iV8',
	'C16',
	N'Maurice Pialat',
	N'Tiếng Pháp - Phụ đề tiếng Việt'
	);
INSERT INTO Film
VALUES 
	('nameFilm/tinhyeu.jpg', 
	N'TIẾNG YÊU KHÔNG LỜI (C16)',
	N'Tâm Lý',
	116 ,
	'2024-03-08', 
	N'Ryosuke Yamada, Minami Hamabe, Shuhei Nomura, Arata Furuta',
	N'Câu chuyện xoay quanh chàng trai trẻ Aoi (Ryosuke Yamada) thầm yêu nữ học viên Mika (Minami Hamabe) với khao khát trở thành nghệ sĩ piano. Một tai nạn bất ngờ đã khiến Mika mất đi thị lực, Aoi vẫn luôn âm thầm bên cạnh và dùng sự dịu dàng vụng về của mình bảo vệ cô. Nhưng số mệnh như một dòng nước đục ngầu cuốn đi chuyện tình thuần khiết đang còn dở dang.',
	'https://www.youtube.com/embed/lMdj-q-3iV8',
	'C16',
	N'Eiji Uchida',
	N'Tiếng Nhật - Phụ đề Tiếng Việt'
	);
-- xin đừng xóa 2 cái update này 
UPDATE Film
SET Trailer = 'https://www.youtube.com/embed/ZCJHvDOhIpI'
WHERE Name = N'DANH HỌA VAN GOGH (T16)'
UPDATE Film
SET Trailer = 'https://www.youtube.com/embed/85oL4klGv2k'
WHERE Name = N'TIẾNG YÊU KHÔNG LỜI (C16)'
-- Please
-- Inserting more film details with no overlapping slots for different dates and screens
CREATE TABLE Screen (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(64) NOT NULL UNIQUE
);
INSERT INTO Screen (Name)
VALUES
    ('Screen 1'),
    ('Screen 2'),
    ('Screen 3'),
    ('Screen 4');
CREATE TABLE ScreenSeat (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Type NVARCHAR(50) NOT NULL, -- Type of the seat (e.g., double, vip, standard)
    Price DECIMAL(10, 2) NOT NULL, -- Price of the seat
    ScreenId INT NOT NULL,
    FOREIGN KEY (ScreenId) REFERENCES Screen (Id) ON DELETE CASCADE,
    CONSTRAINT UC_ScreenSeat_Name UNIQUE (Name, ScreenId)
);
-- Insert seats for Screen 1
INSERT INTO ScreenSeat (Name, Type, Price, ScreenId)
SELECT 
    CONCAT(ColumnLetter, Number) AS Name,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' OR 
             (ColumnLetter = 'G' AND Number BETWEEN 3 AND 8) OR 
             (ColumnLetter = 'H' AND Number BETWEEN 3 AND 8) THEN 'VIP'
        ELSE 'Standard'
    END AS Type,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' OR 
             (ColumnLetter = 'G' AND Number BETWEEN 3 AND 8) OR 
             (ColumnLetter = 'H' AND Number BETWEEN 3 AND 8) THEN 55000
        ELSE 45000
    END AS Price,
    1 AS ScreenId
FROM (
    SELECT CHAR(64 + Ones.Number) AS ColumnLetter, Tens.Number
    FROM (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS Tens(Number)
    CROSS JOIN (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS Ones(Number)
) AS Seats;
-- Insert seats for Screen 2
INSERT INTO ScreenSeat (Name, Type, Price, ScreenId)
SELECT 
    CONCAT(ColumnLetter, Number) AS Name,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' OR 
             (ColumnLetter = 'G' AND Number BETWEEN 3 AND 8) OR 
             (ColumnLetter = 'H' AND Number BETWEEN 3 AND 8) THEN 'VIP'
        ELSE 'Standard'
    END AS Type,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' OR 
             (ColumnLetter = 'G' AND Number BETWEEN 3 AND 8) OR 
             (ColumnLetter = 'H' AND Number BETWEEN 3 AND 8) THEN 55000
        ELSE 45000
    END AS Price,
    2 AS ScreenId
FROM (
    SELECT CHAR(64 + Ones.Number) AS ColumnLetter, Tens.Number
    FROM (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS Tens(Number)
    CROSS JOIN (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS Ones(Number)
) AS Seats;
-- Insert seats for Screen 3
INSERT INTO ScreenSeat (Name, Type, Price, ScreenId)
SELECT 
    CONCAT(ColumnLetter, Number) AS Name,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' OR 
             (ColumnLetter = 'G' AND Number BETWEEN 3 AND 8) OR 
             (ColumnLetter = 'H' AND Number BETWEEN 3 AND 8) THEN 'VIP'
        ELSE 'Standard'
    END AS Type,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' OR 
             (ColumnLetter = 'G' AND Number BETWEEN 3 AND 8) OR 
             (ColumnLetter = 'H' AND Number BETWEEN 3 AND 8) THEN 55000
        ELSE 45000
    END AS Price,
    3 AS ScreenId
FROM (
    SELECT CHAR(64 + Ones.Number) AS ColumnLetter, Tens.Number
    FROM (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS Tens(Number)
    CROSS JOIN (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS Ones(Number)
) AS Seats;
-- Insert seats for Screen 4
INSERT INTO ScreenSeat (Name, Type, Price, ScreenId)
SELECT 
    CONCAT(ColumnLetter, Number) AS Name,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' OR 
             (ColumnLetter = 'G' AND Number BETWEEN 3 AND 8) OR 
             (ColumnLetter = 'H' AND Number BETWEEN 3 AND 8) THEN 'VIP'
        ELSE 'Standard'
    END AS Type,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' OR 
             (ColumnLetter = 'G' AND Number BETWEEN 3 AND 8) OR 
             (ColumnLetter = 'H' AND Number BETWEEN 3 AND 8) THEN 55000
        ELSE 45000
    END AS Price,
    4 AS ScreenId
FROM (
    SELECT CHAR(64 + Ones.Number) AS ColumnLetter, Tens.Number
    FROM (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS Tens(Number)
    CROSS JOIN (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS Ones(Number)
) AS Seats;
CREATE TABLE Slot (
    id INT IDENTITY(1,1) PRIMARY KEY,
    startTime TIME NOT NULL,
    endTime TIME NOT NULL,
    CONSTRAINT UC_StartEndTime UNIQUE (startTime, endTime)
);
INSERT INTO Slot (startTime, endTime)
VALUES
    ('09:00', '10:30'),
    ('10:30', '12:00'),
    ('12:00', '13:30'),
    ('13:30', '15:00'),
    ('15:00', '16:30'),
    ('16:30', '18:00'),
    ('18:00', '19:30'),
    ('19:30', '21:00'),
    ('21:00', '22:30'),
    ('22:30', '00:00');
CREATE TABLE FilmDetail (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ScreenId INT NOT NULL,
    FilmId INT NOT NULL,
    FilmSlotId INT NOT NULL,
    MovieDate DATE NOT NULL,
    FOREIGN KEY (ScreenId) REFERENCES Screen (Id) ON DELETE CASCADE,
    FOREIGN KEY (FilmId) REFERENCES Film (Id) ON DELETE CASCADE,
    FOREIGN KEY (FilmSlotId) REFERENCES Slot (Id) ON DELETE CASCADE,
    CONSTRAINT UC_FilmDetail UNIQUE (ScreenId, FilmSlotId, MovieDate) -- Unique constraint to ensure a film can't be shown on the same screen, slot, and date
);

INSERT INTO FilmDetail (ScreenId, FilmId, FilmSlotId, MovieDate)
VALUES 
    (1, 1, 1, '2024-03-17'),
    (2, 2, 2, '2024-03-18'),
    (3, 3, 3, '2024-03-19'),
    (4, 4, 4, '2024-03-20'),
    (1, 5, 5, '2024-03-21'),
    (2, 6, 6, '2024-03-22'),
    (3, 7, 7, '2024-03-23'),
    (4, 8, 8, '2024-03-24'),
    (1, 9, 9, '2024-03-17'),
    (2, 10, 10, '2024-03-18'),
    (3, 11, 1, '2024-03-19'),
    (4, 12, 2, '2024-03-20');

INSERT INTO FilmDetail (ScreenId, FilmId, FilmSlotId, MovieDate)
VALUES 
    (2, 3, 3, '2024-03-17'),
    (3, 4, 4, '2024-03-18'),
    (4, 5, 5, '2024-03-19'),
    (1, 6, 6, '2024-03-20'),
    (2, 7, 7, '2024-03-21'),
    (3, 8, 8, '2024-03-22'),
    (4, 9, 9, '2024-03-23'),
    (1, 10, 10, '2024-03-24');

INSERT INTO FilmDetail (ScreenId, FilmId, FilmSlotId, MovieDate)
VALUES 
    (3, 11, 1, '2024-03-17'),
    (4, 12, 2, '2024-03-18'),
    (1, 1, 3, '2024-03-19'),
    (2, 2, 4, '2024-03-20'),
    (3, 3, 5, '2024-03-21'),
    (4, 4, 6, '2024-03-22'),
    (1, 5, 7, '2024-03-23'),
    (2, 6, 8, '2024-03-24');

INSERT INTO FilmDetail (ScreenId, FilmId, FilmSlotId, MovieDate)
VALUES 
    (3, 7, 9, '2024-03-17'),
    (4, 8, 10, '2024-03-18'),
    (1, 9, 1, '2024-03-19'),
    (2, 10, 2, '2024-03-20'),
    (3, 11, 3, '2024-03-21'),
    (4, 12, 4, '2024-03-22'),
    (1, 1, 5, '2024-03-23'),
    (2, 2, 6, '2024-03-24');

INSERT INTO FilmDetail (ScreenId, FilmId, FilmSlotId, MovieDate)
VALUES 
    (3, 3, 7, '2024-03-17'),
    (4, 4, 8, '2024-03-18'),
    (1, 5, 9, '2024-03-19'),
    (2, 6, 10, '2024-03-20'),
    (3, 7, 1, '2024-03-21'),
    (4, 8, 2, '2024-03-22'),
    (1, 9, 3, '2024-03-23'),
    (2, 10, 4, '2024-03-24'),
    (3, 11, 5, '2024-03-17'),
    (4, 12, 6, '2024-03-18'),
    (1, 1, 7, '2024-03-19'),
    (2, 2, 8, '2024-03-20'),
    (3, 3, 9, '2024-03-21'),
    (4, 4, 10, '2024-03-22'),
    (1, 5, 1, '2024-03-23'),
    (2, 6, 2, '2024-03-24'),
    (3, 7, 3, '2024-03-17'),
    (4, 8, 4, '2024-03-18'),
    (1, 9, 5, '2024-03-19'),
    (2, 10, 6, '2024-03-20'),
    (3, 11, 7, '2024-03-21'),
    (4, 12, 8, '2024-03-22'),
    (1, 1, 9, '2024-03-23'),
    (2, 2, 10, '2024-03-24');

INSERT INTO FilmDetail (ScreenId, FilmId, FilmSlotId, MovieDate)
VALUES 
    (3, 3, 1, '2024-03-24'),
    (4, 4, 2, '2024-03-17'),
    (1, 5, 3, '2024-03-18'),
    (2, 6, 4, '2024-03-19'),
    (3, 7, 5, '2024-03-20'),
    (4, 8, 6, '2024-03-21'),
    (1, 9, 7, '2024-03-22'),
    (2, 10, 8, '2024-03-23'),
    (3, 11, 9, '2024-03-24'),
    (4, 12, 10, '2024-03-17'),
    (1, 1, 1, '2024-03-18'),
    (2, 2, 2, '2024-03-19'),
    (3, 3, 3, '2024-03-20'),
    (4, 4, 4, '2024-03-21'),
    (1, 5, 5, '2024-03-22'),
    (2, 6, 6, '2024-03-23'),
    (3, 7, 7, '2024-03-24'),
    (4, 8, 8, '2024-03-17'),
    (1, 9, 9, '2024-03-18'),
    (2, 10, 10, '2024-03-19'),
    (3, 11, 1, '2024-03-20'),
    (4, 12, 2, '2024-03-21'),
    (1, 1, 3, '2024-03-22'),
    (2, 2, 4, '2024-03-23');

CREATE TABLE Bill (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    Date DATE NOT NULL,
    TotalPrice FLOAT NOT NULL,
    FOREIGN KEY (UserId) REFERENCES [User](Id) ON DELETE CASCADE
);

INSERT INTO Bill (UserId, Date, TotalPrice)
VALUES
(1, GETDATE(), 100.00); -- Assuming UserId is 1 and TotalPrice is 100.00

CREATE TABLE Ticket (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    BillId INT NOT NULL,
    FilmDetailId INT NOT NULL,
    ScreenSeatId INT NOT NULL,
    FOREIGN KEY (BillId) REFERENCES Bill(Id) ON DELETE CASCADE,
    FOREIGN KEY (FilmDetailId) REFERENCES FilmDetail(Id) ON DELETE CASCADE,
    FOREIGN KEY (ScreenSeatId) REFERENCES ScreenSeat(Id) ,
    CONSTRAINT UC_Ticket UNIQUE (FilmDetailId, ScreenSeatId)
);

CREATE TABLE Service (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    url NVARCHAR(255) NOT NULL
);
CREATE TABLE ServiceUsage (
    id INT IDENTITY(1,1) PRIMARY KEY,
    serviceID INT NOT NULL,
    amount INT NOT NULL,
    BillID INT NOT NULL,
    FOREIGN KEY (serviceID) REFERENCES Service(id),
    FOREIGN KEY (BillID) REFERENCES Bill(Id)
);
INSERT INTO Service (name, price, url)
VALUES 
(N'1 ly nước ngọt coca size L', 30000.00, 'nameService/nuoc.png'),
(N'1 bắp rang bơ', 35000.00, 'nameService/bap.png'),
(N'1 ly nước ngọt coca size L và 1 bắp rang bơ', 55000.00, 'nameService/combo3.png'),
(N'2 ly nước ngọt coca size L và 1 bắp rang bơ', 80000.00, 'nameService/combo4.png');


