namespace PoseidonBot
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
            this.entry = new System.Windows.Forms.Button();
            this.quit = new System.Windows.Forms.Button();
            this.run = new System.Windows.Forms.Button();
            this.todayLabel = new System.Windows.Forms.Label();
            this.dayDateLable = new System.Windows.Forms.Label();
            this.runLable = new System.Windows.Forms.Label();
            this.hour1 = new System.Windows.Forms.RadioButton();
            this.hour2 = new System.Windows.Forms.RadioButton();
            this.hour3 = new System.Windows.Forms.RadioButton();
            this.entryStatus = new System.Windows.Forms.Label();
            this.satarday = new System.Windows.Forms.RadioButton();
            this.wednesday = new System.Windows.Forms.RadioButton();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.noTimeRecord = new System.Windows.Forms.RadioButton();
            this.runReadyLabel = new System.Windows.Forms.Label();
            this.runCancel = new System.Windows.Forms.Button();
            this.runReadyProgressBar = new System.Windows.Forms.ProgressBar();
            this.label1 = new System.Windows.Forms.Label();
            this.hours = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.dayDate = new System.Windows.Forms.TextBox();
            this.loginString = new System.Windows.Forms.TextBox();
            this.passwordString = new System.Windows.Forms.TextBox();
            this.loginLabel = new System.Windows.Forms.Label();
            this.passwordLabel = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.Chrome = new System.Windows.Forms.RadioButton();
            this.Firefox = new System.Windows.Forms.RadioButton();
            this.checkBrowserLabel = new System.Windows.Forms.Label();
            this.panel4 = new System.Windows.Forms.Panel();
            this.Month1st = new System.Windows.Forms.RadioButton();
            this.Month2nd = new System.Windows.Forms.RadioButton();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.Washer1 = new System.Windows.Forms.RadioButton();
            this.Washer2 = new System.Windows.Forms.RadioButton();
            this.panel5 = new System.Windows.Forms.Panel();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            this.panel5.SuspendLayout();
            this.SuspendLayout();
            // 
            // entry
            // 
            this.entry.Location = new System.Drawing.Point(93, 75);
            this.entry.Name = "entry";
            this.entry.Size = new System.Drawing.Size(136, 31);
            this.entry.TabIndex = 0;
            this.entry.Text = "Войти в систему";
            this.entry.UseVisualStyleBackColor = true;
            this.entry.Click += new System.EventHandler(this.entry_Click);
            // 
            // quit
            // 
            this.quit.Location = new System.Drawing.Point(93, 558);
            this.quit.Name = "quit";
            this.quit.Size = new System.Drawing.Size(136, 30);
            this.quit.TabIndex = 1;
            this.quit.Text = "Выйти";
            this.quit.UseVisualStyleBackColor = true;
            this.quit.Click += new System.EventHandler(this.quit_Click);
            // 
            // run
            // 
            this.run.Enabled = false;
            this.run.Location = new System.Drawing.Point(34, 476);
            this.run.Name = "run";
            this.run.Size = new System.Drawing.Size(125, 31);
            this.run.TabIndex = 2;
            this.run.Text = "Записаться";
            this.run.UseVisualStyleBackColor = true;
            this.run.Click += new System.EventHandler(this.run_Click);
            // 
            // todayLabel
            // 
            this.todayLabel.Location = new System.Drawing.Point(140, 137);
            this.todayLabel.Name = "todayLabel";
            this.todayLabel.Size = new System.Drawing.Size(170, 24);
            this.todayLabel.TabIndex = 5;
            this.todayLabel.Text = "Запись открывается";
            this.todayLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // dayDateLable
            // 
            this.dayDateLable.Location = new System.Drawing.Point(0, 0);
            this.dayDateLable.Name = "dayDateLable";
            this.dayDateLable.Size = new System.Drawing.Size(100, 23);
            this.dayDateLable.TabIndex = 0;
            // 
            // runLable
            // 
            this.runLable.Location = new System.Drawing.Point(26, 137);
            this.runLable.Name = "runLable";
            this.runLable.Size = new System.Drawing.Size(123, 24);
            this.runLable.TabIndex = 9;
            this.runLable.Text = "Время стирки";
            this.runLable.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // hour1
            // 
            this.hour1.AutoSize = true;
            this.hour1.Location = new System.Drawing.Point(9, 3);
            this.hour1.Name = "hour1";
            this.hour1.Size = new System.Drawing.Size(64, 21);
            this.hour1.TabIndex = 10;
            this.hour1.Text = "1 час";
            this.hour1.UseVisualStyleBackColor = true;
            this.hour1.CheckedChanged += new System.EventHandler(this.hour1_CheckedChanged);
            // 
            // hour2
            // 
            this.hour2.AutoSize = true;
            this.hour2.Location = new System.Drawing.Point(9, 30);
            this.hour2.Name = "hour2";
            this.hour2.Size = new System.Drawing.Size(72, 21);
            this.hour2.TabIndex = 10;
            this.hour2.Text = "2 часа";
            this.hour2.UseVisualStyleBackColor = true;
            this.hour2.CheckedChanged += new System.EventHandler(this.hour2_CheckedChanged);
            // 
            // hour3
            // 
            this.hour3.AutoSize = true;
            this.hour3.Location = new System.Drawing.Point(9, 57);
            this.hour3.Name = "hour3";
            this.hour3.Size = new System.Drawing.Size(72, 21);
            this.hour3.TabIndex = 10;
            this.hour3.Text = "3 часа";
            this.hour3.UseVisualStyleBackColor = true;
            this.hour3.CheckedChanged += new System.EventHandler(this.hour3_CheckedChanged);
            // 
            // entryStatus
            // 
            this.entryStatus.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.entryStatus.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.entryStatus.Location = new System.Drawing.Point(4, 109);
            this.entryStatus.Name = "entryStatus";
            this.entryStatus.Size = new System.Drawing.Size(317, 23);
            this.entryStatus.TabIndex = 11;
            this.entryStatus.Text = "вход не выполнен";
            this.entryStatus.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // satarday
            // 
            this.satarday.AutoSize = true;
            this.satarday.Location = new System.Drawing.Point(3, 31);
            this.satarday.Name = "satarday";
            this.satarday.Size = new System.Drawing.Size(76, 21);
            this.satarday.TabIndex = 3;
            this.satarday.Text = "в 18:00";
            this.satarday.UseVisualStyleBackColor = true;
            this.satarday.CheckedChanged += new System.EventHandler(this.satarday_CheckedChanged);
            // 
            // wednesday
            // 
            this.wednesday.AutoSize = true;
            this.wednesday.Location = new System.Drawing.Point(3, 4);
            this.wednesday.Name = "wednesday";
            this.wednesday.Size = new System.Drawing.Size(76, 21);
            this.wednesday.TabIndex = 3;
            this.wednesday.Text = "в 16:00";
            this.wednesday.UseVisualStyleBackColor = true;
            this.wednesday.CheckedChanged += new System.EventHandler(this.wednesday_CheckedChanged);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.hour3);
            this.panel1.Controls.Add(this.hour2);
            this.panel1.Controls.Add(this.hour1);
            this.panel1.Location = new System.Drawing.Point(35, 164);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(125, 91);
            this.panel1.TabIndex = 12;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.noTimeRecord);
            this.panel2.Controls.Add(this.wednesday);
            this.panel2.Controls.Add(this.satarday);
            this.panel2.Location = new System.Drawing.Point(181, 164);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(97, 89);
            this.panel2.TabIndex = 13;
            // 
            // noTimeRecord
            // 
            this.noTimeRecord.AutoSize = true;
            this.noTimeRecord.Location = new System.Drawing.Point(3, 58);
            this.noTimeRecord.Name = "noTimeRecord";
            this.noTimeRecord.Size = new System.Drawing.Size(84, 21);
            this.noTimeRecord.TabIndex = 4;
            this.noTimeRecord.Text = "открыта";
            this.noTimeRecord.UseVisualStyleBackColor = true;
            this.noTimeRecord.CheckedChanged += new System.EventHandler(this.noTimeRecord_CheckedChanged);
            // 
            // runReadyLabel
            // 
            this.runReadyLabel.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.runReadyLabel.Location = new System.Drawing.Point(37, 510);
            this.runReadyLabel.Name = "runReadyLabel";
            this.runReadyLabel.Size = new System.Drawing.Size(251, 24);
            this.runReadyLabel.TabIndex = 14;
            this.runReadyLabel.Text = "запись не запущена";
            this.runReadyLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.runReadyLabel.UseWaitCursor = true;
            // 
            // runCancel
            // 
            this.runCancel.Location = new System.Drawing.Point(165, 476);
            this.runCancel.Name = "runCancel";
            this.runCancel.Size = new System.Drawing.Size(123, 31);
            this.runCancel.TabIndex = 15;
            this.runCancel.Text = "Отмена";
            this.runCancel.UseVisualStyleBackColor = true;
            this.runCancel.Click += new System.EventHandler(this.runCancel_Click);
            // 
            // runReadyProgressBar
            // 
            this.runReadyProgressBar.Location = new System.Drawing.Point(34, 537);
            this.runReadyProgressBar.MarqueeAnimationSpeed = 0;
            this.runReadyProgressBar.Maximum = 10;
            this.runReadyProgressBar.Name = "runReadyProgressBar";
            this.runReadyProgressBar.Size = new System.Drawing.Size(254, 10);
            this.runReadyProgressBar.Style = System.Windows.Forms.ProgressBarStyle.Marquee;
            this.runReadyProgressBar.TabIndex = 16;
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(166, 392);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(123, 41);
            this.label1.TabIndex = 7;
            this.label1.Text = "     Время     Формат: XX:YY";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // hours
            // 
            this.hours.Location = new System.Drawing.Point(166, 436);
            this.hours.Name = "hours";
            this.hours.Size = new System.Drawing.Size(123, 22);
            this.hours.TabIndex = 18;
            this.hours.TextChanged += new System.EventHandler(this.hours_TextChanged);
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(32, 397);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(125, 30);
            this.label2.TabIndex = 7;
            this.label2.Text = "Число месяца:";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // dayDate
            // 
            this.dayDate.Location = new System.Drawing.Point(35, 436);
            this.dayDate.Name = "dayDate";
            this.dayDate.Size = new System.Drawing.Size(125, 22);
            this.dayDate.TabIndex = 18;
            this.dayDate.TextChanged += new System.EventHandler(this.dayDate_TextChanged);
            // 
            // loginString
            // 
            this.loginString.Location = new System.Drawing.Point(34, 36);
            this.loginString.Name = "loginString";
            this.loginString.Size = new System.Drawing.Size(125, 22);
            this.loginString.TabIndex = 19;
            // 
            // passwordString
            // 
            this.passwordString.Location = new System.Drawing.Point(166, 36);
            this.passwordString.Name = "passwordString";
            this.passwordString.PasswordChar = '*';
            this.passwordString.Size = new System.Drawing.Size(122, 22);
            this.passwordString.TabIndex = 19;
            // 
            // loginLabel
            // 
            this.loginLabel.Location = new System.Drawing.Point(34, 9);
            this.loginLabel.Name = "loginLabel";
            this.loginLabel.Size = new System.Drawing.Size(126, 23);
            this.loginLabel.TabIndex = 20;
            this.loginLabel.Text = "Логин";
            this.loginLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // passwordLabel
            // 
            this.passwordLabel.Location = new System.Drawing.Point(166, 9);
            this.passwordLabel.Name = "passwordLabel";
            this.passwordLabel.Size = new System.Drawing.Size(122, 23);
            this.passwordLabel.TabIndex = 20;
            this.passwordLabel.Text = "Пароль";
            this.passwordLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.Chrome);
            this.panel3.Controls.Add(this.Firefox);
            this.panel3.Location = new System.Drawing.Point(34, 285);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(120, 65);
            this.panel3.TabIndex = 22;
            // 
            // Chrome
            // 
            this.Chrome.AutoSize = true;
            this.Chrome.Location = new System.Drawing.Point(6, 3);
            this.Chrome.Name = "Chrome";
            this.Chrome.Size = new System.Drawing.Size(78, 21);
            this.Chrome.TabIndex = 3;
            this.Chrome.Text = "Chrome";
            this.Chrome.UseVisualStyleBackColor = true;
            this.Chrome.CheckedChanged += new System.EventHandler(this.Chrome_CheckedChanged);
            // 
            // Firefox
            // 
            this.Firefox.AutoSize = true;
            this.Firefox.Location = new System.Drawing.Point(6, 30);
            this.Firefox.Name = "Firefox";
            this.Firefox.Size = new System.Drawing.Size(71, 21);
            this.Firefox.TabIndex = 3;
            this.Firefox.Text = "Firefox";
            this.Firefox.UseVisualStyleBackColor = true;
            this.Firefox.CheckedChanged += new System.EventHandler(this.Firefox_CheckedChanged);
            // 
            // checkBrowserLabel
            // 
            this.checkBrowserLabel.Location = new System.Drawing.Point(35, 256);
            this.checkBrowserLabel.Name = "checkBrowserLabel";
            this.checkBrowserLabel.Size = new System.Drawing.Size(120, 24);
            this.checkBrowserLabel.TabIndex = 23;
            this.checkBrowserLabel.Text = "Браузер";
            this.checkBrowserLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.checkBrowserLabel.Click += new System.EventHandler(this.label3_Click);
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.Month1st);
            this.panel4.Controls.Add(this.Month2nd);
            this.panel4.Location = new System.Drawing.Point(181, 286);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(107, 64);
            this.panel4.TabIndex = 24;
            // 
            // Month1st
            // 
            this.Month1st.AutoSize = true;
            this.Month1st.Location = new System.Drawing.Point(3, 3);
            this.Month1st.Name = "Month1st";
            this.Month1st.Size = new System.Drawing.Size(85, 21);
            this.Month1st.TabIndex = 3;
            this.Month1st.Text = "текущий";
            this.Month1st.UseVisualStyleBackColor = true;
            this.Month1st.CheckedChanged += new System.EventHandler(this.Month1st_CheckedChanged);
            // 
            // Month2nd
            // 
            this.Month2nd.AutoSize = true;
            this.Month2nd.Location = new System.Drawing.Point(3, 29);
            this.Month2nd.Name = "Month2nd";
            this.Month2nd.Size = new System.Drawing.Size(104, 21);
            this.Month2nd.TabIndex = 3;
            this.Month2nd.Text = "следующий";
            this.Month2nd.UseVisualStyleBackColor = true;
            this.Month2nd.CheckedChanged += new System.EventHandler(this.Month2nd_CheckedChanged);
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(181, 256);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(107, 24);
            this.label3.TabIndex = 25;
            this.label3.Text = "Месяц";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(8, 7);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(69, 17);
            this.label4.TabIndex = 27;
            this.label4.Text = "Машинка";
            this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // Washer1
            // 
            this.Washer1.AutoSize = true;
            this.Washer1.Location = new System.Drawing.Point(83, 5);
            this.Washer1.Name = "Washer1";
            this.Washer1.Size = new System.Drawing.Size(37, 21);
            this.Washer1.TabIndex = 3;
            this.Washer1.Text = "1";
            this.Washer1.UseVisualStyleBackColor = true;
            this.Washer1.CheckedChanged += new System.EventHandler(this.Washer1_CheckedChanged);
            // 
            // Washer2
            // 
            this.Washer2.AutoSize = true;
            this.Washer2.Location = new System.Drawing.Point(122, 5);
            this.Washer2.Name = "Washer2";
            this.Washer2.Size = new System.Drawing.Size(37, 21);
            this.Washer2.TabIndex = 3;
            this.Washer2.Text = "2";
            this.Washer2.UseVisualStyleBackColor = true;
            this.Washer2.CheckedChanged += new System.EventHandler(this.Washer2_CheckedChanged);
            // 
            // panel5
            // 
            this.panel5.Controls.Add(this.Washer2);
            this.panel5.Controls.Add(this.Washer1);
            this.panel5.Controls.Add(this.label4);
            this.panel5.Location = new System.Drawing.Point(78, 356);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(166, 38);
            this.panel5.TabIndex = 28;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(322, 596);
            this.Controls.Add(this.panel5);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.panel4);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.todayLabel);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.checkBrowserLabel);
            this.Controls.Add(this.passwordLabel);
            this.Controls.Add(this.loginLabel);
            this.Controls.Add(this.passwordString);
            this.Controls.Add(this.loginString);
            this.Controls.Add(this.dayDate);
            this.Controls.Add(this.hours);
            this.Controls.Add(this.runReadyProgressBar);
            this.Controls.Add(this.runCancel);
            this.Controls.Add(this.runReadyLabel);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.entryStatus);
            this.Controls.Add(this.runLable);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.run);
            this.Controls.Add(this.quit);
            this.Controls.Add(this.entry);
            this.Controls.Add(this.label2);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Location = new System.Drawing.Point(1270, 330);
            this.Name = "Form1";
            this.Text = "Poseidon Bot";
            this.TopMost = true;
            this.Load += new System.EventHandler(this.Form1_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button quit;
        private System.Windows.Forms.Button run;
        private System.Windows.Forms.Label todayLabel;
        private System.Windows.Forms.Label dayDateLable;
        private System.Windows.Forms.Label runLable;
        private System.Windows.Forms.RadioButton hour1;
        private System.Windows.Forms.RadioButton hour2;
        private System.Windows.Forms.RadioButton hour3;
        private System.Windows.Forms.Label entryStatus;
        private System.Windows.Forms.Button entry;
        private System.Windows.Forms.RadioButton satarday;
        private System.Windows.Forms.RadioButton wednesday;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label runReadyLabel;
        private System.Windows.Forms.Button runCancel;
        private System.Windows.Forms.ProgressBar runReadyProgressBar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox hours;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox dayDate;
        private System.Windows.Forms.TextBox loginString;
        private System.Windows.Forms.TextBox passwordString;
        private System.Windows.Forms.Label loginLabel;
        private System.Windows.Forms.Label passwordLabel;
        private System.Windows.Forms.RadioButton noTimeRecord;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.RadioButton Chrome;
        private System.Windows.Forms.RadioButton Firefox;
        private System.Windows.Forms.Label checkBrowserLabel;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.RadioButton Month1st;
        private System.Windows.Forms.RadioButton Month2nd;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.RadioButton Washer1;
        private System.Windows.Forms.RadioButton Washer2;
        private System.Windows.Forms.Panel panel5;
    }
}

