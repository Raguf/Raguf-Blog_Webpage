CREATE DATABASE BloqWebpage;
USE BloqWebpage;

CREATE TABLE Users
(
Id int primary key identity,
Name nvarchar(25),
Surname nvarchar (40),
Email nvarchar (40)unique not null constraint ch_em check (len(Email)>=4 and len(Email)<=100)
);

CREATE TABLE Posts
(
Id int primary key identity,
Title nvarchar (255),
PostText nvarchar (500) not null constraint ch_pt check (len(PostText)<500),
LikeCount decimal,
CreateAt datetime default getdate(),
UserId int references Users(Id)
);
INSERT INTO Users
VALUES
('Ismixan','Xudiyev','ismixanxud@gmail.com'),
('Fezail','Abdullayev','fezabdullayev@gmail.com'),
('Emil','Quliyev','EmilQuliv@gmail.com'),
('Seyrulla','Abdulayev','SeruyAbu90@gmail.com'),
('Ismayil','Novruzlu','novruzIsi@gmail.com'),
('Islam','Shireliyev','shirislam@gmail.com'),
('Rovshen','Rustemov','rovshenrustem@gmail.com');

INSERT INTO  Posts (Title,PostText,LikeCount,CreateAt,UserId)
VALUES
('News','Global warming in the world',123,'2022-06-20 16:36:30', 1),
('Technology','Elon Musk new project',234,'2022-06-20 16:36:30', 5),
('Sport','World Swimming Championship',453,'2022-06-20 16:36:30', 6),
('Music','New hit of 2022',543,'2022-06-20 16:36:30', 7),
('Books','Bestseller 21st century',353,'2022-06-20 16:36:30', 2),
('Travel','Hot Tour in Europe',765,'2022-06-20 16:36:30', 4),
('Cars','The most expensive and fastest car in Asia',787,'2022-06-20 16:36:30', 3);

SELECT * FROM Users
INNER JOIN Posts 
ON Posts.UserId=Users.Id