CREATE DATABASE Course

USE Course

CREATE TABLE [Countries] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40)
)

INSERT INTO Countries VALUES
('Azerbaijan'),
('Turkey'),
('Japan')




CREATE TABLE [Cities] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40),
    CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)

INSERT INTO Cities VALUES
('Baku', 1),
('Ankara', 2),
('Tokyo', 3)




CREATE TABLE [Students] (
    Id INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(40) NOT NULL,
    Birthday DATE NOT NULL,
    Address NVARCHAR(40),
    CityId INT FOREIGN KEY REFERENCES Cities(Id)
)

INSERT INTO Students VALUES
('Ali Talibov', '2001-08-19', 'Xetai', 1),
('Kian Hayes', '1992-10-12', 'Asakusa', 3),
('Phoebe Lawson', '1990-02-04', 'Demirtepe', 2)


CREATE TABLE [Teachers] (
    Id INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(40) NOT NULL,
    Email NVARCHAR(40) NOT NULL,
    Address NVARCHAR(40),
    Salary DECIMAL,
    CityId INT FOREIGN KEY REFERENCES Cities(Id)
)

INSERT INTO Teachers VALUES
('Cavid Bashirov', 'cavid@code.edu.az', 'Ehmedli', 3000, 1),
('Ibrahim Aliyev', 'ibrahim@code.edu.az', 'Genclik', 2800, 1),
('Sara Matthews', 'sara@code.edu.az', 'Kolej', 2900, 2),
('Nicole Andrews', 'nicole@code.edu.az', 'Shibuya', 2700, 3)




CREATE TABLE [StaffMembers] (
    Id INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(40) NOT NULL,
    Salary DECIMAL,
    CityId INT FOREIGN KEY REFERENCES Cities(Id)
)

INSERT INTO StaffMembers VALUES
('Tilly May', 1900, 1),
('Stanley Houghton', 2000, 3),
('Ella Gardner', 1000, 2),
('Arthur Khan', 2100, 2),
('James Wilkinson', 3300, 1),
('Dominik Robinson', 2100, 1)




CREATE TABLE [Roles] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40)
)

INSERT INTO Roles VALUES
('Reception'),
('Barista'),
('Cleaner'),
('CEO'),
('Marketer')




CREATE TABLE [RoleMembers] (
    Id INT PRIMARY KEY IDENTITY,
    RoleId INT FOREIGN KEY REFERENCES Roles(Id),
    MemberId INT FOREIGN KEY REFERENCES StaffMembers(Id)
)

INSERT INTO RoleMembers VALUES
(1, 1),
(1, 2),
(3, 3),
(5, 4),
(4, 5),
(2, 6)




CREATE TABLE [Educations] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50),
    Duration INT
)

INSERT INTO Educations VALUES
('Programming', 120),
('Web Design', 90),
('Digital Marketing', 80),
('System Administrator', 100)




CREATE TABLE [EducationDays] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40)
)

INSERT INTO EducationDays VALUES
('Weekdays'),
('Weekend')




CREATE TABLE [Rooms] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40),
    Capacity INT
)

INSERT INTO Rooms  VALUES
('Saturn', 27),
('Mercury', 30)




CREATE TABLE [Seanses] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40)
)

INSERT INTO Seanses VALUES
('Morning'),
('Afternoon'),
('Evening')




CREATE TABLE [EducationDaySeans] (
    Id INT PRIMARY KEY IDENTITY,
    EducationDayId INT FOREIGN KEY REFERENCES EducationDays(Id),
    SeansId INT FOREIGN KEY REFERENCES Seanses(Id)
)

INSERT INTO EducationDaySeans VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3)




CREATE TABLE [Groups] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40),
    EducationId INT FOREIGN KEY REFERENCES Educations(Id),
    RoomId INT FOREIGN KEY REFERENCES Rooms(Id),
    EducationDaySeansId INT FOREIGN KEY REFERENCES EducationDaySeans(Id)
)

INSERT INTO Groups VALUES
('P135', 1, 1, 1),
('P322', 1, 1, 5),
('D250', 2, 2, 3)




CREATE TABLE [GroupStudents] (
    Id INT PRIMARY KEY IDENTITY,
    GroupId INT FOREIGN KEY REFERENCES Groups(Id),
    StudentId INT FOREIGN KEY REFERENCES Students(Id)
)

INSERT INTO GroupStudents VALUES
(1, 1),
(2, 2),
(3, 3)




CREATE TABLE [GroupTeachers] (
    Id INT PRIMARY KEY IDENTITY,
    GroupId INT FOREIGN KEY REFERENCES Groups(Id),
    TeacherId INT FOREIGN KEY REFERENCES Teachers(Id)
)

INSERT INTO GroupTeachers VALUES
(1, 1),
(2, 2),
(3, 4)