import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { H001_Persona } from '../entity/H001_Persona';
import { _H001_Paciente } from '../Util/RoutesAPI';

@Injectable({
    providedIn: 'root'
})

export class Paciente_service {

    constructor(private http: HttpClient) { }

    InsertarPaciente(H001_Persona: H001_Persona): Observable<any>{
        return this.http.post<any>(`${_H001_Paciente.InsertarPaciente}`, H001_Persona);
    }
}