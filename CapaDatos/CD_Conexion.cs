using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    internal class CD_Conexion
    {

        private SqlConnection db_conexion = new SqlConnection("Data Source=G3RVAWKP1D8V2GN\\SQLEXPRESS;Initial Catalog=DB_BANCO2;Integrated Security=True;Encrypt=False");

        public SqlConnection MtdAbrirConexion()
        {
            if(db_conexion.State == ConnectionState.Closed)
                db_conexion.Open();
            return db_conexion;
        }

        public SqlConnection MtdCerrarConexion()
        {
            if (db_conexion.State == ConnectionState.Closed)
                db_conexion.Close();
            return db_conexion;
        }
    }
}
