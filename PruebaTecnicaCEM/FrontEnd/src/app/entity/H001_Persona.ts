export class H001_Persona {
    constructor(
    public CodPersona?: string,
    public IdTipoDocumento?: number,
    public NumDocIdentidad?:string,
    public Nombre?:string,
    public Nombres?:string,
    public ApellidoPaterno?: string,
    public ApellidoMaterno?:string,
    public Sexo?:string,
    public IdSexo?:string,
    public FechaNacimiento?:Date,
    public IdPertenenciaEtnica?:number,
    public IdPaisNacimiento?:number,
    public CodUbigeoNacimiento?:string,
    public Foto?:string,
    public IdGradoInstruccion?:number,
    public IdReligion?:number,
    public CentroEducativo?:string,
    public IdEstadoCivil?:number,
    public IdOcupacion?:number,
    public TelefonoFijo?:string,
    public TelefonoMovil?:string,
    public Correo?:string,
    public IdTipoPersona?:number,
    public IndTratamientoDatos?:boolean,
    public IndTerminoCondicion?:boolean,
    public EstadoRegistro?:boolean,
    public Edad?:number,
    public Password?:string,
    public ConfirmarPassword?: string,
    public NombreCompleto?:string,
    public Direccion?:string,
    public CodDepartamento?:string,
    public Departamento?:string,
    public CodProvincia?:string,
    public Provincia?: string,
    public CodUbigeo?:string,
    public Distrito?:string,
    public TipoDocumento?:string,
    public Abreviatura?:string
    ) { }
  }
