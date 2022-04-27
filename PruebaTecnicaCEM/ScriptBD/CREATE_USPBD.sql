--create database DBPruebaTecnica;
use DBPruebaTecnica
go

--LISTADOS

CREATE PROCEDURE USP_ListarTipoDocumento
AS
	BEGIN
		SELECT A.IdTipoDocumento IdTipoDocumento
			  ,RTRIM(ISNULL(A.TipoDocumento,'')) TipoDocumento
			  ,RTRIM(ISNULL(A.Abreviatura,'')) Abreviatura		
			  ,ISNULL(A.EstadoRegistro,20) EstadoRegistro
			  ,ISNULL(A.MaxNumDigito,0) MaxNumDigito
		FROM H001_TipoDocumento A WITH(NOLOCK)
		WHERE A.EstadoRegistro = 1
	END
GO

CREATE PROCEDURE USP_ListarDepartamento
AS
	BEGIN
		SELECT A.CodDepartamento CodDepartamento
			  ,RTRIM(ISNULL(A.Departamento,'')) Departamento
		FROM H001_Departamento A WITH(NOLOCK)
		WHERE A.EstadoRegistro = 1
	END
GO

CREATE PROCEDURE USP_ListarProvincia 
@CodDepartamento CHAR(2)
AS
	BEGIN
		SELECT A.CodProvincia CodProvincia
			  ,RTRIM(ISNULL(A.Provincia,'')) Provincia
		FROM H001_Provincia A WITH(NOLOCK)
		WHERE A.EstadoRegistro = 1 AND A.CodDepartamento = @CodDepartamento
	END
GO

CREATE PROCEDURE USP_ListarDistrito
@CodDepartamento CHAR(2),
@CodProvincia CHAR(2)
AS
	BEGIN
		SELECT A.CodUbigeo CodUbigeo
			  ,RTRIM(ISNULL(A.Distrito,'')) Distrito
		FROM H001_Ubigeo A WITH(NOLOCK)		
		WHERE A.EstadoRegistro = 1 AND A.CodDepartamento = @CodDepartamento AND A.CodProvincia = @CodProvincia
	END
GO

--INSERCION




ALTER PROCEDURE USP_InsertarPaciente
	@IdTipoDocumento		int,		
	@NumDocIdentidad		char(20),	
	@Nombre					varchar(50),
	@ApellidoPaterno		varchar(30),
	@ApellidoMaterno		varchar(30),
	@Sexo					char(1),	
	@FechaNacimiento		date,		
	@Direccion				varchar(150),
	@CodDepartamento		char(2),	
	@Departamento			varchar(50),
	@CodProvincia			char(2),	
	@Provincia				varchar(50),
	@CodUbigeo				char(6),	
	@Distrito				varchar(50),
	@TelefonoMovil			char(15),	
	@Correo					varchar(50),
	@CodUsuario				varchar(30),
	@CodUsuCreaRegistro		varchar(30)
AS
	BEGIN
		DECLARE @CodPersona VARCHAR(30)
				,@CantidadPersonas INT

		--VALIDACION EXISTENCIA USUARIO
		IF EXISTS(SELECT 1 FROM H001_Persona WHERE IdTipoDocumento = @IdTipoDocumento AND NumDocIdentidad = @NumDocIdentidad)
			BEGIN
				SELECT 999  
			END
		ELSE
			BEGIN
				SET @CantidadPersonas = (SELECT COUNT(*) CodPersona FROM H001_Persona)
				SET @CodPersona = 'P' + CAST(@CantidadPersonas + 1 AS VARCHAR(30))							

				--INSERCION
				INSERT INTO H001_Persona([CodPersona],
											[IdTipoDocumento],
											[NumDocIdentidad],
											[Nombre],
											[ApellidoPaterno],
											[ApellidoMaterno],
											[Sexo],
											[FechaNacimiento],
											[Direccion],
											[CodDepartamento],
											[Departamento],
											[CodProvincia],
											[Provincia],
											[CodUbigeo],
											[Distrito],
											[TelefonoMovil],
											[Correo],
											[CodUsuario],
											[CodUsuCreaRegistro],
											[FechaCreaRegistro])

				VALUES(@CodPersona,
						@IdTipoDocumento,  
						@NumDocIdentidad,   
						@Nombre,			   
						@ApellidoPaterno,   
						@ApellidoMaterno,   
						@Sexo,			   
						@FechaNacimiento,   
						@Direccion,		   
						@CodDepartamento,   
						@Departamento,	   
						@CodProvincia,	   
						@Provincia,		   
						@CodUbigeo,		   
						@Distrito,		   
						@TelefonoMovil,	   
						@Correo,			   
						@CodUsuario,		   
						@CodUsuCreaRegistro,
						GETDATE())			 

				SELECT @@ROWCOUNT
			END			
	END
GO

