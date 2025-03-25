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
            string Usp_crear = "usp_cuentas_crear";

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

        //Metodo actualizar cuentas
        public int MtdActualizarCuentas(int CodigoCuenta, int CodigoCliente, string NumCuenta, string TipoCuenta, decimal Saldo, DateTime Fecha, string Estado)
        {
            int vContarRegistrosAfectados = 0;

            db_conexion.MtdAbrirConexion();
            string vUspEditarCuentas = "usp_cuentas_modificar";
            SqlCommand commEditarCuentas = new SqlCommand(vUspEditarCuentas, db_conexion.MtdAbrirConexion());
            commEditarCuentas.CommandType = CommandType.StoredProcedure;

            commEditarCuentas.Parameters.AddWithValue("@CodigoCuenta", CodigoCuenta);
            commEditarCuentas.Parameters.AddWithValue("@CodigoCliente", CodigoCliente);
            commEditarCuentas.Parameters.AddWithValue("@NumeroCuenta", NumCuenta);
            commEditarCuentas.Parameters.AddWithValue("@TipoCuenta", TipoCuenta);
            commEditarCuentas.Parameters.AddWithValue("@Saldo", Saldo);
            commEditarCuentas.Parameters.AddWithValue("@FechaApertura", Fecha);
            commEditarCuentas.Parameters.AddWithValue("@Estado", Estado);

            vContarRegistrosAfectados = commEditarCuentas.ExecuteNonQuery();
            return vContarRegistrosAfectados;
        }


        public int MtdEliminarCuentas(int Codigo)
        {
            int vCantidadRegistrosEliminados = 0;
            try
            {
                db_conexion.MtdAbrirConexion();
                string vUspEliminarCuentas = "usp_cuentas_eliminar";
                SqlCommand commEliminarCuentas = new SqlCommand(vUspEliminarCuentas, db_conexion.MtdAbrirConexion());
                commEliminarCuentas.CommandType = CommandType.StoredProcedure;

                commEliminarCuentas.Parameters.AddWithValue("@CodigoCuenta", Codigo);

                object resultado = commEliminarCuentas.ExecuteScalar();

                if (resultado != null && int.TryParse(resultado.ToString(), out int cantidad))
                {
                    vCantidadRegistrosEliminados = cantidad;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Excepción", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                db_conexion.MtdCerrarConexion();
            }
            return vCantidadRegistrosEliminados;
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
