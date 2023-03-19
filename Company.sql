CREATE DATABASE Company

USE Company

CREATE TABLE [Countries] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40) NOT NULL
)

CREATE TABLE [Cities] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40) NOT NULL,
    CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)

CREATE TABLE [Employees] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40) NOT NULL,
    Surname NVARCHAR(40) NOT NULL,
    Age INT NOT NULL,
    Salary DECIMAL,
    Position NVARCHAR(60),
    IsDeleted BIT,
    CityId INT FOREIGN KEY REFERENCES Cities(Id)
)

INSERT INTO [Countries] VALUES
('Azerbaijan'),
('Turkey'),
('Canada'),
('USA')

INSERT INTO [Cities] VALUES
('Baku', 1),
('Toronto', 3),
('Istanbul', 2),
('New-York', 4)

INSERT INTO [Employees] VALUES
('Ali', 'Talibov', '21', 2100, 'FrontEnd Developer', 0, 1),
('Cavid', 'Bashirov', '29', 3000, 'FullStack Developer', 0, 1),
('Ibrahim', 'Aliyev', '27', 2700, 'BackEnd Developer', 0, 1),
('Oscar', 'Gardner', '23', 2400, 'Web Designer', 0, 4),
('Sophie', 'Knight', '22', 2000, 'Digital Marketing', 0, 3),
('Joe', 'Clarke', '26', 1500, 'Reception', 1, 2),
('Rebecca', 'Watts', '25', 1700, 'Reception', 1, 3)




-- Ishcilerin ozlerini, yashadiqi sheherlerini ve olkelerini gosterin.

SELECT e.Id AS EmployeeId, e.Name AS EmployeeName, e.Surname, e.Age, e.Salary, e.Position, e.IsDeleted, ct.Id AS CityId, ct.Name AS CityName, cr.Id AS CountryId, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId



-- Maashi 2000-den yuxari olan ishcilerin adlari ve yashadiqi olkeleri gosterin.

SELECT e.Name AS EmployeeName, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId
WHERE e.Salary > 2000



-- Hansi sheherin hansi olkeye aid olduqunu gosterin.

SELECT ct.Name AS CityName, cr.Name AS CountryName FROM Cities ct
JOIN Countries cr
ON cr.Id = ct.CountryId



-- Positioni "Reseption" olan ishcilerin table-larin id-leri daxil olmamaq sherti ile butun melumatlarini gostermek.

SELECT e.Name AS EmployeeName, e.Surname, e.Age, e.Salary, e.Position, e.IsDeleted, ct.Name AS CityName, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId
WHERE e.Position = 'Reception'



-- Ishden cixan ishcilerin yashadiqi sheher ve olkeleri, hemcinin ishcilerin oz ad ve soyadlarini gosteren query yazin.

SELECT e.Name AS EmployeeName, e.Surname, ct.Name AS CityName, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId
WHERE e.IsDeleted = 1