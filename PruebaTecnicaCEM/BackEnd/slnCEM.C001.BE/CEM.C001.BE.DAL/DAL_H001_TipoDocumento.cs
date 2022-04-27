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
    public class DAL_H001_TipoDocumento: I_H001_TipoDocumento
    {
        private string database;
        public DAL_H001_TipoDocumento(IConfiguration config)
        {
            database = config["Database:CNX"];
        }

        public IEnumerable<H001_TipoDocumento> ListarTipoDocumento(){
            List<H001_TipoDocumento> lista = new List<H001_TipoDocumento>();
            SqlConnection conexion = new SqlConnection(database);            
            try
            {
                conexion.Open();
                SqlCommand nsql = conexion.CreateCommand();

                nsql.CommandText = "USP_ListarTipoDocumento";
                nsql.CommandType = CommandType.StoredProcedure;

                DataTable tabla = new DataTable();

                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = nsql;

                adapter.Fill(tabla);

                foreach (DataRow registro in tabla.Rows)
                {
                    H001_TipoDocumento H001_TipoDocumento = new H001_TipoDocumento();
                    H001_TipoDocumento.IdTipoDocumento = int.Parse(registro["IdTipoDocumento"].ToString());
                    H001_TipoDocumento.TipoDocumento = registro["TipoDocumento"].ToString();
                    H001_TipoDocumento.Abreviatura = registro["Abreviatura"].ToString();
                    H001_TipoDocumento.EstadoRegistro = bool.Parse(registro["EstadoRegistro"].ToString());
                    H001_TipoDocumento.MaxNumDigito = int.Parse(registro["MaxNumDigito"].ToString());

                    lista.Add(H001_TipoDocumento);
                }
            }
            catch (Exception ex){                
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