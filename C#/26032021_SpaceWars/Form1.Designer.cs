namespace _26032021_SpaceWars
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.Debug = new System.Windows.Forms.Label();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.Background = new System.Windows.Forms.PictureBox();
            this.PauseLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.Background)).BeginInit();
            this.SuspendLayout();
            // 
            // Debug
            // 
            this.Debug.AutoSize = true;
            this.Debug.Location = new System.Drawing.Point(44, 34);
            this.Debug.Name = "Debug";
            this.Debug.Size = new System.Drawing.Size(42, 17);
            this.Debug.TabIndex = 3;
            this.Debug.Text = "None";
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // Background
            // 
            this.Background.BackColor = System.Drawing.Color.Black;
            this.Background.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Background.Location = new System.Drawing.Point(0, 0);
            this.Background.Name = "Background";
            this.Background.Size = new System.Drawing.Size(1262, 673);
            this.Background.TabIndex = 0;
            this.Background.TabStop = false;
            this.Background.Click += new System.EventHandler(this.Background_Click);
            this.Background.Paint += new System.Windows.Forms.PaintEventHandler(this.Background_Paint);
            // 
            // PauseLabel
            // 
            this.PauseLabel.AutoSize = true;
            this.PauseLabel.BackColor = System.Drawing.Color.Black;
            this.PauseLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.PauseLabel.ForeColor = System.Drawing.SystemColors.ActiveBorder;
            this.PauseLabel.Location = new System.Drawing.Point(475, 302);
            this.PauseLabel.Name = "PauseLabel";
            this.PauseLabel.Size = new System.Drawing.Size(304, 52);
            this.PauseLabel.TabIndex = 4;
            this.PauseLabel.Text = "Enter - начать";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1262, 673);
            this.Controls.Add(this.PauseLabel);
            this.Controls.Add(this.Debug);
            this.Controls.Add(this.Background);
            this.Name = "Form1";
            this.Text = "Form1";
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Form1_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.Form1_KeyUp);
            ((System.ComponentModel.ISupportInitialize)(this.Background)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox Background;
        private System.Windows.Forms.Label Debug;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.Label PauseLabel;
    }
}

