using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaDatos;

namespace CapaPresentacion
{
    public partial class FrmUsusarios : Form
    {
        public FrmUsusarios()
        {
            InitializeComponent();
        }

        public void MtdMostrarUsuarios()
        {
            CD_Usuarios cd_usuarios = new CD_Usuarios();
            DataTable dtMostrarUsuarios = cd_usuarios.MtMostrarUsuarios();
            dgvUsuarios.DataSource = dtMostrarUsuarios;
            dgvUsuarios.Refresh();
        }

        private void FrmUsuarios_Load(object sender, EventArgs e)
        {
            MtdMostrarUsuarios();

            CD_Usuarios cD_Usuarios = new CD_Usuarios();

            int ultimoCodigo = cD_Usuarios.ObtenerUltimoCodigoUsuario();
            int nuevoCodigo = ultimoCodigo + 1;
            txtCorrelativo.Text = nuevoCodigo.ToString();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            CD_Usuarios cD_Usuarios = new CD_Usuarios();

            try
            {
                string Usuario = txtUsuario.Text;
                string Clave = txtClave.Text;
                string estado = cboxEstado.Text;

                cD_Usuarios.MtdAgregaUsuarios(Usuario, Clave, estado);

                MessageBox.Show("Usuario agregado con éxito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);
                MtdMostrarUsuarios();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dgvUsuarios_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtCorrelativo.Text = dgvUsuarios.SelectedCells[0].Value.ToString();
            txtUsuario.Text = dgvUsuarios.SelectedCells[1].Value.ToString();
            txtClave.Text = dgvUsuarios.SelectedCells[2].Value.ToString();
            cboxEstado.Text = dgvUsuarios.SelectedCells[3].Value.ToString();
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                CD_Usuarios cD_Usuarios = new CD_Usuarios();

                //cD_Clientes.MtdActualizarClientes(int.Parse(txtCodigoCliente.Text), txtNombres.Text, txtDireccion.Text, txtDepartamento.Text, txtPais.Text, cboxCategoria.Text, cboxEstado.Text);
                int vCantidadRegistros = cD_Usuarios.MtdActualizarUsuarios(int.Parse(txtCorrelativo.Text), txtUsuario.Text, txtClave.Text, cboxEstado.Text);
               
                if (vCantidadRegistros > 0)
                {
                    MessageBox.Show("Registros Actualizados!!", "Correcto!!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    MtdMostrarUsuarios();
                }
                else
                {
                    MessageBox.Show("No se actualizaron registros. Verifica los datos.", "Actualización", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Excepción", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            CD_Usuarios cD_Usuarios = new CD_Usuarios();

            int ultimoCodigo = cD_Usuarios.ObtenerUltimoCodigoUsuario();
            int nuevoCodigo = ultimoCodigo + 1;
            txtCorrelativo.Text = nuevoCodigo.ToString();
            txtUsuario.Clear();
            txtClave.Clear();
            cboxEstado.SelectedIndex = -1;
            txtCorrelativo.Focus();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                CD_Usuarios cD_Usuarios = new CD_Usuarios();

                int Correlativo = Convert.ToInt32(txtCorrelativo.Text);

                int vCantidadRegistros = cD_Usuarios.MtdEliminarUsuarios(Correlativo);

                if (vCantidadRegistros > 0)
                {
                    MessageBox.Show("Registros Eliminado!!", "Correcto!!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    MtdMostrarUsuarios();
                }
                else
                {
                    MessageBox.Show("No se encontró codigo!!", "Error eliminacion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Excepción", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
