using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Clientes
    {
    
        CD_Conexion db_conexion = new CD_Conexion();

        public DataTable MtMostrarClientes()
        {
            string QryMostrarClientes = "exec usp_clientes_mostrar;";
            SqlDataAdapter adapter = new SqlDataAdapter(QryMostrarClientes, db_conexion.MtdAbrirConexion());
            DataTable dtMostrarClientes = new DataTable();
            adapter.Fill(dtMostrarClientes);
            db_conexion.MtdCerrarConexion();
            return dtMostrarClientes;
        }

        // Capa datos
        public void MtdAgregarClientes( string Nombre, string Direccion, string Departamento, string Pais, string Categoria, string Estado)
        {
           // Abrir la conexión
             db_conexion.MtdAbrirConexion();

            // Definir el procedimiento almacenado
            string Usp_crear = "usp_clientes_crear";

            // Crear el comando para ejecutar el procedimiento almacenado
            SqlCommand cmd_InsertarClientes = new SqlCommand(Usp_crear, db_conexion.MtdAbrirConexion());

            // Especificar que el comando es de tipo Procedimiento Almacenado
            cmd_InsertarClientes.CommandType = CommandType.StoredProcedure;

            // Añadir los parámetros para el procedimiento almacenado
            cmd_InsertarClientes.Parameters.AddWithValue("@Nombre", Nombre);
            cmd_InsertarClientes.Parameters.AddWithValue("@Direccion", Direccion);
            cmd_InsertarClientes.Parameters.AddWithValue("@Departamento", Departamento);
            cmd_InsertarClientes.Parameters.AddWithValue("@Pais", Pais);
            cmd_InsertarClientes.Parameters.AddWithValue("@Categoria", Categoria);
            cmd_InsertarClientes.Parameters.AddWithValue("@Estado", Estado);

            // Ejecutar el procedimiento almacenado
            cmd_InsertarClientes.ExecuteNonQuery();

        }
    }
}
