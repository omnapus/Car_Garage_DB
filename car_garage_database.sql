USE [master]
GO
/****** Object:  Database [CarServiceDB]    Script Date: 19/10/2026 14:38:58 ******/
CREATE DATABASE [CarServiceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarServiceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER01\MSSQL\DATA\CarServiceDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarServiceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER01\MSSQL\DATA\CarServiceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CarServiceDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarServiceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarServiceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarServiceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarServiceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarServiceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarServiceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarServiceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarServiceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarServiceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarServiceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarServiceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarServiceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarServiceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarServiceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarServiceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarServiceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarServiceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarServiceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarServiceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarServiceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarServiceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarServiceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarServiceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarServiceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CarServiceDB] SET  MULTI_USER 
GO
ALTER DATABASE [CarServiceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarServiceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarServiceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarServiceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarServiceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarServiceDB] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [CarServiceDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CarServiceDB] SET QUERY_STORE = OFF
GO
USE [CarServiceDB]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 19/10/2026 14:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[RegistrationNumber] [nvarchar](20) NOT NULL,
	[Make] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NULL,
	[DateOfManufacture] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 19/10/2026 14:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mechanic]    Script Date: 19/10/2026 14:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mechanic](
	[MechanicID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Grade] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MechanicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MechanicUnavailability]    Script Date: 19/10/2026 14:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MechanicUnavailability](
	[UnavailabilityID] [int] IDENTITY(1,1) NOT NULL,
	[MechanicID] [int] NOT NULL,
	[StartDateTime] [datetime2](7) NOT NULL,
	[EndDateTime] [datetime2](7) NOT NULL,
	[Reason] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnavailabilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 19/10/2026 14:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceCode] [nvarchar](20) NULL,
	[CustomerID] [int] NOT NULL,
	[CarID] [int] NOT NULL,
	[DropOffDateTime] [datetime2](7) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Mileage] [int] NULL,
	[NextServiceDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceMechanic]    Script Date: 19/10/2026 14:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceMechanic](
	[ServiceID] [int] NOT NULL,
	[MechanicID] [int] NOT NULL,
	[TimeSpentMinutes] [int] NOT NULL,
 CONSTRAINT [PK_ServiceMechanic] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[MechanicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StagingCarServiceRaw]    Script Date: 19/10/2026 14:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StagingCarServiceRaw](
	[service_id] [nvarchar](50) NULL,
	[employee_id] [nvarchar](50) NULL,
	[time_spent] [nvarchar](50) NULL,
	[dropoff_date] [nvarchar](50) NULL,
	[dropoff_time] [nvarchar](50) NULL,
	[work_required] [nvarchar](255) NULL,
	[milage] [nvarchar](50) NULL,
	[next_service] [nvarchar](50) NULL,
	[emp_name] [nvarchar](100) NULL,
	[emp_phone] [nvarchar](50) NULL,
	[grade] [nvarchar](50) NULL,
	[registration] [nvarchar](50) NULL,
	[make] [nvarchar](50) NULL,
	[model] [nvarchar](50) NULL,
	[date_of_manufacture] [nvarchar](50) NULL,
	[customer_id] [nvarchar](50) NULL,
	[cust_name] [nvarchar](100) NULL,
	[cust_email] [nvarchar](100) NULL,
	[cust_phoneno] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (85, 19, N'Mechanic', N'SEZ 5629', N'Skoda', NULL)
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (86, 19, N'Trainee', N'SEZ 5629', N'Skoda', NULL)
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (87, 20, N'BJI 111', N'Vauxhall', N'Astra', CAST(N'2016-07-02' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (88, 20, N'OEZ 1872', N'Alfa Romeo', N'Alfasud', CAST(N'2014-09-22' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (89, 21, N'AF56 WWJ', N'Volkswagen', N'Golf', CAST(N'2014-05-25' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (90, 22, N'CJ16 WED', N'Vauxhall', N'Corsa-e', CAST(N'2020-01-27' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (91, 22, N'G5 T77', N'Dacia', N'Duster', CAST(N'2017-09-19' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (92, 22, N'LLZ 9362', N'Volkswagen', N'Golf', CAST(N'2018-08-30' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (93, 23, N'LV59 OTP', N'Volkswagen', N'Polo', CAST(N'2015-06-30' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (94, 24, N'BEZ 8826', N'Toyota', N'Corolla', CAST(N'2015-05-26' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (95, 24, N'D268 YCF', N'Audi', N'A8 TFSI e', CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (96, 25, N'T779 OLI', N'Ford', N'Fiesta 1.25 Zetec', CAST(N'2016-03-16' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (97, 26, N'CEZ 563', N'Volkswagen', N'Golf', NULL)
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (98, 27, N'SEZ 5629', N'Skoda', N'Superb', CAST(N'2009-11-26' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (99, 28, N'STR 9378', N'Skoda', NULL, NULL)
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (100, 29, N'F6 Y886', N'Skoda', N'Superb', CAST(N'2018-12-14' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (101, 30, N'FET 6821', N'Nissan', N'Qashqai Visia', CAST(N'2018-09-13' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (102, 31, N'MEZ 8086', N'Subaru', N'Impreza', CAST(N'2017-10-15' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (103, 32, N'YR3 67', N'Vauxhall', N'Corsa-e', CAST(N'2019-06-27' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (104, 33, N'B82 T56', N'Skoda', N'Superb', CAST(N'2017-10-19' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (105, 34, N'GRZ 6511', N'Subaru', N'Outback', CAST(N'2018-04-01' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (106, 34, N'W85 TTF', N'Nissan', N'Micra', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (107, 35, N'Y4 T87', N'Subaru', N'Impreza', CAST(N'2017-11-05' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (108, 36, N'DCZ 1844', N'Nissan', N'Qashqai Visia', CAST(N'2008-03-13' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (109, 36, N'WVG 673', N'Volvo', N'V90', CAST(N'2019-12-13' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (110, 37, N'D89 Y6', N'Alfa Romeo', N'Alfasud', CAST(N'2016-09-02' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (111, 38, N'JEA 991', N'Volvo', N'V70', CAST(N'2018-10-13' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (112, 39, N'SWT 9930', N'Dacia', N'Duster', CAST(N'2018-02-15' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (113, 40, N'R99 YRK', N'BMW', N'6 Series Gran Coupe', CAST(N'2019-11-04' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (114, 41, N'B56 Y34', N'Vauxhall', N'Astra', CAST(N'2017-07-22' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (115, 42, N'DYR 87', N'Toyota', N'Corolla', CAST(N'2016-03-26' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (116, 43, N'VIM 8955', N'Skoda', N'Superb', CAST(N'2016-10-14' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (117, 44, N'MEW 783', N'Ford', N'Focus', CAST(N'2017-09-19' AS Date))
INSERT [dbo].[Car] ([CarID], [CustomerID], [RegistrationNumber], [Make], [Model], [DateOfManufacture]) VALUES (118, 45, N'JEZ 7719', N'Dacia', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (19, N'26/11/2009', N'D13-R93', N'John Wayne', N',02890112233')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (20, N'D13-101', N'Bette Davis', N'bette.davis@ulster.ac.uk', N'41728003')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (21, N'D13-203', N'Cary Grant', N'bigcary@yahoo.com', N'+44417654321')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (22, N'D13-306', N'William Holden', N'billyho66@yahoo.com', N'+38198322843')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (23, N'D13-42', N'Humphrey Bogart', N'bogieh@gmail.com', N'07782751839')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (24, N'D13-51', N'Ingrid Bergman', N'IngridB@hotmail.com', N'66419887654')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (25, N'D13-R45', N'James Stewart', N'jimmy_stew@qub.ac.uk', N'08770987654')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (26, N'D13-R71', N'Sean Connery', N'connery.sean007@outlook.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (27, N'D13-R93', N'John Wayne', NULL, N'02890112233')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (28, N'D14-025', N'James Dean', N'deenj@outlook.com', N'+447780276405')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (29, N'D14-16', N'Rock Hudson', N'rockyh@hotmail.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (30, N'D14-37', N'Natalie Wood', N'nattiewood@outlook.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (31, N'D14-38', N'Katharine Hepburn', N'kath_hep29@hotmail.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (32, N'D14-V17', N'Tony Curtis', N't.curtis@yahoo.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (33, N'D14-V77', N'Doris Day', N'd.day67@hotmail.com', N'+4478779297611')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (34, N'D17-022', N'Marilyn Monroe', N'marilyn@hotmail.com', N'+88487618356732')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (35, N'D17-043', N'Deborah Kerr', NULL, N'02890672593')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (36, N'D17-080', N'Orson Welles', N'welles.orson@ulster.ac.uk', N'08998736126')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (37, N'D17-945', N'Frank Sinatra', NULL, N'08870286004')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (38, N'D17-R14', N'Lana Turner', N'lana.turner@yahoo.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (39, N'L231-05', N'Burt Lancaster', NULL, N'+447781904569')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (40, N'L231-12', N'Rita Hayworth', N'ritah99@outlook.com', N'077709873980')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (41, N'L231-44', N'Omar Sharif', N'sharifo18@hotmail.com', N'00447880708090')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (42, N'L231-47', N'Elvis Presley', N'elvisp@yahoo.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (43, N'R180-05', N'Vivien Leigh', N'viv.leigh38@gmail.com', N'02890289675')
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (44, N'R180-32', N'Susan Hayward', N'susan.hayward@yahoo.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerCode], [Name], [Email], [Phone]) VALUES (45, N'R180-61', N'Elizabeth Taylor', NULL, N'+442891785397')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Mechanic] ON 

INSERT [dbo].[Mechanic] ([MechanicID], [EmployeeCode], [Name], [Phone], [Grade]) VALUES (83, N'E0392', N'Edsger Dijkstra', N'07751839368', N'Senior Mechanic')
INSERT [dbo].[Mechanic] ([MechanicID], [EmployeeCode], [Name], [Phone], [Grade]) VALUES (84, N'E1037', N'21/06/2021', N'07882751331', N'07882751331')
INSERT [dbo].[Mechanic] ([MechanicID], [EmployeeCode], [Name], [Phone], [Grade]) VALUES (85, N'E2045', N'Grace Hopper', N'+447880496206', N'Apprentice')
INSERT [dbo].[Mechanic] ([MechanicID], [EmployeeCode], [Name], [Phone], [Grade]) VALUES (86, N'E2648', N'Alan Turing', N'02890568482', N'Apprentice')
INSERT [dbo].[Mechanic] ([MechanicID], [EmployeeCode], [Name], [Phone], [Grade]) VALUES (87, N'E4470', N'Ada Lovelace', N'07811304671', N'Mechanic')
INSERT [dbo].[Mechanic] ([MechanicID], [EmployeeCode], [Name], [Phone], [Grade]) VALUES (88, N'E7291', N'Tony Hoare', N'+44717689275', N'Apprentice')
INSERT [dbo].[Mechanic] ([MechanicID], [EmployeeCode], [Name], [Phone], [Grade]) VALUES (89, N'E9274', N'21/06/2021', N'+442890469927', N'+442890469927')
SET IDENTITY_INSERT [dbo].[Mechanic] OFF
GO
SET IDENTITY_INSERT [dbo].[MechanicUnavailability] ON 

INSERT [dbo].[MechanicUnavailability] ([UnavailabilityID], [MechanicID], [StartDateTime], [EndDateTime], [Reason]) VALUES (3, 83, CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-05T23:59:59.0000000' AS DateTime2), N'Vacation')
INSERT [dbo].[MechanicUnavailability] ([UnavailabilityID], [MechanicID], [StartDateTime], [EndDateTime], [Reason]) VALUES (4, 83, CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-05T23:59:59.0000000' AS DateTime2), N'Vacation')
INSERT [dbo].[MechanicUnavailability] ([UnavailabilityID], [MechanicID], [StartDateTime], [EndDateTime], [Reason]) VALUES (5, 83, CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-05T23:59:59.0000000' AS DateTime2), N'Vacation')
INSERT [dbo].[MechanicUnavailability] ([UnavailabilityID], [MechanicID], [StartDateTime], [EndDateTime], [Reason]) VALUES (6, 83, CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-05T23:59:59.0000000' AS DateTime2), N'Vacation')
INSERT [dbo].[MechanicUnavailability] ([UnavailabilityID], [MechanicID], [StartDateTime], [EndDateTime], [Reason]) VALUES (7, 83, CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-05T23:59:59.0000000' AS DateTime2), N'Vacation')
SET IDENTITY_INSERT [dbo].[MechanicUnavailability] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (171, N'S2006-101', 20, 87, CAST(N'2020-06-17T08:30:00.0000000' AS DateTime2), N'MOT check-up', 45461, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (172, N'S2006-102', 21, 89, CAST(N'2020-06-17T14:30:00.0000000' AS DateTime2), N'MOT check-up', 75712, CAST(N'2021-06-20' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (173, N'S2006-103', 23, 93, CAST(N'2020-06-17T08:00:00.0000000' AS DateTime2), N'Other - Wheel bearing - front passengers side', 49904, CAST(N'2021-06-18' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (174, N'S2006-104', 27, 98, CAST(N'2020-06-17T07:30:00.0000000' AS DateTime2), N'Other - Not going into third gear. All other gears are okay.', 135312, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (175, N'S2006-105', 31, 102, CAST(N'2020-06-17T08:15:00.0000000' AS DateTime2), N'Annual service', 31446, CAST(N'2021-06-19' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (176, N'S2006-106', 34, 105, CAST(N'2020-06-18T16:30:00.0000000' AS DateTime2), N'Other - Rattle in the front suspension', 21043, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (177, N'S2006-107', 36, 108, CAST(N'2020-06-18T08:30:00.0000000' AS DateTime2), N'MOT check-up', 142958, CAST(N'2021-06-18' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (178, N'S2006-108', 43, 116, CAST(N'2020-06-18T08:00:00.0000000' AS DateTime2), N'MOT check-up', 25077, CAST(N'2021-06-19' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (179, N'S2006-109', 20, 88, CAST(N'2020-06-19T08:30:00.0000000' AS DateTime2), N'Other - Oil leak - looks major', 85602, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (180, N'S2006-110', 24, 95, CAST(N'2020-06-19T08:45:00.0000000' AS DateTime2), N'Other - Loses power going up hills. Can not go over 50 mph', 9362, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (181, N'S2006-111', 22, 90, CAST(N'2020-06-19T08:30:00.0000000' AS DateTime2), N'Other - Air conditioning not working', 5903, CAST(N'2021-06-19' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (182, N'S2006-112', 34, 106, CAST(N'2020-06-19T08:30:00.0000000' AS DateTime2), N'Other - Grinding noise from the brakes and whirring noise from the front.', 34943, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (183, N'S2006-113', 22, 92, CAST(N'2020-06-19T08:30:00.0000000' AS DateTime2), N'Annual service', 15033, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (184, N'S2006-114', 36, 109, CAST(N'2020-06-20T16:45:00.0000000' AS DateTime2), N'Other - high pitched whistling noise coming from the front.', 7034, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (185, N'S2006-115', 40, 113, CAST(N'2020-06-20T08:30:00.0000000' AS DateTime2), N'Other - Filled with diesel - should have been petrol! Will need collected.', 4766, NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (186, N'S2006-116', 25, 96, CAST(N'2020-06-20T12:30:00.0000000' AS DateTime2), N'MOT check-up', 21641, CAST(N'2021-06-22' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (187, N'S2006-117', 24, 94, CAST(N'2020-06-20T08:15:00.0000000' AS DateTime2), N'Other - Front tyres are wearing away on the inside. Wire is showing.', 94006, CAST(N'2021-06-20' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (188, N'S2006-118', 22, 91, CAST(N'2020-06-22T08:30:00.0000000' AS DateTime2), N'Annual service', 42743, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (189, N'S2006-119', 19, 85, CAST(N'2020-06-22T08:30:00.0000000' AS DateTime2), N'"Other - Same problem as before - worked for a while', NULL, NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (190, N'S2006-120', 28, 99, CAST(N'2020-06-22T10:30:00.0000000' AS DateTime2), N'MOT check-up', 63092, CAST(N'2021-06-22' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (191, N'S2006-121', 29, 100, CAST(N'2020-06-23T08:30:00.0000000' AS DateTime2), N'Annual service', 18932, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (192, N'S2006-122', 32, 103, CAST(N'2020-06-23T09:00:00.0000000' AS DateTime2), N'Annual service', 11037, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (193, N'S2006-123', 42, 115, CAST(N'2020-06-23T16:15:00.0000000' AS DateTime2), N'MOT check-up', 48841, CAST(N'2021-06-23' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (194, N'S2006-124', 39, 112, CAST(N'2020-06-23T08:30:00.0000000' AS DateTime2), N'Annual service', 20026, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (195, N'S2006-125', 37, 110, CAST(N'2020-06-24T12:15:00.0000000' AS DateTime2), N'MOT check-up', 31604, NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (196, N'S2006-126', 35, 107, CAST(N'2020-06-24T08:15:00.0000000' AS DateTime2), N'Other - front suspension has collapsed.', 36480, NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (197, N'S2006-127', 45, 118, CAST(N'2020-06-24T08:30:00.0000000' AS DateTime2), N'MOT check-up', 84629, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (198, N'S2006-128', 44, 117, CAST(N'2020-06-24T08:00:00.0000000' AS DateTime2), N'Other - Power steering not working. Very hard to turn the steering wheel.', 22030, CAST(N'2020-12-09' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (199, N'S2006-129', 38, 111, CAST(N'2020-06-24T14:30:00.0000000' AS DateTime2), N'Annual service', 11729, CAST(N'2020-06-25' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (200, N'S2006-130', 41, 114, CAST(N'2020-06-24T08:00:00.0000000' AS DateTime2), N'Annual service', 51815, CAST(N'2020-06-13' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (201, N'S2006-131', 30, 101, CAST(N'2020-06-25T07:45:00.0000000' AS DateTime2), N'Annual service', 18037, CAST(N'2020-06-30' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (202, N'S2006-132', 33, 104, CAST(N'2020-06-25T08:15:00.0000000' AS DateTime2), N'Other - none of the lights are working', 37104, NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (203, N'S2006-133', 26, 97, CAST(N'2020-06-25T16:30:00.0000000' AS DateTime2), N'MOT check-up', 71402, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (204, N'S2006-134', 21, 89, CAST(N'2020-06-25T08:30:00.0000000' AS DateTime2), N'Other - Car not starting', 76537, CAST(N'2021-06-20' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (205, N'S2006-135', 27, 98, CAST(N'2020-06-25T14:30:00.0000000' AS DateTime2), N'Other - Now there are grinding sounds from gearbox!!!', 135576, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (208, NULL, 19, 85, CAST(N'2025-02-15T09:30:00.0000000' AS DateTime2), N'Regular service and oil change', 55000, CAST(N'2025-08-15' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (210, NULL, 19, 85, CAST(N'2025-02-15T09:30:00.0000000' AS DateTime2), N'Regular service and oil change', 55000, CAST(N'2025-08-15' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (211, NULL, 19, 85, CAST(N'2025-02-15T09:30:00.0000000' AS DateTime2), N'Regular service and oil change', 55000, CAST(N'2025-08-15' AS Date))
INSERT [dbo].[Service] ([ServiceID], [ServiceCode], [CustomerID], [CarID], [DropOffDateTime], [Description], [Mileage], [NextServiceDate]) VALUES (212, NULL, 19, 85, CAST(N'2025-02-15T09:30:00.0000000' AS DateTime2), N'Regular service and oil change', 55000, CAST(N'2025-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (171, 84, 45)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (171, 89, 195)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (172, 87, 30)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (172, 88, 240)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (173, 83, 70)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (173, 84, 380)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (173, 85, 210)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (174, 84, 315)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (174, 87, 565)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (174, 89, 145)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (175, 83, 60)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (175, 85, 260)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (176, 84, 195)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (176, 89, 320)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (177, 84, 275)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (177, 89, 75)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (178, 86, 215)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (178, 87, 215)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (179, 83, 380)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (179, 84, 75)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (179, 88, 265)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (180, 83, 615)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (180, 84, 615)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (180, 86, 135)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (181, 85, 300)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (182, 83, 395)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (182, 85, 105)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (182, 87, 485)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (183, 87, 235)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (183, 88, 210)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (184, 84, 135)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (184, 87, 200)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (184, 88, 195)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (185, 84, 335)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (185, 89, 335)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (186, 84, 255)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (186, 85, 225)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (187, 87, 155)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (187, 88, 75)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (188, 83, 50)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (188, 89, 200)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (189, 84, 280)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (189, 89, 155)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (190, 86, 210)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (190, 87, 170)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (191, 85, 0)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (192, 88, 0)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (193, 86, 0)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (194, 89, 0)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (195, 86, 0)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (197, 88, 0)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (199, 85, 0)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (200, 89, 0)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (201, 86, 0)
INSERT [dbo].[ServiceMechanic] ([ServiceID], [MechanicID], [TimeSpentMinutes]) VALUES (203, 88, 0)
GO
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-101 ', N'E9274', N'03:15', N'17/06/2020', N'08:30:00', N'MOT check-up', N'45461', N'21/06/2021', N'Tim Berners-Lee', N'+442890469927', N'Trainee', N'BJI 111', N'Vauxhall', N'Astra', N'02/07/2016', N'D13-101', N'Bette Davis', N'bette.davis@ulster.ac.uk', N'41728003')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-101 ', N'E1037', N'00:45', N'17/06/2020', N'08:30:00', N'MOT check-up', N'45461', N'21/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'BJI 111', N'Vauxhall', N'Astra', N'02/07/2016', N'D13-101', N'Bette Davis', N'bette.davis@ulster.ac.uk', N'41728003')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-102 ', N'E7291', N'04:00', N'17/06/2020', N'14:30:00', N'MOT check-up', N'75712', N'20/06/2021', N'Tony Hoare', N'+44717689275', N'Apprentice', N'AF56 WWJ', N'Volkswagen', N'Golf', N'25/05/2014', N'D13-203', N'Cary Grant', N'bigcary@yahoo.com', N'+44417654321')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-102 ', N'E4470', N'00:30', N'17/06/2020', N'14:30:00', N'MOT check-up', N'75712', N'20/06/2021', N'Ada Lovelace', N'07811304671', N'Mechanic', N'AF56 WWJ', N'Volkswagen', N'Golf', N'25/05/2014', N'D13-203', N'Cary Grant', N'bigcary@yahoo.com', N'+44417654321')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-103 ', N'E2045', N'03:30', N'17/06/2020', N'08:00:00', N'Other - Wheel bearing - front passengers side', N'49904', N'18/06/2021', N'Grace Hopper', N'+447880496206', N'Apprentice', N'LV59 OTP', N'Volkswagen', N'Polo', N'30/06/2015', N'D13-42 ', N'Humphrey Bogart', N'bogieh@gmail.com', N'07782751839')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-103 ', N'E1037', N'06:20', N'17/06/2020', N'08:00:00', N'Other - Wheel bearing - front passengers side', N'49904', N'18/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'LV59 OTP', N'Volkswagen', N'Polo', N'30/06/2015', N'D13-42 ', N'Humphrey Bogart', N'bogieh@gmail.com', N'07782751839')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-103 ', N'E0392', N'01:10', N'17/06/2020', N'08:00:00', N'Other - Wheel bearing - front passengers side', N'49904', N'18/06/2021', N'Edsger Dijkstra', N'07751839368', N'Senior Mechanic', N'LV59 OTP', N'Volkswagen', N'Polo', N'30/06/2015', N'D13-42 ', N'Humphrey Bogart', N'bogieh@gmail.com', N'07782751839')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-104 ', N'E9274', N'02:25', N'17/06/2020', N'07:30:00', N'Other - Not going into third gear. All other gears are okay.', N'135312', N'21/06/2021', N'Tim Berners-Lee', N'+442890469927', N'Trainee', N'SEZ 5629', N'Skoda', N'Superb', N'26/11/2009', N'D13-R93', N'John Wayne', NULL, N'02890112233')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-104 ', N'E4470', N'09:25', N'17/06/2020', N'07:30:00', N'Other - Not going into third gear. All other gears are okay.', N'135312', N'21/06/2021', N'Ada Lovelace', N'07811304671', N'Mechanic', N'SEZ 5629', N'Skoda', N'Superb', N'26/11/2009', N'D13-R93', N'John Wayne', NULL, N'02890112233')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-104 ', N'E1037', N'05:15', N'17/06/2020', N'07:30:00', N'Other - Not going into third gear. All other gears are okay.', N'135312', N'21/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'SEZ 5629', N'Skoda', N'Superb', N'26/11/2009', N'D13-R93', N'John Wayne', NULL, N'02890112233')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-105 ', N'E2045', N'04:20', N'17/06/2020', N'08:15:00', N'Annual service', N'31446', N'19/06/2021', N'Grace Hopper', N'+447880496206', N'Apprentice', N'MEZ 8086', N'Subaru', N'Impreza', N'15/10/2017', N'D14-38 ', N'Katharine Hepburn', N'kath_hep29@hotmail.com', NULL)
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-105 ', N'E0392', N'01:00', N'17/06/2020', N'08:15:00', N'Annual service', N'31446', N'19/06/2021', N'Edsger Dijkstra', N'07751839368', N'Senior Mechanic', N'MEZ 8086', N'Subaru', N'Impreza', N'15/10/2017', N'D14-38 ', N'Katharine Hepburn', N'kath_hep29@hotmail.com', NULL)
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-106 ', N'E9274', N'05:20', N'18/06/2020', N'16:30:00', N'Other - Rattle in the front suspension', N'21043', N'21/06/2021', N'Tim Berners-Lee', N'+442890469927', N'Trainee', N'GRZ 6511', N'Subaru', N'Outback', N'01/04/2018', N'D17-022', N'Marilyn Monroe', N'marilyn@hotmail.com', N'+88487618356732')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-106 ', N'E1037', N'03:15', N'18/06/2020', N'16:30:00', N'Other - Rattle in the front suspension', N'21043', N'21/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'GRZ 6511', N'Subaru', N'Outback', N'01/04/2018', N'D17-022', N'Marilyn Monroe', N'marilyn@hotmail.com', N'+88487618356732')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-107 ', N'E9274', N'01:15', N'18/06/2020', N'08:30:00', N'MOT check-up', N'142958', N'18/06/2021', N'Tim Berners-Lee', N'+442890469927', N'Trainee', N'DCZ 1844', N'Nissan', N'Qashqai Visia', N'13/03/2008', N'D17-080', N'Orson Welles', N'welles.orson@ulster.ac.uk', N'08998736126')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-107 ', N'E1037', N'04:35', N'18/06/2020', N'08:30:00', N'MOT check-up', N'142958', N'18/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'DCZ 1844', N'Nissan', N'Qashqai Visia', N'13/03/2008', N'D17-080', N'Orson Welles', N'welles.orson@ulster.ac.uk', N'08998736126')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-108 ', N'E2648', N'03:35', N'18/06/2020', N'08:00:00', N'MOT check-up', N'25077', N'19/06/2021', N'Alan Turing', N'02890568482', N'Apprentice', N'VIM 8955', N'Skoda', N'Superb', N'14/10/2016', N'R180-05', N'Vivien Leigh', N'viv.leigh38@gmail.com', N'02890289675')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-108 ', N'E4470', N'03:35', N'18/06/2020', N'08:00:00', N'MOT check-up', N'25077', N'19/06/2021', N'Ada Lovelace', N'07811304671', N'Mechanic', N'VIM 8955', N'Skoda', N'Superb', N'14/10/2016', N'R180-05', N'Vivien Leigh', N'viv.leigh38@gmail.com', N'02890289675')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-109 ', N'E7291', N'04:25', N'19/06/2020', N'08:30:00', N'Other - Oil leak - looks major', N'85602', N'21/06/2021', N'Tony Hoare', N'+44717689275', N'Apprentice', N'OEZ 1872', N'Alfa Romeo', N'Alfasud', N'22/09/2014', N'D13-101', N'Bette Davis', N'bette.davis@ulster.ac.uk', N'41728003')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-109 ', N'E0392', N'06:20', N'19/06/2020', N'08:30:00', N'Other - Oil leak - looks major', N'85602', N'21/06/2021', N'Edsger Dijkstra', N'07751839368', N'Senior Mechanic', N'OEZ 1872', N'Alfa Romeo', N'Alfasud', N'22/09/2014', N'D13-101', N'Bette Davis', N'bette.davis@ulster.ac.uk', N'41728003')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-109 ', N'E1037', N'01:15', N'19/06/2020', N'08:30:00', N'Other - Oil leak - looks major', N'85602', N'21/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'OEZ 1872', N'Alfa Romeo', N'Alfasud', N'22/09/2014', N'D13-101', N'Bette Davis', N'bette.davis@ulster.ac.uk', N'41728003')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-110 ', N'E2648', N'02:15', N'19/06/2020', N'08:45:00', N'Other - Loses power going up hills. Can not go over 50 mph', N'9362', N'21/06/2021', N'Alan Turing', N'02890568482', N'Apprentice', N'D268 YCF', N'Audi', N'A8 TFSI e', N'07/02/2020', N'D13-51 ', N'Ingrid Bergman', N'IngridB@hotmail.com', N'66419887654')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-110 ', N'E0392', N'10:15', N'19/06/2020', N'08:45:00', N'Other - Loses power going up hills. Can not go over 50 mph', N'9362', N'21/06/2021', N'Edsger Dijkstra', N'07751839368', N'Senior Mechanic', N'D268 YCF', N'Audi', N'A8 TFSI e', N'07/02/2020', N'D13-51 ', N'Ingrid Bergman', N'IngridB@hotmail.com', N'66419887654')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-110 ', N'E1037', N'10:15', N'19/06/2020', N'08:45:00', N'Other - Loses power going up hills. Can not go over 50 mph', N'9362', N'21/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'D268 YCF', N'Audi', N'A8 TFSI e', N'07/02/2020', N'D13-51 ', N'Ingrid Bergman', N'IngridB@hotmail.com', N'66419887654')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-111 ', N'E2045', N'05:00', N'19/06/2020', N'08:30:00', N'Other - Air conditioning not working', N'5903', N'19/06/2021', N'Grace Hopper', N'+447880496206', N'Apprentice', N'CJ16 WED', N'Vauxhall', N'Corsa-e', N'27/01/2020', N'D13-306', N'William Holden', N'billyho66@yahoo.com', N'+38198322843')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-112 ', N'E2045', N'01:45', N'19/06/2020', N'08:30:00', N'Other - Grinding noise from the brakes and whirring noise from the front.', N'34943', N'23/06/2021', N'Grace Hopper', N'+447880496206', N'Apprentice', N'W85 TTF', N'Nissan', N'Micra', N'12/12/2017', N'D17-022', N'Marilyn Monroe', N'marilyn@hotmail.com', N'+88487618356732')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-112 ', N'E4470', N'08:05', N'19/06/2020', N'08:30:00', N'Other - Grinding noise from the brakes and whirring noise from the front.', N'34943', N'23/06/2021', N'Ada Lovelace', N'07811304671', N'Mechanic', N'W85 TTF', N'Nissan', N'Micra', N'12/12/2017', N'D17-022', N'Marilyn Monroe', N'marilyn@hotmail.com', N'+88487618356732')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-112 ', N'E0392', N'06:35', N'19/06/2020', N'08:30:00', N'Other - Grinding noise from the brakes and whirring noise from the front.', N'34943', N'23/06/2021', N'Edsger Dijkstra', N'07751839368', N'Senior Mechanic', N'W85 TTF', N'Nissan', N'Micra', N'12/12/2017', N'D17-022', N'Marilyn Monroe', N'marilyn@hotmail.com', N'+88487618356732')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-113 ', N'E7291', N'03:30', N'19/06/2020', N'08:30:00', N'Annual service', N'15033', N'21/06/2021', N'Tony Hoare', N'+44717689275', N'Apprentice', N'LLZ 9362', N'Volkswagen', N'Golf', N'30/08/2018', N'D13-306', N'William Holden', N'billyho66@yahoo.com', N'+38198322843')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-113 ', N'E4470', N'03:55', N'19/06/2020', N'08:30:00', N'Annual service', N'15033', N'21/06/2021', N'Ada Lovelace', N'07811304671', N'Mechanic', N'LLZ 9362', N'Volkswagen', N'Golf', N'30/08/2018', N'D13-306', N'William Holden', N'billyho66@yahoo.com', N'+38198322843')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-114 ', N'E7291', N'03:15', N'20/06/2020', N'16:45:00', N'Other - high pitched whistling noise coming from the front.', N'7034', N'21/06/2021', N'Tony Hoare', N'+44717689275', N'Apprentice', N'WVG 673', N'Volvo', N'V90', N'13/12/2019', N'D17-080', N'Orson Welles', N'welles.orson@ulster.ac.uk', N'08998736126')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-114 ', N'E4470', N'03:20', N'20/06/2020', N'16:45:00', N'Other - high pitched whistling noise coming from the front.', N'7034', N'21/06/2021', N'Ada Lovelace', N'07811304671', N'Mechanic', N'WVG 673', N'Volvo', N'V90', N'13/12/2019', N'D17-080', N'Orson Welles', N'welles.orson@ulster.ac.uk', N'08998736126')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-114 ', N'E1037', N'02:15', N'20/06/2020', N'16:45:00', N'Other - high pitched whistling noise coming from the front.', N'7034', N'21/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'WVG 673', N'Volvo', N'V90', N'13/12/2019', N'D17-080', N'Orson Welles', N'welles.orson@ulster.ac.uk', N'08998736126')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-115 ', N'E9274', N'05:35', N'20/06/2020', N'08:30:00', N'Other - Filled with diesel - should have been petrol! Will need collected.', N'4766', NULL, N'Tim Berners-Lee', N'+442890469927', N'Trainee', N'R99 YRK', N'BMW', N'6 Series Gran Coupe', N'04/11/2019', N'L231-12', N'Rita Hayworth', N'ritah99@outlook.com', N'077709873980')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-115 ', N'E1037', N'05:35', N'20/06/2020', N'08:30:00', N'Other - Filled with diesel - should have been petrol! Will need collected.', N'4766', NULL, N'Edgar F. Codd', N'07882751331', N'Mechanic', N'R99 YRK', N'BMW', N'6 Series Gran Coupe', N'04/11/2019', N'L231-12', N'Rita Hayworth', N'ritah99@outlook.com', N'077709873980')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-116 ', N'E2045', N'03:45', N'20/06/2020', N'12:30:00', N'MOT check-up', N'21641', N'22/06/2021', N'Grace Hopper', N'+447880496206', N'Apprentice', N'T779 OLI', N'Ford', N'Fiesta 1.25 Zetec', N'16/03/2016', N'D13-R45', N'James Stewart', N'jimmy_stew@qub.ac.uk', N'08770987654')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-116 ', N'E1037', N'04:15', N'20/06/2020', N'12:30:00', N'MOT check-up', N'21641', N'22/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'T779 OLI', N'Ford', N'Fiesta 1.25 Zetec', N'16/03/2016', N'D13-R45', N'James Stewart', N'jimmy_stew@qub.ac.uk', N'08770987654')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-117 ', N'E7291', N'01:15', N'20/06/2020', N'08:15:00', N'Other - Front tyres are wearing away on the inside. Wire is showing.', N'94006', N'20/06/2021', N'Tony Hoare', N'+44717689275', N'Apprentice', N'BEZ 8826', N'Toyota', N'Corolla', N'26/05/2015', N'D13-51 ', N'Ingrid Bergman', N'IngridB@hotmail.com', N'66419887654')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-117 ', N'E4470', N'02:35', N'20/06/2020', N'08:15:00', N'Other - Front tyres are wearing away on the inside. Wire is showing.', N'94006', N'20/06/2021', N'Ada Lovelace', N'07811304671', N'Mechanic', N'BEZ 8826', N'Toyota', N'Corolla', N'26/05/2015', N'D13-51 ', N'Ingrid Bergman', N'IngridB@hotmail.com', N'66419887654')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-118 ', N'E9274', N'03:20', N'22/06/2020', N'08:30:00', N'Annual service', N'42743', N'24/06/2021', N'Tim Berners-Lee', N'+442890469927', N'Trainee', N'G5 T77', N'Dacia', N'Duster', N'19/09/2017', N'D13-306', N'William Holden', N'billyho66@yahoo.com', N'+38198322843')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-118 ', N'E0392', N'00:50', N'22/06/2020', N'08:30:00', N'Annual service', N'42743', N'24/06/2021', N'Edsger Dijkstra', N'07751839368', N'Senior Mechanic', N'G5 T77', N'Dacia', N'Duster', N'19/09/2017', N'D13-306', N'William Holden', N'billyho66@yahoo.com', N'+38198322843')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-119 ', N'E9274', N'02:35', N'22/06/2020', N'08:30:00', N'"Other - Same problem as before - worked for a while', N' but now not going into first or third gear."', N'135394', N'21/06/2021', N'Tim Berners-Lee', N'+442890469927', N'Trainee', N'SEZ 5629', N'Skoda', N'Superb', N'26/11/2009', N'D13-R93', N'John Wayne', N',02890112233')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-119 ', N'E1037', N'04:40', N'22/06/2020', N'08:30:00', N'"Other - Same problem as before - worked for a while', N' but now not going into first or third gear."', N'135394', N'21/06/2021', N'Edgar F. Codd', N'07882751331', N'Mechanic', N'SEZ 5629', N'Skoda', N'Superb', N'26/11/2009', N'D13-R93', N'John Wayne', N',02890112233')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-120 ', N'E2648', N'03:30', N'22/06/2020', N'10:30:00', N'MOT check-up', N'63092', N'22/06/2021', N'Alan Turing', N'02890568482', N'Apprentice', N'STR 9378', N'Skoda', NULL, NULL, N'D14-025', N'James Dean', N'deenj@outlook.com', N'+447780276405')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-120 ', N'E4470', N'02:50', N'22/06/2020', N'10:30:00', N'MOT check-up', N'63092', N'22/06/2021', N'Ada Lovelace', N'07811304671', N'Mechanic', N'STR 9378', N'Skoda', NULL, NULL, N'D14-025', N'James Dean', N'deenj@outlook.com', N'+447780276405')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-121 ', N'E2045', NULL, N'23/06/2020', N'08:30:00', N'Annual service', N'18932', N'25/06/2021', N'Grace Hopper', N'+447880496206', N'Apprentice', N'F6 Y886', N'Skoda', N'Superb', N'14/12/2018', N'D14-16 ', N'Rock Hudson', N'rockyh@hotmail.com', NULL)
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-122 ', N'E7291', NULL, N'23/06/2020', N'09:00:00', N'Annual service', N'11037', N'25/06/2021', N'Tony Hoare', N'+44717689275', N'Apprentice', N'YR3 67', N'Vauxhall', N'Corsa-e', N'27/06/2019', N'D14-V17', N'Tony Curtis', N't.curtis@yahoo.com', NULL)
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-123 ', N'E2648', NULL, N'23/06/2020', N'16:15:00', N'MOT check-up', N'48841', N'23/06/2021', N'Alan Turing', N'02890568482', N'Apprentice', N'DYR 87', N'Toyota', N'Corolla', N'26/03/2016', N'L231-47', N'Elvis Presley', N'elvisp@yahoo.com', NULL)
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-124 ', N'E9274', NULL, N'23/06/2020', N'08:30:00', N'Annual service', N'20026', N'24/06/2021', N'Tim Berners-Lee', N'+442890469927', N'Trainee', N'SWT 9930', N'Dacia', N'Duster', N'15/02/2018', N'L231-05', N'Burt Lancaster', NULL, N'+447781904569')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-125 ', N'E2648', NULL, N'24/06/2020', N'12:15:00', N'MOT check-up', N'31604', NULL, N'Alan Turing', N'02890568482', N'Apprentice', N'D89 Y6', N'Alfa Romeo', N'Alfasud', N'02/09/2016', N'D17-945', N'Frank Sinatra', NULL, N'08870286004')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-126 ', NULL, NULL, N'24/06/2020', N'08:15:00', N'Other - front suspension has collapsed.', N'36480', NULL, NULL, NULL, NULL, N'Y4 T87', N'Subaru', N'Impreza', N'05/11/2017', N'D17-043', N'Deborah Kerr', NULL, N'02890672593')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-127 ', N'E7291', NULL, N'24/06/2020', N'08:30:00', N'MOT check-up', N'84629', N'24/06/2021', N'Tony Hoare', N'+44717689275', N'Apprentice', N'JEZ 7719', N'Dacia', NULL, NULL, N'R180-61', N'Elizabeth Taylor', NULL, N'+442891785397')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-128 ', NULL, NULL, N'24/06/2020', N'08:00:00', N'Other - Power steering not working. Very hard to turn the steering wheel.', N'22030', N'09/12/2020', NULL, NULL, NULL, N'MEW 783', N'Ford', N'Focus', N'19/09/2017', N'R180-32', N'Susan Hayward', N'susan.hayward@yahoo.com', NULL)
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-129 ', N'E2045', NULL, N'24/06/2020', N'14:30:00', N'Annual service', N'11729', N'25/06/2020', N'Grace Hopper', N'+447880496206', N'Apprentice', N'JEA 991', N'Volvo', N'V70', N'13/10/2018', N'D17-R14', N'Lana Turner', N'lana.turner@yahoo.com', NULL)
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-130 ', N'E9274', NULL, N'24/06/2020', N'08:00:00', N'Annual service', N'51815', N'13/06/2020', N'Tim Berners-Lee', N'+442890469927', N'Trainee', N'B56 Y34', N'Vauxhall', N'Astra', N'22/07/2017', N'L231-44', N'Omar Sharif', N'sharifo18@hotmail.com', N'00447880708090')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-131 ', N'E2648', NULL, N'25/06/2020', N'07:45:00', N'Annual service', N'18037', N'30/06/2020', N'Alan Turing', N'02890568482', N'Apprentice', N'FET 6821', N'Nissan', N'Qashqai Visia', N'13/09/2018', N'D14-37 ', N'Natalie Wood', N'nattiewood@outlook.com', NULL)
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-132 ', NULL, NULL, N'25/06/2020', N'08:15:00', N'Other - none of the lights are working', N'37104', NULL, NULL, NULL, NULL, N'B82 T56', N'Skoda', N'Superb', N'19/10/2017', N'D14-V77', N'Doris Day', N'd.day67@hotmail.com', N'+4478779297611')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-133 ', N'E7291', NULL, N'25/06/2020', N'16:30:00', N'MOT check-up', N'71402', N'25/06/2021', N'Tony Hoare', N'+44717689275', N'Apprentice', N'CEZ 563', N'Volkswagen', N'Golf', NULL, N'D13-R71', N'Sean Connery', N'connery.sean007@outlook.com', NULL)
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-134 ', NULL, NULL, N'25/06/2020', N'08:30:00', N'Other - Car not starting', N'76537', N'20/06/2021', NULL, NULL, NULL, N'AF56 WWJ', N'Volkswagen', N'Golf', N'25/05/2014', N'D13-203', N'Cary Grant', N'bigcary@yahoo.com', N'+44417654321')
INSERT [dbo].[StagingCarServiceRaw] ([service_id], [employee_id], [time_spent], [dropoff_date], [dropoff_time], [work_required], [milage], [next_service], [emp_name], [emp_phone], [grade], [registration], [make], [model], [date_of_manufacture], [customer_id], [cust_name], [cust_email], [cust_phoneno]) VALUES (N'S2006-135 ', NULL, NULL, N'25/06/2020', N'14:30:00', N'Other - Now there are grinding sounds from gearbox!!!', N'135576', N'21/06/2021', NULL, NULL, NULL, N'SEZ 5629', N'Skoda', N'Superb', N'26/11/2009', N'D13-R93', N'John Wayne', NULL, N'02890112233')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Car__E88646024024566C]    Script Date: 19/10/2026 14:39:01 ******/
ALTER TABLE [dbo].[Car] ADD UNIQUE NONCLUSTERED 
(
	[RegistrationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__066785218097A9B0]    Script Date: 19/10/2026 14:39:01 ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[CustomerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Mechanic__1F6425480DB657EF]    Script Date: 19/10/2026 14:39:01 ******/
ALTER TABLE [dbo].[Mechanic] ADD UNIQUE NONCLUSTERED 
(
	[EmployeeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServiceMechanic] ADD  CONSTRAINT [DF_ServiceMechanic_TimeSpent]  DEFAULT ((0)) FOR [TimeSpentMinutes]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Customer]
GO
ALTER TABLE [dbo].[MechanicUnavailability]  WITH CHECK ADD  CONSTRAINT [FK_MechanicUnavailability_Mechanic] FOREIGN KEY([MechanicID])
REFERENCES [dbo].[Mechanic] ([MechanicID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MechanicUnavailability] CHECK CONSTRAINT [FK_MechanicUnavailability_Mechanic]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[Car] ([CarID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Car]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Customer]
GO
ALTER TABLE [dbo].[ServiceMechanic]  WITH CHECK ADD  CONSTRAINT [FK_ServiceMechanic_Mechanic] FOREIGN KEY([MechanicID])
REFERENCES [dbo].[Mechanic] ([MechanicID])
GO
ALTER TABLE [dbo].[ServiceMechanic] CHECK CONSTRAINT [FK_ServiceMechanic_Mechanic]
GO
ALTER TABLE [dbo].[ServiceMechanic]  WITH CHECK ADD  CONSTRAINT [FK_ServiceMechanic_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceMechanic] CHECK CONSTRAINT [FK_ServiceMechanic_Service]
GO
USE [master]
GO
ALTER DATABASE [CarServiceDB] SET  READ_WRITE 
GO
