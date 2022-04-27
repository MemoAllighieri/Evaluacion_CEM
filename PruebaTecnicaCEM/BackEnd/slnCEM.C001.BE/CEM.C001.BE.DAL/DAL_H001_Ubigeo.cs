using CEM.C001.BE.Interface;
using CEM.C001.BE.Model;
using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CEM.C001.BE.DAL
{
    public class DAL_H001_Ubigeo:I_H001_Ubigeo
    {
        private string database;
        public DAL_H001_Ubigeo(IConfiguration config)
        {
            database = config["Database:CNX"];
        }

        public IEnumerable<H001_Ubigeo> ListarDepartamento(){
            List<H001_Ubigeo> lista = new List<H001_Ubigeo>();
            SqlConnection conexion = new SqlConnection(database);
            try
            {
                conexion.Open();
                SqlCommand nsql = conexion.CreateCommand();

                nsql.CommandText = "USP_ListarDepartamento";
                nsql.CommandType = CommandType.StoredProcedure;

                DataTable tabla = new DataTable();

                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = nsql;

                adapter.Fill(tabla);

                foreach (DataRow registro in tabla.Rows)
                {
                    H001_Ubigeo H001_Ubigeo = new H001_Ubigeo();
                    H001_Ubigeo.CodDepartamento = registro["CodDepartamento"].ToString();
                    H001_Ubigeo.Departamento = registro["Departamento"].ToString();

                    lista.Add(H001_Ubigeo);
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
            return lista;
        }

        public IEnumerable<H001_Ubigeo> ListarProvincia(string psCodDepartamento){
            List<H001_Ubigeo> lista = new List<H001_Ubigeo>();
            SqlConnection conexion = new SqlConnection(database);
            try
            {
                conexion.Open();
                SqlCommand nsql = conexion.CreateCommand();

                nsql.CommandText = "USP_ListarProvincia";
                nsql.CommandType = CommandType.StoredProcedure;

                nsql.Parameters.Add("@CodDepartamento", SqlDbType.VarChar).Value = psCodDepartamento;

                DataTable tabla = new DataTable();

                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = nsql;

                adapter.Fill(tabla);

                foreach (DataRow registro in tabla.Rows)
                {
                    H001_Ubigeo H001_Ubigeo = new H001_Ubigeo();
                    H001_Ubigeo.CodProvincia = registro["CodProvincia"].ToString();
                    H001_Ubigeo.Provincia = registro["Provincia"].ToString();

                    lista.Add(H001_Ubigeo);
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
            return lista;
        }

        public IEnumerable<H001_Ubigeo> ListarDistrito(string psCodDepartamento, string psCodProvincia)
        {
            List<H001_Ubigeo> lista = new List<H001_Ubigeo>();
            SqlConnection conexion = new SqlConnection(database);
            try
            {
                conexion.Open();
                SqlCommand nsql = conexion.CreateCommand();

                nsql.CommandText = "USP_ListarDistrito";
                nsql.CommandType = CommandType.StoredProcedure;

                nsql.Parameters.Add("@CodDepartamento", SqlDbType.VarChar).Value = psCodDepartamento;
                nsql.Parameters.Add("@CodProvincia", SqlDbType.VarChar).Value = psCodProvincia;

                DataTable tabla = new DataTable();

                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = nsql;

                adapter.Fill(tabla);

                foreach (DataRow registro in tabla.Rows)
                {
                    H001_Ubigeo H001_Ubigeo = new H001_Ubigeo();
                    H001_Ubigeo.CodUbigeo = registro["CodUbigeo"].ToString();
                    H001_Ubigeo.Distrito = registro["Distrito"].ToString();

                    lista.Add(H001_Ubigeo);
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
            return lista;
        }
    }
}