USE [master]
GO
/****** Object:  Database [QLNV]    Script Date: 4/8/2019 12:13:24 PM ******/
CREATE DATABASE [QLNV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLNV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLNV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLNV] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLNV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLNV] SET  MULTI_USER 
GO
ALTER DATABASE [QLNV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNV] SET QUERY_STORE = OFF
GO
USE [QLNV]
GO
/****** Object:  Table [dbo].[account]    Script Date: 4/8/2019 12:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [varchar](100) NOT NULL,
	[dispname] [nvarchar](100) NOT NULL,
	[pass] [varchar](100) NOT NULL,
	[type1] [int] NOT NULL,
 CONSTRAINT [PK__account__F3DBC573B46B6A85] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 4/8/2019 12:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[msnv] [char](6) NOT NULL,
	[hoten] [nvarchar](100) NULL,
	[gioitinh] [nvarchar](3) NULL,
	[phg] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[msnv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phongban]    Script Date: 4/8/2019 12:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phongban](
	[maphg] [char](4) NOT NULL,
	[tenphg] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maphg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([username], [dispname], [pass], [type1]) VALUES (N'a', N'a', N'1292201552198220877194054219216496220885', 1)
INSERT [dbo].[account] ([username], [dispname], [pass], [type1]) VALUES (N'b', N'ban', N'2022411632231815255237132654824514092250', 0)
INSERT [dbo].[account] ([username], [dispname], [pass], [type1]) VALUES (N'c', N'c', N'3244185981728979115075721453575112', 1)
INSERT [dbo].[nhanvien] ([msnv], [hoten], [gioitinh], [phg]) VALUES (N'NV0001', N'Lê Tuấn Đạt', N'Nam', N'0004')
INSERT [dbo].[nhanvien] ([msnv], [hoten], [gioitinh], [phg]) VALUES (N'NV0002', N'Võ Quốc Thắng', N'Nam', N'0001')
INSERT [dbo].[nhanvien] ([msnv], [hoten], [gioitinh], [phg]) VALUES (N'NV0003', N'Lê Nguyễn Nhựt Trường', N'Nam', N'0004')
INSERT [dbo].[nhanvien] ([msnv], [hoten], [gioitinh], [phg]) VALUES (N'NV0004', N'Lê Đạt', N'Nam', N'0004')
INSERT [dbo].[phongban] ([maphg], [tenphg]) VALUES (N'0001', N'Quản lý nhân sự')
INSERT [dbo].[phongban] ([maphg], [tenphg]) VALUES (N'0002', N'Marketing')
INSERT [dbo].[phongban] ([maphg], [tenphg]) VALUES (N'0004', N'Kĩ thuật')
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF__account__pass__4BAC3F29]  DEFAULT ('123') FOR [pass]
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD  CONSTRAINT [fk_nhanvien_phongban] FOREIGN KEY([phg])
REFERENCES [dbo].[phongban] ([maphg])
GO
ALTER TABLE [dbo].[nhanvien] CHECK CONSTRAINT [fk_nhanvien_phongban]
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD  CONSTRAINT [ck_nhanvien_gioitinh] CHECK  (([gioitinh]=N'Nữ' OR [gioitinh]='Nam'))
GO
ALTER TABLE [dbo].[nhanvien] CHECK CONSTRAINT [ck_nhanvien_gioitinh]
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD  CONSTRAINT [ck_nhanvien_msnv] CHECK  (([msnv] like 'NV%'))
GO
ALTER TABLE [dbo].[nhanvien] CHECK CONSTRAINT [ck_nhanvien_msnv]
GO
/****** Object:  StoredProcedure [dbo].[deletephg]    Script Date: 4/8/2019 12:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deletephg]
@maphg char(4)
as
begin
	update nhanvien set phg=null where phg=@maphg
	delete from phongban where maphg=@maphg
end
GO
/****** Object:  StoredProcedure [dbo].[getusername]    Script Date: 4/8/2019 12:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getusername]
@username varchar(100)
as
begin
select * from account where @username=username
end
GO
/****** Object:  StoredProcedure [dbo].[loginname]    Script Date: 4/8/2019 12:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[loginname]
@username varchar(100),@pass varchar(100)
as
begin
select * from account where @username=username and @pass=pass
end
GO
/****** Object:  StoredProcedure [dbo].[updateacc]    Script Date: 4/8/2019 12:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateacc]
@username varchar(100),@dispname nvarchar(100),@pass varchar(100),@newpass varchar(100)
as
begin
	declare @a int
	select @a=count(*) from account where username=@username and pass=@pass
	if(@a=1)
	begin
		if(@newpass=null or @newpass='')
		begin
			update account set dispname=@dispname where username=@username
		end
		else
		begin
			update account set dispname=@dispname, pass=@newpass where username=@username
		end
	end
end

GO
USE [master]
GO
ALTER DATABASE [QLNV] SET  READ_WRITE 
GO
