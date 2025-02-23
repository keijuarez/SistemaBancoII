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
    }
}
