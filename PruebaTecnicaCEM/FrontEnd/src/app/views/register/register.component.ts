import { HttpClient, HttpHeaders, HttpParams, JsonpClientBackend } from '@angular/common/http';
import { Component, OnInit,Injectable } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import Swal from 'sweetalert2'
import { DatePipe } from '@angular/common';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbDateParserFormatter,NgbDatepickerI18n, NgbDate, NgbDateStruct } from '@ng-bootstrap/ng-bootstrap';
import {CustomDatepickerI18n} from '../../util/CustomDatepickerI18n';
import {I18n} from '../../util/I18n';
import { H001_Persona } from '../../entity/H001_Persona';
import { H001_Departamento } from '../../entity/H001_Departamento';
import { H001_Provincia } from '../../entity/H001_Provincia';
import { H001_Distrito } from '../../entity/H001_Distrito';
import { H001_TipoDocumento } from '../../entity/H001_TipoDocumento';

import { H001_TipoDocumento_service } from "../../services/tiposdocumento.service";
import { Ubigeo_service } from "../../services/ubigeo.service";
import { Paciente_service } from "../../services/paciente.service";

@Component({
  selector: 'register.component',
  templateUrl: 'register.component.html',
  styleUrls: ['./register.component.scss'],
  providers: [I18n,DatePipe, {provide: NgbDatepickerI18n, useClass: CustomDatepickerI18n}]
})
export class RegisterComponent  implements OnInit { 
  goH001_Persona: H001_Persona = {};
  gloH001_TipoDocumento:H001_TipoDocumento[];
  gloH001_Departamento:H001_Departamento[];
  gloH001_Provincia:H001_Provincia[];
  gloH001_Distrito:H001_Distrito[];
  gsTipoDocumento: string = ""; 
  gdFechaSeleccionada: NgbDateStruct;
  fechaNacimiento: Date;
  
  constructor( private formBuilder: FormBuilder
              ,public datepipe: DatePipe
              ,private H001_TipoDocumento_service: H001_TipoDocumento_service
              ,private Ubigeo_service: Ubigeo_service
              ,private Paciente_service: Paciente_service){/* */
   }

  ngOnInit() {       
    this.ListarTipoDocumento();
    this.ListarUbigeoDepartamento();
    this.goH001_Persona = new H001_Persona();
    this.reload();
  }

  reload(){
    this.goH001_Persona.CodDepartamento = "0";
    this.goH001_Persona.CodProvincia = "0";
    this.goH001_Persona.CodUbigeo = "0";
    this.goH001_Persona.NumDocIdentidad = "";
    this.goH001_Persona.Nombre = "";
    this.goH001_Persona.ApellidoPaterno = "";
    this.goH001_Persona.ApellidoMaterno = "";
    this.goH001_Persona.Sexo = "";
    this.goH001_Persona.FechaNacimiento = new Date();  
    this.fechaNacimiento = new Date(); 
    this.goH001_Persona.Departamento = "";    
    this.goH001_Persona.Provincia = "";    
    this.goH001_Persona.Distrito = "";
    this.goH001_Persona.TelefonoMovil = "";
    this.goH001_Persona.Correo = "";
    this.goH001_Persona.Direccion = "";
  }

  ListarTipoDocumento(){   
    this.H001_TipoDocumento_service.ListarTipoDocumento().subscribe(
      (res: any) => { 
        this.gloH001_TipoDocumento = res.data
        }
        , (err) => {
          throw err;
        }
    )
  }

  SeleccionarTipoDocumento(data: any){
    this.goH001_Persona.IdTipoDocumento = data.idTipoDocumento;
    this.goH001_Persona.TipoDocumento = data.abreviatura;
  }

  InsertarPaciente(){        
    let mensaje : string  = '';    
    if(this.goH001_Persona.CodUbigeo == "0"){
      mensaje = 'Debe seleccionar el distrito';
    }    
    if(this.goH001_Persona.CodProvincia == "0"){
      mensaje = 'Debe seleccionar la provincia';
    }    
    if(this.goH001_Persona.CodDepartamento == "0"){
      mensaje = 'Debe seleccionar el departamento';
    }    
    if(!(this.goH001_Persona.Direccion) || (this.goH001_Persona.Direccion).trim() == ''){
      mensaje = 'Debe colocar la direccion';
    }    
    if(!(this.goH001_Persona.TelefonoMovil) || (this.goH001_Persona.TelefonoMovil).trim() == ''){
      mensaje = 'Debe colocar el número celular';
    }
    if(!(this.goH001_Persona.Correo) || (this.goH001_Persona.Correo).trim() == ''){
      mensaje = 'Debe colocar el correo';
    }
    if(!(this.goH001_Persona.Sexo) || (this.goH001_Persona.Sexo).trim() == ''){
      mensaje = 'Debe seleccionar la sexualidad';
    }
    if(!(this.goH001_Persona.ApellidoMaterno) || (this.goH001_Persona.ApellidoMaterno).trim() == ''){
      mensaje = 'Debe colocar el apellido materno';
    }
    if(!(this.goH001_Persona.ApellidoPaterno) || (this.goH001_Persona.ApellidoPaterno).trim() == ''){
      mensaje = 'Debe colocar el apellido paterno';
    }
    if(!(this.goH001_Persona.Nombre) || (this.goH001_Persona.Nombre).trim() == ''){
      mensaje = 'Debe colocar el nombre';
    }
    if(!(this.goH001_Persona.NumDocIdentidad) || (this.goH001_Persona.NumDocIdentidad).trim() == ''){
      mensaje = 'Debe colocar el numero de documento';
    }
    if(!(this.goH001_Persona.TipoDocumento) || (this.goH001_Persona.TipoDocumento).trim() == ''){
      mensaje = 'Debe seleccionar un tipo de documento';
    }   
    
    if(mensaje.length > 0){
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: mensaje + '!!!'
      })
    }
    else{
      this.goH001_Persona.FechaNacimiento = new Date(this.fechaNacimiento["year"], this.fechaNacimiento["month"], this.fechaNacimiento["day"]); 
      this.goH001_Persona.Departamento = this.gloH001_Departamento.find(x => x.codDepartamento == this.goH001_Persona.CodDepartamento)["departamento"];
      this.goH001_Persona.Provincia = this.gloH001_Provincia.find(x => x.codProvincia == this.goH001_Persona.CodProvincia)["provincia"];
      this.goH001_Persona.Distrito = this.gloH001_Distrito.find(x => x.codUbigeo == this.goH001_Persona.CodUbigeo)["distrito"];

       
      this.Paciente_service.InsertarPaciente(this.goH001_Persona).subscribe(
        (res: any) => { 
            if(res.data == 1){
              Swal.fire(
                'Excelente',
                'El usuario se registro!!!',
                'success'
              )
              this.reload();
            }else if(res.data == 999){
              Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text:  'El usuario ya se encuentra registrado'
              })
            }else{
              Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text:  'Ocurrio un error'
              })
            }
          }
          , (err) => {
            throw err;
          }
      )
    }
  }

  ListarUbigeoDepartamento(){    
    this.Ubigeo_service.ListarDepartamento().subscribe(
      (res: any) => { 
        this.gloH001_Departamento = res.data
        }
        , (err) => {
          throw err;
        }
    )
  }

  ListarUbigeoProvincia(){ 
    if(this.goH001_Persona.CodDepartamento != "0"){
      this.Ubigeo_service.ListarProvincia(this.goH001_Persona.CodDepartamento).subscribe(
        (res: any) => { 
          this.gloH001_Provincia = res.data
          }
          , (err) => {
            throw err;
          }
      )
    }
  }

  ListarUbigeoDistrito(){  
    if(this.goH001_Persona.CodDepartamento != "0" && this.goH001_Persona.CodProvincia != "0"){
      this.Ubigeo_service.ListarDistrito(this.goH001_Persona.CodDepartamento, this.goH001_Persona.CodProvincia).subscribe(
        (res: any) => { 
          this.gloH001_Distrito = res.data
          }
          , (err) => {
            throw err;
          }
      )
    }
  }
}
