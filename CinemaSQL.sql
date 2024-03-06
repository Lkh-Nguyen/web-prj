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
('John Doe', 'Male', '1990-05-15', '123456789012', '1234567890', 'john@example.com', 'password123', '123 Main St, Cityville', 1),
('Jane Smith', 'Female', '1985-08-20', '987654321098', '0987654321', 'jane@example.com', 'securepassword', '456 Elm St, Townsville', 1),
('Alice Johnson', 'Female', '1992-10-08', '456789012345', '5551234567', 'alice@example.com', 'strongPassword123', '789 Oak St, Villagetown', 2);

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

CREATE TABLE ScreenSeat (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    ScreenId INT NOT NULL,
    FOREIGN KEY (ScreenId) REFERENCES Screen (Id),
    CONSTRAINT UC_ScreenSeat_Name UNIQUE (Name, ScreenId)
);


CREATE TABLE FilmDetail (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ScreenId INT NOT NULL,
    FilmId INT NOT NULL,
    FilmSlot INT NOT NULL,
    MovieDate DATE NOT NULL,
    FOREIGN KEY (ScreenId) REFERENCES Screen (Id),
    FOREIGN KEY (FilmId) REFERENCES Film (Id),
    CONSTRAINT UC_FilmDetail UNIQUE (ScreenId, FilmSlot, MovieDate) -- Unique constraint to ensure a film can't be shown on the same screen, slot, and date
);


CREATE TABLE Ticket (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    Price FLOAT NOT NULL,
    Date DATE NOT NULL,
    FilmDetailId INT NOT NULL,
    ScreenSeatId INT NOT NULL,
    FOREIGN KEY (UserId) REFERENCES [User](Id),
    FOREIGN KEY (FilmDetailId) REFERENCES FilmDetail(Id),
    FOREIGN KEY (ScreenSeatId) REFERENCES ScreenSeat(Id),
    CONSTRAINT UC_Ticket UNIQUE (FilmDetailId, ScreenSeatId)
);





