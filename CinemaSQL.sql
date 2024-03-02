-- User

CREATE TABLE Users (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')) NOT NULL,
    DateOfBirth DATE NOT NULL,
    CMND CHAR(12) CHECK (LEN(CMND) = 12),
    PhoneNumber VARCHAR(15) CHECK (LEN(PhoneNumber) = 10) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Role INT CHECK (Role IN (1, 2)), -- Restricting values to 1 or 2
    CONSTRAINT CHK_Email CHECK (Email LIKE '%@%.%'), -- Basic email format validation
    CONSTRAINT CHK_Password_Length CHECK (LEN(Password) >= 8) -- Minimum password length
);


INSERT INTO Users (Name, Gender, DateOfBirth, CMND, PhoneNumber, Email, Password, Address, Role) 
VALUES 
('John Doe', 'Male', '1990-05-15', '123456789012', '1234567890', 'john@example.com', 'password123', '123 Main St, Cityville', 1),
('Jane Smith', 'Female', '1985-08-20', '987654321098', '0987654321', 'jane@example.com', 'securepassword', '456 Elm St, Townsville', 1),
('Alice Johnson', 'Female', '1992-10-08', '456789012345', '5551234567', 'alice@example.com', 'strongPassword123', '789 Oak St, Villagetown', 2);

-- Film

CREATE TABLE Film (
    id INT IDENTITY(1,1) PRIMARY KEY,
    url NVARCHAR(MAX) NOT NULL,
    name NVARCHAR(MAX) NOT NULL,
    type NVARCHAR(MAX) NOT NULL,
    duration INT NOT NULL,
    startDate DATE NOT NULL,
    actor NVARCHAR(MAX) NOT NULL,
    detail NVARCHAR(MAX) NOT NULL,
    trailer NVARCHAR(MAX),
    rate VARCHAR(50) NOT NULL
);

CREATE TABLE Screen (
	Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(64) NOT NULL
);

CREATE TABLE FilmDetail (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Screen_Id INT NOT NULL,
    Film_Id INT NOT NULL,
    Film_Slot INT NOT NULL,
    MovieDate DATE NOT NULL,
    FOREIGN KEY (Screen_Id) REFERENCES Screen (ID),
    FOREIGN KEY (Film_Id) REFERENCES Film (id)
);

CREATE TABLE Ticket (
    TId INT IDENTITY(1,1) PRIMARY KEY,
    UId INT NOT NULL,
    Price FLOAT NOT NULL,
    TDate DATE NOT NULL,
    FDId INT NOT NULL,
    FOREIGN KEY (UId) REFERENCES Users(Id),
    FOREIGN KEY (FDId) REFERENCES FilmDetail(Id)
);






--
