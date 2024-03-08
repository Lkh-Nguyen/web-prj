﻿CREATE TABLE [User] (
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
('Le Kim Hoang Nguyen', 'Male', '2004-09-23', NULL, '0763905056', 'lkh@gmail.com', '01234567', NULL, 1);
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
    FOREIGN KEY (ScreenId) REFERENCES Screen (Id),
    CONSTRAINT UC_ScreenSeat_Name UNIQUE (Name, ScreenId)
);


-- Insert seats for Screen 1
INSERT INTO ScreenSeat (Name, Type, Price, ScreenId)
SELECT 
    CONCAT(ColumnLetter, Number) AS Name,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' THEN 'VIP'
        ELSE 'Standard'
    END AS Type,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' THEN 55000
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
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' THEN 'VIP'
        ELSE 'Standard'
    END AS Type,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' THEN 55000
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
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' THEN 'VIP'
        ELSE 'Standard'
    END AS Type,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' THEN 55000
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
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' THEN 'VIP'
        ELSE 'Standard'
    END AS Type,
    CASE 
        WHEN CONCAT(ColumnLetter, Number) BETWEEN 'F3' AND 'F8' THEN 55000
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
    endTime TIME NOT NULL
);

INSERT INTO Slot (startTime, endTime)
VALUES
    ('09:00', '10:30'),
    ('10:30', '12:00'),
    ('13:00', '14:30'),
    ('15:00', '16:30');

CREATE TABLE FilmDetail (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ScreenId INT NOT NULL,
    FilmId INT NOT NULL,
    FilmSlotId INT NOT NULL,
    MovieDate DATE NOT NULL,
    FOREIGN KEY (ScreenId) REFERENCES Screen (Id),
    FOREIGN KEY (FilmId) REFERENCES Film (Id),
    FOREIGN KEY (FilmSlotId) REFERENCES Slot (Id),
    CONSTRAINT UC_FilmDetail UNIQUE (ScreenId, FilmSlotId, MovieDate) -- Unique constraint to ensure a film can't be shown on the same screen, slot, and date
);

INSERT INTO FilmDetail (ScreenId, FilmId, FilmSlotId, MovieDate)
VALUES 
    (1, 1, 1, '2024-03-06'), -- Screen 1 showing Film 1 on Slot 1 on 2024-03-06
    (2, 2, 2, '2024-03-06'), -- Screen 2 showing Film 2 on Slot 2 on 2024-03-06
    (3, 3, 3, '2024-03-06'), -- Screen 3 showing Film 3 on Slot 3 on 2024-03-06
    (4, 4, 4, '2024-03-06'); -- Screen 4 showing Film 4 on Slot 4 on 2024-03-06

CREATE TABLE Bill (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    Date DATE NOT NULL,
    TotalPrice FLOAT NOT NULL,
    FOREIGN KEY (UserId) REFERENCES [User](Id)
);

INSERT INTO Bill (UserId, Date, TotalPrice)
VALUES
(1, GETDATE(), 100.00); -- Assuming UserId is 1 and TotalPrice is 100.00

CREATE TABLE Ticket (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    BillId INT NOT NULL,
    FilmDetailId INT NOT NULL,
    ScreenSeatId INT NOT NULL,
    FOREIGN KEY (BillId) REFERENCES Bill(Id),
    FOREIGN KEY (FilmDetailId) REFERENCES FilmDetail(Id),
    FOREIGN KEY (ScreenSeatId) REFERENCES ScreenSeat(Id),
    CONSTRAINT UC_Ticket UNIQUE (FilmDetailId, ScreenSeatId)
);

INSERT INTO Ticket (BillId, FilmDetailId, ScreenSeatId)
VALUES
(1, 2, (SELECT Id FROM ScreenSeat WHERE ScreenId = 2 AND Name = 'A1')),
(1, 2, (SELECT Id FROM ScreenSeat WHERE ScreenId = 2 AND Name = 'A2')),
(1, 2, (SELECT Id FROM ScreenSeat WHERE ScreenId = 2 AND Name = 'B3')),
(1, 2, (SELECT Id FROM ScreenSeat WHERE ScreenId = 2 AND Name = 'C4')),
(1, 2, (SELECT Id FROM ScreenSeat WHERE ScreenId = 2 AND Name = 'D5'));








