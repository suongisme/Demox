USE [master]
GO
/****** Object:  Database [RealClub]    Script Date: 7/1/2024 12:31:07 AM ******/
CREATE DATABASE [RealClub]
GO
ALTER DATABASE [RealClub] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealClub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealClub] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [RealClub] SET ANSI_NULLS OFF
GO
ALTER DATABASE [RealClub] SET ANSI_PADDING OFF
GO
ALTER DATABASE [RealClub] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [RealClub] SET ARITHABORT OFF
GO
ALTER DATABASE [RealClub] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [RealClub] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [RealClub] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [RealClub] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [RealClub] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [RealClub] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [RealClub] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [RealClub] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [RealClub] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [RealClub] SET  DISABLE_BROKER
GO
ALTER DATABASE [RealClub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [RealClub] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [RealClub] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [RealClub] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [RealClub] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [RealClub] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [RealClub] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [RealClub] SET RECOVERY FULL
GO
ALTER DATABASE [RealClub] SET  MULTI_USER
GO
ALTER DATABASE [RealClub] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [RealClub] SET DB_CHAINING OFF
GO
ALTER DATABASE [RealClub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [RealClub] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [RealClub] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [RealClub] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
ALTER DATABASE [RealClub] SET QUERY_STORE = OFF
GO
USE [RealClub]
GO
/****** Object:  Table [dbo].[AttendanceCheck]    Script Date: 7/1/2024 12:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceCheck](
    [AttendanceID] [int] IDENTITY(1,1) NOT NULL,
    [PlayerID] [int] NULL,
    [TrainingID] [int] NULL,
    [CheckDate] [datetime] NULL,
    [IsPresent] [bit] NULL,
    CONSTRAINT [PK__Attendan__8B69263CD870C491] PRIMARY KEY CLUSTERED
(
[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Coach]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Coach](
    [CoachID] [int] IDENTITY(1,1) NOT NULL,
    [UserID] [int] NOT NULL,
    [CoachName] [nchar](100) NOT NULL,
    CONSTRAINT [PK_Coach] PRIMARY KEY CLUSTERED
(
[CoachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[DietPlan]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[DietPlan](
    [DietPlanID] [int] IDENTITY(1,1) NOT NULL,
    [PlayerID] [int] NULL,
    [PlanDescription] [text] NULL,
    CONSTRAINT [PK__DietPlan__D256E16AA289BB34] PRIMARY KEY CLUSTERED
(
[DietPlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[DietPlanFoods]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[DietPlanFoods](
    [DietPlanID] [int] NOT NULL,
    [FoodID] [int] NOT NULL,
    [PortionSize] [varchar](50) NULL,
    PRIMARY KEY CLUSTERED
(
    [DietPlanID] ASC,
[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[ExpectedLineups]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[ExpectedLineups](
    [LineupID] [int] IDENTITY(1,1) NOT NULL,
    [MatchID] [int] NULL,
    [PlayerID] [int] NULL,
    [LineupName] [varchar](50) NULL,
    CONSTRAINT [PK__Expected__492BA7BCD872DEF7] PRIMARY KEY CLUSTERED
(
[LineupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Foods]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Foods](
    [FoodID] [int] IDENTITY(1,1) NOT NULL,
    [FoodName] [varchar](100) NULL,
    [Description] [text] NULL,
    [Calo] [decimal](10, 2) NULL,
    [Proteins] [decimal](10, 2) NULL,
    [Carbohydrates] [decimal](10, 2) NULL,
    [Fats] [decimal](10, 2) NULL,
    CONSTRAINT [PK__Foods__856DB3CB324E40B4] PRIMARY KEY CLUSTERED
(
[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Jerseys]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Jerseys](
    [JerseyID] [int] NOT NULL,
    [JerseyName] [nvarchar](100) NOT NULL,
    [JerseyDescription] [nvarchar](255) NULL,
    [JerseyPrice] [decimal](10, 2) NOT NULL,
    [JerseyImage] [nvarchar](255) NULL,
    CONSTRAINT [PK_Jerseys] PRIMARY KEY CLUSTERED
(
[JerseyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[JerseySizes]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[JerseySizes](
    [SizeID] [int] NOT NULL,
    [JerseyID] [int] NULL,
    [JerseySize] [nvarchar](50) NULL,
    [JerseyQuantity] [int] NULL,
    CONSTRAINT [PK__JerseySi__83BD095AE4E2FBA2] PRIMARY KEY CLUSTERED
(
[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[MatchSchedule]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[MatchSchedule](
    [MatchID] [int] IDENTITY(1,1) NOT NULL,
    [AwayTeamID] [int] NULL,
    [HomeTeamID] [int] NULL,
    [MatchDate] [datetime] NULL,
    [MatchLocation] [varchar](100) NULL,
    [Tournament] [varchar](100) NULL,
    CONSTRAINT [PK__MatchSch__4218C837085898DD] PRIMARY KEY CLUSTERED
(
[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[MatchStatistic]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[MatchStatistic](
    [MatchStatisticID] [int] IDENTITY(1,1) NOT NULL,
    [MatchID] [int] NOT NULL,
    [TeamID] [int] NULL,
    [Score] [int] NULL,
    [YellowCards] [int] NULL,
    [RedCards] [int] NULL,
    [TotalShots] [int] NULL,
    [CornerKicks] [int] NULL,
    [BallPossession] [int] NULL,
    [Passes] [int] NULL,
    CONSTRAINT [PK_MatchStatistic] PRIMARY KEY CLUSTERED
(
[MatchStatisticID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[MeetingSchedule]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[MeetingSchedule](
    [MeetingID] [int] IDENTITY(1,1) NOT NULL,
    [MeetingDate] [datetime] NULL,
    [MeetingTime] [varchar](50) NULL,
    [Location] [varchar](100) NULL,
    [Description] [text] NULL,
    CONSTRAINT [PK__MeetingS__E9F9E9AC882DE7EF] PRIMARY KEY CLUSTERED
(
[MeetingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[OrderJerseyDetails]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[OrderJerseyDetails](
    [OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
    [OrderID] [int] NULL,
    [JerseySizeID] [int] NULL,
    [JerseyID] [int] NULL,
    [JerseyQuantity] [int] NULL,
    CONSTRAINT [PK__OrderJer__D3B9D30C4FBCC1F8] PRIMARY KEY CLUSTERED
(
[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Orders](
    [OrderID] [int] IDENTITY(1,1) NOT NULL,
    [UserID] [int] NOT NULL,
    [OrderDate] [datetime] NOT NULL,
    [OrderTotal] [decimal](10, 2) NOT NULL,
    [Phone] [nchar](10) NULL,
    [Address] [text] NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED
(
[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Player]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Player](
    [PlayerID] [int] IDENTITY(1,1) NOT NULL,
    [UserID] [int] NULL,
    [Position] [varchar](50) NULL,
    [Name] [varchar](100) NULL,
    [DOB] [date] NULL,
    [Weight] [nchar](10) NULL,
    [Height] [int] NULL,
    CONSTRAINT [PK__Player__4A4E74A87809BF73] PRIMARY KEY CLUSTERED
(
[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[PlayerPerformance]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[PlayerPerformance](
    [PerformanceID] [int] IDENTITY(1,1) NOT NULL,
    [PlayerID] [int] NULL,
    [MatchID] [int] NULL,
    [GoalsScored] [int] NULL,
    [YellowCards] [int] NULL,
    [RedCards] [int] NULL,
    CONSTRAINT [PK__PlayerPe__F9606DE148F03196] PRIMARY KEY CLUSTERED
(
[PerformanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[PlayerPhysicalCondition]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[PlayerPhysicalCondition](
    [ConditionID] [int] IDENTITY(1,1) NOT NULL,
    [PlayerID] [int] NULL,
    [ConditionDescription] [text] NULL,
    [DateRecorded] [date] NULL,
    CONSTRAINT [PK__PlayerPh__37F5C0EF3E76253C] PRIMARY KEY CLUSTERED
(
[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[TeamNews]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[TeamNews](
    [NewsID] [int] IDENTITY(1,1) NOT NULL,
    [NewsTitle] [varchar](255) NULL,
    [NewsImageDescription] [nchar](1000) NULL,
    [NewsContent] [text] NULL,
    [DatePosted] [date] NULL,
    [Description] [text] NULL,
    CONSTRAINT [PK__TeamNews__954EBDD37C021207] PRIMARY KEY CLUSTERED
(
[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Teams]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Teams](
    [TeamID] [int] IDENTITY(1,1) NOT NULL,
    [TeamName] [varchar](50) NULL,
    [flag] [nvarchar](1000) NULL,
    CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED
(
[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Ticket](
    [TicketID] [int] IDENTITY(1,1) NOT NULL,
    [MatchID] [int] NULL,
    [SeatNumber] [varchar](20) NULL,
    [Price] [decimal](10, 2) NULL,
    CONSTRAINT [PK__TicketPu__712CC627620A6B80] PRIMARY KEY CLUSTERED
(
[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[TicketPurchase]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[TicketPurchase](
    [PurchaseID] [int] IDENTITY(1,1) NOT NULL,
    [UserID] [int] NULL,
    [TicketID] [int] NULL,
    [PurchaseDate] [date] NULL,
    [PaymentMethod] [nvarchar](100) NULL,
    [Status] [bit] NULL,
    CONSTRAINT [PK_TicketPurchae] PRIMARY KEY CLUSTERED
(
[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[TrainingSchedule]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[TrainingSchedule](
    [TrainingID] [int] IDENTITY(1,1) NOT NULL,
    [TrainingDate] [datetime] NULL,
    [TrainingTime] [varchar](50) NULL,
    [Location] [varchar](100) NULL,
    [Description] [text] NULL,
    CONSTRAINT [PK__Training__E8D71DE2591936C3] PRIMARY KEY CLUSTERED
(
[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[TreatmentSchedule]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[TreatmentSchedule](
    [TreatmentID] [int] IDENTITY(1,1) NOT NULL,
    [PlayerID] [int] NULL,
    [TreatmentDate] [date] NULL,
    [TreatmentTime] [time](7) NULL,
    [TreatmentDescription] [text] NULL,
    CONSTRAINT [PK__Treatmen__1A57B71125A2D698] PRIMARY KEY CLUSTERED
(
[TreatmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[User]    Script Date: 7/1/2024 12:31:07 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[User](
    [UserID] [int] IDENTITY(1,1) NOT NULL,
    [Username] [varchar](50) NULL,
    [Password] [varchar](50) NULL,
    [Image] [nchar](1000) NULL,
    [Email] [varchar](100) NULL,
    [Role] [varchar](50) NULL,
    [Name] [nchar](100) NULL,
    [DateOfBirth] [datetime] NULL,
    [About] [text] NULL,
    [Status] [bit] NULL,
    CONSTRAINT [PK__User__1788CCAC15C20CF9] PRIMARY KEY CLUSTERED
(
[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
    SET IDENTITY_INSERT [dbo].[AttendanceCheck] ON

    INSERT [dbo].[AttendanceCheck] ([AttendanceID], [PlayerID], [TrainingID], [CheckDate], [IsPresent]) VALUES (22, 1, 9, CAST(N'2024-06-09T00:00:00.000' AS DateTime), 1)
    INSERT [dbo].[AttendanceCheck] ([AttendanceID], [PlayerID], [TrainingID], [CheckDate], [IsPresent]) VALUES (23, 2, 9, CAST(N'2024-06-09T00:00:00.000' AS DateTime), 1)
    INSERT [dbo].[AttendanceCheck] ([AttendanceID], [PlayerID], [TrainingID], [CheckDate], [IsPresent]) VALUES (24, 3, 9, CAST(N'2024-06-09T00:00:00.000' AS DateTime), 1)
    INSERT [dbo].[AttendanceCheck] ([AttendanceID], [PlayerID], [TrainingID], [CheckDate], [IsPresent]) VALUES (25, 1, 10, CAST(N'2024-06-09T00:00:00.000' AS DateTime), 1)
    INSERT [dbo].[AttendanceCheck] ([AttendanceID], [PlayerID], [TrainingID], [CheckDate], [IsPresent]) VALUES (26, 2, 10, CAST(N'2024-06-09T00:00:00.000' AS DateTime), 0)
    INSERT [dbo].[AttendanceCheck] ([AttendanceID], [PlayerID], [TrainingID], [CheckDate], [IsPresent]) VALUES (27, 3, 10, CAST(N'2024-06-09T00:00:00.000' AS DateTime), 1)
    INSERT [dbo].[AttendanceCheck] ([AttendanceID], [PlayerID], [TrainingID], [CheckDate], [IsPresent]) VALUES (28, 1, 11, CAST(N'2024-06-11T00:00:00.000' AS DateTime), 1)
    INSERT [dbo].[AttendanceCheck] ([AttendanceID], [PlayerID], [TrainingID], [CheckDate], [IsPresent]) VALUES (29, 2, 11, CAST(N'2024-06-11T00:00:00.000' AS DateTime), 0)
    INSERT [dbo].[AttendanceCheck] ([AttendanceID], [PlayerID], [TrainingID], [CheckDate], [IsPresent]) VALUES (30, 3, 11, CAST(N'2024-06-11T00:00:00.000' AS DateTime), 0)
    SET IDENTITY_INSERT [dbo].[AttendanceCheck] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Coach] ON

    INSERT [dbo].[Coach] ([CoachID], [UserID], [CoachName]) VALUES (1, 4, N'Le Tien                                                                                             ')
    SET IDENTITY_INSERT [dbo].[Coach] OFF
    GO
    SET IDENTITY_INSERT [dbo].[DietPlan] ON

    INSERT [dbo].[DietPlan] ([DietPlanID], [PlayerID], [PlanDescription]) VALUES (1, 1, N'an kiêng thôi')
    INSERT [dbo].[DietPlan] ([DietPlanID], [PlayerID], [PlanDescription]) VALUES (2, 3, N'doi bung nen phai nhin')
    INSERT [dbo].[DietPlan] ([DietPlanID], [PlayerID], [PlanDescription]) VALUES (3, 3, N'tap gym giam can')
    SET IDENTITY_INSERT [dbo].[DietPlan] OFF
    GO
    INSERT [dbo].[DietPlanFoods] ([DietPlanID], [FoodID], [PortionSize]) VALUES (2, 1, N'333')
    INSERT [dbo].[DietPlanFoods] ([DietPlanID], [FoodID], [PortionSize]) VALUES (2, 2, N'222')
    INSERT [dbo].[DietPlanFoods] ([DietPlanID], [FoodID], [PortionSize]) VALUES (2, 3, N'333')
    GO
    SET IDENTITY_INSERT [dbo].[Foods] ON

    INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Calo], [Proteins], [Carbohydrates], [Fats]) VALUES (1, N'tao', N'tao tau', CAST(123.00 AS Decimal(10, 2)), CAST(123.00 AS Decimal(10, 2)), CAST(333.00 AS Decimal(10, 2)), CAST(121.00 AS Decimal(10, 2)))
    INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Calo], [Proteins], [Carbohydrates], [Fats]) VALUES (2, N'chuoi', N'nai', CAST(22.00 AS Decimal(10, 2)), CAST(33.00 AS Decimal(10, 2)), CAST(123.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)))
    INSERT [dbo].[Foods] ([FoodID], [FoodName], [Description], [Calo], [Proteins], [Carbohydrates], [Fats]) VALUES (3, N'cam', N'xanh', CAST(1233.00 AS Decimal(10, 2)), CAST(33.00 AS Decimal(10, 2)), CAST(33.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)))
    SET IDENTITY_INSERT [dbo].[Foods] OFF
    GO
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (1, N'Messi Jersey', N'Jersey of player Messi', CAST(39.99 AS Decimal(10, 2)), N'messi.png')
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (2, N'Ronaldo Jersey', N'Jersey of player Ronaldo', CAST(39.99 AS Decimal(10, 2)), N'ronaldo.jpg')
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (3, N'Neymar Jersey', N'Jersey of player Neymar', CAST(39.99 AS Decimal(10, 2)), N'neymar.jpg')
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (4, N'Salah Jersey', N'Jersey of player Salah', CAST(39.99 AS Decimal(10, 2)), N'salah.jpg')
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (5, N'Mbappe Jersey', N'Jersey of player Mbappe', CAST(39.99 AS Decimal(10, 2)), N'mbappe.jpg')
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (6, N'Hazard Jersey', N'Jersey of player Hazard', CAST(39.99 AS Decimal(10, 2)), N'hazard.jpg')
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (7, N'Lewandowski Jersey', N'Jersey of player Lewandowski', CAST(39.99 AS Decimal(10, 2)), N'lewandowski.jpg')
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (8, N'De Bruyne Jersey', N'Jersey of player De Bruyne', CAST(39.99 AS Decimal(10, 2)), N'kevin.jpg')
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (9, N'Van Dijk Jersey', N'Jersey of player Van Dijk', CAST(39.99 AS Decimal(10, 2)), N'dijk.jpg')
    INSERT [dbo].[Jerseys] ([JerseyID], [JerseyName], [JerseyDescription], [JerseyPrice], [JerseyImage]) VALUES (10, N'Kane Jersey', N'Jersey of player Kane', CAST(39.99 AS Decimal(10, 2)), N'kane.jpg')
    GO
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (1, 1, N'S', 10)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (2, 1, N'M', 12)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (3, 1, N'L', 20)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (4, 1, N'XL', 15)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (5, 2, N'S', 9)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (6, 2, N'M', 7)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (7, 2, N'L', 21)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (8, 2, N'XL', 17)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (9, 3, N'S', 11)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (10, 3, N'M', 10)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (11, 3, N'L', 25)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (12, 3, N'XL', 15)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (13, 4, N'S', 7)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (14, 4, N'M', 13)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (15, 4, N'L', 18)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (16, 4, N'XL', 19)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (17, 5, N'S', 15)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (18, 5, N'M', 22)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (19, 5, N'L', 21)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (20, 5, N'XL', 14)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (21, 6, N'S', 10)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (22, 6, N'M', 15)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (23, 6, N'L', 22)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (24, 6, N'XL', 18)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (25, 7, N'S', 13)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (26, 7, N'M', 19)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (27, 7, N'L', 23)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (28, 7, N'XL', 14)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (29, 8, N'S', 15)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (30, 8, N'M', 20)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (31, 8, N'L', 18)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (32, 8, N'XL', 14)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (33, 9, N'S', 18)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (34, 9, N'M', 19)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (35, 9, N'L', 20)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (36, 9, N'XL', 12)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (37, 10, N'S', 20)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (38, 10, N'M', 18)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (39, 10, N'L', 15)
    INSERT [dbo].[JerseySizes] ([SizeID], [JerseyID], [JerseySize], [JerseyQuantity]) VALUES (40, 10, N'XL', 17)
    GO
    SET IDENTITY_INSERT [dbo].[MatchSchedule] ON

    INSERT [dbo].[MatchSchedule] ([MatchID], [AwayTeamID], [HomeTeamID], [MatchDate], [MatchLocation], [Tournament])
    VALUES (1, 1, 2, CAST(N'2022-12-12 20:00:00' AS DATETIME), N'Kenan Stadium, Chapel Hill', N'Friendly')
    INSERT [dbo].[MatchSchedule] ([MatchID], [AwayTeamID], [HomeTeamID], [MatchDate], [MatchLocation], [Tournament])
    VALUES (1002, 1, 7, CAST(N'2024-07-03 20:00:00' AS Datetime), N'Yankee Stadium, New York City', N'LIGUE_1')
    INSERT [dbo].[MatchSchedule] ([MatchID], [AwayTeamID], [HomeTeamID], [MatchDate], [MatchLocation], [Tournament])
    VALUES (1003, 2, 7, CAST(N'2024-09-13 20:00:00' AS Datetime), N'Camping World Stadium, Orlando, Florida', N'LA_LIGA')
    SET IDENTITY_INSERT [dbo].[MatchSchedule] OFF
    GO
    SET IDENTITY_INSERT [dbo].[MatchStatistic] ON

    INSERT [dbo].[MatchStatistic] ([MatchStatisticID], [MatchID], [TeamID], [Score], [YellowCards], [RedCards], [TotalShots], [CornerKicks], [BallPossession], [Passes]) VALUES (1, 1, 1, 2, 3, 0, 9, 6, 9, 3)
    INSERT [dbo].[MatchStatistic] ([MatchStatisticID], [MatchID], [TeamID], [Score], [YellowCards], [RedCards], [TotalShots], [CornerKicks], [BallPossession], [Passes]) VALUES (2, 1, 2, 1, 4, 6, 7, 3, 7, 9)
    SET IDENTITY_INSERT [dbo].[MatchStatistic] OFF
    GO
    SET IDENTITY_INSERT [dbo].[MeetingSchedule] ON

    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1, CAST(N'2022-12-08T00:00:00.000' AS DateTime), N'13:30', N'', N'')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (2, CAST(N'2011-03-08T00:00:00.000' AS DateTime), N'9:15', N'dd', N'description')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (3, CAST(N'2024-06-13T00:00:00.000' AS DateTime), N'3:30', N'vn', N'')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (4, CAST(N'2024-06-12T00:00:00.000' AS DateTime), N'16:59', N'vnn', N'')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1001, CAST(N'2024-10-31T00:00:00.000' AS DateTime), N'15:11:55', N'VIP Lounge', N'Training Session')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1002, CAST(N'2024-11-27T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Technical Briefing')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1003, CAST(N'2024-11-23T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room B', N'Customer Feedback Session')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1004, CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'15:11:55', N'Garden Area', N'Staff Orientation')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1005, CAST(N'2024-10-17T00:00:00.000' AS DateTime), N'15:11:55', N'Garden Area', N'Board of Directors Meeting')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1006, CAST(N'2024-07-11T00:00:00.000' AS DateTime), N'15:11:55', N'Garden Area', N'Training Session')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1007, CAST(N'2024-11-17T00:00:00.000' AS DateTime), N'15:11:55', N'Main Hall', N'Staff Orientation')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1008, CAST(N'2024-11-26T00:00:00.000' AS DateTime), N'15:11:55', N'VIP Lounge', N'Staff Orientation')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1009, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'15:11:55', N'Main Hall', N'Customer Feedback Session')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1010, CAST(N'2024-11-17T00:00:00.000' AS DateTime), N'15:11:55', N'VIP Lounge', N'Annual General Meeting')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1011, CAST(N'2024-07-26T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room B', N'Budget Review')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1012, CAST(N'2024-09-21T00:00:00.000' AS DateTime), N'15:11:55', N'Garden Area', N'Stakeholder Update')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1013, CAST(N'2024-09-26T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Product Launch Meeting')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1014, CAST(N'2024-08-26T00:00:00.000' AS DateTime), N'15:11:55', N'VIP Lounge', N'Sales Performance Review')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1015, CAST(N'2024-07-13T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Training Session')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1016, CAST(N'2024-12-15T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Team Building Workshop')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1017, CAST(N'2024-08-07T00:00:00.000' AS DateTime), N'15:11:55', N'Main Hall', N'Team Building Workshop')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1018, CAST(N'2024-11-05T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Technical Briefing')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1019, CAST(N'2024-12-04T00:00:00.000' AS DateTime), N'15:11:55', N'Main Hall', N'Marketing Campaign Discussion')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1020, CAST(N'2024-10-26T00:00:00.000' AS DateTime), N'15:11:55', N'Garden Area', N'Stakeholder Update')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1021, CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Board of Directors Meeting')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1022, CAST(N'2024-10-08T00:00:00.000' AS DateTime), N'15:11:55', N'Main Hall', N'Team Building Workshop')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1023, CAST(N'2024-07-23T00:00:00.000' AS DateTime), N'15:11:55', N'Garden Area', N'Sales Performance Review')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1024, CAST(N'2024-11-13T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Marketing Campaign Discussion')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1025, CAST(N'2024-10-08T00:00:00.000' AS DateTime), N'15:11:55', N'Main Hall', N'Technical Briefing')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1026, CAST(N'2024-10-05T00:00:00.000' AS DateTime), N'15:11:55', N'VIP Lounge', N'Team Building Workshop')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1027, CAST(N'2024-08-03T00:00:00.000' AS DateTime), N'15:11:55', N'Main Hall', N'Annual General Meeting')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1028, CAST(N'2024-11-22T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Sales Performance Review')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1029, CAST(N'2024-08-17T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Customer Feedback Session')
    INSERT [dbo].[MeetingSchedule] ([MeetingID], [MeetingDate], [MeetingTime], [Location], [Description]) VALUES (1030, CAST(N'2024-08-11T00:00:00.000' AS DateTime), N'15:11:55', N'Conference Room A', N'Customer Feedback Session')
    SET IDENTITY_INSERT [dbo].[MeetingSchedule] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Player] ON

    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1, 2, N'LB', N'tien', CAST(N'2003-12-08' AS Date), N'70.2      ', 178)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (2, 11, N'LW', N'qminh', CAST(N'2002-12-05' AS Date), N'79        ', 180)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (3, 12, N'RW', N'nminh', CAST(N'2001-11-06' AS Date), N'88        ', 192)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (4, 13, N'LW', N'trikhang', CAST(N'2003-03-10' AS Date), N'68        ', 187)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1004, 1013, N'LB', N'Ronaldo', CAST(N'1987-06-18' AS Date), N'76        ', 186)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1005, 1014, N'ST', N'Messi', CAST(N'1987-06-24' AS Date), N'72        ', 170)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1006, 1015, N'LW', N'Neymar', CAST(N'1992-02-05' AS Date), N'68        ', 175)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1007, 1016, N'RCM', N'KaKa', CAST(N'1998-12-20' AS Date), N'73        ', 178)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1008, 1017, N'RW', N'Salah', CAST(N'1992-06-15' AS Date), N'71        ', 175)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1009, 1018, N'LCM', N'De Bruyne', CAST(N'1991-06-28' AS Date), N'70        ', 181)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1010, 1019, N'RCB', N'PePe', CAST(N'1988-08-21' AS Date), N'79        ', 185)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1011, 1020, N'RB', N'Walker', CAST(N'1993-07-28' AS Date), N'86        ', 188)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1012, 1021, N'GK', N'De Gea', CAST(N'1990-11-07' AS Date), N'83        ', 192)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1013, 1022, N'CDM', N'Kante', CAST(N'1991-03-29' AS Date), N'70        ', 168)
    INSERT [dbo].[Player] ([PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (1014, 1023, N'LCB', N'Ramos', CAST(N'1987-03-29' AS Date), N'79        ', 186)
    SET IDENTITY_INSERT [dbo].[Player] OFF
    GO
    SET IDENTITY_INSERT [dbo].[PlayerPerformance] ON

    INSERT [dbo].[PlayerPerformance] ([PerformanceID], [PlayerID], [MatchID], [GoalsScored], [YellowCards], [RedCards]) VALUES (1, 3, 1, 3, 2, 1)
    INSERT [dbo].[PlayerPerformance] ([PerformanceID], [PlayerID], [MatchID], [GoalsScored], [YellowCards], [RedCards]) VALUES (3, 3, 1002, 2, 0, 0)
    INSERT [dbo].[PlayerPerformance] ([PerformanceID], [PlayerID], [MatchID], [GoalsScored], [YellowCards], [RedCards]) VALUES (4, 3, 1003, 1, 0, 0)
    SET IDENTITY_INSERT [dbo].[PlayerPerformance] OFF
    GO
    SET IDENTITY_INSERT [dbo].[PlayerPhysicalCondition] ON

    INSERT [dbo].[PlayerPhysicalCondition] ([ConditionID], [PlayerID], [ConditionDescription], [DateRecorded]) VALUES (1, 3, N'anh nay khoe nhung luoi t?p', CAST(N'2024-04-04' AS Date))
    INSERT [dbo].[PlayerPhysicalCondition] ([ConditionID], [PlayerID], [ConditionDescription], [DateRecorded]) VALUES (2, 3, N'hoi khó hi?u', CAST(N'2024-05-05' AS Date))
    SET IDENTITY_INSERT [dbo].[PlayerPhysicalCondition] OFF
    GO
    SET IDENTITY_INSERT [dbo].[TeamNews] ON

    INSERT [dbo].[TeamNews] ([NewsID], [NewsTitle], [NewsImageDescription], [NewsContent], [DatePosted], [Description]) VALUES (2, N'new newspaper', N'Logo-Dai-hoc-FPT (1).webp                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'<p>abc</p>

<p>&nbsp;</p>
', CAST(N'2024-06-12' AS Date), N'add')
    INSERT [dbo].[TeamNews] ([NewsID], [NewsTitle], [NewsImageDescription], [NewsContent], [DatePosted], [Description]) VALUES (3, N'geee', N'áds,adsd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'<p>xyz</p>

<p>&nbsp;</p>
', CAST(N'2024-06-12' AS Date), N'add1')
    INSERT [dbo].[TeamNews] ([NewsID], [NewsTitle], [NewsImageDescription], [NewsContent], [DatePosted], [Description]) VALUES (4, N'title', N'[áds, adsd]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'<p>qwe</p>
', CAST(N'2024-06-12' AS Date), N'add2')
    SET IDENTITY_INSERT [dbo].[TeamNews] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Teams] ON

    INSERT [dbo].[Teams] ([TeamID], [TeamName], [flag]) VALUES (1, N'Manchester', N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/800px-Flag_of_England.svg.png')
    INSERT [dbo].[Teams] ([TeamID], [TeamName], [flag]) VALUES (2, N'Barcelona', N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/800px-Flag_of_England.svg.png')
    INSERT [dbo].[Teams] ([TeamID], [TeamName], [flag]) VALUES (3, N'Real Madrid', N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/800px-Flag_of_England.svg.png')
    INSERT [dbo].[Teams] ([TeamID], [TeamName], [flag]) VALUES (4, N'Juventus', N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/800px-Flag_of_England.svg.png')
    INSERT [dbo].[Teams] ([TeamID], [TeamName], [flag]) VALUES (5, N'Liverpool', N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/800px-Flag_of_England.svg.png')
    INSERT [dbo].[Teams] ([TeamID], [TeamName], [flag]) VALUES (6, N'Arsenal', N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/800px-Flag_of_England.svg.png')
    INSERT [dbo].[Teams] ([TeamID], [TeamName], [flag]) VALUES (7, N'RealFC', N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/800px-Flag_of_England.svg.png')
    SET IDENTITY_INSERT [dbo].[Teams] OFF
    GO
    SET IDENTITY_INSERT [dbo].[TrainingSchedule] ON

    INSERT [dbo].[TrainingSchedule] ([TrainingID], [TrainingDate], [TrainingTime], [Location], [Description]) VALUES (9, CAST(N'2024-06-05T00:00:00.000' AS DateTime), N'16:22', N'vn', N'')
    INSERT [dbo].[TrainingSchedule] ([TrainingID], [TrainingDate], [TrainingTime], [Location], [Description]) VALUES (10, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'19:32', N'vn', N'')
    INSERT [dbo].[TrainingSchedule] ([TrainingID], [TrainingDate], [TrainingTime], [Location], [Description]) VALUES (11, CAST(N'2024-06-11T00:00:00.000' AS DateTime), N'15:38', N'vn', N'')
    SET IDENTITY_INSERT [dbo].[TrainingSchedule] OFF
    GO
    SET IDENTITY_INSERT [dbo].[TreatmentSchedule] ON

    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (1, 3, CAST(N'2024-03-05' AS Date), CAST(N'15:00:00' AS Time), N'âcsca')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (2, 3, CAST(N'2024-06-06' AS Date), CAST(N'12:00:00' AS Time), N'czczc')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (3, 3, CAST(N'2024-06-02' AS Date), CAST(N'13:38:33' AS Time), N'Sample treatment description 1')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (4, 3, CAST(N'2024-02-03' AS Date), CAST(N'16:16:14' AS Time), N'Sample treatment description 2')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (5, 3, CAST(N'2024-01-04' AS Date), CAST(N'01:46:58' AS Time), N'Sample treatment description 3')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (6, 3, CAST(N'2024-12-05' AS Date), CAST(N'17:31:27' AS Time), N'Sample treatment description 4')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (7, 3, CAST(N'2024-01-06' AS Date), CAST(N'04:33:17' AS Time), N'Sample treatment description 5')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (8, 3, CAST(N'2024-07-07' AS Date), CAST(N'01:54:25' AS Time), N'Sample treatment description 6')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (9, 3, CAST(N'2024-01-08' AS Date), CAST(N'20:24:18' AS Time), N'Sample treatment description 7')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (10, 3, CAST(N'2024-03-09' AS Date), CAST(N'20:09:08' AS Time), N'Sample treatment description 8')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (11, 3, CAST(N'2024-07-10' AS Date), CAST(N'07:22:28' AS Time), N'Sample treatment description 9')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (12, 3, CAST(N'2024-04-11' AS Date), CAST(N'09:06:50' AS Time), N'Sample treatment description 10')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (13, 3, CAST(N'2024-01-12' AS Date), CAST(N'16:12:00' AS Time), N'Sample treatment description 11')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (14, 3, CAST(N'2024-01-13' AS Date), CAST(N'23:41:38' AS Time), N'Sample treatment description 12')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (15, 3, CAST(N'2024-01-14' AS Date), CAST(N'08:37:43' AS Time), N'Sample treatment description 13')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (16, 3, CAST(N'2024-07-15' AS Date), CAST(N'14:02:05' AS Time), N'Sample treatment description 14')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (17, 3, CAST(N'2024-09-16' AS Date), CAST(N'05:15:44' AS Time), N'Sample treatment description 15')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (18, 3, CAST(N'2024-11-17' AS Date), CAST(N'17:38:43' AS Time), N'Sample treatment description 16')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (19, 3, CAST(N'2024-01-18' AS Date), CAST(N'01:02:26' AS Time), N'Sample treatment description 17')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (20, 3, CAST(N'2024-01-19' AS Date), CAST(N'06:31:27' AS Time), N'Sample treatment description 18')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (21, 3, CAST(N'2024-01-20' AS Date), CAST(N'14:01:02' AS Time), N'Sample treatment description 19')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (22, 3, CAST(N'2024-01-21' AS Date), CAST(N'21:43:06' AS Time), N'Sample treatment description 20')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (23, 3, CAST(N'2024-01-22' AS Date), CAST(N'07:35:25' AS Time), N'Sample treatment description 21')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (24, 3, CAST(N'2024-01-23' AS Date), CAST(N'12:47:02' AS Time), N'Sample treatment description 22')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (25, 3, CAST(N'2024-01-24' AS Date), CAST(N'22:09:30' AS Time), N'Sample treatment description 23')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (26, 3, CAST(N'2024-01-25' AS Date), CAST(N'09:01:33' AS Time), N'Sample treatment description 24')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (27, 3, CAST(N'2024-01-26' AS Date), CAST(N'09:01:19' AS Time), N'Sample treatment description 25')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (28, 3, CAST(N'2024-01-27' AS Date), CAST(N'01:51:46' AS Time), N'Sample treatment description 26')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (29, 3, CAST(N'2024-01-28' AS Date), CAST(N'16:47:27' AS Time), N'Sample treatment description 27')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (30, 3, CAST(N'2024-01-29' AS Date), CAST(N'06:56:29' AS Time), N'Sample treatment description 28')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (31, 3, CAST(N'2024-01-30' AS Date), CAST(N'12:37:12' AS Time), N'Sample treatment description 29')
    INSERT [dbo].[TreatmentSchedule] ([TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (32, 3, CAST(N'2024-01-31' AS Date), CAST(N'19:14:58' AS Time), N'Sample treatment description 30')
    SET IDENTITY_INSERT [dbo].[TreatmentSchedule] OFF
    GO
    SET IDENTITY_INSERT [dbo].[User] ON

    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1, N'admin', N'123', N'http://localhost:8080/SWPClubManegement/IMAGE/AVATAR/images.png                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'Admin@gmail.com', N'Admin', N'Admin                                                                                               ', CAST(N'2003-02-03T00:00:00.000' AS DateTime), N'a', 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (2, N'lkhoa', N'123', N'http://localhost:8080/SWPClubManegement/IMAGE/AVATAR/images.png                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'user@gmail.com', N'User', N'quang minh                                                                                          ', CAST(N'2003-07-31T00:00:00.000' AS DateTime), N'', 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (3, N'player', N'123', NULL, N'player@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (4, N'coach', N'123', NULL, N'coach@gmail.com', N'Coach', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (5, N'medical', N'123', NULL, N'medical@gmail.com', N'Medical', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (11, N'qminh', N'123', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBbZ3fwlY7id7IcyC2fYH-Vae_jl_w5YGlcQ&s                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'qminh@gmail.com', N'Player', N'qminh                                                                                               ', CAST(N'2003-07-31T00:00:00.000' AS DateTime), N'dka', 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (12, N'nminh', N'123', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSOpH_l_mimlUGRouXcGnFY_-54ddnpsU7Zw&s                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'nminh@gmail.com', N'Player', N'nminh                                                                                               ', CAST(N'1999-01-21T00:00:00.000' AS DateTime), N'b', 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (13, N'tkhang', N'123', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBbZ3fwlY7id7IcyC2fYH-Vae_jl_w5YGlcQ&s                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'khang@gmail.com', N'Player', N'tkhang                                                                                              ', CAST(N'1992-01-22T00:00:00.000' AS DateTime), N'c', 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1013, N'Ronaldo', N'123', N'/SWPClubManegement\IMAGE\PLAYER\Ronaldo1719276867681.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'a1@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1014, N'Messi', N'1234', N'/SWPClubManegement\IMAGE\PLAYER\Messi1719276867823.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'a2@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1015, N'Neymar', N'1234', N'/SWPClubManegement\IMAGE\PLAYER\Neymar1719276867920.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'a3@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1016, N'KaKa', N'1234', N'/SWPClubManegement\IMAGE\PLAYER\KaKa1719276868041.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'a4@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1017, N'Salah', N'1234', N'/SWPClubManegement\IMAGE\PLAYER\Salah1719276868169.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'a5@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1018, N'De Bruyne', N'1234', N'/SWPClubManegement\IMAGE\PLAYER\De_Bruyne1719276868298.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'a6@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1019, N'PePe', N'1234', N'/SWPClubManegement\IMAGE\PLAYER\PePe1719276868414.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'a7@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1020, N'Walker', N'1234', N'/SWPClubManegement\IMAGE\PLAYER\Walker1719276868569.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'a8@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1021, N'De Gea', N'1234', N'/SWPClubManegement\IMAGE\PLAYER\De_Gea1719276868723.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'a9@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1022, N'Kante', N'1234', N'/SWPClubManegement\IMAGE\PLAYER\Kante1719276868845.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'a10@gmail.com', N'Player', NULL, NULL, NULL, 1)
    INSERT [dbo].[User] ([UserID], [Username], [Password], [Image], [Email], [Role], [Name], [DateOfBirth], [About], [Status]) VALUES (1023, N'Ramos', N'tien1234', N'/SWPClubManegement\IMAGE\PLAYER\Ramos1719276868974.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'a11@gmail.com', N'Player', NULL, NULL, NULL, 1)
    SET IDENTITY_INSERT [dbo].[User] OFF
    GO
/****** Object:  Index [Unique_u]    Script Date: 7/1/2024 12:31:07 AM ******/
ALTER TABLE [dbo].[Coach] ADD  CONSTRAINT [Unique_u] UNIQUE NONCLUSTERED
    (
    [UserID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    GO
/****** Object:  Index [IX_Player]    Script Date: 7/1/2024 12:31:07 AM ******/
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [IX_Player] UNIQUE NONCLUSTERED
    (
    [UserID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    GO
    SET ANSI_PADDING ON
    GO
/****** Object:  Index [UQ_Email]    Script Date: 7/1/2024 12:31:07 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED
    (
    [Email] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    GO
/****** Object:  Index [IX_User]    Script Date: 7/1/2024 12:31:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_User] ON [dbo].[User]
    (
     [UserID] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceCheck]  WITH CHECK ADD  CONSTRAINT [FK__Attendanc__Playe__4D94879B] FOREIGN KEY([PlayerID])
    REFERENCES [dbo].[Player] ([PlayerID])
    GO
ALTER TABLE [dbo].[AttendanceCheck] CHECK CONSTRAINT [FK__Attendanc__Playe__4D94879B]
    GO
ALTER TABLE [dbo].[AttendanceCheck]  WITH CHECK ADD  CONSTRAINT [FK__Attendanc__Train__5AEE82B9] FOREIGN KEY([TrainingID])
    REFERENCES [dbo].[TrainingSchedule] ([TrainingID])
    GO
ALTER TABLE [dbo].[AttendanceCheck] CHECK CONSTRAINT [FK__Attendanc__Train__5AEE82B9]
    GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD  CONSTRAINT [FK_Coach_User] FOREIGN KEY([UserID])
    REFERENCES [dbo].[User] ([UserID])
    GO
ALTER TABLE [dbo].[Coach] CHECK CONSTRAINT [FK_Coach_User]
    GO
ALTER TABLE [dbo].[DietPlan]  WITH CHECK ADD  CONSTRAINT [FK__DietPlan__Player__440B1D61] FOREIGN KEY([PlayerID])
    REFERENCES [dbo].[Player] ([PlayerID])
    GO
ALTER TABLE [dbo].[DietPlan] CHECK CONSTRAINT [FK__DietPlan__Player__440B1D61]
    GO
ALTER TABLE [dbo].[DietPlanFoods]  WITH CHECK ADD  CONSTRAINT [FK__DietPlanF__DietP__5DCAEF64] FOREIGN KEY([DietPlanID])
    REFERENCES [dbo].[DietPlan] ([DietPlanID])
    GO
ALTER TABLE [dbo].[DietPlanFoods] CHECK CONSTRAINT [FK__DietPlanF__DietP__5DCAEF64]
    GO
ALTER TABLE [dbo].[DietPlanFoods]  WITH CHECK ADD  CONSTRAINT [FK__DietPlanF__FoodI__5EBF139D] FOREIGN KEY([FoodID])
    REFERENCES [dbo].[Foods] ([FoodID])
    GO
ALTER TABLE [dbo].[DietPlanFoods] CHECK CONSTRAINT [FK__DietPlanF__FoodI__5EBF139D]
    GO
ALTER TABLE [dbo].[ExpectedLineups]  WITH CHECK ADD  CONSTRAINT [FK__ExpectedL__Playe__5AEE82B9] FOREIGN KEY([PlayerID])
    REFERENCES [dbo].[Player] ([PlayerID])
    GO
ALTER TABLE [dbo].[ExpectedLineups] CHECK CONSTRAINT [FK__ExpectedL__Playe__5AEE82B9]
    GO
ALTER TABLE [dbo].[JerseySizes]  WITH CHECK ADD  CONSTRAINT [FK__JerseySiz__Jerse__214BF109] FOREIGN KEY([JerseyID])
    REFERENCES [dbo].[Jerseys] ([JerseyID])
    GO
ALTER TABLE [dbo].[JerseySizes] CHECK CONSTRAINT [FK__JerseySiz__Jerse__214BF109]
    GO
ALTER TABLE [dbo].[JerseySizes]  WITH CHECK ADD  CONSTRAINT [FK_JerseySizes_Jerseys] FOREIGN KEY([JerseyID])
    REFERENCES [dbo].[Jerseys] ([JerseyID])
    GO
ALTER TABLE [dbo].[JerseySizes] CHECK CONSTRAINT [FK_JerseySizes_Jerseys]
    GO
ALTER TABLE [dbo].[MatchSchedule]  WITH CHECK ADD  CONSTRAINT [FK_MatchSchedule_Teams] FOREIGN KEY([AwayTeamID])
    REFERENCES [dbo].[Teams] ([TeamID])
    GO
ALTER TABLE [dbo].[MatchSchedule] CHECK CONSTRAINT [FK_MatchSchedule_Teams]
    GO
ALTER TABLE [dbo].[MatchSchedule]  WITH CHECK ADD  CONSTRAINT [FK_MatchSchedule_Teams1] FOREIGN KEY([HomeTeamID])
    REFERENCES [dbo].[Teams] ([TeamID])
    GO
ALTER TABLE [dbo].[MatchSchedule] CHECK CONSTRAINT [FK_MatchSchedule_Teams1]
    GO
ALTER TABLE [dbo].[MatchStatistic]  WITH CHECK ADD  CONSTRAINT [FK_MatchStatistic_MatchSchedule] FOREIGN KEY([MatchID])
    REFERENCES [dbo].[MatchSchedule] ([MatchID])
    GO
ALTER TABLE [dbo].[MatchStatistic] CHECK CONSTRAINT [FK_MatchStatistic_MatchSchedule]
    GO
ALTER TABLE [dbo].[MatchStatistic]  WITH CHECK ADD  CONSTRAINT [FK_MatchStatistic_Teams] FOREIGN KEY([TeamID])
    REFERENCES [dbo].[Teams] ([TeamID])
    GO
ALTER TABLE [dbo].[MatchStatistic] CHECK CONSTRAINT [FK_MatchStatistic_Teams]
    GO
ALTER TABLE [dbo].[OrderJerseyDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderJers__Jerse__251C81ED] FOREIGN KEY([JerseySizeID])
    REFERENCES [dbo].[JerseySizes] ([SizeID])
    GO
ALTER TABLE [dbo].[OrderJerseyDetails] CHECK CONSTRAINT [FK__OrderJers__Jerse__251C81ED]
    GO
ALTER TABLE [dbo].[OrderJerseyDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderJers__Jerse__2610A626] FOREIGN KEY([JerseyID])
    REFERENCES [dbo].[Jerseys] ([JerseyID])
    GO
ALTER TABLE [dbo].[OrderJerseyDetails] CHECK CONSTRAINT [FK__OrderJers__Jerse__2610A626]
    GO
ALTER TABLE [dbo].[OrderJerseyDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderJers__Order__24285DB4] FOREIGN KEY([OrderID])
    REFERENCES [dbo].[Orders] ([OrderID])
    GO
ALTER TABLE [dbo].[OrderJerseyDetails] CHECK CONSTRAINT [FK__OrderJers__Order__24285DB4]
    GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([UserID])
    REFERENCES [dbo].[User] ([UserID])
    GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
    GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK__Player__UserID__2C3393D0] FOREIGN KEY([UserID])
    REFERENCES [dbo].[User] ([UserID])
    GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK__Player__UserID__2C3393D0]
    GO
ALTER TABLE [dbo].[PlayerPerformance]  WITH CHECK ADD  CONSTRAINT [FK__PlayerPer__Match__6477ECF3] FOREIGN KEY([MatchID])
    REFERENCES [dbo].[MatchSchedule] ([MatchID])
    GO
ALTER TABLE [dbo].[PlayerPerformance] CHECK CONSTRAINT [FK__PlayerPer__Match__6477ECF3]
    GO
ALTER TABLE [dbo].[PlayerPerformance]  WITH CHECK ADD  CONSTRAINT [FK__PlayerPer__Playe__5165187F] FOREIGN KEY([PlayerID])
    REFERENCES [dbo].[Player] ([PlayerID])
    GO
ALTER TABLE [dbo].[PlayerPerformance] CHECK CONSTRAINT [FK__PlayerPer__Playe__5165187F]
    GO
ALTER TABLE [dbo].[PlayerPhysicalCondition]  WITH CHECK ADD  CONSTRAINT [FK__PlayerPhy__Playe__3F466844] FOREIGN KEY([PlayerID])
    REFERENCES [dbo].[Player] ([PlayerID])
    GO
ALTER TABLE [dbo].[PlayerPhysicalCondition] CHECK CONSTRAINT [FK__PlayerPhy__Playe__3F466844]
    GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_MatchSchedule] FOREIGN KEY([MatchID])
    REFERENCES [dbo].[MatchSchedule] ([MatchID])
    GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_MatchSchedule]
    GO
ALTER TABLE [dbo].[TicketPurchase]  WITH CHECK ADD  CONSTRAINT [FK_TicketPurchase_Ticket] FOREIGN KEY([TicketID])
    REFERENCES [dbo].[Ticket] ([TicketID])
    GO
ALTER TABLE [dbo].[TicketPurchase] CHECK CONSTRAINT [FK_TicketPurchase_Ticket]
    GO
ALTER TABLE [dbo].[TicketPurchase]  WITH CHECK ADD  CONSTRAINT [FK_TicketPurchase_User] FOREIGN KEY([UserID])
    REFERENCES [dbo].[User] ([UserID])
    GO
ALTER TABLE [dbo].[TicketPurchase] CHECK CONSTRAINT [FK_TicketPurchase_User]
    GO
ALTER TABLE [dbo].[TreatmentSchedule]  WITH CHECK ADD  CONSTRAINT [FK__Treatment__Playe__571DF1D5] FOREIGN KEY([PlayerID])
    REFERENCES [dbo].[Player] ([PlayerID])
    GO
ALTER TABLE [dbo].[TreatmentSchedule] CHECK CONSTRAINT [FK__Treatment__Playe__571DF1D5]
    GO
create table dbo.Cart
(
    Id       int identity
        constraint Cart_pk
        primary key,
    ItemId   int not null,
    UserId   int not null,
    Type     nvarchar(100),
    Quantity int not null
)
    go
USE [master]
GO
ALTER DATABASE [RealClub] SET  READ_WRITE
GO
