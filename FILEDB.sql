CREATE DATABASE IF NOT EXISTS TutorScheduling;
use TutorScheduling;


CREATE TABLE people(
	Id VARCHAR(50) PRIMARY KEY,
    p_name NVARCHAR(100) NOT NULL,
    email VARCHAR(50) NULL,
    address NVARCHAR(150) NULL,
    p_role ENUM('user', 'admin', 'tutor') DEFAULT 'user',
    gender ENUM ('Nam', 'Nu'),
    phonenumber VARCHAR(20) NULL,
    password VARCHAR(200) NOT NULL
);
CREATE TABLE Admin(
	AdminId VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (AdminId) REFERENCES people(Id) ON DELETE CASCADE
    
);

CREATE TABLE Subject(
	SubId INT AUTO_INCREMENT PRIMARY KEY,
    AdminId VARCHAR(50) NOT NULL,
    Su_Name NVARCHAR(100) NOT NULL,
    Su_Description NVARCHAR(200) NULL,
    FOREIGN KEY (AdminId) REFERENCES Admin(AdminId) ON DELETE CASCADE
);

CREATE TABLE Tutor(
	TutorId VARCHAR(50) NOT NULL UNIQUE,
    Fee INT PRIMARY KEY,
    Rating ENUM ('1','2','3','4','5'),
    SubId INT NULL,
    SessionId INT NULL,
    Education NVARCHAR(100) NOT NULL,
    Experience NVARCHAR(100) NOT NULL,
    FOREIGN KEY (TutorId) REFERENCES people(Id) ON DELETE CASCADE,
	FOREIGN KEY (SubId) REFERENCES Subject(SubId) ON DELETE CASCADE,
    FOREIGN KEY (SessionId) REFERENCES Session(SessionId) ON DELETE CASCADE
    
);

CREATE TABLE Student(
	StudentId VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (StudentId) REFERENCES people(Id) ON DELETE CASCADE
    
);


CREATE TABLE Session(
	SessionId INT AUTO_INCREMENT PRIMARY KEY,
    Fee INT NOT NULL,
    SubId INT NOT NULL,
	Se_Description NVARCHAR(100) NULL,
    Duration NVARCHAR(100) NULL,
    Capacity INT NOT NULL,
    TutorId VARCHAR(50) NULL,
    Se_Status ENUM ('Lock','Unlock'),
    FOREIGN KEY (TutorId) REFERENCES Tutor(TutorId) ON DELETE CASCADE,
    FOREIGN KEY (SubId) REFERENCES Subject(SubId) ON DELETE CASCADE
    
);

CREATE TABLE Booking_Session(
    BookingId INT AUTO_INCREMENT PRIMARY KEY,
    StudentId VARCHAR(50) NULL,
    SubId INT NULL,
    TutorId VARCHAR(50) NULL,
    StudyDate VARCHAR(50) NOT NULL,
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId) ON DELETE CASCADE,
    FOREIGN KEY (SubId) REFERENCES Subject(SubId) ON DELETE CASCADE,
    FOREIGN KEY (TutorId) REFERENCES Tutor(TutorId) ON DELETE CASCADE
);

CREATE TABLE Booking_Session_Detail(
	SessionId INT NULL,
    BookingId INT NULL,
    Check_in ENUM ('Yes', 'No'),
    Location NVARCHAR(300) NULL,
    D_Date DATE NOT NULL,
    D_Time TIME NOT NULL,
    D_ConfirmCode VARCHAR (50),
    FOREIGN KEY (SessionId) REFERENCES Session(SessionId) ON DELETE CASCADE,
    FOREIGN KEY (BookingId) REFERENCES Booking_Session(BookingId) ON DELETE CASCADE
);


