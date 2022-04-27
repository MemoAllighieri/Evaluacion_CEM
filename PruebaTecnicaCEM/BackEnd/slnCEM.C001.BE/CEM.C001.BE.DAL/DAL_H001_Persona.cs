using CEM.C001.BE.Interface;
using CEM.C001.BE.Model;

using Microsoft.Extensions.Configuration;
using System;
using System.Data;
using System.Data.SqlClient;

namespace CEM.C001.BE.DAL{
    public class DAL_H001_Persona : I_H001_Persona
    {
        private string database;

        public DAL_H001_Persona(IConfiguration config)
        {
            database = config["Database:CNX"];
        }


        public int InsertarPersona(H001_Persona poH001_Persona)
        {
            int res = 0;
            SqlConnection conexion = new SqlConnection(database);
            try
            {
                conexion.Open();
                SqlCommand nsql = conexion.CreateCommand();

                nsql.CommandText = "USP_InsertarPaciente";
                nsql.CommandType = CommandType.StoredProcedure;

                nsql.Parameters.Add("@IdTipoDocumento", SqlDbType.Int).Value = poH001_Persona.IdTipoDocumento;
                nsql.Parameters.Add("@NumDocIdentidad", SqlDbType.Char).Value = poH001_Persona.NumDocIdentidad;
                nsql.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = poH001_Persona.Nombre;
                nsql.Parameters.Add("@ApellidoPaterno", SqlDbType.VarChar).Value = poH001_Persona.ApellidoPaterno;
                nsql.Parameters.Add("@ApellidoMaterno", SqlDbType.VarChar).Value = poH001_Persona.ApellidoMaterno;
                nsql.Parameters.Add("@Sexo", SqlDbType.Char).Value = poH001_Persona.Sexo;
                nsql.Parameters.Add("@FechaNacimiento", SqlDbType.Date).Value = poH001_Persona.FechaNacimiento;
                nsql.Parameters.Add("@Direccion", SqlDbType.VarChar).Value = poH001_Persona.Direccion;
                nsql.Parameters.Add("@CodDepartamento", SqlDbType.Char).Value = poH001_Persona.CodDepartamento;
                nsql.Parameters.Add("@Departamento", SqlDbType.VarChar).Value = poH001_Persona.Departamento;
                nsql.Parameters.Add("@CodProvincia", SqlDbType.Char).Value = poH001_Persona.CodProvincia;
                nsql.Parameters.Add("@Provincia", SqlDbType.VarChar).Value = poH001_Persona.Provincia;
                nsql.Parameters.Add("@CodUbigeo", SqlDbType.Char).Value = poH001_Persona.CodUbigeo;
                nsql.Parameters.Add("@Distrito", SqlDbType.VarChar).Value = poH001_Persona.Distrito;
                nsql.Parameters.Add("@TelefonoMovil", SqlDbType.Char).Value = poH001_Persona.TelefonoMovil;
                nsql.Parameters.Add("@Correo", SqlDbType.VarChar).Value = poH001_Persona.Correo;
                nsql.Parameters.Add("@CodUsuario", SqlDbType.VarChar).Value = "ADMIN01";
                nsql.Parameters.Add("@CodUsuCreaRegistro", SqlDbType.VarChar).Value = "ADMIN01";

                SqlDataReader reader = nsql.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    res = reader.GetInt32(0);
                }
                else
                {
                    res = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return res;
        }
    }
}