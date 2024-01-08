-- MOVIESDB_SCRIPT


USE [MoviesDB]
GO
/****** Object:  Table [dbo].[actors]    Script Date: 15-11-2023 20:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actors](
	[actor_id] [int] NOT NULL,   
	[name] [varchar](45) NOT NULL,
	[birth_year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[financials]    Script Date: 15-11-2023 20:23:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[financials](
	[movie_id] [int] NOT NULL,
	[budget] [decimal](10, 2) NULL,
	[revenue] [decimal](10, 2) NULL,
	[unit] [varchar](20) NULL,
	[currency] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languages]    Script Date: 15-11-2023 20:23:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[language_id] [tinyint] NOT NULL,
	[name] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_actor]    Script Date: 15-11-2023 20:23:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_actor](
	[movie_id] [int] NOT NULL,
	[actor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[actor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movies]    Script Date: 15-11-2023 20:23:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movies](
	[movie_id] [int] NOT NULL,
	[title] [varchar](150) NOT NULL,
	[industry] [varchar](45) NULL,
	[release_year] [int] NULL,
	[imdb_rating] [decimal](3, 1) NULL,
	[studio] [varchar](45) NULL,
	[language_id] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (50, N'Yash', 1986)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (51, N'Sanjay Dutt', 1959)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (52, N'Benedict Cumberbatch', 1976)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (53, N'Elizabeth Olsen', 1989)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (54, N'Chris Hemsworth', 1983)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (55, N'Natalie Portman', 1981)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (56, N'Tom Hiddleston', 1981)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (57, N'Amitabh Bachchan', 1942)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (58, N'Jaya Bachchan', 1948)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (59, N'Shah Rukh Khan', 1965)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (60, N'Kajol', 1974)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (61, N'Aamir Khan', 1965)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (62, N'R. Madhavan', 1970)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (63, N'Sharman Joshi', 1979)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (64, N'Hrithik Roshan', 1974)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (65, N'Ranveer Singh', 1985)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (66, N'Deepika Padukone', 1986)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (67, N'Tim Robbins', 1958)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (68, N'Morgan Freeman', 1937)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (69, N'Leonardo DiCaprio', 1974)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (70, N'Ken Watanabe', 1959)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (71, N'Matthew McConaughey', 1969)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (72, N'Anne Hathaway', 1982)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (73, N'John David Washington', 1984)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (74, N'Robert Pattinson', 1986)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (75, N'Will Smith', 1968)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (76, N'Thandiwe Newton', 1972)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (77, N'Russell Crowe', 1964)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (78, N'Joaquin Phoenix', 1974)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (79, N'Kate Winslet', 1975)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (80, N'James Stewart', 1908)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (81, N'Donna Reed', 1921)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (82, N'Sam Worthington', 1976)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (83, N'Zoe Saldana', 1978)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (84, N'Marlon Brando', 1924)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (85, N'Al Pacino', 1940)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (86, N'Christian Bale', 1974)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (87, N'Heath Ledger', 1979)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (88, N'Liam Neeson', 1952)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (89, N'Ben Kingsley', 1943)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (90, N'Sam Neill', 1947)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (91, N'Laura Dern', 1967)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (92, N'Song Kang-ho', 1967)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (93, N'Lee Sun-kyun', 1975)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (94, N'Robert Downey Jr.', 1965)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (95, N'Chris Evans', 1981)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (150, N'Kanu Banerjee', 1905)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (151, N'Karuna Banerjee', 1919)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (152, N'Darsheel Safary', 1997)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (153, N'Sunil Dutt', 1929)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (154, N'Anushka Sharma', 1988)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (155, N'Ranbir Kapoor', 1982)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (156, N'Allu Arjun', 1982)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (157, N'Fahadh Faasil', 1982)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (158, N'N. T. Rama Rao Jr.', 1983)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (159, N'Ram Charan', 1985)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (160, N'Prabhas', 1979)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (161, N'Rana Daggubati', 1984)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (162, N'Mithun Chakraborty', 1950)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (163, N'Anupam Kher', 1955)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (164, N'Salman Khan', 1965)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (165, N'Nawazuddin Siddiqui', 1967)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (166, N'Tommy Lee Jones', 1946)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (167, N'Sebastian Stan', 1982)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (168, N'Anil Kapoor', 1956)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (169, N'Sidharth Malhotra', 1985)
INSERT [dbo].[actors] ([actor_id], [name], [birth_year]) VALUES (170, N'Kiara Advani', 1991)
GO
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (101, CAST(1.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), N'Billions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (102, CAST(200.00 AS Decimal(10, 2)), CAST(954.80 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (103, CAST(165.00 AS Decimal(10, 2)), CAST(644.80 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (104, CAST(180.00 AS Decimal(10, 2)), CAST(854.00 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (105, CAST(250.00 AS Decimal(10, 2)), CAST(670.00 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (107, CAST(400.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), N'Millions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (108, CAST(550.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'Millions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (109, CAST(390.00 AS Decimal(10, 2)), CAST(1360.00 AS Decimal(10, 2)), N'Millions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (110, CAST(1.40 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), N'Billions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (111, CAST(25.00 AS Decimal(10, 2)), CAST(73.30 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (113, CAST(165.00 AS Decimal(10, 2)), CAST(701.80 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (114, CAST(205.00 AS Decimal(10, 2)), CAST(365.30 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (115, CAST(55.00 AS Decimal(10, 2)), CAST(307.10 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (116, CAST(103.00 AS Decimal(10, 2)), CAST(460.50 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (117, CAST(200.00 AS Decimal(10, 2)), CAST(2202.00 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (118, CAST(3.18 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (119, CAST(237.00 AS Decimal(10, 2)), CAST(2847.00 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (120, CAST(7.20 AS Decimal(10, 2)), CAST(291.00 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (121, CAST(185.00 AS Decimal(10, 2)), CAST(1006.00 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (122, CAST(22.00 AS Decimal(10, 2)), CAST(322.20 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (123, CAST(63.00 AS Decimal(10, 2)), CAST(1046.00 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (124, CAST(15.50 AS Decimal(10, 2)), CAST(263.10 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (125, CAST(400.00 AS Decimal(10, 2)), CAST(2798.00 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (126, CAST(400.00 AS Decimal(10, 2)), CAST(2048.00 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (127, CAST(70000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), N'Thousands', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (128, CAST(120.00 AS Decimal(10, 2)), CAST(1350.00 AS Decimal(10, 2)), N'Millions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (129, CAST(100.00 AS Decimal(10, 2)), CAST(410.00 AS Decimal(10, 2)), N'Millions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (130, CAST(850.00 AS Decimal(10, 2)), CAST(8540.00 AS Decimal(10, 2)), N'Millions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (131, CAST(1.00 AS Decimal(10, 2)), CAST(5.86 AS Decimal(10, 2)), N'Billions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (132, CAST(2.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), N'Billions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (133, CAST(5.50 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'Billions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (134, CAST(1.80 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), N'Billions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (135, CAST(250.00 AS Decimal(10, 2)), CAST(3409.00 AS Decimal(10, 2)), N'Millions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (136, CAST(900.00 AS Decimal(10, 2)), CAST(11690.00 AS Decimal(10, 2)), N'Millions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (137, CAST(216.70 AS Decimal(10, 2)), CAST(370.60 AS Decimal(10, 2)), N'Millions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (138, CAST(177.00 AS Decimal(10, 2)), CAST(714.40 AS Decimal(10, 2)), N'MIllions', N'USD')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (139, CAST(1.80 AS Decimal(10, 2)), CAST(3.05 AS Decimal(10, 2)), N'Billions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (140, CAST(500.00 AS Decimal(10, 2)), CAST(950.00 AS Decimal(10, 2)), N'MIllions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (406, CAST(30.00 AS Decimal(10, 2)), CAST(350.00 AS Decimal(10, 2)), N'Millions', N'INR')
INSERT [dbo].[financials] ([movie_id], [budget], [revenue], [unit], [currency]) VALUES (412, CAST(160.00 AS Decimal(10, 2)), CAST(836.80 AS Decimal(10, 2)), N'Millions', N'USD')
GO
INSERT [dbo].[languages] ([language_id], [name]) VALUES (1, N'Hindi')
INSERT [dbo].[languages] ([language_id], [name]) VALUES (2, N'Telugu')
INSERT [dbo].[languages] ([language_id], [name]) VALUES (3, N'Kannada')
INSERT [dbo].[languages] ([language_id], [name]) VALUES (4, N'Tamil')
INSERT [dbo].[languages] ([language_id], [name]) VALUES (5, N'English')
INSERT [dbo].[languages] ([language_id], [name]) VALUES (6, N'French')
INSERT [dbo].[languages] ([language_id], [name]) VALUES (7, N'Bengali')
INSERT [dbo].[languages] ([language_id], [name]) VALUES (8, N'Gujarati')
GO
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (101, 50)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (101, 51)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (102, 52)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (102, 53)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (103, 54)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (103, 55)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (103, 56)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (104, 54)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (104, 56)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (105, 54)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (105, 55)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (106, 57)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (106, 58)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (107, 59)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (107, 60)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (108, 61)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (108, 62)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (108, 63)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (109, 57)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (109, 59)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (109, 64)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (110, 65)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (110, 66)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (111, 67)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (111, 68)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (112, 69)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (112, 70)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (113, 71)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (113, 72)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (114, 73)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (114, 74)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (115, 75)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (115, 76)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (116, 77)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (116, 78)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (117, 69)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (117, 79)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (118, 80)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (118, 81)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (119, 82)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (119, 83)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (120, 84)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (120, 85)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (121, 86)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (121, 87)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (122, 88)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (122, 89)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (123, 90)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (123, 91)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (124, 92)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (124, 93)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (125, 54)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (125, 94)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (125, 95)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (126, 54)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (126, 94)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (126, 95)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (127, 150)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (127, 151)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (128, 61)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (128, 152)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (129, 51)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (129, 153)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (130, 61)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (130, 154)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (131, 154)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (131, 155)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (132, 156)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (132, 157)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (133, 158)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (133, 159)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (134, 160)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (134, 161)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (135, 162)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (135, 163)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (136, 164)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (136, 165)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (137, 95)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (137, 166)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (138, 95)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (138, 167)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (139, 164)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (139, 168)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (140, 169)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id]) VALUES (140, 170)
GO
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (101, N'K.G.F: Chapter 2', N'Bollywood', 2022, CAST(8.4 AS Decimal(3, 1)), N'Hombale Films', 3)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (102, N'Doctor Strange in the Multiverse of Madness', N'Hollywood', 2022, CAST(7.0 AS Decimal(3, 1)), N'Marvel Studios', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (103, N'Thor: The Dark World ', N'Hollywood', 2013, CAST(6.8 AS Decimal(3, 1)), N'Marvel Studios', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (104, N'Thor: Ragnarok ', N'Hollywood', 2017, CAST(7.9 AS Decimal(3, 1)), N'Marvel Studios', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (105, N'Thor: Love and Thunder ', N'Hollywood', 2022, CAST(6.8 AS Decimal(3, 1)), N'Marvel Studios', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (106, N'Sholay', N'Bollywood', 1975, CAST(8.1 AS Decimal(3, 1)), N'United Producers', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (107, N'Dilwale Dulhania Le Jayenge', N'Bollywood', 1995, CAST(8.0 AS Decimal(3, 1)), N'Yash Raj Films', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (108, N'3 Idiots', N'Bollywood', 2009, CAST(8.4 AS Decimal(3, 1)), N'Vinod Chopra Films', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (109, N'Kabhi Khushi Kabhie Gham', N'Bollywood', 2001, CAST(7.4 AS Decimal(3, 1)), N'Dharma Productions', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (110, N'Bajirao Mastani ', N'Bollywood', 2015, CAST(7.2 AS Decimal(3, 1)), NULL, 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (111, N'The Shawshank Redemption', N'Hollywood', 1994, CAST(9.3 AS Decimal(3, 1)), N'Castle Rock Entertainment', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (112, N'Inception', N'Hollywood', 2010, CAST(8.8 AS Decimal(3, 1)), N'Warner Bros. Pictures', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (113, N'Interstellar', N'Hollywood', 2014, CAST(8.6 AS Decimal(3, 1)), N'Warner Bros. Pictures', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (114, N'Tenet', N'Hollywood', 2020, NULL, N'Syncopy', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (115, N'The Pursuit of Happyness', N'Hollywood', 2006, CAST(8.0 AS Decimal(3, 1)), N'Columbia Pictures', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (116, N'Gladiator', N'Hollywood', 2000, CAST(8.5 AS Decimal(3, 1)), N'Universal Pictures  ', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (117, N'Titanic', N'Hollywood', 1997, CAST(7.9 AS Decimal(3, 1)), N'Paramount Pictures', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (118, N'It''s a Wonderful Life', N'Hollywood', 1946, CAST(8.6 AS Decimal(3, 1)), N'Liberty Films', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (119, N'Avatar', N'Hollywood', 2009, CAST(7.8 AS Decimal(3, 1)), N'20th Century Fox', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (120, N'The Godfather', N'Hollywood', 1972, CAST(9.2 AS Decimal(3, 1)), N'Paramount Pictures', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (121, N'The Dark Knight', N'Hollywood', 2008, CAST(9.0 AS Decimal(3, 1)), N'Syncopy', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (122, N'Schindler''s List', N'Hollywood', 1993, CAST(9.0 AS Decimal(3, 1)), N'Universal Pictures', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (123, N'Jurassic Park', N'Hollywood', 1993, CAST(8.2 AS Decimal(3, 1)), N'Universal Pictures', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (124, N'Parasite', N'Hollywood', 2019, CAST(8.5 AS Decimal(3, 1)), NULL, 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (125, N'Avengers: Endgame', N'Hollywood', 2019, CAST(8.4 AS Decimal(3, 1)), N'Marvel Studios', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (126, N'Avengers: Infinity War', N'Hollywood', 2018, CAST(8.4 AS Decimal(3, 1)), N'Marvel Studios', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (127, N'Pather Panchali', N'Bollywood', 1955, CAST(8.3 AS Decimal(3, 1)), N'Government of West Bengal', 7)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (128, N'Taare Zameen Par', N'Bollywood', 2007, CAST(8.3 AS Decimal(3, 1)), NULL, 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (129, N'Munna Bhai M.B.B.S.', N'Bollywood', 2003, CAST(8.1 AS Decimal(3, 1)), N'Vinod Chopra Productions', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (130, N'PK', N'Bollywood', 2014, CAST(8.1 AS Decimal(3, 1)), N'Vinod Chopra Films', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (131, N'Sanju', N'Bollywood', 2018, CAST(7.6 AS Decimal(3, 1)), N'Vinod Chopra Films', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (132, N'Pushpa: The Rise - Part 1', N'Bollywood', 2021, CAST(7.6 AS Decimal(3, 1)), N'Mythri Movie Makers', 2)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (133, N'RRR', N'Bollywood', 2022, CAST(8.0 AS Decimal(3, 1)), N'DVV Entertainment', 2)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (134, N'Baahubali: The Beginning', N'Bollywood', 2015, CAST(8.0 AS Decimal(3, 1)), N'Arka Media Works', 2)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (135, N'The Kashmir Files', N'Bollywood', 2022, CAST(8.3 AS Decimal(3, 1)), N'Zee Studios', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (136, N'Bajrangi Bhaijaan', N'Bollywood', 2015, CAST(8.1 AS Decimal(3, 1)), N'Salman Khan Films', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (137, N'Captain America: The First Avenger', N'Hollywood', 2011, CAST(6.9 AS Decimal(3, 1)), N'Marvel Studios', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (138, N'Captain America: The Winter Soldier', N'Hollywood', 2014, CAST(7.8 AS Decimal(3, 1)), N'Marvel Studios', 5)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (139, N'Race 3', N'Bollywood', 2018, CAST(1.9 AS Decimal(3, 1)), N'Salman Khan Films', 1)
INSERT [dbo].[movies] ([movie_id], [title], [industry], [release_year], [imdb_rating], [studio], [language_id]) VALUES (140, N'Shershaah', N'Bollywood', 2021, CAST(8.4 AS Decimal(3, 1)), N'Dharma Productions', 1)
GO
ALTER TABLE [dbo].[movie_actor]  WITH NOCHECK ADD FOREIGN KEY([actor_id])
REFERENCES [dbo].[actors] ([actor_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[movie_actor]  WITH NOCHECK ADD FOREIGN KEY([movie_id])
REFERENCES [dbo].[movies] ([movie_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[movies]  WITH NOCHECK ADD FOREIGN KEY([language_id])
REFERENCES [dbo].[languages] ([language_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
