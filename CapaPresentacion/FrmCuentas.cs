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
    public partial class FrmCuentas : Form
    {
        public FrmCuentas()
        {
            InitializeComponent();
        }

        public void MtdMostrarCuentas()
        {
            CD_Cuentas cd_cuentas = new CD_Cuentas();
            DataTable dtMostrarCuentas = cd_cuentas.MtMostrarCuentas();
            dgvCuentas.DataSource = dtMostrarCuentas;
            dgvCuentas.Refresh();
        }

        private void FrmCuentas_Load(object sender, EventArgs e)
        {
            MtdMostrarCuentas();

            CD_Cuentas cD_Cuentas = new CD_Cuentas();

            int ultimoCodigo = cD_Cuentas.ObtenerUltimoCodigoCuenta();
            int nuevoCodigo = ultimoCodigo + 1;
            txtCodigoCuenta.Text = nuevoCodigo.ToString();
            txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            CD_Cuentas cD_Clientes = new CD_Cuentas();

            try
            {
                int codigoCliente = int.Parse(txtCodigoCliente.Text); 
                string numeroCuenta = txtNumeroCuenta.Text;
                string tipoCuenta = cboxTipoCuenta.Text;
                decimal saldo = decimal.Parse(txtSaldo.Text); 
                DateTime fecha = DateTime.Parse(txtFecha.Text); 
                string estado = cboxEstado.Text;

                cD_Clientes.MtdAgregarCuentas(codigoCliente, numeroCuenta, tipoCuenta, saldo, fecha, estado);

                MessageBox.Show("Cuenta agregada con éxito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);
                MtdMostrarCuentas();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dgvCuentas_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtCodigoCuenta.Text = dgvCuentas.SelectedCells[0].Value.ToString();
            txtCodigoCliente.Text = dgvCuentas.SelectedCells[1].Value.ToString();
            txtNumeroCuenta.Text = dgvCuentas.SelectedCells[2].Value.ToString();
            cboxTipoCuenta.Text = dgvCuentas.SelectedCells[3].Value.ToString();
            txtSaldo.Text = dgvCuentas.SelectedCells[4].Value.ToString();
            txtFecha.Text = dgvCuentas.SelectedCells[5].Value.ToString();
            cboxEstado.Text = dgvCuentas.SelectedCells[6].Value.ToString();
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                CD_Cuentas cD_Cuentas = new CD_Cuentas();

                //cD_Clientes.MtdActualizarClientes(int.Parse(txtCodigoCliente.Text), txtNombres.Text, txtDireccion.Text, txtDepartamento.Text, txtPais.Text, cboxCategoria.Text, cboxEstado.Text);
                int vCantidadRegistros = cD_Cuentas.MtdActualizarCuentas(int.Parse(txtCodigoCuenta.Text), int.Parse(txtCodigoCliente.Text),  txtNumeroCuenta.Text, cboxTipoCuenta.Text, Decimal.Parse(txtSaldo.Text), DateTime.Parse(txtFecha.Text), cboxEstado.Text);
               
                if (vCantidadRegistros > 0)
                {
                    MessageBox.Show("Registros Actualizados!!", "Correcto!!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    MtdMostrarCuentas();
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
            CD_Cuentas cD_Cuentas = new CD_Cuentas();

            int ultimoCodigo = cD_Cuentas.ObtenerUltimoCodigoCuenta();
            int nuevoCodigo = ultimoCodigo + 1;
            txtCodigoCuenta.Text = nuevoCodigo.ToString();
            txtCodigoCliente.Clear();
            txtNumeroCuenta.Clear();
            cboxTipoCuenta.SelectedIndex = -1;
            txtSaldo.Clear();
            txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
            cboxEstado.SelectedIndex = -1;
            txtCodigoCuenta.Focus();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                CD_Cuentas cD_Cuentas = new CD_Cuentas();

                int Codigo = Convert.ToInt32(txtCodigoCuenta.Text);

                int vCantidadRegistros = cD_Cuentas.MtdEliminarCuentas(Codigo);

                if (vCantidadRegistros > 0)
                {
                    MessageBox.Show("Registros Eliminado!!", "Correcto!!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    MtdMostrarCuentas();
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
