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
    public class CD_Usuarios
    {
        CD_Conexion db_conexion = new CD_Conexion();

        //Metodo mostrar usuarios
        public DataTable MtMostrarUsuarios()
        {
            string QryMostrarUsuarios = "exec usp_usuarios_mostrar;";
            SqlDataAdapter adapter = new SqlDataAdapter(QryMostrarUsuarios, db_conexion.MtdAbrirConexion());
            DataTable dtMostrarUsuarios = new DataTable();
            adapter.Fill(dtMostrarUsuarios);
            db_conexion.MtdCerrarConexion();
            return dtMostrarUsuarios;
        }

        //Metodo agregar Usuarios
        public void MtdAgregaUsuarios(string Usuario, string Clave, string Estado)
        {
            db_conexion.MtdAbrirConexion();
            string Usp_agregar = "usp_usuarios_agregar";

            SqlCommand cmd_InsertarUsuarios= new SqlCommand(Usp_agregar, db_conexion.MtdAbrirConexion());
            cmd_InsertarUsuarios.CommandType = CommandType.StoredProcedure;

            cmd_InsertarUsuarios.Parameters.AddWithValue("@Usuario", Usuario);
            cmd_InsertarUsuarios.Parameters.AddWithValue("@Clave", Clave);
            cmd_InsertarUsuarios.Parameters.AddWithValue("@Estado", Estado);

            cmd_InsertarUsuarios.ExecuteNonQuery();
        }


        //Metodo actualizar Usuarios
        public int MtdActualizarUsuarios(int Correlativo, string Usuario, string Clave, string Estado)
        {
            int vContarRegistrosAfectados = 0;

            db_conexion.MtdAbrirConexion();
            string vUspActualizarUsuarios = "usp_usuarios_actualizar";
            SqlCommand commActualizarUsuarios = new SqlCommand(vUspActualizarUsuarios, db_conexion.MtdAbrirConexion());
            commActualizarUsuarios.CommandType = CommandType.StoredProcedure;

            commActualizarUsuarios.Parameters.AddWithValue("@Correlativo", Correlativo);
            commActualizarUsuarios.Parameters.AddWithValue("@Usuario", Usuario);
            commActualizarUsuarios.Parameters.AddWithValue("@Clave", Clave);
            commActualizarUsuarios.Parameters.AddWithValue("@Estado", Estado);

            vContarRegistrosAfectados = commActualizarUsuarios.ExecuteNonQuery();
            return vContarRegistrosAfectados;
        }

        //Eliminar usuarios
        public int MtdEliminarUsuarios(int Correlativo)
        {
            int vCantidadRegistrosEliminados = 0;
            try
            {
                db_conexion.MtdAbrirConexion();
                string vUspEliminarUsuarios = "usp_usuarios_delete";
                SqlCommand commEliminarUsuarios = new SqlCommand(vUspEliminarUsuarios, db_conexion.MtdAbrirConexion());
                commEliminarUsuarios.CommandType = CommandType.StoredProcedure;

                commEliminarUsuarios.Parameters.AddWithValue("@Correlativo", Correlativo);

                object resultado = commEliminarUsuarios.ExecuteScalar();

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
        public int ObtenerUltimoCodigoUsuario()
        {
            int ultimoCodigo = 0;

            try
            {
                SqlCommand cmd_UltimoCodigo = new SqlCommand("SELECT TOP 1 Correlativo FROM tbl_usuarios ORDER BY Correlativo DESC", db_conexion.MtdAbrirConexion());
                SqlDataReader reader = cmd_UltimoCodigo.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    ultimoCodigo = Convert.ToInt32(reader["Correlativo"]);
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
