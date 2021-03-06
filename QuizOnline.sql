USE [master]
GO
/****** Object:  Database [Quiz_Online]    Script Date: 03/04/2021 3:52:04 PM ******/
CREATE DATABASE [Quiz_Online]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quiz_Online', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Quiz_Online.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Quiz_Online_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Quiz_Online_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Quiz_Online] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quiz_Online].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quiz_Online] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quiz_Online] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quiz_Online] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quiz_Online] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quiz_Online] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quiz_Online] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Quiz_Online] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quiz_Online] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quiz_Online] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quiz_Online] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quiz_Online] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quiz_Online] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quiz_Online] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quiz_Online] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quiz_Online] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Quiz_Online] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quiz_Online] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quiz_Online] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quiz_Online] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quiz_Online] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quiz_Online] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quiz_Online] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quiz_Online] SET RECOVERY FULL 
GO
ALTER DATABASE [Quiz_Online] SET  MULTI_USER 
GO
ALTER DATABASE [Quiz_Online] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quiz_Online] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quiz_Online] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quiz_Online] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Quiz_Online] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Quiz_Online', N'ON'
GO
USE [Quiz_Online]
GO
/****** Object:  Table [dbo].[account]    Script Date: 03/04/2021 3:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[email] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [varchar](300) NOT NULL,
	[role] [bit] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[answer]    Script Date: 03/04/2021 3:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[answer_content] [nvarchar](300) NOT NULL,
	[questionId] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK__answer__6836B9746D7306AB] PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historyQuiz]    Script Date: 03/04/2021 3:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[historyQuiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subjectId] [varchar](20) NOT NULL,
	[time] [datetime] NOT NULL,
	[correct_answer] [int] NOT NULL,
	[grade] [float] NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK__historyQ__3213E83FF60AD240] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[question]    Script Date: 03/04/2021 3:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[question_content] [nvarchar](300) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[subjectId] [varchar](20) NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reviewQuiz]    Script Date: 03/04/2021 3:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviewQuiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[historyQuizId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[answerId] [int] NULL,
 CONSTRAINT [PK_reviewQuiz] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subject]    Script Date: 03/04/2021 3:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subject](
	[subjectId] [varchar](20) NOT NULL,
	[subjectName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[account] ([email], [name], [password], [role], [status]) VALUES (N'a@gmail.com', N'long', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0)
INSERT [dbo].[account] ([email], [name], [password], [role], [status]) VALUES (N'se140810@gmail.com', N'Dat Do', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 0, 0)
INSERT [dbo].[account] ([email], [name], [password], [role], [status]) VALUES (N'se140811@gmail.com', N'Dang Minh', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0)
INSERT [dbo].[account] ([email], [name], [password], [role], [status]) VALUES (N'se140812@gmail.com', N'An Nguy', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0)
INSERT [dbo].[account] ([email], [name], [password], [role], [status]) VALUES (N'se140814@gmail.com', N'Long', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, 1)
SET IDENTITY_INSERT [dbo].[answer] ON 

INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (1, N'picking', 7, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (2, N'picking', 7, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (3, N'picking', 7, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (4, N'picking', 7, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (5, N'more convenient', 8, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (6, N'as convenient', 8, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (7, N'most convenient', 8, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (8, N'so convenient', 8, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (9, N'to understand', 9, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (10, N'to study', 9, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (11, N'to know', 9, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (12, N'find', 9, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (13, N'costs', 10, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (14, N'will cost', 10, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (15, N'would cost', 10, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (16, N'cost', 10, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (17, N'calls', 11, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (18, N'would call', 11, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (19, N'will call', 11, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (20, N'calling', 11, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (21, N'are', 12, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (22, N'will be', 12, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (23, N'were', 12, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (24, N'is', 12, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (25, N'don’t come', 13, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (26, N'didn’t come', 13, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (27, N'doesn’t come', 13, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (28, N'had not come', 13, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (29, N'goes', 14, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (30, N'will go', 14, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (31, N'would go', 14, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (32, N'go', 14, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (33, N'would not have', 15, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (34, N'will not have', 15, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (35, N'wouldn’t have had', 15, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (36, N'has', 15, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (37, N'gets', 16, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (38, N'will get', 16, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (39, N'got', 16, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (40, N'had got', 16, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (41, N'has', 17, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (42, N'will have', 17, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (43, N'have', 17, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (44, N'had', 17, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (45, N'am', 18, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (46, N'be

', 18, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (47, N'were', 18, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (48, N'had been', 18, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (49, N'hadn’t had', 19, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (50, N'haven’t had', 19, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (51, N'don’t have', 19, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (52, N'didn’t have', 19, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (53, N'to sell', 20, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (54, N'sell', 20, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (55, N'sold', 20, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (56, N'will sell', 20, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (57, N'were not', 21, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (58, N'wasn’t', 21, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (59, N'aren’t', 21, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (60, N'hadn’t been', 21, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (61, N'will enjoy', 22, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (62, N'would enjoy

', 22, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (63, N'would have enjoyed', 22, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (64, N'enjoyed', 22, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (65, N'has', 23, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (66, N'will have', 23, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (67, N'had had', 23, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (68, N'had', 23, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (69, N'would not have had', 24, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (70, N'will not have', 24, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (71, N'does not have', 24, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (72, N'would not have', 24, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (73, N'would not be', 25, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (74, N'will not be', 25, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (75, N'is not', 25, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (76, N'would not have been', 25, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (77, N'resigned', 26, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (78, N'will resign', 26, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (79, N'resigns', 26, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (80, N'to resign', 26, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (81, N'asking', 27, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (82, N'will ask', 27, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (83, N'asked', 27, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (84, N'asks', 27, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (85, N'not to see', 28, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (86, N'didn’t see', 28, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (87, N'don’t see', 28, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (88, N'hadn’t seen', 28, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (89, N'hadn''t', 29, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (90, N'hadn''t been', 29, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (91, N'wouldn''t be', 29, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (92, N'wasn''t', 29, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (93, N'wouldn''t have been', 30, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (94, N'would have been', 30, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (95, N'wouldn’t be', 30, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (96, N'would be', 30, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (97, N'were asked', 31, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (98, N'would ask', 31, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (99, N'had been asked', 31, 0)
GO
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (100, N'asked', 31, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (101, N'sssss', 32, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (102, N'she had done', 32, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (103, N'she does', 32, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (104, N'she did', 32, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (105, N'ddungs', 33, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (106, N'have stolen', 33, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (110, N'were to steal', 33, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (111, N'steal', 33, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (112, N'was', 39, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (113, N'were', 39, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (114, N'to be', 39, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (115, N' to was', 39, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (117, N'duck/go', 40, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (118, N'ducks/go', 40, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (119, N'ducks/went', 40, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (120, N'duck/went', 40, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (121, N'saw/year', 41, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (122, N'seen/weeks', 41, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (123, N'see/months', 41, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (124, N'saw/months', 41, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (125, N'won', 42, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (126, N'to won', 42, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (127, N'win', 42, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (128, N'winning', 42, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (129, N'left', 43, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (130, N'leave', 43, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (131, N'leaving', 43, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (132, N'had left', 43, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (133, N'see', 44, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (134, N'saw', 44, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (135, N'seing', 44, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (136, N'seen', 44, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (137, N'do/does', 45, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (138, N'do/do', 45, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (139, N'do/did', 45, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (140, N'did/did', 45, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (141, N'like', 46, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (142, N'liked', 46, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (143, N'didn''t like', 46, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (144, N'didn''t liked', 46, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (145, N'studies', 47, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (146, N'study', 47, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (147, N'studied', 47, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (148, N'were study', 47, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (149, N'have you joined', 48, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (150, N'did you joined', 48, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (151, N'did you join', 48, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (152, N'have you ever joined', 48, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (153, N'Did you ever worked', 49, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (154, N'Have you ever worked', 49, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (155, N'Worked you', 49, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (156, N'Didn''t you have worked', 49, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (157, N'I never heard', 50, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (158, N'I didn''t hear', 50, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (159, N'I used to hear', 50, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (160, N'I''ve ever heard', 50, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (161, N'I never dealt with.', 51, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (162, N'I never had to deal with.', 51, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (163, N'I''ve ever had to deal with.', 51, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (164, N'I''ve never had to deal with', 51, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (165, N'I spoke', 52, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (166, N'I''ve already spoken', 52, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (167, N'I didn''t spoked', 52, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (168, N'I speaked', 52, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (169, N'We have signed', 53, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (170, N'We signed', 53, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (171, N'We haven''t signed', 53, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (172, N'We have sign', 53, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (173, N'I come back', 54, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (174, N'I came back', 54, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (175, N'I never came back', 54, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (176, N'I''ve just come back', 54, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (177, N'rised _ falled', 55, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (178, N'rose _ fell', 55, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (179, N'have risen _ have fallen', 55, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (180, N'rose _ have fallen', 55, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (181, N'listened _ I haven''t said', 56, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (182, N'didn''t listen _ I say', 56, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (183, N'haven''t listened _ I''ve said back', 56, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (184, N'listened _ saying', 56, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (185, N'you haven''t read', 57, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (186, N'you didn''t read', 57, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (187, N'you don''t read', 57, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (188, N'you read not.', 57, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (189, N'buy', 58, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (190, N'to buy', 58, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (191, N'buying', 58, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (192, N'bought', 58, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (193, N'write', 59, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (194, N'writes', 59, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (195, N'wrote', 59, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (196, N'writing', 59, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (197, N'haven''t seen', 60, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (198, N'hasn''t seen', 60, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (199, N'haven''t see', 60, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (200, N'hasn''t see', 60, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (201, N'haven''t had', 61, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (202, N'hasn''t had', 61, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (203, N'haven''t have', 61, 0)
GO
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (204, N'hasn''t has', 61, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (207, N'4', 62, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (208, N'5', 62, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (209, N'6', 62, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (210, N'7', 62, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (211, N'3', 63, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (212, N'4', 63, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (213, N'5', 63, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (214, N'6', 63, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (215, N'6', 64, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (216, N'7', 64, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (217, N'8', 64, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (218, N'9', 64, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (219, N'4', 65, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (220, N'5', 65, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (221, N'6', 65, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (222, N'7', 65, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (223, N'8', 66, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (224, N'9', 66, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (225, N'10', 66, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (226, N'11', 66, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (227, N'6', 67, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (228, N'7', 67, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (229, N'8', 67, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (230, N'9', 67, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (231, N'10', 68, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (232, N'11', 68, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (233, N'12', 68, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (234, N'13', 68, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (235, N'30', 69, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (236, N'31', 69, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (237, N'32', 69, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (238, N'33', 69, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (239, N'40', 70, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (240, N'41', 70, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (241, N'42', 70, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (242, N'43', 70, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (243, N'60', 71, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (244, N'61', 71, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (245, N'62', 71, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (246, N'63', 71, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (247, N'94', 74, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (248, N'95', 74, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (249, N'96', 74, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (250, N'97', 74, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (251, N'77', 75, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (252, N'78', 75, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (253, N'79', 75, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (254, N'80', 75, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (255, N'70', 76, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (256, N'71', 76, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (257, N'72', 76, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (258, N'73', 76, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (259, N'75', 77, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (260, N'76', 77, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (261, N'77', 77, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (262, N'78', 77, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (263, N'43', 78, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (264, N'44', 78, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (265, N'45', 78, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (266, N'46', 78, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (267, N'64', 80, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (268, N'65', 80, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (269, N'66', 80, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (270, N'67', 80, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (271, N'73', 79, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (272, N'70', 79, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (273, N'71', 79, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (274, N'72', 79, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (275, N'74', 81, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (276, N'75', 81, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (277, N'76', 81, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (278, N'63', 82, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (279, N'64', 82, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (280, N'65', 82, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (281, N'66', 82, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (282, N'60', 83, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (283, N'61', 83, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (284, N'62', 83, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (285, N'63', 83, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (286, N'94', 84, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (287, N'93', 84, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (288, N'92', 84, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (289, N'91', 84, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (290, N'55', 85, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (291, N'56', 85, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (292, N'57', 85, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (293, N'58', 85, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (294, N'93', 86, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (296, N'94', 86, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (297, N'96', 86, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (298, N'97', 86, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (299, N'77', 81, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (348, N'333', 108, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (349, N'1111', 108, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (350, N'2222', 108, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (351, N'3333', 108, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (352, N'a', 109, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (353, N'ab', 109, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (354, N'ac', 109, 0)
GO
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (355, N'ad', 109, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (356, N'a4', 110, 1)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (357, N'a1', 110, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (358, N'a2', 110, 0)
INSERT [dbo].[answer] ([answerId], [answer_content], [questionId], [status]) VALUES (359, N'a3', 110, 0)
SET IDENTITY_INSERT [dbo].[answer] OFF
SET IDENTITY_INSERT [dbo].[historyQuiz] ON 

INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (1, N'If', CAST(N'2021-02-22 21:18:39.273' AS DateTime), 3, 3, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (4, N'Math', CAST(N'2021-02-22 21:27:28.963' AS DateTime), 4, 4, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (12, N'If', CAST(N'2021-02-23 15:10:38.450' AS DateTime), 5, 5, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (13, N'Math', CAST(N'2021-02-23 15:12:06.290' AS DateTime), 9, 9, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (14, N'If', CAST(N'2021-02-23 16:26:31.267' AS DateTime), 7, 7, N'se140810@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (15, N'If', CAST(N'2021-02-24 07:03:47.193' AS DateTime), 0, 0, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (16, N'If', CAST(N'2021-02-24 20:11:16.383' AS DateTime), 2, 2, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (17, N'If', CAST(N'2021-02-24 20:12:25.637' AS DateTime), 0, 0, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (18, N'If', CAST(N'2021-02-24 20:15:56.547' AS DateTime), 0, 0, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (19, N'Math', CAST(N'2021-02-24 20:18:13.410' AS DateTime), 2, 2, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (20, N'Math', CAST(N'2021-03-01 07:17:46.747' AS DateTime), 3, 3, N'a@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (21, N'Math', CAST(N'2021-03-01 07:18:13.037' AS DateTime), 1, 1, N'a@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (22, N'Math', CAST(N'2021-04-03 15:32:16.527' AS DateTime), 0, 0, N'se140811@gmail.com')
INSERT [dbo].[historyQuiz] ([id], [subjectId], [time], [correct_answer], [grade], [email]) VALUES (23, N'If', CAST(N'2021-04-03 15:38:36.663' AS DateTime), 0, 0, N'se140811@gmail.com')
SET IDENTITY_INSERT [dbo].[historyQuiz] OFF
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (7, N'Look! Some children are ____________the buffaloes.', CAST(N'2019-03-22 09:00:00.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (8, N'Is living in the city _________ than living in the country?', CAST(N'2019-12-18 08:27:00.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (9, N'He is surprised __________that there are 54 ethnic groups in our country.', CAST(N'2019-10-10 15:24:00.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (10, N'If it ……………………… too much, I will buy the smaller one.', CAST(N'2019-05-15 14:50:00.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (11, N'She …………………….. if she has time.', CAST(N'2020-10-15 03:06:00.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (12, N'If the class. ………………………. full, we will find another one.', CAST(N'2019-07-24 20:32:56.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (13, N'What will we do if the taxi ………………………..?', CAST(N'2019-06-07 11:49:12.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (14, N'If it snowed this summer, we …………………… skiing.', CAST(N'2019-02-02 10:18:20.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (15, N'If you drove more carefully, you ………………….so many accidents.', CAST(N'2019-03-05 19:50:10.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (16, N'If he ……………………….. up earlier, he’d get to work on time.', CAST(N'2020-04-16 12:29:57.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (17, N'I would tell you more about it if we ……………………………… more time.', CAST(N'2019-12-24 23:48:55.000' AS DateTime), N'Math', 0)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (18, N'If I ……………………..you, I wouldn’t worry about going to university.', CAST(N'2019-09-17 11:18:32.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (19, N'If you ………………………… any money, I’d give you some.', CAST(N'2020-07-17 20:50:56.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (20, N'You’d earn more money if you …………………. more products.', CAST(N'2019-05-01 22:06:40.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (21, N'If I ……………………. so busy yesterday, I would have visited you.', CAST(N'2020-04-07 06:04:45.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (22, N'If you had seen the film, you …………………. it.', CAST(N'2019-08-07 23:39:07.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (23, N'She would have gone to the university if she ……………… the opportunity.', CAST(N'2019-06-15 01:03:39.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (24, N'If he had been more careful, he ……………………….. an accident.', CAST(N'2020-10-24 18:17:51.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (25, N'If you’d stayed at home, there …………………………. any trouble.', CAST(N'2019-09-15 21:19:44.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (26, N'What would you do if he………………………. tomorrow?', CAST(N'2019-06-24 01:14:36.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (27, N'I’ll do it if he ………………………….. me.', CAST(N'2019-01-20 15:25:12.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (28, N'I wouldn’t have believed it if I………………… it with my own eyes.', CAST(N'2019-03-24 11:00:58.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (29, N'I would have visited you before if there _____ quite a lot of people in your house..............', CAST(N'2019-02-25 09:19:35.000' AS DateTime), N'Math', 0)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (30, N'If you had caught the bus, you _____ late for work.', CAST(N'2020-11-18 13:23:40.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (31, N'If I _____, I would express my feelings.', CAST(N'2020-12-01 20:26:44.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (32, N'If _____ as I told her, she would have succeeded.', CAST(N'2019-10-17 09:42:46.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (33, N'Will you be angry if I _____ your pocket dictionary?', CAST(N'2019-04-01 16:22:39.000' AS DateTime), N'If', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (39, N'I (be)___ a student in Moloxop School in 1998.', CAST(N'2020-09-05 05:38:59.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (40, N'A number of (duck) ___ (go) ___ through here, yesterday.', CAST(N'2019-10-31 00:31:24.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (41, N'I last (see)___ her at her house two ____ ago.', CAST(N'2020-02-13 09:59:28.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (42, N'She (win) ___ the gold medal in 1986.', CAST(N'2020-02-28 00:13:24.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (43, N'He had taught in this school before he (leave)____ for London.', CAST(N'2020-04-28 06:50:15.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (44, N'I didn''t (see)_____ you before.', CAST(N'2019-07-26 21:52:08.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (45, N'What did you (do) ______ last night? - I (do) ______ my homework.', CAST(N'2020-09-21 17:25:09.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (46, N'He (like)_________ tomatoes before. But, I am eating it now.', CAST(N'2020-03-08 14:08:27.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (47, N'I (study)__________ French when I was a child.', CAST(N'2020-01-29 11:13:38.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (48, N'When ____________ the school?', CAST(N'2019-06-13 08:52:22.000' AS DateTime), N'Tense', 0)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (49, N'_____________ in England?', CAST(N'2019-03-11 14:15:56.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (50, N'That''s the best speech _________', CAST(N'2020-12-16 20:10:45.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (51, N'He''s the most difficult housemate _____________________', CAST(N'2019-11-27 08:02:41.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (52, N'______ to him last week.', CAST(N'2020-12-16 20:10:45.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (53, N'_____a contract last year and it is still valid.', CAST(N'2019-03-05 12:05:11.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (54, N'______ from a business trip to France.', CAST(N'2020-12-14 07:30:09.000' AS DateTime), N'Tense', 0)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (55, N'Prices ________ in 1995 but then _____ in 1996.', CAST(N'2020-08-13 16:48:35.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (56, N'You ____________ to a word ____________', CAST(N'2019-12-26 08:02:24.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (57, N'I can''t believe that ________________ the news.

', CAST(N'2019-06-30 08:21:50.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (58, N'We (buy)..............a new lamp.', CAST(N'2019-02-10 11:31:21.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (59, N'He (write)..............five letters.', CAST(N'2019-02-21 04:27:33.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (60, N'She (not/ see)..............him for a long time.', CAST(N'2019-08-21 04:02:38.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (61, N'No, he (have/ not)..............the time yet.', CAST(N'2019-10-18 20:57:33.000' AS DateTime), N'Tense', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (62, N'1 + 5 =', CAST(N'2020-11-10 00:57:27.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (63, N'1 + 3 =', CAST(N'2020-01-31 16:51:10.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (64, N'	
2 + 6 =', CAST(N'2019-09-20 19:24:23.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (65, N'	
1 + 4 =', CAST(N'2020-01-10 05:44:44.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (66, N'2 + 8 =', CAST(N'2020-03-16 20:15:48.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (67, N'3 + 6 =', CAST(N'2019-11-29 15:28:05.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (68, N'3 + 7 =', CAST(N'2020-07-05 04:19:55.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (69, N'26 + 5 =', CAST(N'2020-02-18 07:12:09.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (70, N'6 + 37 =', CAST(N'2019-10-19 16:40:48.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (71, N'56 + 6 =', CAST(N'2020-10-24 18:56:10.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (74, N'86 + 8 =', CAST(N'2019-04-02 06:55:18.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (75, N'67 + 9 =', CAST(N'2020-12-04 08:41:51.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (76, N'6 + 66 =', CAST(N'2019-04-02 06:55:18.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (77, N'57 + 18 =', CAST(N'2020-10-24 18:56:10.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (78, N'16 + 27 =', CAST(N'2020-07-06 13:06:23.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (79, N'57 + 16 =', CAST(N'2019-02-13 00:32:15.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (80, N'
46 + 18 =', CAST(N'2019-04-28 11:33:39.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (81, N'58 + 16 =', CAST(N'2020-01-20 02:31:38.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (82, N'36 + 27 =', CAST(N'2019-04-19 05:00:49.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (83, N'26 + 35 =', CAST(N'2019-03-08 00:02:36.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (84, N'36 +58 =', CAST(N'2019-03-25 05:14:30.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (85, N'16 + 39 =', CAST(N'2019-12-17 12:27:56.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (86, N'67 + 26 =', CAST(N'2020-07-06 13:06:23.000' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (108, N'111 + 222 =', CAST(N'2021-02-23 16:43:05.547' AS DateTime), N'Math', 1)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (109, N'a', CAST(N'2021-02-27 13:43:05.313' AS DateTime), N'If', 0)
INSERT [dbo].[question] ([questionId], [question_content], [createDate], [subjectId], [status]) VALUES (110, N'a', CAST(N'2021-03-01 07:16:07.437' AS DateTime), N'If', 1)
SET IDENTITY_INSERT [dbo].[question] OFF
SET IDENTITY_INSERT [dbo].[reviewQuiz] ON 

INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (8, 19, 108, 348)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (9, 19, 64, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (10, 19, 9, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (11, 19, 75, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (12, 19, 67, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (13, 19, 65, 222)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (14, 19, 70, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (15, 19, 69, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (16, 19, 74, 247)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (17, 19, 82, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (18, 20, 71, 244)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (19, 20, 63, 212)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (20, 20, 69, 236)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (21, 20, 68, 231)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (22, 20, 76, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (23, 20, 83, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (24, 20, 65, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (25, 20, 108, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (26, 20, 81, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (27, 20, 86, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (28, 21, 86, 294)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (29, 21, 9, 9)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (30, 21, 68, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (31, 21, 81, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (32, 21, 108, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (33, 21, 74, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (34, 21, 64, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (35, 21, 66, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (36, 21, 77, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (37, 21, 65, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (38, 22, 70, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (39, 22, 67, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (40, 22, 82, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (41, 22, 66, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (42, 22, 108, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (43, 22, 80, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (44, 22, 68, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (45, 22, 79, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (46, 22, 74, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (47, 22, 86, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (48, 23, 15, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (49, 23, 14, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (50, 23, 24, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (51, 23, 11, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (52, 23, 26, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (53, 23, 110, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (54, 23, 16, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (55, 23, 33, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (56, 23, 12, NULL)
INSERT [dbo].[reviewQuiz] ([id], [historyQuizId], [questionId], [answerId]) VALUES (57, 23, 25, NULL)
SET IDENTITY_INSERT [dbo].[reviewQuiz] OFF
INSERT [dbo].[subject] ([subjectId], [subjectName]) VALUES (N'If', N'If quiz')
INSERT [dbo].[subject] ([subjectId], [subjectName]) VALUES (N'Math', N'Math quiz')
INSERT [dbo].[subject] ([subjectId], [subjectName]) VALUES (N'Tense', N'Tense quiz')
ALTER TABLE [dbo].[answer]  WITH CHECK ADD  CONSTRAINT [FK__answer__question__403A8C7D] FOREIGN KEY([questionId])
REFERENCES [dbo].[question] ([questionId])
GO
ALTER TABLE [dbo].[answer] CHECK CONSTRAINT [FK__answer__question__403A8C7D]
GO
ALTER TABLE [dbo].[historyQuiz]  WITH CHECK ADD  CONSTRAINT [FK__historyQu__email__656C112C] FOREIGN KEY([email])
REFERENCES [dbo].[account] ([email])
GO
ALTER TABLE [dbo].[historyQuiz] CHECK CONSTRAINT [FK__historyQu__email__656C112C]
GO
ALTER TABLE [dbo].[historyQuiz]  WITH CHECK ADD  CONSTRAINT [FK__historyQu__subje__6383C8BA] FOREIGN KEY([subjectId])
REFERENCES [dbo].[subject] ([subjectId])
GO
ALTER TABLE [dbo].[historyQuiz] CHECK CONSTRAINT [FK__historyQu__subje__6383C8BA]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD FOREIGN KEY([subjectId])
REFERENCES [dbo].[subject] ([subjectId])
GO
ALTER TABLE [dbo].[reviewQuiz]  WITH CHECK ADD  CONSTRAINT [FK_reviewQuiz_answer] FOREIGN KEY([answerId])
REFERENCES [dbo].[answer] ([answerId])
GO
ALTER TABLE [dbo].[reviewQuiz] CHECK CONSTRAINT [FK_reviewQuiz_answer]
GO
ALTER TABLE [dbo].[reviewQuiz]  WITH CHECK ADD  CONSTRAINT [FK_reviewQuiz_historyQuiz] FOREIGN KEY([historyQuizId])
REFERENCES [dbo].[historyQuiz] ([id])
GO
ALTER TABLE [dbo].[reviewQuiz] CHECK CONSTRAINT [FK_reviewQuiz_historyQuiz]
GO
ALTER TABLE [dbo].[reviewQuiz]  WITH CHECK ADD  CONSTRAINT [FK_reviewQuiz_question] FOREIGN KEY([questionId])
REFERENCES [dbo].[question] ([questionId])
GO
ALTER TABLE [dbo].[reviewQuiz] CHECK CONSTRAINT [FK_reviewQuiz_question]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD CHECK  (((50)>len([email]) AND len([email])>(6)))
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD CHECK  (((50)>len([name]) AND len([name])>(2)))
GO
USE [master]
GO
ALTER DATABASE [Quiz_Online] SET  READ_WRITE 
GO
