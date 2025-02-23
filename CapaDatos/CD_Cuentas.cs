using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaDatos
{
    public class CD_Cuentas
    {
        CD_Conexion db_conexion = new CD_Conexion();

        //Metodo mostrar cuenta
        public DataTable MtMostrarCuentas()
        {
            string QryMostrarCuentas = "exec usp_cuentas_mostrar;";
            SqlDataAdapter adapter = new SqlDataAdapter(QryMostrarCuentas, db_conexion.MtdAbrirConexion());
            DataTable dtMostrarCuentas = new DataTable();
            adapter.Fill(dtMostrarCuentas);
            db_conexion.MtdCerrarConexion();
            return dtMostrarCuentas;
        }

        //Metodo agregar cuenta
        public void MtdAgregarCuentas(int CodigoClie, string NumCuenta, string TipoCuenta, decimal Saldo, DateTime Fecha, string Estado)
        {
            db_conexion.MtdAbrirConexion();
            string Usp_crear = "usp_cuentas_agregar";

            SqlCommand cmd_InsertarCuentas = new SqlCommand(Usp_crear, db_conexion.MtdAbrirConexion());
            cmd_InsertarCuentas.CommandType = CommandType.StoredProcedure;

            cmd_InsertarCuentas.Parameters.AddWithValue("@CodigoCliente", CodigoClie);
            cmd_InsertarCuentas.Parameters.AddWithValue("@NumeroCuenta", NumCuenta);
            cmd_InsertarCuentas.Parameters.AddWithValue("@TipoCuenta", TipoCuenta);
            cmd_InsertarCuentas.Parameters.AddWithValue("@Saldo", Saldo);
            cmd_InsertarCuentas.Parameters.AddWithValue("@FechaApertura", Fecha);
            cmd_InsertarCuentas.Parameters.AddWithValue("@Estado", Estado);

            cmd_InsertarCuentas.ExecuteNonQuery();
        }


        public int ObtenerUltimoCodigoCuenta()
        {
            int ultimoCodigo = 0;

            try
            {
                SqlCommand cmd_UltimoCodigo = new SqlCommand("SELECT TOP 1 CodigoCuenta FROM tbl_Cuentas ORDER BY CodigoCuenta DESC", db_conexion.MtdAbrirConexion());
                SqlDataReader reader = cmd_UltimoCodigo.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    ultimoCodigo = Convert.ToInt32(reader["CodigoCuenta"]);
                }

                reader.Close();
                db_conexion.MtdCerrarConexion();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al obtener el último código de cuenta: " + ex.Message);
            }

            return ultimoCodigo;
        }


    }
}
