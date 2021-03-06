USE [Roommate]
GO
/****** Object:  Table [dbo].[Ad]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[rent] [smallint] NOT NULL,
	[available_from] [varchar](20) NOT NULL,
	[mobile] [varchar](20) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[hood] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[room_type] [varchar](20) NOT NULL,
	[room_number] [varchar](2) NOT NULL,
	[place_size] [varchar](6) NOT NULL,
	[set] [varchar](10) NOT NULL,
	[details] [varchar](200) NULL,
	[essetials] [bit] NULL,
	[tv] [bit] NULL,
	[wifi] [bit] NULL,
	[desk] [bit] NULL,
	[ac] [bit] NULL,
	[url] [varchar](100) NOT NULL,
	[created] [datetime] NOT NULL,
 CONSTRAINT [PK_Ad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdImgFolder]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdImgFolder](
	[AdID] [int] NOT NULL,
	[img_folder] [varchar](200) NOT NULL,
 CONSTRAINT [PK_AdImgFolder] PRIMARY KEY CLUSTERED 
(
	[AdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[gender] [varchar](50) NULL,
	[dob] [varchar](50) NULL,
	[created] [datetime] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[addUserInfo]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dragan Akeljić>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addUserInfo]
	-- Add the parameters for the stored procedure here
	@email varchar(100),
	@password varchar(100),
	@name varchar(50),
	@lastName varchar(50),
	@gender varchar(50),
	@dob varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO UserInfo VALUES(@email, @password, @name, @lastName, @gender, @dob, GETUTCDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[checkUser]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dragan Akeljić>
-- Create date: <20.02.2016.>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[checkUser]
	-- Add the parameters for the stored procedure here
	@email varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT email, password, name, lastName FROM UserInfo WHERE email=@email
END

GO
/****** Object:  StoredProcedure [dbo].[createAd]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dragan Akeljic>
-- Create date: <23.02.2016.>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createAd] 
	-- Add the parameters for the stored procedure here
	@email varchar(50),
	@rent smallint,
	@available_from varchar(20),
	@mobile varchar(20),
	@city varchar(50),
	@hood varchar(50),
	@address varchar(50),
	@room_type varchar(20),
	@room_number varchar(2),
	@place_size varchar(6),
	@set varchar(10),
	@details varchar(200),
	@essentials bit,
	@tv bit,
	@wifi bit,
	@desk bit, 
	@ac bit,
	@url varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Ad VALUES(@email, @rent, @available_from, @mobile, @city, @hood, @address, @room_type, @room_number, @place_size, @set, @details, @essentials, @tv, @wifi, @desk, @ac, @url, GETUTCDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[get6Ads]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get6Ads] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP(6) url, img_folder, available_from, created, rent, room_type, city, hood FROM Ad INNER JOIN AdImgFolder ON Ad.id=AdImgFolder.AdID ORDER BY created DESC
END

GO
/****** Object:  StoredProcedure [dbo].[getAd]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dragan Akeljić>
-- Create date: <28.02.2016.>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAd] 
	-- Add the parameters for the stored procedure here
	@url varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Ad.*, AdImgFolder.img_folder, UserInfo.name FROM (Ad INNER JOIN AdImgFolder ON Ad.id=AdImgFolder.AdID) INNER JOIN UserInfo ON UserInfo.email=Ad.email WHERE Ad.url=@url
END

GO
/****** Object:  StoredProcedure [dbo].[getAdID]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAdID] 
	-- Add the parameters for the stored procedure here
	@email varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP(1) id FROM Ad WHERE email = @email ORDER BY created DESC
END

GO
/****** Object:  StoredProcedure [dbo].[setImgFolder]    Script Date: 1.3.2016. 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[setImgFolder] 
	-- Add the parameters for the stored procedure here
	@AdID int,
	@img_folder varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO AdImgFolder VALUES(@AdID, @img_folder)
END

GO
