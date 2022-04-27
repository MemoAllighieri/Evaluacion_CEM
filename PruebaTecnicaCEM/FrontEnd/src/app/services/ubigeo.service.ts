import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { H001_Departamento } from '../entity/H001_Departamento';
import { H001_Provincia } from '../entity/H001_Provincia';
import { H001_Distrito } from '../entity/H001_Distrito';
import { _Ubigeo } from '../Util/RoutesAPI';

@Injectable({
    providedIn: 'root'
})

export class Ubigeo_service {

    constructor(private http: HttpClient) { }

    ListarDepartamento(): Observable<any>{
        return this.http.get<any>(`${_Ubigeo.ListarDepartamento}`);
    }
    ListarProvincia(psCodDepartamento : string): Observable<any>{
        return this.http.get<any>(`${_Ubigeo.ListarProvincia}${psCodDepartamento}`);
    }
    ListarDistrito(psCodDepartamento : string, psCodProvincia : string): Observable<any>{
        return this.http.get<any>(`${_Ubigeo.ListarDistrito}${psCodDepartamento}/${psCodProvincia}`);
    }
}