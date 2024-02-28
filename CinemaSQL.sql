CREATE TABLE Customers (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')) NOT NULL,
    DateOfBirth DATE NOT NULL,
    CMND CHAR(12) CHECK (LEN(CMND) = 12),
    PhoneNumber VARCHAR(15) CHECK (LEN(PhoneNumber) = 10),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    CONSTRAINT CHK_Email CHECK (Email LIKE '%@%.%'), -- Basic email format validation
    CONSTRAINT CHK_Password_Length CHECK (LEN(Password) >= 8) -- Minimum password length
);

INSERT INTO Customers (Name, Gender, DateOfBirth, CMND, PhoneNumber, Email, Password, Address) 
VALUES 
('John Doe', 'Male', '1990-05-15', '123456789012', '1234567890', 'john@example.com', 'password123', '123 Main St, Cityville'),
('Jane Smith', 'Female', '1985-08-20', '987654321098', '0987654321', 'jane@example.com', 'securepassword', '456 Elm St, Townsville'),
('Alice Johnson', 'Female', '1992-10-08', '456789012345', '5551234567', 'alice@example.com', 'strongPassword123', '789 Oak St, Villagetown');
