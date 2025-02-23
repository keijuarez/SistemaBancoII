using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaDatos
{
    //Metodo Mostrar Clientes
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

        // Metodo Agregar clientes
        public void MtdAgregarClientes( string Nombre, string Direccion, string Departamento, string Pais, string Categoria, string Estado)
        {
        
             db_conexion.MtdAbrirConexion();

            
            string Usp_crear = "usp_clientes_crear";

    
            SqlCommand cmd_InsertarClientes = new SqlCommand(Usp_crear, db_conexion.MtdAbrirConexion());


            cmd_InsertarClientes.CommandType = CommandType.StoredProcedure;


            cmd_InsertarClientes.Parameters.AddWithValue("@Nombre", Nombre);
            cmd_InsertarClientes.Parameters.AddWithValue("@Direccion", Direccion);
            cmd_InsertarClientes.Parameters.AddWithValue("@Departamento", Departamento);
            cmd_InsertarClientes.Parameters.AddWithValue("@Pais", Pais);
            cmd_InsertarClientes.Parameters.AddWithValue("@Categoria", Categoria);
            cmd_InsertarClientes.Parameters.AddWithValue("@Estado", Estado);


            cmd_InsertarClientes.ExecuteNonQuery();

        }

       //Metodo actualizar clientes
        public int MtdActualizarClientes(int Codigo, string Nombre, string Direccion, string Departamento, string Pais, string Categoria, string Estado)
        {
            int vContarRegistrosAfectados = 0;

            db_conexion.MtdAbrirConexion();
            string vUspEditarClientes = "usp_clientes_editar2";
            SqlCommand commEditarClientes = new SqlCommand(vUspEditarClientes, db_conexion.MtdAbrirConexion());
            commEditarClientes.CommandType = CommandType.StoredProcedure;

            commEditarClientes.Parameters.AddWithValue("@Codigo", Codigo);
            commEditarClientes.Parameters.AddWithValue("@Nombre", Nombre);
            commEditarClientes.Parameters.AddWithValue("@Direccion", Direccion);
            commEditarClientes.Parameters.AddWithValue("@Departamento", Departamento);
            commEditarClientes.Parameters.AddWithValue("@Pais", Pais);
            commEditarClientes.Parameters.AddWithValue("@Categoria", Categoria);
            commEditarClientes.Parameters.AddWithValue("@Estado", Estado);

            vContarRegistrosAfectados = commEditarClientes.ExecuteNonQuery();
            return vContarRegistrosAfectados;

        }
    }
}
