USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 28/07/2024 2:26:38 CH ******/
CREATE DATABASE [SWP391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP391] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP391] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP391]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[user_id] [nvarchar](20) NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[dob] [date] NULL,
	[gender] [nvarchar](10) NULL,
	[phone_number] [varchar](15) NULL,
	[avatar] [nvarchar](255) NULL,
	[specialization] [nvarchar](max) NULL,
	[role_id] [int] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[application_id] [int] IDENTITY(1,1) NOT NULL,
	[applicant_id] [nvarchar](20) NULL,
	[position_code] [varchar](50) NULL,
	[project_code] [varchar](50) NULL,
	[status] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[attendance_id] [int] IDENTITY(1,1) NOT NULL,
	[intern_id] [int] NULL,
	[date] [date] NULL,
	[status] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[attendance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[cer_id] [int] IDENTITY(1,1) NOT NULL,
	[cer_name] [varchar](255) NOT NULL,
	[issue_date] [date] NOT NULL,
	[project_code] [varchar](50) NOT NULL,
	[cer_img] [varchar](50) NULL,
	[cer_link] [nvarchar](255) NULL,
	[intern_id] [int] NULL,
	[sender_id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluations]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluations](
	[evaluation_id] [int] IDENTITY(1,1) NOT NULL,
	[intern_id] [int] NULL,
	[mentor_id] [nvarchar](20) NULL,
	[type] [nvarchar](50) NULL,
	[attitude_score] [int] NULL,
	[soft_skills_score] [int] NULL,
	[technical_skills_score] [int] NULL,
	[total_score] [nvarchar](50) NULL,
	[comment] [nvarchar](250) NULL,
	[project_code] [varchar](50) NULL,
	[position_code] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[evaluation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interns]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interns](
	[intern_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](20) NULL,
	[project_code] [varchar](50) NULL,
	[mentor_id] [nvarchar](20) NULL,
	[position_code] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[intern_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InternSchedule]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternSchedule](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](20) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewSchedule]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewSchedule](
	[interviewschedule_id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [nvarchar](20) NULL,
	[mentor_id] [nvarchar](50) NULL,
	[project_code] [varchar](50) NULL,
	[message] [nvarchar](max) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[Time] [time](7) NULL,
	[date_start] [datetime] NULL,
	[room] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[interviewschedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[message_id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [nvarchar](20) NULL,
	[receiver_id] [nvarchar](20) NULL,
	[message] [nvarchar](max) NOT NULL,
	[timestamp] [datetime] NULL,
	[subject] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[published_date] [datetime] NOT NULL,
	[image_url] [nvarchar](255) NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[user_id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[note_id] [int] IDENTITY(1,1) NOT NULL,
	[intern_id] [int] NULL,
	[note] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[note_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[notification_id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [nvarchar](20) NULL,
	[project_code] [varchar](50) NULL,
	[position_code] [varchar](50) NULL,
	[message] [nvarchar](max) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[Time] [time](7) NULL,
	[date_start] [datetime] NULL,
	[published_date] [datetime] NOT NULL,
	[room] [varchar](50) NULL,
	[link] [nvarchar](250) NULL,
	[receiver_id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[position_code] [varchar](50) NOT NULL,
	[position_name] [nvarchar](255) NOT NULL,
	[project_code] [varchar](50) NULL,
	[position_count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[position_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[project_code] [varchar](50) NOT NULL,
	[project_name] [nvarchar](255) NOT NULL,
	[mentor_id] [nvarchar](20) NULL,
	[project_details] [varchar](255) NULL,
	[project_img] [nvarchar](200) NULL,
	[project_startday] [date] NULL,
	[project_endday] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[project_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruitment](
	[message_id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [nvarchar](20) NULL,
	[receiver_id] [nvarchar](20) NULL,
	[message] [nvarchar](max) NOT NULL,
	[timestamp] [datetime] NULL,
	[mess_img] [nvarchar](200) NULL,
	[mess_title] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[date_start] [date] NULL,
	[date_end] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[report_id] [int] IDENTITY(1,1) NOT NULL,
	[intern_id] [int] NULL,
	[week] [int] NOT NULL,
	[report] [nvarchar](max) NOT NULL,
	[report_link] [nvarchar](255) NULL,
	[mentor_id] [nvarchar](255) NULL,
	[project_code] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WifiIPAddress]    Script Date: 28/07/2024 2:26:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WifiIPAddress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ipAddress] [varchar](50) NOT NULL,
	[user_id] [nvarchar](20) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'DX2401', N'huyennthe172781@fpt.edu.vn', N'Chien2003@', N'Nguyễn Thị Huyền ', CAST(N'2003-01-29' AS Date), N'Male', N'0877169947', N'images.png', N'NULL', 2, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE151297', N'hoangxbhe151297@fpt.edu.vn', N'User@1234', N'Hoàng Xuân Bách', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE153012', N'huypndhe153012@fpt.edu.vn', N'User@1235', N'Phan Nguyễn Đăng Huy', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE161222', N'daipvhe161222@fpt.edu.vn', N'User@1236', N'Phí Văn Đại', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE161815', N'anhvthe161815@fpt.edu.vn', N'User@1237', N'Trần Việt Anh', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE163378', N'duykhe163378@fpt.edu.vn', N'User@1238', N'Nguyễn Khánh Duy', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE170132', N'anhnvhe170132@fpt.edu.vn', N'A123456@', N'Nguyễn Việt Anh', CAST(N'2003-07-27' AS Date), N'Male', N'0866052283', N'img/IMG_8407.JPG', N'SW NodeJS', 5, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE170197', N'nguyenbphe170197@fpt.edu.vn', N'User@1240', N'Phạm Bình Nguyên', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE170470', N'huydvhe170470@fpt.edu.vn', N'User@1241', N'Đặng Vũ Huy', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE170497', N'hopndhe170497@fpt.edu.vn', N'User@1242', N'Nguyễn Đắc Hợp', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE170775', N'huydqhe170775@fpt.edu.vn', N'User@1243', N'Đỗ Quang Huy', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE171667', N'vinhnthe171667@fpt.edu.vn', N'User@1244', N'Nguyễn Thành Vinh', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE171881', N'hoanvhe171881@fpt.edu.vn', N'User@1245', N'Nguyễn Văn Hòa', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE172328', N'minhndhe172328@fpt.edu.vn', N'User@1246', N'Nguyễn Đức Minh', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE172374', N'hoangnhhe172374@fpt.edu.vn', N'User@1247', N'Nguyễn Hữu Hoàng', NULL, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE172730', N'dongnvhe172730@fpt.edu.vn', N'Chien2003@', N'Nguyễn Văn Đông', CAST(N'2003-06-28' AS Date), N'Male', N'0866052283', N'img/images.png', N'SW NodeJS', 5, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE176221', N'chiennxhe176221@fpt.edu.vn', N'Chien2003@', N'Nguyễn Xuân Chiến', CAST(N'2003-02-09' AS Date), N'male', N'0836663285', NULL, N'SW AI', 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HE176321', N'chiennvhe176321@fpt.edu.vn', N'Chien2003@', N'Nguyễn Xuân Chiến', CAST(N'2003-09-09' AS Date), N'Male', N'0836663285', N'images.png', N'SW NodeJS', 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HR001', N'dongnvhe172730@fe.edu.vn', N'Chien2003@', N'Nguyễn Văn Đông', CAST(N'2003-02-09' AS Date), N'Male', N'0389848201', N'images.png', N'SW AI', 3, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HR002', N'hr2@fe.edu.vn', N'Chien2003@', N'HR HR Two', CAST(N'1990-02-02' AS Date), N'Male', N'1234567891', N'avatar2.jpg', N'NULL', 3, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HR003', N'hr3@fe.edu.vn', N'Chien2003@', N'HR HR Three', CAST(N'1987-03-03' AS Date), N'Female', N'1234567892', N'avatar3.jpg', N'NULL', 3, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HR004', N'hr4@fe.edu.vn', N'Chien2003@', N'HR HR Four', CAST(N'1992-04-04' AS Date), N'Male', N'1234567893', N'avatar4.jpg', N'NULL', 3, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HR005', N'hr5@fe.edu.vn', N'Chien2003@', N'HR HR One', CAST(N'1985-01-01' AS Date), N'Female', N'1234567890', N'avatar1.jpg', N'NULL', 3, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'HS171487', N'huonghs171487@fpt.edu.vn', N'Chien2003@', N'Quach Thi Minh Huong', CAST(N'2003-08-25' AS Date), N'Male', N'0969729035', N'images.png', N'SW NodeJS', 6, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'IT001', N'admin@fe.edu.vn', N'Chien2003@', N'Nguyễn Văn Anh', CAST(N'1982-02-09' AS Date), N'Male', N'0389848201', N'images.png', N'NULL', 1, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'ME001', N'tuanvm001@fe.edu.vn', N'Chien2003@', N'Vương Minh Tuấn', CAST(N'1989-01-01' AS Date), N'Male', N'0123456789', N'images.png', N'NULL', 4, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'ME002', N'donglm@fe.edu.vn', N'Chien2003@', N'Le Mai Dong', CAST(N'2003-08-25' AS Date), N'female', N'0999999999', NULL, NULL, 4, 1)
INSERT [dbo].[Account] ([user_id], [username], [password], [full_name], [dob], [gender], [phone_number], [avatar], [specialization], [role_id], [is_active]) VALUES (N'ME003', N'duongtb@fe.edu.vn', N'Chien2003@', N'Tran Binh Duong', CAST(N'1988-01-01' AS Date), N'male', N'0987654321', NULL, NULL, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Evaluations] ON 

INSERT [dbo].[Evaluations] ([evaluation_id], [intern_id], [mentor_id], [type], [attitude_score], [soft_skills_score], [technical_skills_score], [total_score], [comment], [project_code], [position_code]) VALUES (3, 2, N'ME001', N'Midterm', 2, 4, 9, N'4.70', N'', N'PRJ001', N'PRJ001_POS1')
INSERT [dbo].[Evaluations] ([evaluation_id], [intern_id], [mentor_id], [type], [attitude_score], [soft_skills_score], [technical_skills_score], [total_score], [comment], [project_code], [position_code]) VALUES (4, 3, N'ME001', N'Midterm', 6, 7, 8, N'6.90', N'Good', N'PRJ001', N'PRJ001_POS1')
SET IDENTITY_INSERT [dbo].[Evaluations] OFF
GO
SET IDENTITY_INSERT [dbo].[Interns] ON 

INSERT [dbo].[Interns] ([intern_id], [user_id], [project_code], [mentor_id], [position_code]) VALUES (2, N'HE172730', N'PRJ001', N'ME001', N'PRJ001_POS1')
INSERT [dbo].[Interns] ([intern_id], [user_id], [project_code], [mentor_id], [position_code]) VALUES (3, N'HE170132', N'PRJ001', N'ME001', N'PRJ001_POS1')
SET IDENTITY_INSERT [dbo].[Interns] OFF
GO
SET IDENTITY_INSERT [dbo].[InterviewSchedule] ON 

INSERT [dbo].[InterviewSchedule] ([interviewschedule_id], [sender_id], [mentor_id], [project_code], [message], [title], [Time], [date_start], [room]) VALUES (16, N'HR001', N'ME003', N'FER001', N'Các bạn nhớ mang theo CV khi đến phỏng vấn', N'Lịch Phỏng Vấn', CAST(N'10:30:00' AS Time), CAST(N'2024-07-28T00:00:00.000' AS DateTime), N'BE-212')
INSERT [dbo].[InterviewSchedule] ([interviewschedule_id], [sender_id], [mentor_id], [project_code], [message], [title], [Time], [date_start], [room]) VALUES (17, N'HR001', N'ME003', N'FER002', N'Nho den dung gio', N'Phỏng Vấn ', CAST(N'10:30:00' AS Time), CAST(N'2024-07-30T00:00:00.000' AS DateTime), N'BE-211')
INSERT [dbo].[InterviewSchedule] ([interviewschedule_id], [sender_id], [mentor_id], [project_code], [message], [title], [Time], [date_start], [room]) VALUES (18, N'HR001', N'ME001', N'PRJ001', N'Các bạn nhớ đến đúng giờ nhé!!', N'Phỏng Vấn', CAST(N'10:30:00' AS Time), CAST(N'2024-08-04T00:00:00.000' AS DateTime), N'DE-222')
SET IDENTITY_INSERT [dbo].[InterviewSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([news_id], [published_date], [image_url], [title], [content], [user_id]) VALUES (1, CAST(N'2024-06-27T00:00:00.000' AS DateTime), N'img/z5558660041858_6d024a20258dbbf7cbb92da4e85b5f1c.jpg', N'Best free project management software of 2024', N'Trello is arguably the most popular project management tool worldwide. It was created in 2011 by a company called Fog Creek Software (now Glitch) and sold to Atlassian in 2017 for over $400 million. 

Trello offers a free plan for individuals and teams that want to manage their projects effectively. With the free plan, you can create up to 10 boards per workspace and unlimited project cards. You get unlimited file storage, although the size of a single file is capped at 10 MB. You can access the platform via the web or download the app on your mobile device, and Trello is notably friendly to mobile users.

The free plan supports two-factor authentication for extra security. Enabling this feature means that access won’t be granted to any user’s account except two modes of identification are provided (the first is the username and password and the second is usually a one-time pin sent to the user’s phone number or email address). 

With Trello, a lead project manager can easily assign tasks to their subordinates and track their progress in real-time. The free version alone provides ample features to manage projects effectively, but you’re free to subscribe to a premium plan to get access to advanced features such as organization-wide permissions, public board management, and single sign-on.', N'DX2401')
INSERT [dbo].[News] ([news_id], [published_date], [image_url], [title], [content], [user_id]) VALUES (2, CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'img/z5558660548864_01f11d4cae6404dc7b7805d8511ee4db.jpg', N'Email threats are becoming more dangerous than ever — so keep an eye on your inbox', N'Cyberattacks spread via email are still rising, and with generative artificial intelligence (AI), they have gotten even more dangerous, a new report from Barracuda Networks has claimed. 

After analyzing 69 million attacks across 4.5 million mailboxes over the past 12 months, Barracuda said business email compromise (BEC), conversation hijacking, and QR code attacks were all growing.

In fact, BEC attacks now make up a tenth (10.6%) of all email-based social engineering attacks, up from 8% in 2022, and up from 9% in 2021. At the same time, conversation hijacking made up 0.5% of all social engineering attacks in the past year, which is an increase of some 70%, compared to the 0.3% back in 2022.

Gmail and bit.ly
This method’s overall share is relatively small since it requires a lot of effort to execute, but the payout can still be significant, Barracuda warns. 

With conversation hijacking, a threat actor will compromise a person’s email account, and look for conversations with potential targets. They will then “hijack” the conversation, and reply to the latest email, continuing the chain of communication. That way, the victim has no reason not to trust the contents of the email, making distributing malware and stealing sensitive data that much easier.

Finally, around 1 in 20 mailboxes were targeted with QR code attacks, which are relatively successful since they mostly bypass traditional email filtering solutions. Furthermore, they make the victims use a personal device to scan the QR code, which is usually not protected by corporate security software.

The attackers will usually go for Gmail users, Barracuda added, since Gmail accounted for 22% of the domains used for social engineering. What’s more, bit.ly is the go-to tool for URL shortening, used in almost 40% of social engineering attacks. ', N'DX2401')
INSERT [dbo].[News] ([news_id], [published_date], [image_url], [title], [content], [user_id]) VALUES (3, CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'img/z5558660166269_adbee84d40ff479c22418383404d7850.jpg', N'NordVPN''s tracker blocker got a boost to help you fight back against online scams', N'One of the best VPN services around has just upgraded its protection against malware and tracking to help you not fall victim to ever-growing phishing attempts and online scams.

NordVPN was the first to introduce the concept of Threat Protection to the VPN market, the provider claims. That''s essentially a tracker, malware, and ad-blocker integrated directly into the virtual private network software. Now, as online threats are getting increasingly more sophisticated, the team felt the need to give it a boost.

NordVPN Threat Protection Pro is currently available on Windows and macOS only, at the time of writing, and comes with all the provider''s upper-tier plans. This means that if you are a Basic subscriber you need to upgrade your plan to use the new tool. 

What is NordVPN Threat Protection Pro?
Phishing attacks, malvertising incidents, and similar online scams are on the rise everywhere. What all these types of cyberattacks have in common is tricking people into clicking on malicious links through which criminals can inject malware software into their devices. And, while most of us perhaps learned to spot red flags for scammy messages, AI-powered tools are helping bad actors craft increasingly more convincing scams.

Let''s look at some data. In May alone, NordVPN’s Threat Protection Pro reportedly blocked over 5 billion intrusive ads, almost 40 billion trackers, and 60 million malware infection attempts. Britons were the most affected amounting to over 18 million incidents since the beginning of the year. This is an average of 97 malware-related incidents per device per month, compared to the US median of 89 monthly attempts.

These numbers are significant considering that, during the research period between  January 1 and May 31, criminals heavily impersonated popular brands to trick victims into clicking phishing links and downloading infected files. Malicious Office365 (86K impersonated URLs discovered), Gazprom (60K), AT&T (28K), Facebook (19K), and Bet365 (15K) were the most used to spread malware.

These results clearly show the need for better solutions to filter out these threats. Hence, Nord is committed to constantly updating its threat protections with new features.', N'DX2401')
INSERT [dbo].[News] ([news_id], [published_date], [image_url], [title], [content], [user_id]) VALUES (4, CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'img/z5558659993710_80db7707f37083998a9fa1a5861dc280.jpg', N'Trello offers a free plan for individuals ', N'Trello offers a free plan for individuals and teams that want to manage their projects effectively. With the free plan, you can create up to 10 boards per workspace and unlimited project cards. You get unlimited file storage, although the size of a single file is capped at 10 MB. You can access the platform via the web or download the app on your mobile device, and Trello is notably friendly to mobile users. The free plan supports two-factor authentication for extra security. Enabling this feature means that access won’t be granted to any user’s account except two modes of identification are provided (the first is the username and password and the second is usually a one-time pin sent to the user’s phone number or email address). With Trello, a lead project', N'DX2401')
INSERT [dbo].[News] ([news_id], [published_date], [image_url], [title], [content], [user_id]) VALUES (5, CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'img/z5558660054513_9e05209b6f5a92faa383eba5a90f7f68.jpg', N'Cyberattacks spread via email are still rising', N'Cyberattacks spread via email are still rising, and with generative artificial intelligence (AI), they have gotten even more dangerous, a new report from Barracuda Networks has claimed. After analyzing 69 million attacks across 4.5 million mailboxes over the past 12 months, Barracuda said business email compromise (BEC), conversation hijacking, and QR code attacks were all growing. In fact, BEC attacks now make up a tenth (10.6%) of all email-based social engineering attacks, up from 8% in 2022, and up from 9% in 2021. At the same time, conversation hijacking made up 0.5% of all social engineering attacks in the past year, which is an increase of some 70%, compared to the 0.3% back in 2022. Gmail and bit.ly This method’s overall share is relatively small since it requires a lot of effort to execute, but the payout can still be significant, Barracuda warns.', N'DX2401')
INSERT [dbo].[News] ([news_id], [published_date], [image_url], [title], [content], [user_id]) VALUES (6, CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'img/z5558660514244_cc649a8803efb7f436495c23073db205.jpg', N'One of the best VPN services around has just upgraded its protection against malware and tracking', N'One of the best VPN services around has just upgraded its protection against malware and tracking to help you not fall victim to ever-growing phishing attempts and online scams. NordVPN was the first to introduce the concept of Threat Protection to the VPN market, the provider claims. That''s essentially a tracker, malware, and ad-blocker integrated directly into the virtual private network software. Now, as online threats are getting increasingly more sophisticated, the team felt the need to give it a boost. NordVPN Threat Protection Pro is currently available on Windows and macOS only, at the time of writing, and comes with all the provider''s upper-tier plans. This means that if you are a Basic subscriber you need to upgrade your plan to use the new tool. What is NordVPN Threat Protection Pro? Phishing attacks, malvertising incidents, and similar online scams are on the rise everywhere.', N'DX2401')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([notification_id], [sender_id], [project_code], [position_code], [message], [title], [Time], [date_start], [published_date], [room], [link], [receiver_id]) VALUES (2, N'ME001', N'PRJ001', N'PRJ001_POS1', N'Nho den dung gio', N'Meeting', CAST(N'11:30:00' AS Time), CAST(N'2024-07-30T00:00:00.000' AS DateTime), CAST(N'2024-07-27T08:33:11.553' AS DateTime), N'BE-201', N'https://meet.google.com/zzx-cqzu-qkk?authuser=0', NULL)
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'FER001_POS1', N'Devloper', N'FER001', 4)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'FER001_POS2', N'Devloper', N'FER001', 5)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'FER002_POS1', N'Devloper', N'FER002', 4)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'FER002_POS2', N'Devloper', N'FER002', 3)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'FER002_POS3', N'Devloper', N'FER002', 2)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'PRJ001_POS1', N'Devloper', N'PRJ001', 3)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'PRJ001_POS2', N'BA', N'PRJ001', 4)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'PRJ002_POS1', N'Devloper', N'PRJ002', 4)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'PRJ002_POS2', N'Devloper', N'PRJ002', 1)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'SWP001_POS1', N'Devloper', N'SWP001', 5)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'SWP001_POS2', N'Devloper', N'SWP001', 5)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'SWP002_POS1', N'Devloper', N'SWP002', 4)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'SWP002_POS2', N'Devloper', N'SWP002', 1)
INSERT [dbo].[Positions] ([position_code], [position_name], [project_code], [position_count]) VALUES (N'SWP033_POS1', N'BA', N'SWP033', 1)
GO
INSERT [dbo].[Projects] ([project_code], [project_name], [mentor_id], [project_details], [project_img], [project_startday], [project_endday]) VALUES (N'FER001', N'Front-End web development with React', N'ME003', N'This project focuses on building interactive and responsive web applications using React, a popular JavaScript library.', N'img/html.jpg', CAST(N'2024-06-01' AS Date), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Projects] ([project_code], [project_name], [mentor_id], [project_details], [project_img], [project_startday], [project_endday]) VALUES (N'FER002', N'Front-End web development with React', N'ME003', N'This project focuses on building interactive and responsive web applications using React, a popular JavaScript library.', N'img/DX-LAB.jpg', CAST(N'2024-06-08' AS Date), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Projects] ([project_code], [project_name], [mentor_id], [project_details], [project_img], [project_startday], [project_endday]) VALUES (N'PRJ001', N'Java Web Application Development', N'ME001', N'This project aims to develop robust and scalable web applications using Java technologies. ', N'img/z5558660548864_01f11d4cae6404dc7b7805d8511ee4db.jpg', CAST(N'2024-06-01' AS Date), CAST(N'2024-07-07' AS Date))
INSERT [dbo].[Projects] ([project_code], [project_name], [mentor_id], [project_details], [project_img], [project_startday], [project_endday]) VALUES (N'PRJ002', N'Java Web Application Development', N'ME001', N'This project aims to develop robust and scalable web applications using Java technologies. ', N'img/Screen.png', CAST(N'2024-06-08' AS Date), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Projects] ([project_code], [project_name], [mentor_id], [project_details], [project_img], [project_startday], [project_endday]) VALUES (N'SWP001', N'Software development project', N'ME002', N'This project involves the complete software development lifecycle from requirement gathering to deployment. ', N'img/z5558660514244_cc649a8803efb7f436495c23073db205.jpg', CAST(N'2024-06-01' AS Date), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Projects] ([project_code], [project_name], [mentor_id], [project_details], [project_img], [project_startday], [project_endday]) VALUES (N'SWP002', N'Software development project1', N'ME002', N'This project involves the complete software development lifecycle from requirement gathering to deployment. ', N'img/lap-trinh-c.jpg', CAST(N'2024-06-08' AS Date), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Projects] ([project_code], [project_name], [mentor_id], [project_details], [project_img], [project_startday], [project_endday]) VALUES (N'SWP03', N'Student Management System', N'ME001', N'A system designed to efficiently manage stuff information, including enrollment, attendance, grades, and personal details. It streamlines administrative processes, improves communication between students and staff.', N'img/CSD.png', CAST(N'2024-07-28' AS Date), CAST(N'2024-08-08' AS Date))
INSERT [dbo].[Projects] ([project_code], [project_name], [mentor_id], [project_details], [project_img], [project_startday], [project_endday]) VALUES (N'SWP033', N'Stuff Management System', N'ME001', N'A system designed to efficiently manage stuff information, including enrollment, attendance, grades, and personal details. It streamlines administrative processes, improves communication between students and staff.', N'img/PRF.png', CAST(N'2024-07-30' AS Date), CAST(N'2024-08-10' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Recruitment] ON 

INSERT [dbo].[Recruitment] ([message_id], [sender_id], [receiver_id], [message], [timestamp], [mess_img], [mess_title], [status], [date_start], [date_end]) VALUES (3, N'ME001', N'HR001', N'1. Vị trí tuyển dụng: Lập trình viên C
Mô tả công việc:

Phát triển và duy trì các ứng dụng web sử dụng Java Servlets và JSP.
Thực hiện các yêu cầu liên quan đến quản lý tài khoản người dùng, bao gồm chức năng đăng nhập, đăng ký, xem danh sách người dùng, và chỉnh sửa thông tin tài khoản.
Làm việc với cơ sở dữ liệu SQL Server, bao gồm thiết kế bảng, viết truy vấn SQL, và tích hợp JDBC.
Sử dụng Bootstrap và CSS để thiết kế giao diện người dùng, đảm bảo tính thẩm mỹ và tương thích trên nhiều thiết bị.
Áp dụng các kỹ thuật và công cụ hiện đại để tạo hiệu ứng động và tăng tính tương tác cho ứng dụng web.
Tích hợp và kiểm tra các tệp Excel để tạo tài khoản người dùng và xác thực thông tin từ các tệp này.
Đảm bảo các chức năng hoạt động ổn định và an toàn theo yêu cầu của dự án.
Yêu cầu công việc:

Thành thạo ngôn ngữ lập trình Java và có kinh nghiệm làm việc với Java Servlets và JSP.
Có kinh nghiệm với cơ sở dữ liệu SQL Server và JDBC.
Biết sử dụng các công cụ và thư viện frontend như Bootstrap, CSS, và JavaScript.
Có kinh nghiệm xử lý và phân tích tệp Excel trong các ứng dụng web.
Hiểu biết về các nguyên tắc thiết kế giao diện người dùng và có khả năng tạo ra các giao diện thân thiện và dễ sử dụng.
Kỹ năng giải quyết vấn đề và khả năng làm việc độc lập cũng như trong nhóm.
Kinh nghiệm làm việc với các hệ thống quản lý dự án và theo dõi lỗi như JIRA là một lợi thế.
Quyền lợi:

Mức lương cạnh tranh và các chế độ đãi ngộ hấp dẫn.
Môi trường làm việc chuyên nghiệp và thân thiện.
Cơ hội phát triển nghề nghiệp và thăng tiến.
Tham gia các khóa đào tạo nâng cao kỹ năng và kiến thức chuyên môn.
Được đóng bảo hiểm xã hội, bảo hiểm y tế theo quy định của pháp luật.
Thông tin liên hệ:

Email: hr@dxlab.com
Số điện thoại: 0123 456 789
Địa chỉ: DX Lab, FPT University Hanoi', CAST(N'2024-07-19T13:35:41.167' AS DateTime), N'img/lap-trinh-c.jpg', N'Tuyển thực tập sinh tháng 7', N'Done', CAST(N'2024-07-20' AS Date), CAST(N'2024-07-30' AS Date))
SET IDENTITY_INSERT [dbo].[Recruitment] OFF
GO
SET IDENTITY_INSERT [dbo].[Reports] ON 

INSERT [dbo].[Reports] ([report_id], [intern_id], [week], [report], [report_link], [mentor_id], [project_code]) VALUES (2, 2, 1, N'Report week 1', N'https://docs.google.com/document/d/1cCRp2V6bxPchrqKNeW1GIs6-fTJ4ML_Q/edit', N'ME001', N'PRJ001')
INSERT [dbo].[Reports] ([report_id], [intern_id], [week], [report], [report_link], [mentor_id], [project_code]) VALUES (4, 2, 1, N'Report week 1', N'https://docs.google.com/document/d/1cCRp2V6bxPchrqKNeW1GIs6-fTJ4ML_Q/edit', N'ME001', N'PRJ001')
INSERT [dbo].[Reports] ([report_id], [intern_id], [week], [report], [report_link], [mentor_id], [project_code]) VALUES (5, 3, 1, N'Report 1', N'https://docs.google.com/document/d/1cCRp2V6bxPchrqKNeW1GIs6-fTJ4ML_Q/edit', N'ME001', N'PRJ001')
SET IDENTITY_INSERT [dbo].[Reports] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (6, N'Candidate')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'HR')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (5, N'Intern')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'IT Admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Lab Manage')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (4, N'Mentor')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[WifiIPAddress] ON 

INSERT [dbo].[WifiIPAddress] ([id], [ipAddress], [user_id], [created_at]) VALUES (1, N'192.168.1.94', N'IT001', CAST(N'2024-07-19T13:41:15.930' AS DateTime))
INSERT [dbo].[WifiIPAddress] ([id], [ipAddress], [user_id], [created_at]) VALUES (2, N'10.33.53.86', N'IT001', CAST(N'2024-07-19T13:45:00.660' AS DateTime))
SET IDENTITY_INSERT [dbo].[WifiIPAddress] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__F3DBC5728EF765B7]    Script Date: 28/07/2024 2:26:39 CH ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Role__783254B1BD5167D6]    Script Date: 28/07/2024 2:26:39 CH ******/
ALTER TABLE [dbo].[Role] ADD UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[Applications] ADD  DEFAULT ('Pending') FOR [status]
GO
ALTER TABLE [dbo].[Messages] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[Notes] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [published_date]
GO
ALTER TABLE [dbo].[Projects] ADD  DEFAULT (getdate()) FOR [project_startday]
GO
ALTER TABLE [dbo].[Recruitment] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([applicant_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([position_code])
REFERENCES [dbo].[Positions] ([position_code])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([project_code])
REFERENCES [dbo].[Projects] ([project_code])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([intern_id])
REFERENCES [dbo].[Interns] ([intern_id])
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD FOREIGN KEY([intern_id])
REFERENCES [dbo].[Interns] ([intern_id])
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Account_Sender] FOREIGN KEY([sender_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_Account_Sender]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_project_code] FOREIGN KEY([project_code])
REFERENCES [dbo].[Projects] ([project_code])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_project_code]
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD FOREIGN KEY([intern_id])
REFERENCES [dbo].[Interns] ([intern_id])
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD FOREIGN KEY([mentor_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Interns]  WITH CHECK ADD FOREIGN KEY([mentor_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Interns]  WITH CHECK ADD FOREIGN KEY([position_code])
REFERENCES [dbo].[Positions] ([position_code])
GO
ALTER TABLE [dbo].[Interns]  WITH CHECK ADD FOREIGN KEY([project_code])
REFERENCES [dbo].[Projects] ([project_code])
GO
ALTER TABLE [dbo].[Interns]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[InternSchedule]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD FOREIGN KEY([project_code])
REFERENCES [dbo].[Projects] ([project_code])
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD FOREIGN KEY([intern_id])
REFERENCES [dbo].[Interns] ([intern_id])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([position_code])
REFERENCES [dbo].[Positions] ([position_code])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([project_code])
REFERENCES [dbo].[Projects] ([project_code])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([receiver_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[Positions]  WITH CHECK ADD FOREIGN KEY([project_code])
REFERENCES [dbo].[Projects] ([project_code])
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD FOREIGN KEY([mentor_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Recruitment]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Recruitment]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([intern_id])
REFERENCES [dbo].[Interns] ([intern_id])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Projects] FOREIGN KEY([project_code])
REFERENCES [dbo].[Projects] ([project_code])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Projects]
GO
ALTER TABLE [dbo].[WifiIPAddress]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD CHECK  (([attitude_score]>=(0) AND [attitude_score]<=(10)))
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD CHECK  (([soft_skills_score]>=(0) AND [soft_skills_score]<=(10)))
GO
ALTER TABLE [dbo].[Evaluations]  WITH CHECK ADD CHECK  (([technical_skills_score]>=(0) AND [technical_skills_score]<=(10)))
GO
USE [master]
GO
ALTER DATABASE [SWP391] SET  READ_WRITE 
GO
