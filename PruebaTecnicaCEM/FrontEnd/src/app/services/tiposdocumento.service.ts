import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { H001_TipoDocumento } from '../entity/H001_TipoDocumento';
import { _H001_TipoDocumento } from '../Util/RoutesAPI';

@Injectable({
    providedIn: 'root'
})

export class H001_TipoDocumento_service {

    constructor(private http: HttpClient) { }

    ListarTipoDocumento(): Observable<any>{
        return this.http.get<any>(`${_H001_TipoDocumento.ListarTipoDocumento}`);
    }
}