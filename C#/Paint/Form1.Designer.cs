namespace Paint
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
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.LineBtn = new System.Windows.Forms.RadioButton();
            this.RectBtn = new System.Windows.Forms.RadioButton();
            this.CloudBtn = new System.Windows.Forms.RadioButton();
            this.LunaBtn = new System.Windows.Forms.RadioButton();
            this.CircleBtn = new System.Windows.Forms.RadioButton();
            this.SunBtn = new System.Windows.Forms.RadioButton();
            this.ColorBox = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.TextBtn = new System.Windows.Forms.RadioButton();
            this.LineTypeBox = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.ShouldFillBox = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.TextWide = new System.Windows.Forms.TrackBar();
            this.label5 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TextWide)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.Location = new System.Drawing.Point(28, 25);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(945, 869);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(47, 56);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(46, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "label1";
            // 
            // LineBtn
            // 
            this.LineBtn.AutoSize = true;
            this.LineBtn.Checked = true;
            this.LineBtn.Location = new System.Drawing.Point(1114, 95);
            this.LineBtn.Name = "LineBtn";
            this.LineBtn.Size = new System.Drawing.Size(71, 21);
            this.LineBtn.TabIndex = 2;
            this.LineBtn.TabStop = true;
            this.LineBtn.Tag = "1";
            this.LineBtn.Text = "Линия";
            this.LineBtn.UseVisualStyleBackColor = true;
            this.LineBtn.CheckedChanged += new System.EventHandler(this.LineBtn_CheckedChanged);
            // 
            // RectBtn
            // 
            this.RectBtn.AutoSize = true;
            this.RectBtn.Location = new System.Drawing.Point(1114, 122);
            this.RectBtn.Name = "RectBtn";
            this.RectBtn.Size = new System.Drawing.Size(84, 21);
            this.RectBtn.TabIndex = 3;
            this.RectBtn.Tag = "1";
            this.RectBtn.Text = "Квадрат";
            this.RectBtn.UseVisualStyleBackColor = true;
            this.RectBtn.CheckedChanged += new System.EventHandler(this.RectBtn_CheckedChanged);
            // 
            // CloudBtn
            // 
            this.CloudBtn.AutoSize = true;
            this.CloudBtn.Location = new System.Drawing.Point(1114, 227);
            this.CloudBtn.Name = "CloudBtn";
            this.CloudBtn.Size = new System.Drawing.Size(79, 21);
            this.CloudBtn.TabIndex = 4;
            this.CloudBtn.Tag = "1";
            this.CloudBtn.Text = "Облако";
            this.CloudBtn.UseVisualStyleBackColor = true;
            this.CloudBtn.CheckedChanged += new System.EventHandler(this.CloudBtn_CheckedChanged);
            // 
            // LunaBtn
            // 
            this.LunaBtn.AutoSize = true;
            this.LunaBtn.Location = new System.Drawing.Point(1114, 200);
            this.LunaBtn.Name = "LunaBtn";
            this.LunaBtn.Size = new System.Drawing.Size(62, 21);
            this.LunaBtn.TabIndex = 5;
            this.LunaBtn.Tag = "1";
            this.LunaBtn.Text = "Луна";
            this.LunaBtn.UseVisualStyleBackColor = true;
            this.LunaBtn.CheckedChanged += new System.EventHandler(this.LunaBtn_CheckedChanged);
            // 
            // CircleBtn
            // 
            this.CircleBtn.AutoSize = true;
            this.CircleBtn.Location = new System.Drawing.Point(1114, 146);
            this.CircleBtn.Name = "CircleBtn";
            this.CircleBtn.Size = new System.Drawing.Size(58, 21);
            this.CircleBtn.TabIndex = 6;
            this.CircleBtn.Tag = "1";
            this.CircleBtn.Text = "Круг";
            this.CircleBtn.UseVisualStyleBackColor = true;
            this.CircleBtn.CheckedChanged += new System.EventHandler(this.CircleBtn_CheckedChanged);
            // 
            // SunBtn
            // 
            this.SunBtn.AutoSize = true;
            this.SunBtn.Location = new System.Drawing.Point(1114, 173);
            this.SunBtn.Name = "SunBtn";
            this.SunBtn.Size = new System.Drawing.Size(98, 21);
            this.SunBtn.TabIndex = 7;
            this.SunBtn.Tag = "1";
            this.SunBtn.Text = "Солнышко";
            this.SunBtn.UseVisualStyleBackColor = true;
            this.SunBtn.CheckedChanged += new System.EventHandler(this.SunBtn_CheckedChanged);
            // 
            // ColorBox
            // 
            this.ColorBox.FormattingEnabled = true;
            this.ColorBox.Items.AddRange(new object[] {
            "Чёрный",
            "Красный",
            "Синий",
            "Зелёный",
            "Жёлтый"});
            this.ColorBox.Location = new System.Drawing.Point(1114, 354);
            this.ColorBox.Name = "ColorBox";
            this.ColorBox.Size = new System.Drawing.Size(121, 24);
            this.ColorBox.TabIndex = 8;
            this.ColorBox.Text = "Чёрный";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(1114, 331);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(45, 17);
            this.label2.TabIndex = 9;
            this.label2.Text = "Цвет:";
            // 
            // TextBtn
            // 
            this.TextBtn.AutoSize = true;
            this.TextBtn.Location = new System.Drawing.Point(1114, 270);
            this.TextBtn.Name = "TextBtn";
            this.TextBtn.Size = new System.Drawing.Size(67, 21);
            this.TextBtn.TabIndex = 10;
            this.TextBtn.Tag = "1";
            this.TextBtn.Text = "Текст";
            this.TextBtn.UseVisualStyleBackColor = true;
            this.TextBtn.CheckedChanged += new System.EventHandler(this.TextBtn_CheckedChanged);
            // 
            // LineTypeBox
            // 
            this.LineTypeBox.FormattingEnabled = true;
            this.LineTypeBox.Items.AddRange(new object[] {
            "___________",
            "_._._._._._._.",
            "- - - - - - -"});
            this.LineTypeBox.Location = new System.Drawing.Point(1114, 422);
            this.LineTypeBox.Name = "LineTypeBox";
            this.LineTypeBox.Size = new System.Drawing.Size(121, 24);
            this.LineTypeBox.TabIndex = 11;
            this.LineTypeBox.Text = "___________";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(1114, 402);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(95, 17);
            this.label3.TabIndex = 12;
            this.label3.Text = "Тип обводки:";
            // 
            // ShouldFillBox
            // 
            this.ShouldFillBox.FormattingEnabled = true;
            this.ShouldFillBox.Items.AddRange(new object[] {
            "Да",
            "Нет"});
            this.ShouldFillBox.Location = new System.Drawing.Point(1114, 475);
            this.ShouldFillBox.Name = "ShouldFillBox";
            this.ShouldFillBox.Size = new System.Drawing.Size(121, 24);
            this.ShouldFillBox.TabIndex = 13;
            this.ShouldFillBox.Text = "Нет";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(1114, 455);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(110, 17);
            this.label4.TabIndex = 14;
            this.label4.Text = "Закрашивание:";
            // 
            // TextWide
            // 
            this.TextWide.Location = new System.Drawing.Point(1114, 531);
            this.TextWide.Minimum = 1;
            this.TextWide.Name = "TextWide";
            this.TextWide.Size = new System.Drawing.Size(104, 56);
            this.TextWide.TabIndex = 15;
            this.TextWide.Value = 1;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(1114, 511);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(113, 17);
            this.label5.TabIndex = 16;
            this.label5.Text = "Толщина кисти:";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1262, 977);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.TextWide);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.ShouldFillBox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.LineTypeBox);
            this.Controls.Add(this.TextBtn);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.ColorBox);
            this.Controls.Add(this.SunBtn);
            this.Controls.Add(this.CircleBtn);
            this.Controls.Add(this.LunaBtn);
            this.Controls.Add(this.CloudBtn);
            this.Controls.Add(this.RectBtn);
            this.Controls.Add(this.LineBtn);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pictureBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TextWide)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.RadioButton LineBtn;
        private System.Windows.Forms.RadioButton RectBtn;
        private System.Windows.Forms.RadioButton CloudBtn;
        private System.Windows.Forms.RadioButton LunaBtn;
        private System.Windows.Forms.RadioButton CircleBtn;
        private System.Windows.Forms.RadioButton SunBtn;
        private System.Windows.Forms.ComboBox ColorBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.RadioButton TextBtn;
        private System.Windows.Forms.ComboBox LineTypeBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox ShouldFillBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TrackBar TextWide;
        private System.Windows.Forms.Label label5;
    }
}

