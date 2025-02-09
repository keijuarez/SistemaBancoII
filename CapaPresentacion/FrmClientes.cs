using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
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

        /*    
        public void MtdMostrarClientes()
        {
            CD_Clientes cd_clientes = new CD_Clientes();
            DataTable dtClientes = cd_clientes.MtMostrarClientes();
            dgvClientes.DataSource = dtClientes;
        }
        */

        public void MtdMostrarClientes()
        {
            CD_Clientes cd_clientes = new CD_Clientes();
            DataTable dtMostrarClientes = cd_clientes.MtMostrarClientes();
            dgvClientes.DataSource = dtMostrarClientes;
        }

        private void FrmClientes_Load(object sender, EventArgs e)
        {
            MtdMostrarClientes();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}
