USE [master]
GO
/****** Object:  Database [HospitalDB]    Script Date: 06.11.2018 16:20:16 ******/
CREATE DATABASE [HospitalDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HospitalDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HospitalDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HospitalDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalDB] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HospitalDB', N'ON'
GO
USE [HospitalDB]
GO
/****** Object:  Table [dbo].[AccountingWorks]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountingWorks](
	[AccountingID] [uniqueidentifier] NOT NULL,
	[VisitID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AccountingWork] PRIMARY KEY CLUSTERED 
(
	[AccountingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccShiftDuties]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccShiftDuties](
	[AccountingID] [uniqueidentifier] NOT NULL,
	[ShiftID] [uniqueidentifier] NOT NULL,
	[IsDutyDoctor] [bit] NOT NULL,
 CONSTRAINT [PK_AccShiftDuties] PRIMARY KEY CLUSTERED 
(
	[AccountingID] ASC,
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Agencies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencies](
	[AgencyID] [uniqueidentifier] NOT NULL,
	[AgencyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Agencies] PRIMARY KEY CLUSTERED 
(
	[AgencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Analyzes]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analyzes](
	[AnalysisID] [uniqueidentifier] NOT NULL,
	[AnalysisType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Analyzes] PRIMARY KEY CLUSTERED 
(
	[AnalysisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorDischarge]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorDischarge](
	[DischargeID] [uniqueidentifier] NOT NULL,
	[PatientID] [uniqueidentifier] NOT NULL,
	[DrugID1] [uniqueidentifier] NOT NULL,
	[DrugID2] [uniqueidentifier] NOT NULL,
	[DrugID3] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorDischarge] PRIMARY KEY CLUSTERED 
(
	[DischargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorID] [uniqueidentifier] NOT NULL,
	[SpecID] [uniqueidentifier] NOT NULL,
	[DoctorFullName] [nvarchar](50) NOT NULL,
	[Age] [numeric](3, 0) NOT NULL,
	[Experience] [numeric](3, 0) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrugProviders]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugProviders](
	[DrugProviderID] [uniqueidentifier] NOT NULL,
	[ProviderName] [nvarchar](100) NOT NULL,
	[ProviderCountry] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DrugProviders] PRIMARY KEY CLUSTERED 
(
	[DrugProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drugs](
	[DrugID] [uniqueidentifier] NOT NULL,
	[DrugProviderID] [uniqueidentifier] NOT NULL,
	[DrugName] [nvarchar](50) NOT NULL,
	[DrugPurpose] [nvarchar](150) NOT NULL,
	[IsPrescriptionAllowed] [bit] NOT NULL,
 CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED 
(
	[DrugID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Historyillings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historyillings](
	[HistoryillingID] [uniqueidentifier] NOT NULL,
	[IllingID] [uniqueidentifier] NOT NULL,
	[AnalysisID] [uniqueidentifier] NOT NULL,
	[AnalysisResult] [nvarchar](50) NOT NULL,
	[DatePatientilling] [date] NOT NULL,
	[PatientCondition] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Historyillings] PRIMARY KEY CLUSTERED 
(
	[HistoryillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Illings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Illings](
	[IllingID] [uniqueidentifier] NOT NULL,
	[IllingName] [nvarchar](50) NOT NULL,
	[Symptomatology] [nvarchar](255) NOT NULL,
	[TreatDiseaseDuration] [numeric](4, 0) NOT NULL,
 CONSTRAINT [PK_Illings] PRIMARY KEY CLUSTERED 
(
	[IllingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientCards]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientCards](
	[PatientCardNum] [uniqueidentifier] NOT NULL,
	[CardCreatingDate] [date] NOT NULL,
	[CardOwnerFIO] [nvarchar](50) NOT NULL,
	[HistoryillingID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PatientCard] PRIMARY KEY CLUSTERED 
(
	[PatientCardNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patients]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientID] [uniqueidentifier] NOT NULL,
	[PolicyID] [numeric](16, 0) NOT NULL,
	[PatientCardNum] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Policies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policies](
	[PolicyNum] [numeric](16, 0) NOT NULL,
	[AgencyID] [uniqueidentifier] NOT NULL,
	[PatientFullName] [nvarchar](50) NOT NULL,
	[PatientBirthDate] [date] NOT NULL,
	[PatientAddress] [nvarchar](150) NOT NULL,
	[PatientIssueDate] [date] NOT NULL,
	[PatientExpiredDate] [date] NOT NULL,
 CONSTRAINT [PK_Policies] PRIMARY KEY CLUSTERED 
(
	[PolicyNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Receptions]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receptions](
	[ReceptionID] [uniqueidentifier] NOT NULL,
	[ReceptionType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Receptions] PRIMARY KEY CLUSTERED 
(
	[ReceptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[ShiftID] [uniqueidentifier] NOT NULL,
	[ShiftName] [nvarchar](50) NULL,
	[ShiftTime] [time](0) NULL,
 CONSTRAINT [PK_Shifts] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specifications]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specifications](
	[SpecID] [uniqueidentifier] NOT NULL,
	[SpecName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Specifications] PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Visits]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visits](
	[VisitID] [uniqueidentifier] NOT NULL,
	[PatientID] [uniqueidentifier] NOT NULL,
	[DoctorID] [uniqueidentifier] NOT NULL,
	[ReceptionDateTime] [datetime] NOT NULL,
	[ReceptionID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Visits] PRIMARY KEY CLUSTERED 
(
	[VisitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AccountingWorks]  WITH CHECK ADD  CONSTRAINT [FK_AccountingWorks_Visits] FOREIGN KEY([VisitID])
REFERENCES [dbo].[Visits] ([VisitID])
GO
ALTER TABLE [dbo].[AccountingWorks] CHECK CONSTRAINT [FK_AccountingWorks_Visits]
GO
ALTER TABLE [dbo].[AccShiftDuties]  WITH CHECK ADD  CONSTRAINT [FK_AccShiftDuties_AccountingWorks] FOREIGN KEY([AccountingID])
REFERENCES [dbo].[AccountingWorks] ([AccountingID])
GO
ALTER TABLE [dbo].[AccShiftDuties] CHECK CONSTRAINT [FK_AccShiftDuties_AccountingWorks]
GO
ALTER TABLE [dbo].[AccShiftDuties]  WITH CHECK ADD  CONSTRAINT [FK_AccShiftDuties_Shifts] FOREIGN KEY([ShiftID])
REFERENCES [dbo].[Shifts] ([ShiftID])
GO
ALTER TABLE [dbo].[AccShiftDuties] CHECK CONSTRAINT [FK_AccShiftDuties_Shifts]
GO
ALTER TABLE [dbo].[DoctorDischarge]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDischarge_Drugs] FOREIGN KEY([DrugID1])
REFERENCES [dbo].[Drugs] ([DrugID])
GO
ALTER TABLE [dbo].[DoctorDischarge] CHECK CONSTRAINT [FK_DoctorDischarge_Drugs]
GO
ALTER TABLE [dbo].[DoctorDischarge]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDischarge_Drugs1] FOREIGN KEY([DrugID2])
REFERENCES [dbo].[Drugs] ([DrugID])
GO
ALTER TABLE [dbo].[DoctorDischarge] CHECK CONSTRAINT [FK_DoctorDischarge_Drugs1]
GO
ALTER TABLE [dbo].[DoctorDischarge]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDischarge_Drugs2] FOREIGN KEY([DrugID3])
REFERENCES [dbo].[Drugs] ([DrugID])
GO
ALTER TABLE [dbo].[DoctorDischarge] CHECK CONSTRAINT [FK_DoctorDischarge_Drugs2]
GO
ALTER TABLE [dbo].[DoctorDischarge]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDischarge_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[DoctorDischarge] CHECK CONSTRAINT [FK_DoctorDischarge_Patients]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Specifications] FOREIGN KEY([SpecID])
REFERENCES [dbo].[Specifications] ([SpecID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Specifications]
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD  CONSTRAINT [FK_Drugs_DrugProviders] FOREIGN KEY([DrugProviderID])
REFERENCES [dbo].[DrugProviders] ([DrugProviderID])
GO
ALTER TABLE [dbo].[Drugs] CHECK CONSTRAINT [FK_Drugs_DrugProviders]
GO
ALTER TABLE [dbo].[Historyillings]  WITH CHECK ADD  CONSTRAINT [FK_Historyillings_Analyzes] FOREIGN KEY([AnalysisID])
REFERENCES [dbo].[Analyzes] ([AnalysisID])
GO
ALTER TABLE [dbo].[Historyillings] CHECK CONSTRAINT [FK_Historyillings_Analyzes]
GO
ALTER TABLE [dbo].[Historyillings]  WITH CHECK ADD  CONSTRAINT [FK_Historyillings_Illings] FOREIGN KEY([IllingID])
REFERENCES [dbo].[Illings] ([IllingID])
GO
ALTER TABLE [dbo].[Historyillings] CHECK CONSTRAINT [FK_Historyillings_Illings]
GO
ALTER TABLE [dbo].[PatientCards]  WITH CHECK ADD  CONSTRAINT [FK_PatientCards_Historyillings] FOREIGN KEY([HistoryillingID])
REFERENCES [dbo].[Historyillings] ([HistoryillingID])
GO
ALTER TABLE [dbo].[PatientCards] CHECK CONSTRAINT [FK_PatientCards_Historyillings]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_PatientCards] FOREIGN KEY([PatientCardNum])
REFERENCES [dbo].[PatientCards] ([PatientCardNum])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_PatientCards]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Policies] FOREIGN KEY([PolicyID])
REFERENCES [dbo].[Policies] ([PolicyNum])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Policies]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_Policies_Agencies] FOREIGN KEY([AgencyID])
REFERENCES [dbo].[Agencies] ([AgencyID])
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_Policies_Agencies]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [FK_Visits_Doctors] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [FK_Visits_Doctors]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [FK_Visits_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [FK_Visits_Patients]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [FK_Visits_Receptions] FOREIGN KEY([ReceptionID])
REFERENCES [dbo].[Receptions] ([ReceptionID])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [FK_Visits_Receptions]
GO
/****** Object:  StoredProcedure [dbo].[CrtAccShiftDuties]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtAccShiftDuties]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[AccShiftDuties](
	[AccountingID] [uniqueidentifier] NOT NULL,
	[ShiftID] [uniqueidentifier] NOT NULL,
	[IsDutyDoctor] [bit] NOT NULL,
 CONSTRAINT [PK_AccShiftDuties] PRIMARY KEY CLUSTERED 
(
	[AccountingID] ASC,
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[CrtAccWorks]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtAccWorks]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[AccountingWorks](
	[AccountingID] [uniqueidentifier] NOT NULL,
	[VisitID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AccountingWork] PRIMARY KEY CLUSTERED 
(
	[AccountingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[CrtAgencies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtAgencies]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Agencies](
		[AgencyID] [uniqueidentifier] NOT NULL,
		[AgencyName] [nvarchar](50) NOT NULL,
	 CONSTRAINT [PK_Agencies] PRIMARY KEY CLUSTERED 
	(
		[AgencyID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[CrtAnalyzes]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtAnalyzes]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Analyzes](
	[AnalysisID] [uniqueidentifier] NOT NULL,
	[AnalysisType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Analyzes] PRIMARY KEY CLUSTERED 
(
	[AnalysisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[CrtDocDischarge]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtDocDischarge]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[DoctorDischarge](
	[DischargeID] [uniqueidentifier] NOT NULL,
	[PatientID] [uniqueidentifier] NOT NULL,
	[DrugID1] [uniqueidentifier] NOT NULL,
	[DrugID2] [uniqueidentifier] NOT NULL,
	[DrugID3] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorDischarge] PRIMARY KEY CLUSTERED 
(
	[DischargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[CrtDoctors]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtDoctors]
--@DocID uniqueidentifier, @SpecID uniqueidentifier,
--@DocFullName nvarchar(50), @Age numeric(3,0), @Exp numeric(3, 0), @BirthD date, @Cost money
 AS
	BEGIN
		BEGIN TRAN
		CREATE TABLE [dbo].[Doctors](
	[DoctorID] [uniqueidentifier] NOT NULL,
	[SpecID] [uniqueidentifier] NOT NULL,
	[DoctorFullName] [nvarchar](50) NOT NULL,
	[Age] [numeric](3, 0) NOT NULL,
	[Experience] [numeric](3, 0) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtDrugProviders]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtDrugProviders]
--@DocID uniqueidentifier, @SpecID uniqueidentifier,
--@DocFullName nvarchar(50), @Age numeric(3,0), @Exp numeric(3, 0), @BirthD date, @Cost money
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[DrugProviders](
	[DrugProviderID] [uniqueidentifier] NOT NULL,
	[ProviderName] [nvarchar](100) NOT NULL,
	[ProviderCountry] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DrugProviders] PRIMARY KEY CLUSTERED 
(
	[DrugProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtDrugs]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtDrugs]
--@DrugProviderID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Drugs](
	[DrugID] [uniqueidentifier] NOT NULL,
	[DrugProviderID] [uniqueidentifier] NOT NULL,
	[DrugName] [nvarchar](50) NOT NULL,
	[DrugPurpose] [nvarchar](150) NOT NULL,
	[IsPrescriptionAllowed] [bit] NOT NULL,
 CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED 
(
	[DrugID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtHistoryillings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtHistoryillings]
@HistoryIllID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Historyillings](
	[HistoryillingID] [uniqueidentifier] NOT NULL,
	[IllingID] [uniqueidentifier] NOT NULL,
	[AnalysisID] [uniqueidentifier] NOT NULL,
	[AnalysisResult] [nvarchar](50) NOT NULL,
	[DatePatientilling] [date] NOT NULL,
	[PatientCondition] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Historyillings] PRIMARY KEY CLUSTERED 
(
	[HistoryillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtIllings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtIllings]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Illings](
	[IllingID] [uniqueidentifier] NOT NULL,
	[IllingName] [nvarchar](50) NOT NULL,
	[Symptomatology] [nvarchar](255) NOT NULL,
	[TreatDiseaseDuration] [numeric](4, 0) NOT NULL,
 CONSTRAINT [PK_Illings] PRIMARY KEY CLUSTERED 
(
	[IllingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtPatientCards]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtPatientCards]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[PatientCards](
	[PatientCardNum] [uniqueidentifier] NOT NULL,
	[CardCreatingDate] [date] NOT NULL,
	[CardOwnerFIO] [nvarchar](50) NOT NULL,
	[HistoryillingID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PatientCard] PRIMARY KEY CLUSTERED 
(
	[PatientCardNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtPatients]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtPatients]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Patients](
	[PatientID] [uniqueidentifier] NOT NULL,
	[PolicyID] [numeric](16, 0) NOT NULL,
	[PatientCardNum] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtPolicies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtPolicies]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Policies](
	[PolicyNum] [numeric](16, 0) NOT NULL,
	[AgencyID] [uniqueidentifier] NOT NULL,
	[PatientFullName] [nvarchar](50) NOT NULL,
	[PatientBirthDate] [date] NOT NULL,
	[PatientAddress] [nvarchar](150) NOT NULL,
	[PatientIssueDate] [date] NOT NULL,
	[PatientExpiredDate] [date] NOT NULL,
 CONSTRAINT [PK_Policies] PRIMARY KEY CLUSTERED 
(
	[PolicyNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtReceptions]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtReceptions]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Receptions](
	[ReceptionID] [uniqueidentifier] NOT NULL,
	[ReceptionType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Receptions] PRIMARY KEY CLUSTERED 
(
	[ReceptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtShifts]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtShifts]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Shifts](
	[ShiftID] [uniqueidentifier] NOT NULL,
	[ShiftName] [nvarchar](50) NULL,
	[ShiftTime] [time](0) NULL,
 CONSTRAINT [PK_Shifts] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtSpecifications]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtSpecifications]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].Specifications(
	[SpecID] [uniqueidentifier] NOT NULL,
	[SpecName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Specifications] PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[CrtVisits]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrtVisits]
 AS
	BEGIN
		BEGIN TRAN
			CREATE TABLE [dbo].[Visits](
	[VisitID] [uniqueidentifier] NOT NULL,
	[PatientID] [uniqueidentifier] NOT NULL,
	[DoctorID] [uniqueidentifier] NOT NULL,
	[ReceptionDateTime] [datetime] NOT NULL,
	[ReceptionID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Visits] PRIMARY KEY CLUSTERED 
(
	[VisitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelAccShiftDuties]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelAccShiftDuties]
 @AccID uniqueidentifier, @ShiftID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
DELETE FROM [dbo].[AccShiftDuties] WHERE AccountingID = @AccID AND ShiftID = @ShiftID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[DelAccWorks]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelAccWorks]
 @AccID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
DELETE FROM [dbo].[AccountingWorks] WHERE AccountingID = @AccID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[DelAgencies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelAgencies]
 @AgID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Agencies] WHERE AgencyID = @AgID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[DelAnalyzes]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelAnalyzes]
 @AnID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Analyzes] WHERE AnalysisID = @AnID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[DelDocDischarge]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelDocDischarge]
@DischargeID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
		DELETE FROM [dbo].[DoctorDischarge] WHERE DischargeID = @DischargeID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelDoctors]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelDoctors]
@DocID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
		DELETE FROM [dbo].[Doctors] WHERE DoctorID = @DocID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelDrugProviders]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelDrugProviders]
@DrugProviderID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[DrugProviders] WHERE DrugProviderID = @DrugProviderID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelDrugs]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelDrugs]
@DrugID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Drugs] WHERE DrugID = @DrugID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelHistoryillings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelHistoryillings]
@HistoryIllID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Historyillings] WHERE HistoryillingID = @HistoryIllID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelIllings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelIllings]
 @IllID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Illings] WHERE IllingID = @IllID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelPatientCards]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelPatientCards]
 @PatCardNum uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[PatientCards] WHERE PatientCardNum = @PatCardNum
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelPatients]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelPatients]
 @PatID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Patients] WHERE PatientCardNum = @PatID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelPolicies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelPolicies]
  @PolID numeric(16,0)
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Policies] WHERE PolicyNum = @PolID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelReceptions]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelReceptions]
  @RecID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Receptions] WHERE ReceptionID = @RecID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelShifts]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelShifts]
  @ShiftID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Shifts] WHERE ShiftID = @ShiftID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelSpecifications]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelSpecifications]
  @SpecID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Specifications] WHERE SpecID = @SpecID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[DelVisits]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelVisits]
  @VisitID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			DELETE FROM [dbo].[Visits] WHERE VisitID = @VisitID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsAccShiftDuties]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsAccShiftDuties]
 @AccID uniqueidentifier, @ShiftID uniqueidentifier, @IsDutyDoc bit
 AS
	BEGIN
		BEGIN TRAN
INSERT INTO [dbo].[AccShiftDuties] VALUES(@AccID, @ShiftID, @IsDutyDoc)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[InsAccWorks]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsAccWorks]
 @AccID uniqueidentifier, @VisitID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
INSERT INTO [dbo].[AccountingWorks]
     VALUES
           (@AccID, @VisitID)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[InsAgencies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsAgencies]
 @AgName nvarchar(50), @AgID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Agencies] VALUES(@AgID, @AgName)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[InsAnalyzes]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsAnalyzes]
 @AnID uniqueidentifier, @AnType nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Analyzes] VALUES(@AnID, @AnType)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[InsDocDischarge]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsDocDischarge]
@DischargeID uniqueidentifier, @PatID uniqueidentifier,
@DrugID1 uniqueidentifier, @DrugID2 uniqueidentifier, @DrugID3 uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
		INSERT INTO [dbo].[DoctorDischarge] VALUES (@DischargeID, @PatID,  @DrugID1, @DrugID2, @DrugID3)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsDoctors]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsDoctors]
@DocID uniqueidentifier, @SpecID uniqueidentifier,
@DocFullName nvarchar(50), @Age numeric(3,0), @Exp numeric(3, 0), @BirthD date, @Cost money
 AS
	BEGIN
		BEGIN TRAN
		INSERT INTO [dbo].[Doctors] VALUES (@DocID, @SpecID, @DocFullName, @Age, @Exp, @BirthD, @Cost)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsDrugProviders]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsDrugProviders]
@DrugProviderID uniqueidentifier, @ProviderName nvarchar(100), @ProviderCountry nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[DrugProviders] VALUES (@DrugProviderID, @ProviderName, @ProviderCountry)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsDrugs]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsDrugs]
@DrugID uniqueidentifier, @DrugProviderID uniqueidentifier, @DrugName nvarchar(50), @DrugPurpose nvarchar(150), @IsPreAllowed bit
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Drugs] VALUES (@DrugID, @DrugProviderID, @DrugName, @DrugPurpose, @IsPreAllowed)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsHistoryillings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsHistoryillings]
@HistoryIllID uniqueidentifier, @IllID uniqueidentifier, @AnID uniqueidentifier, @AnRes nvarchar(50), @DatePat date, @PatCond nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Historyillings] VALUES (@HistoryIllID, @IllID, @AnID, @AnRes, @DatePat, @PatCond)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsIllings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsIllings]
 @IllID uniqueidentifier, @IllName nvarchar(50), @Sympt nvarchar(255), @TreatDisDur numeric(4,0)
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Illings] VALUES (@IllID, @IllName, @Sympt, @TreatDisDur)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsPatientCards]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsPatientCards]
 @PatCardNum uniqueidentifier, @CardCrtDate date, @CardOwnerFIO nvarchar(50), @HisIllID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[PatientCards] VALUES (@PatCardNum, @CardCrtDate, @CardOwnerFIO, @HisIllID)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsPatients]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsPatients]
 @PatID uniqueidentifier, @PolID numeric(16,0), @PatCardNum uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Patients] VALUES (@PatID, @PolID, @PatCardNum)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsPolicies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsPolicies]
 @PolID numeric(16,0), @AgID uniqueidentifier, @PatFullName nvarchar(50), @PatBirthD date, @PatAddr nvarchar(150), @PatIssueD date, @PatExpD date
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Policies] VALUES (@PolID, @AgID, @PatFullName, @PatBirthD, @PatAddr, @PatIssueD, @PatExpD)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsReceptions]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsReceptions]
	@RecID uniqueidentifier, @RecType nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Receptions] VALUES (@RecID, @RecType)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsShifts]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsShifts]
	@ShiftID uniqueidentifier, @ShiftName nvarchar(50), @ShiftTime time(0)
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Shifts] VALUES (@ShiftID, @ShiftName, @ShiftTime)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsSpecifications]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsSpecifications]
	@SpecID uniqueidentifier, @SpecName nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Specifications] VALUES (@SpecID, @SpecName)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[InsVisits]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsVisits]
	 @VisitID uniqueidentifier, @PatientID uniqueidentifier, @DoctorID uniqueidentifier, @ReceptionDateTime datetime, @ReceptionID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			INSERT INTO [dbo].[Visits] VALUES (@VisitID, @PatientID, @DoctorID, @ReceptionDateTime, @ReceptionID)
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdAccShiftDuties]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdAccShiftDuties]
 @AccID uniqueidentifier, @ShiftID uniqueidentifier, @IsDutyDoc bit
 AS
	BEGIN
		BEGIN TRAN
UPDATE [dbo].[AccShiftDuties]
        SET 
          IsDutyDoctor = @IsDutyDoc
        WHERE AccountingID = @AccID AND ShiftID = @ShiftID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[UpdAccWorks]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdAccWorks]
 @AccID uniqueidentifier, @VisitID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
UPDATE [dbo].[AccountingWorks]
        SET 
          VisitID = @VisitID
        WHERE AccountingID = @AccID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[UpdAgencies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdAgencies]
 @AgName nvarchar(50), @AgID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Agencies]
			SET 
			  AgencyName = @AgName
			WHERE AgencyID = @AgID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[UpdAnalyzes]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdAnalyzes]
 @AnID uniqueidentifier, @AnType nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Analyzes] SET AnalysisType = @AnType WHERE AnalysisID = @AnID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END

GO
/****** Object:  StoredProcedure [dbo].[UpdDocDischarge]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdDocDischarge]
@DischargeID uniqueidentifier, @PatID uniqueidentifier,
@DrugID1 uniqueidentifier, @DrugID2 uniqueidentifier, @DrugID3 uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
	UPDATE [dbo].[DoctorDischarge]
        SET 
          PatientID = @PatID, DrugID1 = @DrugID1, DrugID2 = @DrugID2, DrugID3 = @DrugID3
        WHERE DischargeID = @DischargeID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdDoctors]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdDoctors]
@DocID uniqueidentifier, @SpecID uniqueidentifier,
@DocFullName nvarchar(50), @Age numeric(3,0), @Exp numeric(3, 0), @BirthD date, @Cost money
 AS
	BEGIN
		BEGIN TRAN
		UPDATE [dbo].[Doctors] SET
		SpecID = @SpecID,
		DoctorFullName = @DocFullName,
		Age = @Age,
		Experience = @Exp,
		BirthDate = @BirthD,
		Cost = @Cost
		WHERE DoctorID = @DocID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdDrugProviders]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdDrugProviders]
@DrugProviderID uniqueidentifier, @ProviderName nvarchar(100), @ProviderCountry nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[DrugProviders] SET ProviderName = @ProviderName, ProviderCountry = @ProviderCountry
			WHERE DrugProviderID = @DrugProviderID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdDrugs]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdDrugs]
@DrugID uniqueidentifier, @DrugProviderID uniqueidentifier, @DrugName nvarchar(50), @DrugPurpose nvarchar(150), @IsPreAllowed bit
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Drugs] SET 
			DrugProviderID = @DrugProviderID, DrugName = @DrugName, DrugPurpose = @DrugPurpose, IsPrescriptionAllowed = @IsPreAllowed
			WHERE DrugID = @DrugID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdHistoryillings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdHistoryillings]
@HistoryIllID uniqueidentifier, @IllID uniqueidentifier, @AnID uniqueidentifier, @AnRes nvarchar(50), @DatePat date, @PatCond nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Historyillings] SET 
			IllingID = @IllID, AnalysisID = @AnID, AnalysisResult = @AnRes, DatePatientilling = @DatePat, PatientCondition = @PatCond
			WHERE HistoryillingID = @HistoryIllID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdIllings]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdIllings]
 @IllID uniqueidentifier, @IllName nvarchar(50), @Sympt nvarchar(255), @TreatDisDur numeric(4,0)
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Illings] SET
			IllingName = @IllName, Symptomatology = @Sympt, TreatDiseaseDuration = @TreatDisDur
			WHERE IllingID = @IllID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdPatientCards]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdPatientCards]
 @PatCardNum uniqueidentifier, @CardCrtDate date, @CardOwnerFIO nvarchar(50), @HisIllID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[PatientCards] SET
			CardCreatingDate = @CardCrtDate, CardOwnerFIO = @CardOwnerFIO, HistoryillingID = @HisIllID
			WHERE PatientCardNum = @PatCardNum
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdPatients]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdPatients]
 @PatID uniqueidentifier, @PolID numeric(16,0), @PatCardNum uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Patients] SET
			PolicyID = @PolID, PatientCardNum = @PatCardNum
			WHERE PatientID = @PatID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdPolicies]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdPolicies]
 @PolID numeric(16,0), @AgID uniqueidentifier, @PatFullName nvarchar(50), @PatBirthD date, @PatAddr nvarchar(150), @PatIssueD date, @PatExpD date
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Policies] SET
			 AgencyID = @AgID, PatientFullName = @PatFullName, PatientBirthDate = @PatBirthD,
			 PatientAddress = @PatAddr, PatientIssueDate = @PatIssueD, PatientExpiredDate = @PatExpD
			WHERE PolicyNum = @PolID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdReceptions]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdReceptions]
 @RecID uniqueidentifier, @RecType nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Receptions] SET
			 ReceptionType = @RecType
			WHERE ReceptionID = @RecID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdShifts]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdShifts]
 @ShiftID uniqueidentifier, @ShiftName nvarchar(50), @ShiftTime time(0)
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Shifts] SET
			 ShiftName = @ShiftName, ShiftTime = @ShiftTime
			WHERE ShiftID = @ShiftID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdSpecifications]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdSpecifications]
 @SpecID uniqueidentifier, @SpecName nvarchar(50)
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Specifications] SET SpecName = @SpecName
			WHERE SpecID = @SpecID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
/****** Object:  StoredProcedure [dbo].[UpdVisits]    Script Date: 06.11.2018 16:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdVisits]
 @VisitID uniqueidentifier, @PatientID uniqueidentifier, @DoctorID uniqueidentifier, @ReceptionDateTime datetime, @ReceptionID uniqueidentifier
 AS
	BEGIN
		BEGIN TRAN
			UPDATE [dbo].[Visits] SET PatientID = @PatientID, DoctorID = @DoctorID, ReceptionDateTime = @ReceptionDateTime, ReceptionID = @ReceptionID
			WHERE VisitID = @VisitID
      IF (@@Error != 0)
        ROLLBACK TRAN
      ELSE
        COMMIT TRAN
      END
GO
USE [master]
GO
ALTER DATABASE [HospitalDB] SET  READ_WRITE 
GO
