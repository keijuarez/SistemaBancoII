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
    public partial class FrmClientes : Form
    {
        public FrmClientes()
        {
            InitializeComponent();
        }


        public void MtdMostrarClientes()
        {
            CD_Clientes cd_clientes = new CD_Clientes();
            DataTable dtMostrarClientes = cd_clientes.MtMostrarClientes();
            dgvClientes.DataSource = dtMostrarClientes;
            dgvClientes.Refresh();
        }

        private void FrmClientes_Load(object sender, EventArgs e)
        {
            MtdMostrarClientes();
        }


        private void btnGuardar_Click(object sender, EventArgs e)
        {
            CD_Clientes cD_Clientes = new CD_Clientes();

            try
            {
                cD_Clientes.MtdAgregarClientes(txtNombres.Text, txtDireccion.Text, txtDepartamento.Text, txtPais.Text, cboxCategoria.Text, cboxEstado.Text);

                MessageBox.Show("El cliente se agregó con éxito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);
                MtdMostrarClientes();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }   
        }

        private void dgvClientes_CellClick(object sender, DataGridViewCellEventArgs e)
        {
                txtCodigoCliente.Text = dgvClientes.SelectedCells[0].Value.ToString();
                txtNombres.Text = dgvClientes.SelectedCells[1].Value.ToString();
                txtPais.Text = dgvClientes.SelectedCells[4].Value.ToString();
                txtDepartamento.Text = dgvClientes.SelectedCells[3].Value.ToString();
                txtDireccion.Text = dgvClientes.SelectedCells[2].Value.ToString();
                cboxCategoria.Text = dgvClientes.SelectedCells[5].Value.ToString();
                cboxEstado.Text = dgvClientes.SelectedCells[6].Value.ToString();
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                CD_Clientes cD_Clientes = new CD_Clientes();

                int Codigo = Convert.ToInt32(txtCodigoCliente.Text);
                string Nombre = txtNombres.Text;
                string Pais = txtPais.Text;
                string Departamento = txtDepartamento.Text;
                string Direccion = txtDireccion.Text;
                string Categoria = cboxCategoria.Text;
                string Estado = cboxEstado.Text;

                int vCantidadRegistros = cD_Clientes.MtdActualizarClientes(Codigo, Nombre, Pais, Departamento, Direccion, Categoria, Estado);

                if (vCantidadRegistros > 0)
                {
                    MessageBox.Show("Registros Actualizados!!", "Correcto!!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    MtdMostrarClientes();
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
            try
            {
                CD_Clientes cD_Clientes = new CD_Clientes();

                int Codigo = Convert.ToInt32(txtCodigoCliente.Text);

                int vCantidadRegistros = cD_Clientes.MtdEliminarClientes(Codigo);

                if (vCantidadRegistros > 0)
                {
                    MessageBox.Show("Registros Eliminado!!", "Correcto!!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    MtdMostrarClientes();
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
