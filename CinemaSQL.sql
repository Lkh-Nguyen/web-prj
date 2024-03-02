CREATE TABLE Users (
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

INSERT INTO Users (Name, Gender, DateOfBirth, CMND, PhoneNumber, Email, Password, Address, Role) 
VALUES 
('John Doe', 'Male', '1990-05-15', '123456789012', '1234567890', 'john@example.com', 'password123', '123 Main St, Cityville', 1),
('Jane Smith', 'Female', '1985-08-20', '987654321098', '0987654321', 'jane@example.com', 'securepassword', '456 Elm St, Townsville', 1),
('Alice Johnson', 'Female', '1992-10-08', '456789012345', '5551234567', 'alice@example.com', 'strongPassword123', '789 Oak St, Villagetown', 2);

CREATE TABLE Film (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Url NVARCHAR(MAX) NOT NULL,
    Name NVARCHAR(MAX) NOT NULL,
    Type NVARCHAR(MAX) NOT NULL,
    Duration INT NOT NULL,
    StartDate DATE NOT NULL,
    Actor NVARCHAR(MAX) NOT NULL,
    Detail NVARCHAR(MAX) NOT NULL,
    Trailer NVARCHAR(MAX),
    Rate NVARCHAR(50) NOT NULL
);

CREATE TABLE Screen (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(64) NOT NULL
);

CREATE TABLE ScreenSeat (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    ScreenId INT NOT NULL,
    FOREIGN KEY (ScreenId) REFERENCES Screen (Id)
);

CREATE TABLE FilmDetail (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ScreenId INT NOT NULL,
    FilmId INT NOT NULL,
    FilmSlot INT NOT NULL,
    MovieDate DATE NOT NULL,
    FOREIGN KEY (ScreenId) REFERENCES Screen (Id),
    FOREIGN KEY (FilmId) REFERENCES Film (Id)
);

CREATE TABLE Ticket (
    TId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    Price FLOAT NOT NULL,
    TDate DATE NOT NULL,
    FilmDetailId INT NOT NULL,
    ScreenSeatId INT NOT NULL, -- Reference to the ScreenSeat table
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (FilmDetailId) REFERENCES FilmDetail(Id),
    FOREIGN KEY (ScreenSeatId) REFERENCES ScreenSeat(Id) -- Foreign key to represent the seat reserved
);
