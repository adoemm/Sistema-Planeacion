USE [master]
GO
/****** Object:  Database [DBSPIC]    Script Date: 4/7/2017 5:04:03 PM ******/
CREATE DATABASE [DBSPIC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBSPIC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBSPIC.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBSPIC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBSPIC_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBSPIC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSPIC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSPIC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBSPIC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBSPIC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBSPIC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBSPIC] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBSPIC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBSPIC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBSPIC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBSPIC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBSPIC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBSPIC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBSPIC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBSPIC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBSPIC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBSPIC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBSPIC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBSPIC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBSPIC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBSPIC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBSPIC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBSPIC] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBSPIC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBSPIC] SET RECOVERY FULL 
GO
ALTER DATABASE [DBSPIC] SET  MULTI_USER 
GO
ALTER DATABASE [DBSPIC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBSPIC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBSPIC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBSPIC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBSPIC] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBSPIC', N'ON'
GO
USE [DBSPIC]
GO
/****** Object:  User [spic]    Script Date: 4/7/2017 5:04:03 PM ******/
CREATE USER [spic] FOR LOGIN [spic] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [lgplanea]    Script Date: 4/7/2017 5:04:03 PM ******/
CREATE USER [lgplanea] FOR LOGIN [lgplanea] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [lgplanea]
GO
/****** Object:  Table [dbo].[ACADEMICO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACADEMICO](
	[ID_Academico] [int] IDENTITY(1,1) NOT NULL,
	[personalAdmin] [smallint] NOT NULL,
	[docentes] [smallint] NOT NULL,
	[matricula] [int] NOT NULL,
	[turno] [nvarchar](100) NOT NULL,
	[carrerasVigentes] [nvarchar](300) NOT NULL,
	[carrerasLiquidadas] [nvarchar](300) NOT NULL,
	[fechaActualizacion] [nvarchar](10) NOT NULL,
	[periodoEscolar] [nvarchar](100) NOT NULL,
	[FK_ID_Plantel] [int] NOT NULL,
 CONSTRAINT [PK_ACADEMICO] PRIMARY KEY CLUSTERED 
(
	[ID_Academico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVIDAD](
	[ID_Actividad] [int] IDENTITY(1,1) NOT NULL,
	[nombreActividad] [nvarchar](100) NOT NULL,
	[descripccion] [nvarchar](300) NOT NULL,
	[cantidad] [nvarchar](500) NOT NULL,
	[costoOperacion] [decimal](15, 2) NOT NULL,
	[responsable] [nvarchar](100) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[fechaInicio] [nvarchar](10) NOT NULL,
	[fechaFin] [nvarchar](10) NOT NULL,
	[porcentajeAvance] [decimal](5, 2) NOT NULL,
	[fechaActualizacion] [nvarchar](50) NULL,
	[FK_ID_Etapa] [int] NOT NULL,
 CONSTRAINT [PK_ACTIVIDAD] PRIMARY KEY CLUSTERED 
(
	[ID_Actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ARCHIVO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARCHIVO](
	[ID_Archivo] [bigint] IDENTITY(1,1) NOT NULL,
	[nombreArchivo] [nvarchar](250) NOT NULL,
	[descripcion] [nvarchar](300) NOT NULL,
	[ubicacionFisica] [nvarchar](250) NOT NULL,
	[extension] [nvarchar](10) NOT NULL,
	[fechaActualizacion] [nvarchar](10) NOT NULL,
	[FK_ID_Tipo_Archivo] [int] NOT NULL,
	[tamanio] [bigint] NULL,
	[keywords] [nvarchar](150) NULL,
	[hashName] [nvarchar](500) NULL,
	[FK_ID_Plantel] [int] NULL,
	[tipoAcceso] [nvarchar](10) NULL,
 CONSTRAINT [PK_ARCHIVO] PRIMARY KEY CLUSTERED 
(
	[ID_Archivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO](
	[ID_Estado] [int] IDENTITY(1,1) NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED 
(
	[ID_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ETAPA]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETAPA](
	[ID_Etapa] [int] IDENTITY(1,1) NOT NULL,
	[numeroEtapa] [int] NOT NULL,
	[nombreEtapa] [nvarchar](300) NOT NULL,
	[descripccion] [nvarchar](500) NOT NULL,
	[fechaInicio] [nvarchar](10) NOT NULL,
	[fechaFin] [nvarchar](10) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[fechaActualizacion] [nvarchar](10) NOT NULL,
	[tipoEtapa] [nvarchar](50) NOT NULL,
	[avance] [decimal](4, 2) NOT NULL,
	[numeroActividades] [int] NOT NULL,
	[FK_ID_Plantel] [int] NOT NULL,
 CONSTRAINT [PK_ETAPA] PRIMARY KEY CLUSTERED 
(
	[ID_Etapa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INFRAESTRUCTURA]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INFRAESTRUCTURA](
	[ID_Infraestructura] [int] IDENTITY(1,1) NOT NULL,
	[superficiePredio] [decimal](10, 2) NOT NULL,
	[superficieConstruida] [decimal](10, 2) NOT NULL,
	[aulasDidacticas] [smallint] NOT NULL,
	[laboratorios] [smallint] NOT NULL,
	[talleresComputo] [smallint] NOT NULL,
	[otrosTalleres] [nvarchar](200) NOT NULL,
	[areasAdmin] [nvarchar](4) NOT NULL,
	[biblioteca] [nvarchar](4) NOT NULL,
	[salaAudio] [nvarchar](4) NOT NULL,
	[casetaVigilancia] [nvarchar](4) NOT NULL,
	[cafeteria] [nvarchar](4) NOT NULL,
	[bardaPerimetral] [nvarchar](4) NOT NULL,
	[areasDeportivas] [nvarchar](4) NOT NULL,
	[fechaActualizacion] [nvarchar](10) NULL,
	[FK_ID_Plantel] [int] NOT NULL,
 CONSTRAINT [PK_INFRAESTRUCTURA] PRIMARY KEY CLUSTERED 
(
	[ID_Infraestructura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MUNICIPIO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUNICIPIO](
	[ID_Municipio] [int] IDENTITY(1,1) NOT NULL,
	[municipio] [nvarchar](100) NOT NULL,
	[FK_ID_Estado] [int] NOT NULL,
 CONSTRAINT [PK_MUNICIPIO] PRIMARY KEY CLUSTERED 
(
	[ID_Municipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OBJETO_ARCHIVO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OBJETO_ARCHIVO](
	[ID_Objeto_Archivo] [bigint] IDENTITY(1,1) NOT NULL,
	[nombreObjeto] [nvarchar](150) NULL,
	[FK_ID_Objeto] [bigint] NULL,
	[FK_ID_Archivo] [bigint] NULL,
 CONSTRAINT [PK_OBJETO_ARCHIVO] PRIMARY KEY CLUSTERED 
(
	[ID_Objeto_Archivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PERMISO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISO](
	[ID_Permiso] [int] IDENTITY(1,1) NOT NULL,
	[nombrePermiso] [nvarchar](150) NOT NULL,
	[tipoPermiso] [nvarchar](150) NOT NULL,
	[descripccion] [nvarchar](150) NULL,
 CONSTRAINT [PK_PERMISO] PRIMARY KEY CLUSTERED 
(
	[ID_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLANTEL]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLANTEL](
	[ID_Plantel] [int] NOT NULL,
	[clavePlantel] [nvarchar](10) NULL,
	[nombre] [nvarchar](60) NOT NULL,
	[direccion] [nvarchar](355) NOT NULL,
	[FK_ID_Municipio] [int] NOT NULL,
	[FK_ID_Estado] [int] NOT NULL,
	[claveCentroTrabajo] [nvarchar](50) NOT NULL,
	[claveEstudios] [nvarchar](50) NOT NULL,
	[fechaAlta] [nvarchar](10) NOT NULL,
	[zona] [nvarchar](1) NOT NULL,
	[telefono] [nvarchar](20) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[fax] [nvarchar](30) NOT NULL,
	[anioCreacion] [nvarchar](4) NOT NULL,
	[nombreCompletoDirector] [nvarchar](200) NOT NULL,
	[nombreCompletoSubDirector] [nvarchar](200) NOT NULL,
	[nombreCompletoCoordinador] [nvarchar](200) NOT NULL,
	[claveDGP] [nvarchar](20) NULL,
	[latitud] [nvarchar](50) NULL,
	[longitud] [nvarchar](50) NULL,
 CONSTRAINT [PK_PLANTEL] PRIMARY KEY CLUSTERED 
(
	[ID_Plantel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROL]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[ID_Rol] [int] IDENTITY(1,1) NOT NULL,
	[nombreRol] [nvarchar](150) NOT NULL,
	[descripccion] [nchar](250) NOT NULL,
 CONSTRAINT [PK_ROL] PRIMARY KEY CLUSTERED 
(
	[ID_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROL_PERMISO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL_PERMISO](
	[ID_Rol_Permiso] [int] IDENTITY(1,1) NOT NULL,
	[FK_ID_Rol] [int] NOT NULL,
	[FK_ID_Permiso] [int] NOT NULL,
 CONSTRAINT [PK_ROL_PERMISO] PRIMARY KEY CLUSTERED 
(
	[ID_Rol_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROL_USUARIO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL_USUARIO](
	[ID_Rol_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[FK_ID_Rol] [int] NOT NULL,
	[FK_ID_Usuario] [int] NOT NULL,
 CONSTRAINT [PK_ROL_USUARIO] PRIMARY KEY CLUSTERED 
(
	[ID_Rol_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TIPO_ARCHIVO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_ARCHIVO](
	[ID_Tipo_Archivo] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipo] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_TIPO_ARCHIVO] PRIMARY KEY CLUSTERED 
(
	[ID_Tipo_Archivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 4/7/2017 5:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](150) NOT NULL,
	[password] [nvarchar](200) NOT NULL,
	[nombreCompleto] [nvarchar](200) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[correo] [nvarchar](200) NOT NULL,
	[FK_ID_Plantel] [int] NOT NULL CONSTRAINT [DF_USUARIO_FK_ID_Plantel]  DEFAULT ((1)),
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ACADEMICO] ON 

GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (1, 70, 50, 800, N'Matutino y Vespertino', N'Informatica', N'Seguridad', N'2016-12-5', N'2016-2016', 2)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (2, 80, 50, 588, N'Matutino', N'Informática', N'Seguridad de Informatica', N'2016-11-8', N'2016-2016', 3)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (3, 400, 50, 500, N'Matutino y Vespertino', N'GTUIY', N'YUUI', N'2016-10-21', N'2017-2017', 5)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (4, 50, 50, 50, N'Vespertino', N'D', N'S', N'2016-10-27', N'2016-2016', 57)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (5, 30, 56, 599, N'Matutino y Vespertino', N'Informática', N'dIBUJO', N'2016-11-8', N'2015-2016', 8)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (6, 54, 34, 234, N'Matutino y Vespertino', N'informática', N'desarrollo industrial', N'2016-12-5', N'2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (7, 34, 34, 34, N'Matutino y Vespertino', N'informatica', N'alimntos', N'2016-12-5', N'201572016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (8, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (9, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (10, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (11, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (12, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (13, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (14, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (15, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (16, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (17, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (18, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (19, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (20, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (21, 4, 4, 563, N'Matutino y Vespertino', N'ertr', N'rter', N'2016-12-5', N'2015-2016', 10)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (22, 1, 1, 1, N'Matutino y Vespertino', N'SESE', N'ERWE', N'2016-12-5', N'2015-2016', 14)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (23, 1, 1, 1, N'Matutino y Vespertino', N'SESE', N'ERWE', N'2016-12-5', N'2015-2016', 14)
GO
INSERT [dbo].[ACADEMICO] ([ID_Academico], [personalAdmin], [docentes], [matricula], [turno], [carrerasVigentes], [carrerasLiquidadas], [fechaActualizacion], [periodoEscolar], [FK_ID_Plantel]) VALUES (1006, 14, 25, 365, N'Vespertino', N'Informática y Diseño Industrial', N'Dibujo, Seguridad industrial', N'2016-12-21', N'2016-2016', 4)
GO
SET IDENTITY_INSERT [dbo].[ACADEMICO] OFF
GO
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] ON 

GO
INSERT [dbo].[ACTIVIDAD] ([ID_Actividad], [nombreActividad], [descripccion], [cantidad], [costoOperacion], [responsable], [status], [fechaInicio], [fechaFin], [porcentajeAvance], [fechaActualizacion], [FK_ID_Etapa]) VALUES (39, N'Aulas didácticas', N'Aulas', N'4ee y 2ee', CAST(2000000.00 AS Decimal(15, 2)), N'Arq. Hugo', N'Proceso', N'2014-12-20', N'2015-04-01', CAST(80.00 AS Decimal(5, 2)), N'2016-11-8', 20)
GO
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] OFF
GO
SET IDENTITY_INSERT [dbo].[ARCHIVO] ON 

GO
INSERT [dbo].[ARCHIVO] ([ID_Archivo], [nombreArchivo], [descripcion], [ubicacionFisica], [extension], [fechaActualizacion], [FK_ID_Tipo_Archivo], [tamanio], [keywords], [hashName], [FK_ID_Plantel], [tipoAcceso]) VALUES (20, N'wqef', N'weqf', N'/home/v10x/sibien_Files/files/', N'.jpg', N'2016-12-01', 1, 580096, N'wef', N'5c5f1fee89fd4c0d252f9eae1990f154.jpg', 1, N'publico')
GO
INSERT [dbo].[ARCHIVO] ([ID_Archivo], [nombreArchivo], [descripcion], [ubicacionFisica], [extension], [fechaActualizacion], [FK_ID_Tipo_Archivo], [tamanio], [keywords], [hashName], [FK_ID_Plantel], [tipoAcceso]) VALUES (21, N'wefrwe', N'', N'/home/v10x/sibien_Files/files/', N'.jpg', N'2016-12-02', 1, 623848, N'', N'84c435efb88c33b922f0c5f9d84dd3b3.jpg', 1, N'publico')
GO
INSERT [dbo].[ARCHIVO] ([ID_Archivo], [nombreArchivo], [descripcion], [ubicacionFisica], [extension], [fechaActualizacion], [FK_ID_Tipo_Archivo], [tamanio], [keywords], [hashName], [FK_ID_Plantel], [tipoAcceso]) VALUES (22, N'gf', N'', N'/home/v10x/sibien_Files/files/', N'.jpg', N'2016-12-02', 1, 668460, N'', N'2c04c0c3c5058daf9d8d4ed89db2dfdf.jpg', 1, N'publico')
GO
INSERT [dbo].[ARCHIVO] ([ID_Archivo], [nombreArchivo], [descripcion], [ubicacionFisica], [extension], [fechaActualizacion], [FK_ID_Tipo_Archivo], [tamanio], [keywords], [hashName], [FK_ID_Plantel], [tipoAcceso]) VALUES (10001, N'Proceso de la Etapa 2', N'Imágenes del proceso de construcción de la etapa dos del platel Aculco', N'/home/v10x/sibien_Files/files/', N'.png', N'2016-12-21', 1, 21250, N'Foto 1', N'7464565fc882d13e76f728186d854191.png', 1, N'publico')
GO
INSERT [dbo].[ARCHIVO] ([ID_Archivo], [nombreArchivo], [descripcion], [ubicacionFisica], [extension], [fechaActualizacion], [FK_ID_Tipo_Archivo], [tamanio], [keywords], [hashName], [FK_ID_Plantel], [tipoAcceso]) VALUES (10002, N'Proceso de la Etapa 2 foto 2', N'Fotografia 2 del avance de la etapa 2', N'/home/v10x/sibien_Files/files/', N'.png', N'2016-12-21', 1, 451021, N'Foto 2', N'05b4bb741ad4d67e91fe4a771abe9d46.png', 1, N'publico')
GO
INSERT [dbo].[ARCHIVO] ([ID_Archivo], [nombreArchivo], [descripcion], [ubicacionFisica], [extension], [fechaActualizacion], [FK_ID_Tipo_Archivo], [tamanio], [keywords], [hashName], [FK_ID_Plantel], [tipoAcceso]) VALUES (10003, N'Proceso de la Etapa 3', N'Foto 3 de la etapa 2 de construcción.', N'/home/v10x/sibien_Files/files/', N'.png', N'2016-12-21', 1, 16956, N'Foto 3', N'2cadd28d27693372dc2b77b37b65575b.png', 1, N'publico')
GO
SET IDENTITY_INSERT [dbo].[ARCHIVO] OFF
GO
SET IDENTITY_INSERT [dbo].[ESTADO] ON 

GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (1, N'Estado de México')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (2, N'Aguascalientes')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (3, N'Baja California')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (4, N'Baja California Sur')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (5, N'Campeche')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (6, N'Coahuila')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (7, N'Colima')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (8, N'Chiapas')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (9, N'Chihuahua')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (10, N'Distrito Federal')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (11, N'Durango')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (12, N'Guanajuato')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (13, N'Guerrero')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (14, N'Hidalgo')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (15, N'Jalisco')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (16, N'Michoacán')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (17, N'Morelos')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (18, N'Nayarit')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (19, N'Nuevo León')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (20, N'Oaxaca')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (21, N'Puebla')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (22, N'Querétaro')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (23, N'Quintana Roo')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (24, N'San Luis Potosí')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (25, N'Sinaloa')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (26, N'Sonora')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (27, N'Tabasco')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (28, N'Tamaulipas')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (29, N'Tlaxcala')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (30, N'Veracruz')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (31, N'Yucatán')
GO
INSERT [dbo].[ESTADO] ([ID_Estado], [estado]) VALUES (32, N'Zacatecas')
GO
SET IDENTITY_INSERT [dbo].[ESTADO] OFF
GO
SET IDENTITY_INSERT [dbo].[ETAPA] ON 

GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (12, 40, N'Etapa 40', N'etapa 40', N'2015-05-19', N'2015-05-06', N'Proceso', N'2016-11-3', N'Construccion, equipamiento de salas', CAST(0.00 AS Decimal(4, 2)), 5, 2)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (18, 41, N'ret', N'wert', N'2015-05-05', N'2015-05-05', N'Proceso', N'2016-11-7', N'sdgfd', CAST(0.00 AS Decimal(4, 2)), 5, 2)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (20, 42, N'primera etapa', N'6 aulas didácticas, módulo sanitario, escalera, cancha de usos múltiples, taller de usos mútiples y laboratorio de cómputo', N'2014-12-01', N'2015-09-14', N'Completada', N'2016-11-8', N'Construcción de infraestructura', CAST(12.80 AS Decimal(4, 2)), 6, 2)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (21, 43, N'345', N'455', N'1993-02-14', N'1993-02-14', N'Completada', N'2016-12-1', N'Equipa', CAST(0.00 AS Decimal(4, 2)), 4, 2)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (22, 44, N'345', N'455', N'1993-02-14', N'1993-02-14', N'Completada', N'2016-12-1', N'Equipa', CAST(0.00 AS Decimal(4, 2)), 4, 2)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (23, 45, N'345', N'455', N'1993-02-14', N'1993-02-14', N'Completada', N'2016-12-1', N'Equipa', CAST(0.00 AS Decimal(4, 2)), 4, 2)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (24, 46, N'ert', N'wer', N'1993-02-14', N'1993-02-14', N'Proceso', N'2016-12-1', N'rt', CAST(0.00 AS Decimal(4, 2)), 1, 2)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (28, 1, N'etapa 1', N'contrucción de media h', N'1997-01-01', N'1997-06-06', N'Completada', N'2016-12-6', N'construcción', CAST(0.00 AS Decimal(4, 2)), 4, 10)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (1021, 1, N'Etapa 2', N'Construcción de laboratorio de compúto y area deportiva.', N'2015-05-05', N'2016-01-09', N'Proceso', N'2016-12-21', N'Construcción', CAST(0.00 AS Decimal(4, 2)), 2, 4)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (1022, 2, N'Etapa 2', N'4 aulas didacticas, laboratorio de idiomas, talleres de dibujo, escalera.', N'2015-05-12', N'2016-06-05', N'Completada', N'2016-12-21', N'Construcción', CAST(0.00 AS Decimal(4, 2)), 4, 4)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (1023, 3, N'Etapa 3', N'4 aulas didacticas, talleres de programación, taller de electronica, barda perimetral.', N'2016-02-05', N'2016-08-05', N'Proceso', N'2016-12-21', N'Construcción', CAST(0.00 AS Decimal(4, 2)), 4, 4)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (1024, 4, N'Etapa 4', N'Construcción de escalera, portico, area administrativa, biblioteca, caseta de vigilancia y barda perimetral.', N'2016-05-05', N'2016-05-08', N'Completada', N'2016-12-21', N'Construcció', CAST(0.00 AS Decimal(4, 2)), 6, 4)
GO
INSERT [dbo].[ETAPA] ([ID_Etapa], [numeroEtapa], [nombreEtapa], [descripccion], [fechaInicio], [fechaFin], [status], [fechaActualizacion], [tipoEtapa], [avance], [numeroActividades], [FK_ID_Plantel]) VALUES (1025, 5, N'Etapa 4', N'Construcción de escalera, portico, area administrativa, biblioteca, caseta de vigilancia y barda perimetral.', N'2016-05-05', N'2016-05-08', N'Completada', N'2016-12-21', N'Construcció', CAST(0.00 AS Decimal(4, 2)), 6, 4)
GO
SET IDENTITY_INSERT [dbo].[ETAPA] OFF
GO
SET IDENTITY_INSERT [dbo].[INFRAESTRUCTURA] ON 

GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (1, CAST(20000.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), 2012, 3, 3, N'Dibujo', N'Si', N'Si', N'No', N'Si', N'Si', N'Si', N'3', N'2016-12-5', 2)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (2, CAST(20000.00 AS Decimal(10, 2)), CAST(15500.00 AS Decimal(10, 2)), 1997, 2, 2, N'Dibujo', N'Si', N'Si', N'Si', N'Si', N'No', N'No', N'2', N'2016-11-8', 3)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (3, CAST(20000.00 AS Decimal(10, 2)), CAST(15500.00 AS Decimal(10, 2)), 2004, 2, 3, N'JGFHJF', N'Si', N'Si', N'No', N'Si', N'Si', N'Si', N'2', N'2016-10-21', 5)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (4, CAST(20000.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), 1, 2, 45, N'df', N'No', N'Si', N'No', N'Si', N'Si', N'Si', N'54', N'2016-10-27', 57)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (5, CAST(20000.00 AS Decimal(10, 2)), CAST(17000.00 AS Decimal(10, 2)), 5, 3, 23, N'dibujo', N'Si', N'Si', N'Si', N'Si', N'No', N'Si', N'2', N'2016-11-8', 8)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (7, CAST(45.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), 4, 7, 2, N'no', N'Si', N'No', N'Si', N'Si', N'Si', N'No', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (8, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (9, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (10, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (11, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (12, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (13, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (14, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (15, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (16, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (17, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (18, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (19, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (20, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (21, CAST(3445.00 AS Decimal(10, 2)), CAST(5345.00 AS Decimal(10, 2)), 2, 3, 32, N'werw', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'3', N'2016-12-5', 10)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (22, CAST(12.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), 1, 1, 1, N'EWRW', N'Si', N'Si', N'Si', N'No', N'Si', N'Si', N'5', N'2016-12-5', 14)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (23, CAST(12.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), 1, 1, 1, N'EWRW', N'Si', N'Si', N'Si', N'No', N'Si', N'Si', N'5', N'2016-12-5', 14)
GO
INSERT [dbo].[INFRAESTRUCTURA] ([ID_Infraestructura], [superficiePredio], [superficieConstruida], [aulasDidacticas], [laboratorios], [talleresComputo], [otrosTalleres], [areasAdmin], [biblioteca], [salaAudio], [casetaVigilancia], [cafeteria], [bardaPerimetral], [areasDeportivas], [fechaActualizacion], [FK_ID_Plantel]) VALUES (1006, CAST(20000.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), 10, 4, 1, N'Dibujo', N'Si', N'Si', N'Si', N'No', N'No', N'Si', N'2', N'2016-12-21', 4)
GO
SET IDENTITY_INSERT [dbo].[INFRAESTRUCTURA] OFF
GO
SET IDENTITY_INSERT [dbo].[MUNICIPIO] ON 

GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (1, N'Acambay', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (2, N'Acolman', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (3, N'Aculco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (4, N'Almoloya de Alquisiras', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (5, N'Almoloya de Juárez', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (6, N'Almoloya del Río', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (7, N'Amanalco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (8, N'Amatepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (9, N'Amecameca', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (10, N'Apaxco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (11, N'Atenco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (12, N'Atizapán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (13, N'Atizapán de Zaragoza', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (14, N'Atlacomulco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (15, N'Atlautla', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (16, N'Axapusco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (17, N'Ayapango', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (18, N'Calimaya', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (19, N'Capulhuac', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (20, N'Coacalco de Berriozábal', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (21, N'Coatepec Harinas', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (22, N'Cocotitlán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (23, N'Coyotepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (24, N'Cuautitlán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (25, N'Chalco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (26, N'Chapa de Mota', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (27, N'Chapultepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (28, N'Chiautla', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (29, N'Chicoloapan', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (30, N'Chiconcuac', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (31, N'Chimalhuacán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (32, N'Donato Guerra', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (33, N'Ecatepec de Morelos', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (34, N'Ecatzingo', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (35, N'Huehuetoca', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (36, N'Hueypoxtla', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (37, N'Huixquilucan', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (38, N'Isidro Fabela', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (39, N'Ixtapaluca', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (40, N'Ixtapan de la Sal', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (41, N'Ixtapan del Oro', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (42, N'Ixtlahuaca', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (43, N'Xalatlaco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (44, N'Jaltenco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (45, N'Jilotepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (46, N'Jilotzingo', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (47, N'Jiquipilco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (48, N'Jocotitlán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (49, N'Joquicingo', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (50, N'Juchitepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (51, N'Lerma', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (52, N'Malinalco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (53, N'Melchor Ocampo', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (54, N'Metepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (55, N'Mexicaltzingo', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (56, N'Morelos', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (57, N'Naucalpan de Juárez', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (58, N'Nezahualcóyotl', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (59, N'Nextlalpan', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (60, N'Nicolás Romero', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (61, N'Nopaltepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (62, N'Ocoyoacac', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (63, N'Ocuilan', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (64, N'El Oro', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (65, N'Otumba', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (66, N'Otzoloapan', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (67, N'Otzolotepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (68, N'Ozumba', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (69, N'Papalotla', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (70, N'La Paz', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (71, N'Polotitlán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (72, N'Rayón', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (73, N'San Antonio la Isla', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (74, N'San Felipe del Progreso', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (75, N'San Martín de las Pirámides', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (76, N'San Mateo Atenco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (77, N'San Simón de Guerrero', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (78, N'Santo Tomás', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (79, N'Soyaniquilpan de Juárez', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (80, N'Sultepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (81, N'Tecámac', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (82, N'Tejupilco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (83, N'Temamatla', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (84, N'Temascalapa', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (85, N'Temascalcingo', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (86, N'Temascaltepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (87, N'Temoaya', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (88, N'Tenancingo', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (89, N'Tenango del Aire', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (90, N'Tenango del Valle', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (91, N'Teoloyucan', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (92, N'Teotihuacán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (93, N'Tepetlaoxtoc', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (94, N'Tepetlixpa', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (95, N'Tepotzotlán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (96, N'Tequixquiac', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (97, N'Texcaltitlán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (98, N'Texcalyacac', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (99, N'Texcoco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (100, N'Tezoyuca', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (101, N'Tianguistenco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (102, N'Timilpan', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (103, N'Tlalmanalco', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (104, N'Tlalnepantla de Baz', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (105, N'Tlatlaya', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (106, N'Toluca', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (107, N'Tonatico', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (108, N'Tultepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (109, N'Tultitlán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (110, N'Valle de Bravo', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (111, N'Villa de Allende', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (112, N'Villa del Carbón', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (113, N'Villa Guerrero', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (114, N'Villa Victoria', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (115, N'Xonacatlán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (116, N'Zacazonapan', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (117, N'Zacualpan', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (118, N'Zinacantepec', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (119, N'Zumpahuacán', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (120, N'Zumpango', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (121, N'Cuautitlán Izcalli', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (122, N'Valle de Chalco Solidaridad', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (123, N'Luvianos', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (124, N'San José del Rincón', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (125, N'Tonanitla', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (126, N'Iztacalco', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (127, N'Acacoyagua', 8)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (128, N'Villa Corzo', 8)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (129, N'Pijijiapan', 8)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (131, N'Azcapotzalco', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (132, N'Zacatepec', 17)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (133, N'Santo Domingo Armeta', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (134, N'Chilpancingo', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (135, N'Álvaro Obregón', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (136, N'Benito Juárez', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (137, N'Coyoacán', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (138, N'Cuajimalpa', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (139, N'Cuauhtémoc', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (140, N'Gustavo A. Madero', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (141, N'Iztapalapa', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (143, N'Miguel Hidalgo', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (144, N'Milpa Alta', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (145, N'Tláhuac', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (146, N'Tlalpan', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (147, N'Venustiano Carranza', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (148, N'Xochimilco', 10)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (149, N'Tizayuca', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (150, N'Pilcaya', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (151, N'Ixmiquilpan', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (152, N'Acatlán de Juárez', 15)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (153, N'Santa Lucía del Camino', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (154, N'Corregidora', 22)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (155, N'Villa de Cos', 32)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (156, N'Chiautempan', 29)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (157, N'Lerdo', 11)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (158, N'Morelia', 16)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (159, N'Aguascalientes', 2)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (160, N'Valladolid', 31)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (161, N'Tepic', 18)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (162, N'San Marcos', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (163, N'Boca del Río', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (164, N'San Luis Potosi', 24)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (165, N' Tierra Blanca', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (166, N'Tlayacapan', 17)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (167, N'León', 12)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (168, N'Chihuahua', 9)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (169, N'TULUM', 23)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (170, N'SAN JOSE DEL CABO', 4)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (171, N'TIJUANA', 3)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (172, N'SAN JUAN DEL RIO', 22)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (173, N'SAN JERÓNIMO CALERAS', 21)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (174, N'HUEJOTZINGO', 21)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (175, N'MEXICALI', 3)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (176, N'VILLA DE ACAPETAHUA', 8)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (177, N'SANTA MARÍA APAXCO', 17)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (179, N'CANATLAN', 11)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (180, N'TOLCAYUCA', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (181, N'OCOTLAN DE MORELOS', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (182, N'APODACA', 19)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (183, N'SAN MIGUEL EL GRANDE', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (184, N'SANTA CRUZ ITUNDUJIA', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (185, N'PANOTLA', 29)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (187, N'CANCÚN', 23)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (188, N'FRESNILLO', 32)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (190, N'Benito Juárez', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (191, N'AGUA SANTA', 21)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (192, N'SANTIAGO JAMILTEPEC', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (193, N'PLAYA VICENTE', 2)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (194, N'PLAYA VICENTE', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (195, N'CHILCHOTLA', 21)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (196, N'TZOMPANTEPEC', 29)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (197, N'PARACHO', 16)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (198, N'MAZATECOCHCO', 29)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (199, N'HUICHAPAN', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (200, N'TELOLOAPAN', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (201, N'BENITO JUAREZ', 23)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (202, N'SAN CRISTOBAL DE LAS CASAS', 8)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (203, N'TEOLOCHOLCO', 29)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (204, N'TECOZAUTLA', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (205, N'CHETUMAL', 23)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (206, N'CULIACAN', 25)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (207, N'CHILAPA DE ÁLVAREZ', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (208, N'ARANDAS', 15)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (209, N'SAN MIGUEL TOTOLMALOYA', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (210, N'SAN RAFAEL', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (211, N'SOLIDARIDAD', 23)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (212, N'SAN LUCAS TOTOLMALOYA', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (213, N'ROMITA', 12)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (214, N'SALTILLO', 6)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (215, N'MÉRIDA', 31)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (216, N'VILLA DE TEZONTEPEC', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (217, N'TETIPAC', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (218, N'HUATLATLAUCA', 21)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (219, N'CARMEN', 5)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (220, N'TIANGUISTENGO', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (221, N'SAN AGUSTÍN AMETENGO', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (222, N'CUYAMECALCO VILLA DE ZARAGOZA', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (223, N'ACAPULCO', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (224, N'PIEDRAS NEGRAS', 6)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (225, N'ACAMBARO', 12)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (226, N'IXTACAMAXTITLAN', 21)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (227, N'TAPACHULA', 8)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (228, N'AGUA PRIETA', 26)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (229, N'IRAPUATO', 12)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (230, N'LA UNIÓN DE ISIDORO MONTES DE OCA', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (231, N'MEZQUITIC', 15)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (232, N'TEPATITLÁN DE MORELOS', 15)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (233, N'PUEBLA', 21)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (234, N'QUERÉTARO', 22)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (235, N'TECOLUTLA', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (236, N'YAUHQUEMECAN', 29)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (237, N'SAN LUCAS OCOTEPEC', 1)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (238, N'SANTA CRUZ XOXOCOTLÁN', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (239, N'APAN', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (240, N'TEPEYANCO', 29)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (241, N'CERRO QUEMADO, SAN PEDRO IXCATLÁN', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (242, N'SAN PEDRO CAJONOS', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (243, N'HERMOSILLO', 26)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (244, N'CUERNAVACA', 17)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (245, N'BERIOZABAL', 8)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (246, N'CHONTLA', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (247, N'JEREZ', 32)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (248, N'TANTIMA', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (249, N'TULANCINGO', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (250, N'CATEMACO', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (251, N'PACHUCA DE SOTO', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (252, N'LAZARO CARDENAS', 16)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (253, N'AJUCHITLAN', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (254, N'SALAMANCA', 12)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (255, N'HEROICA CIUDAD DE TLAXIACO', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (256, N'TUXPAN', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (257, N'HUIMANGUILLO', 27)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (258, N'COMALCALCO', 27)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (259, N'AYALA', 17)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (260, N'LA HUACANA', 16)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (261, N'OMEALCA', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (262, N'SAN MIGUEL DE ALLENDE', 12)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (263, N'COATZACOALCOS', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (264, N'COSAMALOAPAN DE CARPIO', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (265, N'SAN JOSÉ ITURBIDE', 12)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (266, N'TEZONTEPEC DE ALDAMA', 14)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (267, N'TLAXCO', 29)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (268, N'SAN SALVADOR EL VERDE', 21)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (269, N'VILLA DE ALVAREZ', 7)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (270, N'SAN PEDRO JICAYAN', 20)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (271, N'ALTZAYANCA', 29)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (273, N'TLAQUEPAQUE', 15)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (274, N'XALAPA', 30)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (275, N'TLALTIZAPAN', 17)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (276, N'VICTORIA', 12)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (277, N'IXTLAHUACAN DE LOS MEMBRILLOS', 15)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (278, N'MANZANILLO', 7)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (279, N'HUEYCANTENANGO', 13)
GO
INSERT [dbo].[MUNICIPIO] ([ID_Municipio], [municipio], [FK_ID_Estado]) VALUES (280, N'SAN FERNANDO', 28)
GO
SET IDENTITY_INSERT [dbo].[MUNICIPIO] OFF
GO
SET IDENTITY_INSERT [dbo].[OBJETO_ARCHIVO] ON 

GO
INSERT [dbo].[OBJETO_ARCHIVO] ([ID_Objeto_Archivo], [nombreObjeto], [FK_ID_Objeto], [FK_ID_Archivo]) VALUES (24, N'ETAPA', 12, 20)
GO
INSERT [dbo].[OBJETO_ARCHIVO] ([ID_Objeto_Archivo], [nombreObjeto], [FK_ID_Objeto], [FK_ID_Archivo]) VALUES (25, N'ETAPA', 12, 21)
GO
INSERT [dbo].[OBJETO_ARCHIVO] ([ID_Objeto_Archivo], [nombreObjeto], [FK_ID_Objeto], [FK_ID_Archivo]) VALUES (26, N'ETAPA', 12, 22)
GO
INSERT [dbo].[OBJETO_ARCHIVO] ([ID_Objeto_Archivo], [nombreObjeto], [FK_ID_Objeto], [FK_ID_Archivo]) VALUES (10002, N'ETAPA', 1021, 10001)
GO
INSERT [dbo].[OBJETO_ARCHIVO] ([ID_Objeto_Archivo], [nombreObjeto], [FK_ID_Objeto], [FK_ID_Archivo]) VALUES (10003, N'ETAPA', 1021, 10002)
GO
INSERT [dbo].[OBJETO_ARCHIVO] ([ID_Objeto_Archivo], [nombreObjeto], [FK_ID_Objeto], [FK_ID_Archivo]) VALUES (10004, N'ETAPA', 1021, 10003)
GO
SET IDENTITY_INSERT [dbo].[OBJETO_ARCHIVO] OFF
GO
SET IDENTITY_INSERT [dbo].[PERMISO] ON 

GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (1, N'accessMain', N'Formulario', N'Acceso a sistema.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (2, N'accessDataSheet', N'Formulario', N'Acceso a Ficha Técnica.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (3, N'addDataSheet', N'Permiso', N'Agregar Ficha Técnica de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (4, N'updateDataSheet', N'Permiso', N'Modificar Ficha Técnica de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (5, N'printDataSheet', N'Formulario', N'Imprimir Ficha Técnica de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (6, N'deleteDataSheet', N'Permiso', N'Eliminar Ficha Técnica de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (7, N'viewStage', N'Formulario', N'Ver Etapas de Desarrollo de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (8, N'addStage', N'Permiso', N'Agregar Etapa de Desarrollo de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (9, N'updateStage', N'Permiso', N'Modificar Etapa de Desarrollo de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (10, N'deleteStage', N'Permiso', N'Elimina Etapa de Desarrollo de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (11, N'viewActivity', N'Formulario', N'Ver Actividades de Etapa de Desarrollo de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (12, N'addActivity', N'Permiso', N'Agregar Actividad de Etapa de Desarrollo de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (13, N'updateActivity', N'Permiso', N'Modificar Actividad de Etapa de Desarrollo de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (14, N'deleteActivity', N'Permiso', N'Eliminar Actividad de Etapa de Desarrollo de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (15, N'filesStage', N'Permiso', N'Administra Archivos de las Etapas de Desarrollo de Plantel.')
GO
INSERT [dbo].[PERMISO] ([ID_Permiso], [nombrePermiso], [tipoPermiso], [descripccion]) VALUES (16, N'deletefiles', N'Permiso', N'Elimina Archivos de las Etapas de Desarrollo de Plantel.')
GO
SET IDENTITY_INSERT [dbo].[PERMISO] OFF
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (1, N'001', N'Dirección General', N'LIBRAMIENTO JOSÉ MARÍA MORELOS Y PAVÓN NO. 401 SUR. COL. LLANO GRANDE', 54, 1, N'****', N'****', N'19/06/1999', N'D', N'722 275 80 40', N'gemeduct@edomex.gob.mx', N'722 275 80 40', N'2000', N'DR. EDGAR ALFONSO HERNANDEZ MUÑOZ', N'', N'', N'', N'19.247721', N'-99.578427')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (2, N'264', N'Acambay', N'Domicilio Conocido s/n. Delegación Ganzdá ', 1, 1, N'15ETC0069O', N'B. T.', N'18/07/2013', N'C', N'71 21 485243', N'cecytemacambay@yahoo.com.mx-es', N'71 21 485243', N'2012', N'L.A.E. GUILLERMO ARMANDO HERRERA ALCÁNTARA', N'L.I.A. ELIZABETH VILLEGAS GUERRA', N'P.L.C. OSCAR JUAN ESTRADA', N'548720', N'19.990211', N'-99.844421')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (3, N'219', N'Aculco', N'CARRETERA PANAMERICANA ACULCO. KM. 2.5. PARCELA NO. 54 2-1P1/1 EJIDO LA SOLEDAD', 3, 1, N'15ETC0035Y', N'B. T.', N'19/06/1999', N'M', N'01 718 1 24 05 20', N'cecytemaculco@prodigy.net.mx', N'01 718 1 24 05 20', N'1997', N'C.P. MA. PATRICIA HERNÁNDEZ MUNGUÍA', N'MANUEL CAÑADA MONROY', N'', N'150295', N'20.089264', N'-99.851381')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (4, N'223', N'Atlautla', N'CORREGIDORA NO. 3. BARRIO SANTO DOMINGO', 15, 1, N'15ETC0038V', N'B. T.', N'19/06/1999', N'M', N'01 59 79 76 22 68', N'cecytematlautla@prodigy.net.mx', N'01 59 79 76 22 68', N'1997', N'M.D.A. IGNACIA BAUTISTA GONZÁLEZ', N'VALENTÍN BARRAGÁN VILLANUEVA', N'', N'150394', N'19.02585', N'-98.773874')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (5, N'242', N'Chalco', N'CARRETERA FEDERAL CHALCO-MISQUIC-CHALCOESQUINA PORTAL DEL SOL . COL. UNIDAD HABITACIONAL VILLA CHALCO', 25, 1, N'15ETC0055L', N'B. T.', N'18/07/2013', N'C', N'01 55 59 75 16 55', N'cecytemchalco@prodigy.net.mx', N'01 55 59 75 16 55', N'2004', N'M. EN .C.E ANA LILIA CERVANTES MEZA', N'LIC. JOSE ADOLFO GUADIAN MARIN', N'', N'150621', N'19.302792', N'-98.950523')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (6, N'210', N'Chicoloapan', N'AV. ZAPATA S/N O CAMINO A COATEPEC PARAJE LA CAMPANA', 29, 1, N'15ETC0032A', N'B. T.', N'19/06/1999', N'C', N'01 55 58 52 13 38', N'cecytemchicoloapan@hotmail.com', N'01 55 58 52 13 38', N'1996', N'LIC. MA DE LOURDES JUÁREZ SÁNCHEZ', N'ING. JOSE LUIS FRANCO VELAZQUEZ', N'LIC. EUSEBIO SAUL GALVEZ ELIZALDE', N'150299', N'19.407584', N'-98.899032')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (7, N'201', N'Chimalhuacán', N'AV. TEZONTLE S/N CASI ESQ. CON AV. ARENAL. ZONA DE TEPALCATES', 31, 1, N'15ETC0021V', N'B. T.', N'19/06/1999', N'C', N'55-58-52-05-01', N'cecytemchimalhuacan@hotmail.com', N'55-58-52-05-01', N'1994', N'Q.F.B. DEMETRIO MATIAS PÉREZ', N'', N'', N'150301', N'19.443677', N'-98.942557')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (8, N'260', N'Chimalhuacán II', N'CALLE ZAFIRO S/N. COL. TLATELXOCHITENCO', 31, 1, N'15ETC0066R', N'B. T.', N'18/07/2013', N'C', N'01 55 26 3210 79', N'direccion_chimal2@hotmail.com', N'01 55 26 3210 79', N'2011', N'M. EN C. GERARDO RICO MARTÍNEZ', N'BEATRIZ CARRILLO PÉREZ', N'LIC. PATRICIA RAMÍREZ LEMUS', N'589476', N'19.443601', N'-98.973693')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (9, N'211', N'Coacalco', N'CALLE ENRIQUE REBSAMEN S/N. COL. EL GIGANTE', 20, 1, N'15ETC0011O', N'B. T.', N'19/06/1999', N'C', N'01 55 15 48 91 98', N'cecytemcoacalco@prodigy.net.mx', N'01 55 15 48 91 98', N'1996', N'MTRO. JAVIER MUÑOZ GARCÍA', N'', N'', N'150296', N'19.621267', N'-99.100901')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (10, N'217', N'Coatepec Harinas', N'SAN LUIS Y EL CEDRITO KM.42', 21, 1, N'15ETC0017I', N'B. T.', N'19/06/1999', N'M', N'01 721 1 43 38 13', N'cecytem_coatepec@yahoo.com.mx', N'01 721 1 43 38 13', N'1996', N'M. EN E. GERMÁN REYES JOSÉ', N'', N'', N'150297', N'18.870681', N'-99.749253')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (11, N'261', N'Cuautitlán', N'AV. SAN FERNANDOS/N. ENTRE CARRETERA CUAUTITLÁNMELCHOR OCAMPO Y AV. TEYAHUALCO FRACCIONAMIENTO SANTA ELENA', 24, 1, N'15ETC0065S', N'B. T.', N'18/07/2013', N'C', N'01 55 20 64 62 19', N'cecytem.cuautitlan@hotmail.com', N'01 55 20 64 62 19', N'2011', N'LIC. YOVANY VERGARA CORTÉS', N'', N'', N'548920', N'19.684751', N'-99.162598')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (12, N'205', N'Cuautitlán Izcalli', N'TORRE SATÉLITE ESQ. TORRE FRONTERA COLONIA SANTA MA. GUADALUPE LAS TORRES. 1ERA. SECCIÓN.', 121, 1, N'15ETC0005D', N'B. T.', N'19/06/1999', N'C', N'01 55 58 77 93 06', N'cecytemcuautitlanizcalli@prodigy.net.mx', N'01 55 58 77 93 06', N'1995', N'M. EN A. CLAUDIA PATRICIA RAMIREZ RODRIGUEZ', N'LIC. DORA MARÍA PEREZ REDONDO', N'LIC. MARIBEL ZEPEDA PACHECO', N'150298', N'19.626836', N'-99.219321')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (13, N'248', N'Donato Guerra', N'RANCHERÍA SAN MARTIN OBISPO', 32, 1, N'15ETC0057J', N'B. T.', N'18/07/2013', N'M', N'044 7222 44 13 56', N'1@hotmail.com', N'044 7222 44 13 56', N'2008', N'LIC. LUCIANO CANO BÁRCENAS', N'M.E.E. SARA SEPULVEDA HERNANDEZ', N'LIC. NORMA SALGADO VARGAS', N'150717', N'19.308828', N'-100.142835')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (14, N'203', N'Ecatepec', N'SOR JUANA I DE LA CRUZ ESQ JOSÉ REVUELTAS S/N COLONIA TIERRA BLANCA', 33, 1, N'15ETC0020W', N'B. T.', N'19/06/1999', N'C', N'55 51 16 14 76', N'cecytemecatepec@prodigy.net.mx', N'55 51 16 14 76', N'1994', N'LIC. ALEJANDRO RAFAEL PACHECO VELAZQUEZ', N'LIC. MARÍA LILIA RODRÍGUEZ GARCÍA', N'', N'150302', N'19.598011', N'-99.055188')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (15, N'227', N'Ecatepec II', N'CALLE MOCTEZUMA S/N. ESQ. FELIPE ÁNGELES .  COL. HACIENDA DE ARAGÓN', 33, 1, N'15ETC0044F', N'B. T.', N'19/09/1999', N'C', N'01 55 57 10 48 72', N'cecytem_ecatepec_2@hotmail.com', N'01 55 57 10 48 72', N'1999', N'C.P. BLANCA ESTELA GONZÁLEZ GARCÍA', N'LIC. MARTHA REYES MARTÍNEZ', N'LIC. AUREA ANGELICA PEREZ ESPINOZA', N'150396', N'19.506274', N'-99.034707')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (16, N'263', N'Huixquilucan', N'GALEANA ESQ. BRAVO', 37, 1, N'15ETC0070D', N'B. T.', N'18/07/2013', N'C', N'55 32 59 65 01', N'cecytemhuixquilucan@hotmail.com', N'55 32 59 65 01', N'2012', N'ING. DAVID ALEJANDRO PIÑA NIETO', N'MTRO. MARCO ANTONIO HERNÁNDEZ RUIZ', N'', N'541290', N'19.359750', N'-99.352297')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (17, N'212', N'Ixtapaluca', N'CAMINO JESÚS MARÍA S/N MZA. V Y VI, LOTES 4 Y 5, UNIDAD HABITACIONAL', 39, 1, N'15ETC0036X', N'B. T.', N'19/06/1999', N'C', N'01 55 59 83 33 92', N'cecytemixtapaluca@prodigy.net.mx', N'01 55 59 83 33 92', N'1996', N'M. EN C. ADRIÁN DE JESÚS VILLA MONZALVO', N'', N'', N'150303', N'19.323284', N'-98.877683')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (18, N'237', N'Ixtapaluca II', N'CALLE CIELO ESQUINA CON ARCOIRIS MZ. 53 LT 221. COL. U. H. ARA CUATRO VIENTOS', 39, 1, N'15ETC0047C', N'B. T.', N'13/12/2000', N'C', N'01 5559 42 75 92', N'cecytemixtapaluca2@prodigy.net.mx', N'01 5559 42 75 92', N'2000', N'M. EN C. KARLA CARINA CORONA GARCÍA', N'', N'', N'150392', N'19.296123', N'-98.831952')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (19, N'245', N'Ixtapan de la Sal', N'CENTENARIO DE LA REVOLUCIÓN NO. 37. COL. ELPROGRESO', 40, 1, N'15ETC0058I', N'B. T.', N'18/07/2013', N'M', N'01 721 1 43 27 09', N'cecytemixtapandelasal@live.com.mx', N'01 721 1 43 27 09', N'2008', N'MTRO. JUAN GABRIEL ZETINA ESPINOSA', N'LIC. JOSÉ LUIS ARRIAGA SÁNCHEZ', N'LIC. JOSÉ LUIS ARRIAGA SÁNCHEZ', N'150710', N'18.850453', N'-99.665639')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (20, N'216', N'Ixtlahuaca', N'CAMINO A SANTA ANA S/N. SANTA ANA IXTLAHUACA', 42, 1, N'15ETC0015K', N'B. T.', N'19/06/1999', N'M', N'01 712 2 83 09 84', N'ixtlahuaca_cecytem@hotmail.com', N'01 712 2 83 09 84', N'1996', N'MTRA. ELIZABETH GUADARRAMA ALMANZA', N'', N'', N'150304', N'19.584979', N'-99.881376')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (21, N'225', N'Jilotepec', N'AV. INDEPENDENCIA S/N. PRIMERA MANZANA. PARAJE LA PRESA DE VILLA DE CANALEJAS', 45, 1, N'15ETC0041I', N'B. T.', N'19/06/1999', N'M', N'01 761 7 34 16 97', N'planteljilotepec@yahoo.com.mx', N'01 761 7 34 16 97', N'1997', N'M. EN C. GUSTAVO MALDONADO CUEVAS', N'ING. RAYMUNDO LARA GARCÍA', N'', N'150395', N'19.972497', N'-99.599685')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (22, N'236', N'Jiquipilco', N'KM 6.5 DE LA  CARRETERA IXTLAHUACA JIQUIPILCO LOCALIDAD DE SANTA CRUZ TEPEXPAN', 47, 1, N'15ETC0048B', N'B. T.', N'13/12/2000', N'M', N'01 712 1 11 01 07', N'cecytemjiquipilco@yahoo.com.mx', N'01 712 1 11 01 07', N'2000', N'M.A.D.N. CARLOS JAVIER CONTRERAS DORDELLY', N'', N'', N'150390', N'19.576150', N'-99.706413')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (23, N'246', N'Jocotitlán', N'DOMICILIO CONOCIDO EJIDO DE SANTIAGO CASANDEJE', 48, 1, N'15ETC0059H', N'B. T.', N'18/07/2013', N'M', N'01712 5 98 40 14', N'cecytemjoco@hotmail.com', N'01712 5 98 40 14', N'2008', N'I.Q. MARCO ANTONIO PEÑA ROSALES', N'', N'', N'150713', N'19.771872', N'-99.954117')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (24, N'207', N'La Paz', N'ACCESO POR LA CALLE DE DEGOLLADO. PUEBLO LA MAGDALENA ATLICPAC', 70, 1, N'15ETC0025R', N'B. T.', N'19/06/1999', N'C', N'01 55 58 56 75 55', N'cecytelapaz@hotmail.com', N'01 55 58 56 75 55', N'1995', N'C.P. EDUARDO HANS RODRÍGUEZ', N'MTRO.JORGE LICONA RANCHERO', N'LIC. SARA PEREZ VARGAS', N'150305', N'19.375717', N'-98.949641')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (25, N'257', N'Lerma', N'AV. UNIVERSIDADS/N COL. CENTRO COMUNIDAD SAN NICOLÁS PERALTA', 51, 1, N'15ETC0063U', N'B. T.', N'18/07/2013', N'M', N'01 728 2 84 92 08', N'cecytemlerma@hotmail.com', N'01 728 2 84 92 08', N'2010', N'', N'LIC. APOLINAR LÓPEZ MIGUEL', N'', N'150709', N'19.360063', N'-99.491579')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (26, N'222', N'Malinalco', N'CARRETERA A MALINALCO-CHALMA KM. 6  COL. EL PUENTECITO', 52, 1, N'15ETC0040J', N'B. T.', N'19/06/1999', N'M', N'01 714 1 47 23 30', N'cecytemalinalco@hotmail.com', N'01 714 1 47 23 30', N'1997', N'LIC. ALEJANDRA TORRES LÓPEZ', N'MTRO. MARCO GUTIERREZ BERNAL', N'LIC. HILARIO GONZALEZ NAVA', N'150458', N'18.915581', N'-99.476661')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (27, N'209', N'Metepec', N'AV. MOCTEZUMA CASI ESQ. AV. GOBERNADORES S/N, COL. LA PROVIDENCIA, METEPEC, ESTADO DE MÉXICO, C.P. 52177', 54, 1, N'15ETC0024S', N'B. T.', N'19/06/1999', N'M', N'722 2 75 39 15', N'cecytemmetepec@prodigy.net.mx', N'722 2 75 39 15', N'1995', N'C.P. JOSÉ GERARDO JUÁREZ ORTÍZ', N'', N'', N'150306', N'19.270501', N'-99.602384')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (28, N'249', N'Metepec II', N'NICOLÁS BRAVOS S/N A UN COSTADO DE LA ESC. SEC. OFICIAL 1026 “PROF. MIGUEL PORTILLA SALDAÑA”. SAN MIGUEL TOTOCUITLAPILCO', 54, 1, N'15ETC0061W', N'B. T.', N'18/07/2013', N'M', N'722 3 27 01 47', N'cecytemm2@hotmail.com', N'722 3 27 01 47', N'2008', N'M. A. D. B. ISABEL MÉNDEZ MANZANARES', N'C.P. MARIO REYES ÁLVAREZ', N'', N'150712', N'19.234892', N'-99.576207')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (29, N'213', N'Nezahualcóyotl', N'CALLE VALLE DEL MAÍZ S/N ESQ. VALLE DEL YUKÓN.  COL. VALLE DE ARAGÓN. SECCIÓN 1', 59, 1, N'15ETC0013M', N'B. T.', N'19/06/1999', N'C', N'01 55 57 11 21 49', N'123cecyt@prodigy.net.mx', N'01 55 57 11 21 49', N'1996', N'M. EN .C. HERLINDA AMANTE MARTÍNEZ', N'M. EN C. LETICIA ALVIRDE COYT', N'', N'150307', N'19.489178', N'-99.053485')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (30, N'228', N'Nezahualcóyotl II', N'AV. BORDO  DE XOCHIAC A ENTRE AV. LÓPEZ MATEOS Y SOR JUANA INES DE LA CRUZ. COL. BENITO JUÁREZ', 58, 1, N'15ETC0043G', N'B. T.', N'20/09/1999', N'C', N'01 55 51 12 01 02', N'cecytemneza2@prodigy.net.mx', N'01 55 51 12 01 02', N'1999', N'M. EN D. LETICIA ESTHER CAMPOS SANCHEZ', N'', N'', N'150387', N'19.420923', N'-99.012219')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (31, N'202', N'Nicolás Romero', N'AV. MÉXICO S/N COLONIA GRANJAS DE GUADALUPE. LA COLMENA VILLA NICOLÁS ROMERO', 60, 1, N'15ETC0018H', N'B. T.', N'19/06/1999', N'C', N'55 58 27 44 83', N'cecytem_nr@prodigy.net.mx', N'55 58 27 44 83', N'1994', N'M. EN A. ERASMO ROSALES SUÁREZ', N'LIC. JAVIER BAUTISTA CAPULÍN', N'LIC. MA GUADALUPE HERNÁNDEZ TORRES', N'150308', N'19.602335', N'-99.275711')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (32, N'240', N'Nicolás Romero II', N'AV. 22 DE FEBRERO S/N COL. 22 DE FEBRERO', 60, 1, N'15ETC0052O', N'B. T.', N'06/10/2004', N'C', N'01 55 58 21 93 79', N'cecytem-nr2@hotmail.com', N'01 55 58 21 93 79', N'2004', N'LIC. EN D. CAROL ROSAS MARTÍNEZ', N'L.S.I. YAZMÍN LUNA LÓPEZ', N'', N'150619', N'19.612333', N'-99.345170')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (33, N'259', N'Nicolás Romero III', N'ESCUELA PRIMARIA “LUZ Y ESPERANZA” CALLE CUAUTITLÁNS/N. COL. SANTA ANITA LA BOLSA', 60, 1, N'15ETC0067Q', N'B. T.', N'18/07/2013', N'C', N'01 55 58 28 88 82', N'cecytem_nr3@hotmail.com', N'01 55 58 28 88 82', N'2011', N'ING. ANASTACIO BLANCAS ESPINOSA', N'M. EN E. ISRAEL VERA REYES', N'LIC. GUADALUPE LEDESMA GRIMALDO', N'512596', N'19.634278', N'-99.298672')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (34, N'241', N'San Felipe del Progreso', N'AV. INSTITUTO TECNOLOGICO S/N', 74, 1, N'15ETC0053N', N'B. T.', N'19/06/1999', N'M', N'01 712 1 23 77 13', N'cecytem_sfp1@hotmail.com', N'01 712 1 23 77 13', N'2004', N'QUIMICO MARGARITO GARCÍA SAN JUAN', N'', N'', N'259687', N'19.728793', N'-99.955394')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (35, N'221', N'San José del Rincón', N'COMUNIDAD DE SAN JOAQUÍN DEL MONTE. DOM. CONOCIDO', 124, 1, N'15ETC0033Z', N'B. T.', N'18/07/2013', N'M', N'01 712 1 23 72 22', N'cecytemsjr@yahoo.com.mx', N'01 712 1 23 72 22', N'1997', N'C.P. JESÚS BARTOLO ARCOS', N'', N'', N'512480', N'19.656584', N'-100.142648')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (36, N'238', N'Sultepec', N'LIBRAMIENTO SULTEPEC S/N. COL. LUIS DONALDO COLOSIO', 80, 1, N'15ETC0050Q', N'B. T.', N'13/12/2000', N'M', N'044 7221 3159 46', N'cecytemsultepec@yahoo.com.mx', N'044 7221 3159 46', N'2000', N'ING. ROGERIO VITE LINARES', N'ING. JOSÉ INÉS GARCÍA PORFIRIO', N'', N'150456', N'18.861223', N'-99.975673')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (37, N'206', N'Tecámac', N'CARRETERA FEDERAL MÉXICO-PACHUCA. KM. 38.5  COL. EXRANCHO SAN AGUSTÍN.  EL LLANO', 81, 1, N'15ETC0006C', N'B. T.', N'19/06/1999', N'C', N'01 55 59 34 60 38', N'cecytemtecamac@yahoo.com.mx', N'01 55 59 34 60 38', N'1995', N'ING. PEDRO JIMÉNEZ PINEDA', N'LIC. FORTINO FERNANDO LEÓN TENORIO', N'', N'150310', N'19.724003', N'-98.972128')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (38, N'256', N'Tejupilco', N'CARRETERATEJUPILCO-AMATEPECKM 2.5. COL. EL PEDREGAL', 82, 1, N'15ETC0062V', N'B. T.', N'18/07/2013', N'M', N'01 724 26 7 72 11', N'cecytemtejupilco@hotmail.com', N'01 724 26 7 72 11', N'2009', N'ING. SERGIO JARAMILLO SUAREZ', N'LIC. MARIA LUGARDA RODRÍGUEZ PÉREZ', N'', N'150711', N'18.860709', N'-100.124172')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (39, N'262', N'Temascalapa', N'DELEGACIÓN DE SAN JUAN TEACALCO. CALLEAVENIDA JESÚS MESA S/N. COL. PUEBLO DE SAN JUAN TEACALCO', 84, 1, N'15ETC0068P', N'B. T.', N'18/07/2013', N'M', N'01 59 61 00 11 87', N'cecytemtemascalapa@yahoo.com.mx', N'01 59 61 00 11 87', N'2011', N'LIC. MARÍA ANA RAMOS CEDILLO', N'ING. ADOLFO DÍAZ FLORES', N'', N'541259', N'18.886961', N'-100.142027')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (40, N'224', N'Temascaltepec', N'EX HACIENDA DE GUADALUPE DEL BARRIO DE MILÁN NO 37 (ANTIGUO CAMINO DE MINERALES)', 86, 1, N'15ETC0039U', N'B. T.', N'19/06/1999', N'M', N'01 716 2 66 50 35', N'cecytemasc98@hotmail.com', N'01 716 2 66 50 35', N'1997', N'ING. GABRIEL MENDEZ ZEPEDA', N'', N'', N'150389', N'19.044032', N'-100.048804')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (41, N'215', N'Tenancingo', N'KM. 2 DE LA CARR. TENANCINGO-VILLA GUERRERO.  EX HACIENDA DE SANTA ANA', 88, 1, N'15ETC0016J', N'B. T.', N'19/06/1999', N'M', N'01 714 1 42 31 22', N'cecytemtenancingo@prodigy.net.mx', N'01 714 1 42 31 22', N'1996', N'M. EN C. GREGORIO ZAPATA ARREDONDO', N'', N'', N'150313', N'18.967404', N'-99.614678')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (42, N'232', N'Tenango del Valle', N'PROLONGACIÓN AV. INDEPENDENCIA S/N. TERRENO  LA CIENEGUITA. COL. LA SOYA', 90, 1, N'15ETC0045E', N'B. T.', N'20/09/1999', N'M', N'01 717 1 44 07 41', N'direcciontenangodelvalle@hotmail.com', N'01 717 1 44 07 41', N'1999', N'ING. CARLOS RENAUD TOLEDO', N'', N'', N'150385', N'19.117024', N'-99.586594')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (43, N'234', N'Tepotzotlán', N'TEPOTZOTLÁN', 95, 1, N'15ET00049A', N'B. T.', N'13/12/2000', N'C', N'01 55 58 76 45 58', N'cecytemtepotzotlan@prodigy.net.mx', N'01 55 58 76 45 58', N'2000', N'ING. JOSE GUADALUPE VEGA SANCHEZ', N'LIC. ARACELI PEZA MARTINEZ', N'L.C. EDDY VIORNERY DOMINGUEZ', N'150393', N'19.719720', N'-99.203275')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (44, N'229', N'Tequixquiac', N'CALLE REGINA NO. 3. COL. DEL SOL. BARRIO SAN MATEO', 96, 1, N'15ETC0042H', N'B. T.', N'20/09/1999', N'M', N'01 59 19 12 06 32', N'cecytemtequixquiac@hotmail.com', N'01 59 19 12 06 32', N'1999', N'M. EN C. YULISMA L. CORTE SANDOVAL', N'LIC. SONIA ZARAZÚA ROMERO', N'LIC. JORGE LÓPEZ MIGUEL', N'150386', N'19.887876', N'-99.141988')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (45, N'258', N'Texcoco', N'AV. INSURGENTESS/N TEQUEXQUINAHUAC', 99, 1, N'15ETC0064T', N'B. T.', N'18/07/2013', N'C', N'01 5959 23 53 51', N'cecytem_texcoco@prodigy.net.mx', N'01 5959 23 53 51', N'2010', N'LIC: TOMAS FERMÍN BRAVO CRUZ', N'', N'', N'150716', N'19.480480', N'-98.834618')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (46, N'247', N'Tezoyuca', N'CAMINO A TEPEXPANS/N. COMUNIDAD DE TEQUIXSTLÁN', 100, 1, N'15ETC0060X', N'B. T.', N'18/07/2013', N'M', N'01 59 49 34 40 77', N'cecytemtezoyuca@live.com.mx', N'01 59 49 34 40 77', N'2008', N'MTRA. VIOLETA GUTIÉRREZ MATÍAS', N'', N'', N'150715', N'19.604757', N'-98.938461')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (47, N'208', N'Toluca', N'PARCELA ESCOLAR DEL EJIDO DE SAN ANTONIO BUENA VISTA', 106, 1, N'15ETC0023T', N'B. T.', N'19/06/1999', N'M', N'722 2 74 48 44', N'cecytemtol@prodigy.net.mx', N'722 2 74 48 44', N'1995', N'M.E.S. BEATRIZ ELSA CHÁVEZ LÓPEZ', N'', N'', N'150311', N'19.270470', N'-99.712162')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (48, N'239', N'Tultepec', N'AV. CIRCUITO NORTE. CALLE 16 S/N UNIDAD C.T.M (ENTRE CIRCUITO SAN PABLO Y PARALELA CON CALLE 14)', 108, 1, N'15ETC0051P', N'B. T.', N'20/10/2001', N'C', N'55 58 35 23 03', N'direcciontultepec@hotmail.com', N'55 58 35 23 03', N'2002', N'C.P. RITA MARTINEZ ALVAREZ', N'', N'', N'150529', N'19.664046', N'-99.107438')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (49, N'214', N'Tultitlán', N'CONSTITUCIÓN DE 1857. ESQ. JORGE JIMÉNEZ CANTÚ S/N. SAN PABLO DE LAS SALINAS', 109, 1, N'15ETC0029N', N'B. T.', N'19/06/1999', N'C', N'01 55 58 83 72 93', N'cecytemtultitlan@hotmail.com', N'01 55 58 83 72 93', N'1996', N'M. EN D. A. HÉCTOR RICARDO ALMERALLA BANDA', N'C.P. ROCIO DEL PILAR CIBRIAN BUSTAMANTE', N'M. EN D. A. LAURA ESCALANTE RUIZ', N'150312', N'19.673405', N'-99.087057')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (50, N'265', N'Valle de Bravo', N'COLEGIO OFTV NO. 0437 “HÉROES DE LA INDEPENDENCIA” (TELESECUNDARIA). LOCALIDAD DE CUADRILLA DE DOLORES', 110, 1, N'15ETC0071C', N'B. T.', N'18/07/2013', N'C', N'72 62 51 42 61', N'cecytem_valledebravo@hotmail.com', N'72 62 51 42 61', N'2012', N'MTRA. AMALIA LEONILA TOLEDO LÓPEZ', N'', N'', N'548210', N'19.193102', N'-100.133410')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (51, N'204', N'Valle de Chalco Solidaridad', N'AV. ISIDRO FABELA S/N (LAS TORRES) COLONIA MARÍA ISABEL', 122, 1, N'15ETC0022U', N'B. T.', N'19/06/1999', N'C', N'55-59-71-47-43', N'direccionvallechalco@hotmail.com', N'55-59-71-47-43', N'1994', N'DR. MIGUEL ÁNGEL LÓPEZ MÁRQUEZ', N'LIC. BLANCA MIRIAM CEDANO VILLAFUERTE', N'', N'150314', N'19.302794', N'-98.950502')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (52, N'243', N'Valle de Chalco Solidaridad II', N'AV. ADOLFO LÓPEZ MATEOS ESQ. AV. SOLIDARIDAD COL. SAN ISIDRO.', 122, 1, N'15ETC0054M', N'B. T.', N'18/07/2013', N'M', N'01 55 62 82 77 04', N'cecytem_vchsii@hotmail.com', N'01 55 62 82 77 04', N'2005', N'ING. CESAR GÓMEZ FLORES', N'LIC. CLAUDIA BELÉN CRUZ RUIZ', N'', N'150618', N'19.264337', N'-98.930600')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (53, N'244', N'Villa de Allende', N'CAMINO REAL A SAN MIGUEL EJIDO IGNACIO ALLENDE A SAN JOSÉ', 111, 1, N'15ETC0056K', N'B. T.', N'18/07/2013', N'C', N'722 5 96 10 14', N'cvilladeallende@hotmail.com', N'722 5 96 10 14', N'2006', N'BIÓL. CATALINA ALVARADO MORENO', N'ING. GUILLERMO GONZALEZ GALVEZ', N'LIC.​ JOSE PILAR OLMOS QUINTANA', N'150610', N'19.374280', N'-100.147601')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (54, N'220', N'Villa del Carbón', N'PARAJE RANCHO EL GACHUPÍN. POBLADO DE LLANO DE ZACAPEXCO. COMUNIDAD INDÍGENA SAN JERÓNIMO', 112, 1, N'15ETC0034Z', N'B. T.', N'19/06/1999', N'M', N'01 58 89 13 09 27', N'cecytemvilladelcarbon@prodigy.net.mx', N'01 58 89 13 09 27', N'1997', N'LIC. ALEJANDRO PLIEGO FLORES', N'ING. EFRÉN CERÓN VILLAFRANCA', N'', N'150315', N'19.709210', N'-99.488403')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (55, N'233', N'Villa Victoria', N'KM 114 DE LA CARRETERA FEDERAL NOGALES. (TOLUCA-ZITACUARO). LOC. SANTA ISABEL DEL MONTE', 114, 1, N'15ETC0046D', N'B. T.', N'20/09/1999', N'M', N'01 726 2 51 80 90', N'cvillavictoria@yahoo.com.mx', N'01 726 2 51 80 90', N'1999', N'M. EN A.I. E. DIANA GONZÁLEZ REBOLLO', N'', N'', N'150457', N'19.417108', N'-99.972773')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (56, N'226', N'Xonacatlán', N'PARAJE LA JARDONA (KM 49 DE LA CARRETERA TOLUCA-NAUCALPAN)', 115, 1, N'15ETC0037W', N'B. T.', N'19/06/1999', N'M', N'01 719 2 86 39 41', N'cecytemxonacatlan@prodigy.net.mx', N'01 719 2 86 39 41', N'1998', N'ING. JUAN EDUARDO DE LA ROSA OLIVA', N'M. EN C. CAROLINA JALPA PLATA', N'', N'150388', N'19.391884', N'-99.536504')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (57, N'218', N'Zacazonapan', N'CALLE LIBRAMIENTO NO. 7  COL. RUBÉN MÉNDEZ DEL CASTILLO', 116, 1, N'15ETC0031B', N'B. T.', N'19/06/1999', N'M', N'01 726 2 62 42 21', N'p_zacazonapan@hotmail.com', N'01 726 2 62 42 21', N'1997', N'LIC. FRANCISCO EFRAIN ROJAS ESTRADA', N'T.S.U. SERGIO JARAMILLO SUÁREZ', N'', N'150316', N'19.073721', N'-100.253258')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (58, N'066', N'Almoloya de Juárez', N'DOMICILIO CONOCIDO', 5, 1, N'15ETC0072B', N'B. T.', N'2014-10-02', N'C', N'7223037687', N'1@hotmail.com', N'7223037687', N'2014', N'M. EN A. MARGARITA CAMACHO GOMEZ', N'****', N'I.S.C. GISELA ESCOBAR FRANCO', N'123456', N'19.344902', N'-99.755616')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (59, N'067', N'Zinacantepec', N'CLEMENTE OROZCO 201', 118, 1, N'15ETC0073A', N'B. T.', N'2014-10-14', N'C', N'5545415526', N'balrog_iluvatar@hotmail.com', N'5545415526', N'2014', N'ING. ISMAEL HERNANDEZ ARRIETA', N'ING. JORGE ALBERTO FAISAL GÓMEZ', N'', N'125968', N'19.267881', N'-99.757280')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (60, N'069', N'Toluca II', N'DOMICILIO CONOCIDO', 106, 1, N'15ETC0075Z', N'B. T.', N'2014-10-14', N'C', N'017221795168', N'plantel.toluca2@cecytem.mx', N'7223588280', N'2014', N'M. EN E. HERMILA VALLEJO LÓPEZ', N'ING. DIONICIA MANDUJANO CUARTO', N'LIC. MARCOS JAVIER ORTIZ JIMENEZ', N'541203', N'19.445867', N'-99.662557')
GO
INSERT [dbo].[PLANTEL] ([ID_Plantel], [clavePlantel], [nombre], [direccion], [FK_ID_Municipio], [FK_ID_Estado], [claveCentroTrabajo], [claveEstudios], [fechaAlta], [zona], [telefono], [correo], [fax], [anioCreacion], [nombreCompletoDirector], [nombreCompletoSubDirector], [nombreCompletoCoordinador], [claveDGP], [latitud], [longitud]) VALUES (61, N'068', N'Ecatepec III', N'CARRETERA LECHERIA TEXCOCO S/N', 33, 1, N'15ETC0074Z', N'B. T.', N'2014-10-14', N'C', N'5525325739', N'aleflorez85@hotmail.com', N'5525325739', N'2014', N'M. EN C. OSCAR MENDOZA ÁNGELES', N'', N'', N'518930', N'19.617224', N'-98.984211')
GO
SET IDENTITY_INSERT [dbo].[ROL] ON 

GO
INSERT [dbo].[ROL] ([ID_Rol], [nombreRol], [descripccion]) VALUES (1, N'super usuario', N'Tiene todos los permisos para gestionar todo el sistema                                                                                                                                                                                                   ')
GO
SET IDENTITY_INSERT [dbo].[ROL] OFF
GO
SET IDENTITY_INSERT [dbo].[ROL_PERMISO] ON 

GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (1, 1, 1)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (2, 1, 2)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (3, 1, 3)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (4, 1, 4)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (5, 1, 5)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (6, 1, 6)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (7, 1, 7)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (8, 1, 8)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (9, 1, 9)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (10, 1, 10)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (11, 1, 11)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (12, 1, 12)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (13, 1, 13)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (14, 1, 14)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (15, 1, 15)
GO
INSERT [dbo].[ROL_PERMISO] ([ID_Rol_Permiso], [FK_ID_Rol], [FK_ID_Permiso]) VALUES (16, 1, 16)
GO
SET IDENTITY_INSERT [dbo].[ROL_PERMISO] OFF
GO
SET IDENTITY_INSERT [dbo].[ROL_USUARIO] ON 

GO
INSERT [dbo].[ROL_USUARIO] ([ID_Rol_Usuario], [FK_ID_Rol], [FK_ID_Usuario]) VALUES (1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[ROL_USUARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO_ARCHIVO] ON 

GO
INSERT [dbo].[TIPO_ARCHIVO] ([ID_Tipo_Archivo], [nombreTipo]) VALUES (1, N'Foto')
GO
SET IDENTITY_INSERT [dbo].[TIPO_ARCHIVO] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

GO
INSERT [dbo].[USUARIO] ([ID_Usuario], [usuario], [password], [nombreCompleto], [status], [correo], [FK_ID_Plantel]) VALUES (1, N'ROOT', N'507f513353702b50c145d5b7d138095c', N'ROOT', N'ACTIVO', N'root@cecytem.mx', 1)
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[ACADEMICO]  WITH CHECK ADD  CONSTRAINT [FK_ACADEMICO_PLANTEL] FOREIGN KEY([FK_ID_Plantel])
REFERENCES [dbo].[PLANTEL] ([ID_Plantel])
GO
ALTER TABLE [dbo].[ACADEMICO] CHECK CONSTRAINT [FK_ACADEMICO_PLANTEL]
GO
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVIDAD_ETAPA] FOREIGN KEY([FK_ID_Etapa])
REFERENCES [dbo].[ETAPA] ([ID_Etapa])
GO
ALTER TABLE [dbo].[ACTIVIDAD] CHECK CONSTRAINT [FK_ACTIVIDAD_ETAPA]
GO
ALTER TABLE [dbo].[ARCHIVO]  WITH CHECK ADD  CONSTRAINT [FK_ARCHIVO_PLANTEL] FOREIGN KEY([FK_ID_Plantel])
REFERENCES [dbo].[PLANTEL] ([ID_Plantel])
GO
ALTER TABLE [dbo].[ARCHIVO] CHECK CONSTRAINT [FK_ARCHIVO_PLANTEL]
GO
ALTER TABLE [dbo].[ARCHIVO]  WITH CHECK ADD  CONSTRAINT [FK_ARCHIVO_TIPO_ARCHIVO] FOREIGN KEY([FK_ID_Tipo_Archivo])
REFERENCES [dbo].[TIPO_ARCHIVO] ([ID_Tipo_Archivo])
GO
ALTER TABLE [dbo].[ARCHIVO] CHECK CONSTRAINT [FK_ARCHIVO_TIPO_ARCHIVO]
GO
ALTER TABLE [dbo].[ETAPA]  WITH CHECK ADD  CONSTRAINT [FK_ETAPA_PLANTEL] FOREIGN KEY([FK_ID_Plantel])
REFERENCES [dbo].[PLANTEL] ([ID_Plantel])
GO
ALTER TABLE [dbo].[ETAPA] CHECK CONSTRAINT [FK_ETAPA_PLANTEL]
GO
ALTER TABLE [dbo].[INFRAESTRUCTURA]  WITH CHECK ADD  CONSTRAINT [FK_INFRAESTRUCTURA_PLANTEL] FOREIGN KEY([FK_ID_Plantel])
REFERENCES [dbo].[PLANTEL] ([ID_Plantel])
GO
ALTER TABLE [dbo].[INFRAESTRUCTURA] CHECK CONSTRAINT [FK_INFRAESTRUCTURA_PLANTEL]
GO
ALTER TABLE [dbo].[OBJETO_ARCHIVO]  WITH CHECK ADD  CONSTRAINT [FK_OBJETO_ARCHIVO_ARCHIVO] FOREIGN KEY([FK_ID_Archivo])
REFERENCES [dbo].[ARCHIVO] ([ID_Archivo])
GO
ALTER TABLE [dbo].[OBJETO_ARCHIVO] CHECK CONSTRAINT [FK_OBJETO_ARCHIVO_ARCHIVO]
GO
ALTER TABLE [dbo].[PLANTEL]  WITH CHECK ADD  CONSTRAINT [FK_PLANTEL_ESTADO] FOREIGN KEY([FK_ID_Estado])
REFERENCES [dbo].[ESTADO] ([ID_Estado])
GO
ALTER TABLE [dbo].[PLANTEL] CHECK CONSTRAINT [FK_PLANTEL_ESTADO]
GO
ALTER TABLE [dbo].[PLANTEL]  WITH CHECK ADD  CONSTRAINT [FK_PLANTEL_MUNICIPIO] FOREIGN KEY([FK_ID_Municipio])
REFERENCES [dbo].[MUNICIPIO] ([ID_Municipio])
GO
ALTER TABLE [dbo].[PLANTEL] CHECK CONSTRAINT [FK_PLANTEL_MUNICIPIO]
GO
ALTER TABLE [dbo].[ROL_PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_ROL_PERMISO_PERMISO] FOREIGN KEY([FK_ID_Permiso])
REFERENCES [dbo].[PERMISO] ([ID_Permiso])
GO
ALTER TABLE [dbo].[ROL_PERMISO] CHECK CONSTRAINT [FK_ROL_PERMISO_PERMISO]
GO
ALTER TABLE [dbo].[ROL_PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_ROL_PERMISO_ROL] FOREIGN KEY([FK_ID_Rol])
REFERENCES [dbo].[ROL] ([ID_Rol])
GO
ALTER TABLE [dbo].[ROL_PERMISO] CHECK CONSTRAINT [FK_ROL_PERMISO_ROL]
GO
ALTER TABLE [dbo].[ROL_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_ROL_USUARIO_ID_Rol] FOREIGN KEY([FK_ID_Rol])
REFERENCES [dbo].[ROL] ([ID_Rol])
GO
ALTER TABLE [dbo].[ROL_USUARIO] CHECK CONSTRAINT [FK_ROL_USUARIO_ID_Rol]
GO
ALTER TABLE [dbo].[ROL_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_ROL_USUARIO_ID_Usuario] FOREIGN KEY([FK_ID_Usuario])
REFERENCES [dbo].[USUARIO] ([ID_Usuario])
GO
ALTER TABLE [dbo].[ROL_USUARIO] CHECK CONSTRAINT [FK_ROL_USUARIO_ID_Usuario]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_PLANTEL] FOREIGN KEY([FK_ID_Plantel])
REFERENCES [dbo].[PLANTEL] ([ID_Plantel])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_USUARIO_PLANTEL]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacena los datos academicos de los Planteles.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ACADEMICO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que registra las actividades de las etapas de desarrollo de los Planteles.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ACTIVIDAD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacena las rutas e información de los archivos que se guardan en el Sistema SPIC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ARCHIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave Foranea de Plantel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ARCHIVO', @level2type=N'CONSTRAINT',@level2name=N'FK_ARCHIVO_PLANTEL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave foranea de tipo de archivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ARCHIVO', @level2type=N'CONSTRAINT',@level2name=N'FK_ARCHIVO_TIPO_ARCHIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacena las etapas de desarrollo que tienen los Planteles.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ETAPA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacena los registros de la infraestructura de los planteles.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'INFRAESTRUCTURA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla para referenciar el archivo y a su vez a que objeto de la base de datos le pertenece el archivo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBJETO_ARCHIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave foranea que hace referencia a los registros de la tabla ARCHIVO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OBJETO_ARCHIVO', @level2type=N'CONSTRAINT',@level2name=N'FK_OBJETO_ARCHIVO_ARCHIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permisos JSP para usuarios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Roles de los usuario SPIC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ROL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relación de los permisos con los roles de los usuarios del sistema SPIC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ROL_PERMISO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que relaciona los roles y los usuarios en el sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ROL_USUARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave foranea de el ID de la tabla ROL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ROL_USUARIO', @level2type=N'CONSTRAINT',@level2name=N'FK_ROL_USUARIO_ID_Rol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave Foranea de el ID_Usuario de la tabla USUARIO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ROL_USUARIO', @level2type=N'CONSTRAINT',@level2name=N'FK_ROL_USUARIO_ID_Usuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacena los tipos de Archivos que almacena el sistema SPIC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TIPO_ARCHIVO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacena los usuarios del Sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO'
GO
USE [master]
GO
ALTER DATABASE [DBSPIC] SET  READ_WRITE 
GO
