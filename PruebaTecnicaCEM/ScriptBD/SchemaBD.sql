--create database DBPruebaTecnica;
use DBPruebaTecnica
go

/****** Object:  Table [dbo].[H001_Departamento]    Script Date: 06/04/2021 13:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[H001_Departamento](
	[CodDepartamento] [char](2) NOT NULL,
	[Departamento] [varchar](50) NULL,
	[CodUsuCreaRegistro] [varchar](30) NULL,
	[FechaCreaRegistro] [datetime] NULL,
	[CodUsuModificaRegistro] [varchar](30) NULL,
	[FechaModificaRegistro] [datetime] NULL,
	[EstadoRegistro] [bit] NULL,
 CONSTRAINT [PK_HIS_Departamento] PRIMARY KEY CLUSTERED 
(
	[CodDepartamento] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[H001_Persona]    Script Date: 06/04/2021 13:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[H001_Persona](
	[CodPersona] [varchar](30) NOT NULL,
	[IdTipoDocumento] [int] NULL,
	[NumDocIdentidad] [char](20) NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](30) NULL,
	[ApellidoMaterno] [varchar](30) NULL,
	[Sexo] [char](1) NULL,
	[FechaNacimiento] [date] NULL,
	[IdPertenenciaEtnica] [int] NULL,
	[IdPaisNacimiento] [int] NULL,

	[Direccion] [varchar](150) NULL,--agregado
	[CodDepartamento] [char](2) NULL,--agregado
	[Departamento] [varchar](50) NULL,--agregado
	[CodProvincia] [char](2) NULL,--agregado
	[Provincia] [varchar](50) NULL,--agregado
	[CodUbigeo] [char](6) NULL,--agregado
	[Distrito] [varchar](50) NULL,--agregado

	[CodUbigeoNacimiento] [char](6) NULL,
	[Foto] [varchar](100) NULL,
	[IdGradoInstruccion] [int] NULL,
	[IdReligion] [int] NULL,
	[CentroEducativo] [varchar](50) NULL,
	[IdEstadoCivil] [int] NULL,
	[IdOcupacion] [int] NULL,
	[TelefonoFijo] [char](15) NULL,
	[TelefonoMovil] [char](15) NULL,
	[Correo] [varchar](50) NULL,
	[IdTipoPersona] [int] NULL,
	[TratamientoDato] [bit] NULL,
	[TerminoCondicion] [bit] NULL,
	[CodUsuario] [varchar](30) NULL,
	[CodUsuCreaRegistro] [varchar](30) NULL,
	[FechaCreaRegistro] [datetime] NOT NULL,
	[CodUsuModificaRegistro] [varchar](30) NULL,
	[FechaModificaRegistro] [datetime] NULL,
	[EstadoRegistro] [bit] NULL,
 CONSTRAINT [PK_HIS_Persona_1] PRIMARY KEY CLUSTERED 
(
	[CodPersona] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[H001_Provincia]    Script Date: 06/04/2021 13:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[H001_Provincia](
	[CodDepartamento] [char](2) NOT NULL,
	[CodProvincia] [char](2) NOT NULL,
	[Provincia] [varchar](50) NULL,
	[CodUsuCreaRegistro] [varchar](30) NULL,
	[FechaCreaRegistro] [datetime] NULL,
	[CodUsuModificaRegistro] [varchar](30) NULL,
	[FechaModificaRegistro] [datetime] NULL,
	[EstadoRegistro] [bit] NULL,
 CONSTRAINT [PK_HIS_Provincia] PRIMARY KEY CLUSTERED 
(
	[CodDepartamento] ASC,
	[CodProvincia] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[H001_TipoDocumento]    Script Date: 06/04/2021 13:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[H001_TipoDocumento](
	[IdTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](100) NULL,
	[Abreviatura] [varchar](10) NULL,
	[MaxNumDigito] [int] NULL,
	[CodUsuCreaRegistro] [varchar](30) NULL,
	[FechaCreaRegistro] [datetime] NULL,
	[CodUsuModificaRegistro] [varchar](30) NULL,
	[FechaModificaRegistro] [datetime] NULL,
	[EstadoRegistro] [bit] NULL,
 CONSTRAINT [PK_HIS_Tipo_Documento] PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[H001_Ubigeo]    Script Date: 06/04/2021 13:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[H001_Ubigeo](
	[CodUbigeo] [char](6) NOT NULL,
	[CodDepartamento] [char](2) NULL,
	[CodProvincia] [char](2) NULL,
	[Distrito] [varchar](50) NULL,
	[CodUsuCreaRegistro] [varchar](30) NULL,
	[FechaCreaRegistro] [datetime] NULL,
	[CodUsuModificaRegistro] [varchar](30) NULL,
	[FechaModificaRegistro] [datetime] NULL,
	[EstadoRegistro] [bit] NULL,
 CONSTRAINT [PK_HIS_Ubigeo] PRIMARY KEY CLUSTERED 
(
	[CodUbigeo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[H001_Persona]  WITH CHECK ADD CONSTRAINT [FK_H001_Persona_H001_Grado_Instruccion] FOREIGN KEY([IdGradoInstruccion])
REFERENCES [dbo].[H001_GradoInstruccion] ([IdGradoInstruccion])
GO
ALTER TABLE [dbo].[H001_Persona] CHECK CONSTRAINT [FK_H001_Persona_H001_Grado_Instruccion]
GO
ALTER TABLE [dbo].[H001_Persona]  WITH CHECK ADD  CONSTRAINT [FK_H001_Persona_H001_Ocupacion] FOREIGN KEY([IdOcupacion])
REFERENCES [dbo].[H001_Ocupacion] ([IdOcupacion])
GO
ALTER TABLE [dbo].[H001_Persona] CHECK CONSTRAINT [FK_H001_Persona_H001_Ocupacion]
GO
ALTER TABLE [dbo].[H001_Persona]  WITH CHECK ADD  CONSTRAINT [FK_H001_Persona_H001_Pais] FOREIGN KEY([IdPaisNacimiento])
REFERENCES [dbo].[H001_Pais] ([IdPais])
GO
ALTER TABLE [dbo].[H001_Persona] CHECK CONSTRAINT [FK_H001_Persona_H001_Pais]
GO
ALTER TABLE [dbo].[H001_Persona]  WITH CHECK ADD  CONSTRAINT [FK_H001_Persona_H001_Pertenencia_Etnica] FOREIGN KEY([IdPertenenciaEtnica])
REFERENCES [dbo].[H001_PertenenciaEtnica] ([IdPertenenciaEtnica])
GO
ALTER TABLE [dbo].[H001_Persona] CHECK CONSTRAINT [FK_H001_Persona_H001_Pertenencia_Etnica]
GO
ALTER TABLE [dbo].[H001_Persona]  WITH CHECK ADD  CONSTRAINT [FK_H001_Persona_H001_Religion] FOREIGN KEY([IdReligion])
REFERENCES [dbo].[H001_Religion] ([IdReligion])
GO
ALTER TABLE [dbo].[H001_Persona] CHECK CONSTRAINT [FK_H001_Persona_H001_Religion]
GO
ALTER TABLE [dbo].[H001_Persona]  WITH CHECK ADD  CONSTRAINT [FK_H001_Persona_H001_Tipo_Persona] FOREIGN KEY([IdTipoPersona])
REFERENCES [dbo].[H001_TipoPersona] ([IdTipoPersona])
GO
ALTER TABLE [dbo].[H001_Persona] CHECK CONSTRAINT [FK_H001_Persona_H001_Tipo_Persona]
GO
ALTER TABLE [dbo].[H001_Persona]  WITH CHECK ADD  CONSTRAINT [FK_H001_Persona_H001_TipoDocumento] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[H001_TipoDocumento] ([IdTipoDocumento])
GO
ALTER TABLE [dbo].[H001_Persona] CHECK CONSTRAINT [FK_H001_Persona_H001_TipoDocumento]
GO
ALTER TABLE [dbo].[H001_Persona]  WITH CHECK ADD  CONSTRAINT [FK_H001_Persona_H001_Ubigeo] FOREIGN KEY([CodUbigeoNacimiento])
REFERENCES [dbo].[H001_Ubigeo] ([CodUbigeo])
GO
ALTER TABLE [dbo].[H001_Persona] CHECK CONSTRAINT [FK_H001_Persona_H001_Ubigeo]
GO
ALTER TABLE [dbo].[H001_Persona]  WITH CHECK ADD  CONSTRAINT [FK_HIS_Persona_HIS_Estado_Civil] FOREIGN KEY([IdEstadoCivil])
REFERENCES [dbo].[H001_EstadoCivil] ([IdEstadoCivil])
GO
ALTER TABLE [dbo].[H001_Persona] CHECK CONSTRAINT [FK_HIS_Persona_HIS_Estado_Civil]
GO
ALTER TABLE [dbo].[H001_Provincia]  WITH CHECK ADD  CONSTRAINT [FK_H001_Provincia_H001_Departamento] FOREIGN KEY([CodDepartamento])
REFERENCES [dbo].[H001_Departamento] ([CodDepartamento])
GO
ALTER TABLE [dbo].[H001_Provincia] CHECK CONSTRAINT [FK_H001_Provincia_H001_Departamento]
GO
ALTER TABLE [dbo].[H001_Ubigeo]  WITH CHECK ADD  CONSTRAINT [FK_H001_Ubigeo_H001_Departamento] FOREIGN KEY([CodDepartamento])
REFERENCES [dbo].[H001_Departamento] ([CodDepartamento])
GO
ALTER TABLE [dbo].[H001_Ubigeo] CHECK CONSTRAINT [FK_H001_Ubigeo_H001_Departamento]
GO
