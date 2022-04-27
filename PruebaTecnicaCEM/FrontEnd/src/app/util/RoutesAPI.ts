export class RoutesApi{
    public static API_ENDPOINT = 'https://localhost:44389/api';
}

export class _H001_TipoDocumento{
    public static prefijo = RoutesApi.API_ENDPOINT + '/H001_TipoDocumento/';
    public static ListarTipoDocumento = _H001_TipoDocumento.prefijo + 'ListarTipoDocumento';
}

export class _Ubigeo{
    public static prefijo = RoutesApi.API_ENDPOINT + '/H001_Ubigeo/';
    public static ListarDepartamento = _Ubigeo.prefijo + 'ListarDepartamento';
    public static ListarProvincia = _Ubigeo.prefijo + 'ListarProvincia/';
    public static ListarDistrito = _Ubigeo.prefijo + 'ListarDistrito/';
}

export class _H001_Paciente{
    public static prefijo = RoutesApi.API_ENDPOINT + '/H001_Paciente/';
    public static InsertarPaciente = _H001_Paciente.prefijo + 'InsertarPaciente';
}