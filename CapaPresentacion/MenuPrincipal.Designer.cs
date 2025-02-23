namespace CapaPresentacion
{
    partial class FrmMenuPrincipal
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.PanelMenu = new System.Windows.Forms.Panel();
            this.PanelSeleccion = new System.Windows.Forms.Panel();
            this.btnReportes = new FontAwesome.Sharp.IconButton();
            this.btnVentas = new FontAwesome.Sharp.IconButton();
            this.btnInventarios = new FontAwesome.Sharp.IconButton();
            this.btnProductos = new FontAwesome.Sharp.IconButton();
            this.btnCategorias = new FontAwesome.Sharp.IconButton();
            this.btnCuentas = new FontAwesome.Sharp.IconButton();
            this.btnClientes = new FontAwesome.Sharp.IconButton();
            this.PanelMenuInferior = new System.Windows.Forms.Panel();
            this.btnConfiguracion = new FontAwesome.Sharp.IconButton();
            this.PanelMenuSuperior = new System.Windows.Forms.Panel();
            this.PanelSuperior = new System.Windows.Forms.Panel();
            this.btnUsuario = new FontAwesome.Sharp.IconButton();
            this.btnInicio = new FontAwesome.Sharp.IconButton();
            this.btnOcultarMenu = new FontAwesome.Sharp.IconButton();
            this.PanelContenedor = new System.Windows.Forms.Panel();
            this.lblMensajeMenu = new System.Windows.Forms.Label();
            this.PanelMenu.SuspendLayout();
            this.PanelMenuInferior.SuspendLayout();
            this.PanelSuperior.SuspendLayout();
            this.PanelContenedor.SuspendLayout();
            this.SuspendLayout();
            // 
            // PanelMenu
            // 
            this.PanelMenu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(18)))), ((int)(((byte)(34)))), ((int)(((byte)(118)))));
            this.PanelMenu.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.PanelMenu.Controls.Add(this.PanelSeleccion);
            this.PanelMenu.Controls.Add(this.btnReportes);
            this.PanelMenu.Controls.Add(this.btnVentas);
            this.PanelMenu.Controls.Add(this.btnInventarios);
            this.PanelMenu.Controls.Add(this.btnProductos);
            this.PanelMenu.Controls.Add(this.btnCategorias);
            this.PanelMenu.Controls.Add(this.btnCuentas);
            this.PanelMenu.Controls.Add(this.btnClientes);
            this.PanelMenu.Controls.Add(this.PanelMenuInferior);
            this.PanelMenu.Controls.Add(this.PanelMenuSuperior);
            this.PanelMenu.Dock = System.Windows.Forms.DockStyle.Left;
            this.PanelMenu.Location = new System.Drawing.Point(0, 0);
            this.PanelMenu.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.PanelMenu.Name = "PanelMenu";
            this.PanelMenu.Size = new System.Drawing.Size(150, 576);
            this.PanelMenu.TabIndex = 0;
            // 
            // PanelSeleccion
            // 
            this.PanelSeleccion.BackColor = System.Drawing.Color.White;
            this.PanelSeleccion.Location = new System.Drawing.Point(1, 107);
            this.PanelSeleccion.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.PanelSeleccion.Name = "PanelSeleccion";
            this.PanelSeleccion.Size = new System.Drawing.Size(4, 37);
            this.PanelSeleccion.TabIndex = 9;
            // 
            // btnReportes
            // 
            this.btnReportes.FlatAppearance.BorderSize = 0;
            this.btnReportes.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnReportes.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReportes.ForeColor = System.Drawing.Color.White;
            this.btnReportes.IconChar = FontAwesome.Sharp.IconChar.UserGroup;
            this.btnReportes.IconColor = System.Drawing.Color.White;
            this.btnReportes.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnReportes.IconSize = 35;
            this.btnReportes.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnReportes.Location = new System.Drawing.Point(2, 375);
            this.btnReportes.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnReportes.Name = "btnReportes";
            this.btnReportes.Size = new System.Drawing.Size(146, 41);
            this.btnReportes.TabIndex = 8;
            this.btnReportes.Text = "usuarios";
            this.btnReportes.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnReportes.UseVisualStyleBackColor = true;
            // 
            // btnVentas
            // 
            this.btnVentas.FlatAppearance.BorderSize = 0;
            this.btnVentas.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVentas.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnVentas.ForeColor = System.Drawing.Color.White;
            this.btnVentas.IconChar = FontAwesome.Sharp.IconChar.CreditCardAlt;
            this.btnVentas.IconColor = System.Drawing.Color.White;
            this.btnVentas.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnVentas.IconSize = 35;
            this.btnVentas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnVentas.Location = new System.Drawing.Point(2, 330);
            this.btnVentas.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnVentas.Name = "btnVentas";
            this.btnVentas.Size = new System.Drawing.Size(146, 41);
            this.btnVentas.TabIndex = 7;
            this.btnVentas.Text = "Tarjetas";
            this.btnVentas.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnVentas.UseVisualStyleBackColor = true;
            // 
            // btnInventarios
            // 
            this.btnInventarios.FlatAppearance.BorderSize = 0;
            this.btnInventarios.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInventarios.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInventarios.ForeColor = System.Drawing.Color.White;
            this.btnInventarios.IconChar = FontAwesome.Sharp.IconChar.MoneyBillAlt;
            this.btnInventarios.IconColor = System.Drawing.Color.White;
            this.btnInventarios.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnInventarios.IconSize = 35;
            this.btnInventarios.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnInventarios.Location = new System.Drawing.Point(2, 285);
            this.btnInventarios.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnInventarios.Name = "btnInventarios";
            this.btnInventarios.Size = new System.Drawing.Size(146, 41);
            this.btnInventarios.TabIndex = 6;
            this.btnInventarios.Text = "Prestamos";
            this.btnInventarios.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnInventarios.UseVisualStyleBackColor = true;
            // 
            // btnProductos
            // 
            this.btnProductos.FlatAppearance.BorderSize = 0;
            this.btnProductos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnProductos.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnProductos.ForeColor = System.Drawing.Color.White;
            this.btnProductos.IconChar = FontAwesome.Sharp.IconChar.MoneyBill1Wave;
            this.btnProductos.IconColor = System.Drawing.Color.White;
            this.btnProductos.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnProductos.IconSize = 35;
            this.btnProductos.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnProductos.Location = new System.Drawing.Point(2, 240);
            this.btnProductos.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnProductos.Name = "btnProductos";
            this.btnProductos.Size = new System.Drawing.Size(146, 41);
            this.btnProductos.TabIndex = 5;
            this.btnProductos.Text = "Pagos";
            this.btnProductos.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnProductos.UseVisualStyleBackColor = true;
            // 
            // btnCategorias
            // 
            this.btnCategorias.FlatAppearance.BorderSize = 0;
            this.btnCategorias.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCategorias.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCategorias.ForeColor = System.Drawing.Color.White;
            this.btnCategorias.IconChar = FontAwesome.Sharp.IconChar.FileInvoiceDollar;
            this.btnCategorias.IconColor = System.Drawing.Color.White;
            this.btnCategorias.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnCategorias.IconSize = 35;
            this.btnCategorias.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCategorias.Location = new System.Drawing.Point(2, 196);
            this.btnCategorias.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnCategorias.Name = "btnCategorias";
            this.btnCategorias.Size = new System.Drawing.Size(146, 41);
            this.btnCategorias.TabIndex = 4;
            this.btnCategorias.Text = "Movimientos";
            this.btnCategorias.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnCategorias.UseVisualStyleBackColor = true;
            // 
            // btnCuentas
            // 
            this.btnCuentas.FlatAppearance.BorderSize = 0;
            this.btnCuentas.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCuentas.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCuentas.ForeColor = System.Drawing.Color.White;
            this.btnCuentas.IconChar = FontAwesome.Sharp.IconChar.CashRegister;
            this.btnCuentas.IconColor = System.Drawing.Color.White;
            this.btnCuentas.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnCuentas.IconSize = 35;
            this.btnCuentas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCuentas.Location = new System.Drawing.Point(2, 151);
            this.btnCuentas.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnCuentas.Name = "btnCuentas";
            this.btnCuentas.Size = new System.Drawing.Size(146, 41);
            this.btnCuentas.TabIndex = 3;
            this.btnCuentas.Text = "Cuentas";
            this.btnCuentas.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnCuentas.UseVisualStyleBackColor = true;
            this.btnCuentas.Click += new System.EventHandler(this.btnCuentas_Click);
            // 
            // btnClientes
            // 
            this.btnClientes.FlatAppearance.BorderSize = 0;
            this.btnClientes.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClientes.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClientes.ForeColor = System.Drawing.Color.White;
            this.btnClientes.IconChar = FontAwesome.Sharp.IconChar.AddressCard;
            this.btnClientes.IconColor = System.Drawing.Color.White;
            this.btnClientes.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnClientes.IconSize = 35;
            this.btnClientes.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnClientes.Location = new System.Drawing.Point(2, 106);
            this.btnClientes.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnClientes.Name = "btnClientes";
            this.btnClientes.Size = new System.Drawing.Size(146, 41);
            this.btnClientes.TabIndex = 2;
            this.btnClientes.Text = "Clientes";
            this.btnClientes.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnClientes.UseVisualStyleBackColor = true;
            this.btnClientes.Click += new System.EventHandler(this.btnClientes_Click);
            // 
            // PanelMenuInferior
            // 
            this.PanelMenuInferior.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.PanelMenuInferior.Controls.Add(this.btnConfiguracion);
            this.PanelMenuInferior.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.PanelMenuInferior.Location = new System.Drawing.Point(0, 483);
            this.PanelMenuInferior.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.PanelMenuInferior.Name = "PanelMenuInferior";
            this.PanelMenuInferior.Size = new System.Drawing.Size(148, 91);
            this.PanelMenuInferior.TabIndex = 1;
            // 
            // btnConfiguracion
            // 
            this.btnConfiguracion.FlatAppearance.BorderSize = 0;
            this.btnConfiguracion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnConfiguracion.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnConfiguracion.ForeColor = System.Drawing.Color.White;
            this.btnConfiguracion.IconChar = FontAwesome.Sharp.IconChar.ScrewdriverWrench;
            this.btnConfiguracion.IconColor = System.Drawing.Color.White;
            this.btnConfiguracion.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnConfiguracion.IconSize = 35;
            this.btnConfiguracion.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnConfiguracion.Location = new System.Drawing.Point(1, 2);
            this.btnConfiguracion.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnConfiguracion.Name = "btnConfiguracion";
            this.btnConfiguracion.Size = new System.Drawing.Size(146, 88);
            this.btnConfiguracion.TabIndex = 9;
            this.btnConfiguracion.Text = "Configuración";
            this.btnConfiguracion.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnConfiguracion.UseVisualStyleBackColor = true;
            // 
            // PanelMenuSuperior
            // 
            this.PanelMenuSuperior.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.PanelMenuSuperior.Dock = System.Windows.Forms.DockStyle.Top;
            this.PanelMenuSuperior.Location = new System.Drawing.Point(0, 0);
            this.PanelMenuSuperior.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.PanelMenuSuperior.Name = "PanelMenuSuperior";
            this.PanelMenuSuperior.Size = new System.Drawing.Size(148, 79);
            this.PanelMenuSuperior.TabIndex = 0;
            // 
            // PanelSuperior
            // 
            this.PanelSuperior.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(18)))), ((int)(((byte)(34)))), ((int)(((byte)(118)))));
            this.PanelSuperior.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.PanelSuperior.Controls.Add(this.btnUsuario);
            this.PanelSuperior.Controls.Add(this.btnInicio);
            this.PanelSuperior.Controls.Add(this.btnOcultarMenu);
            this.PanelSuperior.Dock = System.Windows.Forms.DockStyle.Top;
            this.PanelSuperior.Location = new System.Drawing.Point(150, 0);
            this.PanelSuperior.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.PanelSuperior.Name = "PanelSuperior";
            this.PanelSuperior.Size = new System.Drawing.Size(893, 36);
            this.PanelSuperior.TabIndex = 1;
            // 
            // btnUsuario
            // 
            this.btnUsuario.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnUsuario.FlatAppearance.BorderSize = 0;
            this.btnUsuario.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUsuario.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUsuario.ForeColor = System.Drawing.Color.White;
            this.btnUsuario.IconChar = FontAwesome.Sharp.IconChar.User;
            this.btnUsuario.IconColor = System.Drawing.Color.White;
            this.btnUsuario.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnUsuario.IconSize = 30;
            this.btnUsuario.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnUsuario.Location = new System.Drawing.Point(811, 0);
            this.btnUsuario.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnUsuario.Name = "btnUsuario";
            this.btnUsuario.Size = new System.Drawing.Size(39, 32);
            this.btnUsuario.TabIndex = 13;
            this.btnUsuario.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnUsuario.UseVisualStyleBackColor = true;
            // 
            // btnInicio
            // 
            this.btnInicio.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnInicio.FlatAppearance.BorderSize = 0;
            this.btnInicio.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInicio.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInicio.ForeColor = System.Drawing.Color.White;
            this.btnInicio.IconChar = FontAwesome.Sharp.IconChar.HomeLg;
            this.btnInicio.IconColor = System.Drawing.Color.White;
            this.btnInicio.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnInicio.IconSize = 30;
            this.btnInicio.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnInicio.Location = new System.Drawing.Point(850, 0);
            this.btnInicio.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnInicio.Name = "btnInicio";
            this.btnInicio.Size = new System.Drawing.Size(39, 32);
            this.btnInicio.TabIndex = 12;
            this.btnInicio.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnInicio.UseVisualStyleBackColor = true;

            // 
            // btnOcultarMenu
            // 
            this.btnOcultarMenu.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnOcultarMenu.FlatAppearance.BorderSize = 0;
            this.btnOcultarMenu.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnOcultarMenu.Font = new System.Drawing.Font("Calisto MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOcultarMenu.ForeColor = System.Drawing.Color.White;
            this.btnOcultarMenu.IconChar = FontAwesome.Sharp.IconChar.Navicon;
            this.btnOcultarMenu.IconColor = System.Drawing.Color.White;
            this.btnOcultarMenu.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnOcultarMenu.IconSize = 30;
            this.btnOcultarMenu.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnOcultarMenu.Location = new System.Drawing.Point(0, 0);
            this.btnOcultarMenu.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnOcultarMenu.Name = "btnOcultarMenu";
            this.btnOcultarMenu.Size = new System.Drawing.Size(39, 32);
            this.btnOcultarMenu.TabIndex = 11;
            this.btnOcultarMenu.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnOcultarMenu.UseVisualStyleBackColor = true;
            this.btnOcultarMenu.Click += new System.EventHandler(this.btnOcultarMenu_Click);
            // 
            // PanelContenedor
            // 
            this.PanelContenedor.Controls.Add(this.lblMensajeMenu);
            this.PanelContenedor.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PanelContenedor.Location = new System.Drawing.Point(150, 36);
            this.PanelContenedor.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.PanelContenedor.Name = "PanelContenedor";
            this.PanelContenedor.Size = new System.Drawing.Size(893, 540);
            this.PanelContenedor.TabIndex = 3;
            // 
            // lblMensajeMenu
            // 
            this.lblMensajeMenu.AutoSize = true;
            this.lblMensajeMenu.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMensajeMenu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(8)))), ((int)(((byte)(34)))), ((int)(((byte)(118)))));
            this.lblMensajeMenu.Location = new System.Drawing.Point(236, 165);
            this.lblMensajeMenu.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblMensajeMenu.Name = "lblMensajeMenu";
            this.lblMensajeMenu.Size = new System.Drawing.Size(393, 37);
            this.lblMensajeMenu.TabIndex = 0;
            this.lblMensajeMenu.Text = "Bienvenida Menu Principal";
            // 
            // FrmMenuPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(1043, 576);
            this.Controls.Add(this.PanelContenedor);
            this.Controls.Add(this.PanelSuperior);
            this.Controls.Add(this.PanelMenu);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "FrmMenuPrincipal";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "MenuPrincipal";
            this.PanelMenu.ResumeLayout(false);
            this.PanelMenuInferior.ResumeLayout(false);
            this.PanelSuperior.ResumeLayout(false);
            this.PanelContenedor.ResumeLayout(false);
            this.PanelContenedor.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel PanelMenu;
        private System.Windows.Forms.Panel PanelMenuInferior;
        private System.Windows.Forms.Panel PanelMenuSuperior;
        private System.Windows.Forms.Panel PanelSuperior;
        private FontAwesome.Sharp.IconButton btnClientes;
        private FontAwesome.Sharp.IconButton btnReportes;
        private FontAwesome.Sharp.IconButton btnVentas;
        private FontAwesome.Sharp.IconButton btnInventarios;
        private FontAwesome.Sharp.IconButton btnProductos;
        private FontAwesome.Sharp.IconButton btnCategorias;
        private FontAwesome.Sharp.IconButton btnCuentas;
        private FontAwesome.Sharp.IconButton btnConfiguracion;
        private FontAwesome.Sharp.IconButton btnOcultarMenu;
        private FontAwesome.Sharp.IconButton btnInicio;
        private FontAwesome.Sharp.IconButton btnUsuario;
        private System.Windows.Forms.Panel PanelSeleccion;
        private System.Windows.Forms.Panel PanelContenedor;
        private System.Windows.Forms.Label lblMensajeMenu;
    }
}