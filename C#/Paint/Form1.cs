using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Paint
{
    public partial class Form1 : Form
    {
        Graphics g;
        Point startpos = new Point();
        bool isMouseDown = false;
        private int DrawMode = 0; // 1 - линия, 2 - квадрат и т.д.
        private bool fill;
        private bool init = false;

        public Form1()
        {
            InitializeComponent();
            pictureBox1.MouseDown += new MouseEventHandler(pictureBox1_MouseDown);
            pictureBox1.MouseUp += new MouseEventHandler(pictureBox1_MouseUp);

            g = pictureBox1.CreateGraphics();
           
        }

        
        private void pictureBox1_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e) {
            if (!init)
            {
                g.Clear(Color.White);
                init = true;
            }
            if (!isMouseDown)
            {
                isMouseDown = true;
                startpos.X = e.X;
                startpos.Y = e.Y;
            }

            

            //// Создаем объекты-кисти для закрашивания фигур
            //SolidBrush myCorp = new SolidBrush(Color.DarkMagenta);
            //SolidBrush myTrum = new SolidBrush(Color.DarkOrchid);
            //SolidBrush myTrub = new SolidBrush(Color.DeepPink);
            //SolidBrush mySeа = new SolidBrush(Color.Blue);
            ////Выбираем перо myPen желтого цвета толщиной в 2 пикселя:
            //Pen myWind = new Pen(Color.Yellow, 2);
            //// Закрашиваем фигуры
            //g.FillRectangle(myTrub, 300, 125, 75, 75); // 1 труба (прямоугольник)
            //g.FillRectangle(myTrub, 480, 125, 75, 75); // 2 труба (прямоугольник)
            //g.FillPolygon(myCorp, new Point[]      // корпус (трапеция)
            //  {
            //    new Point(100,300),new Point(700,300),
            //    new Point(700,300),new Point(600,400),
            //    new Point(600,400),new Point(200,400),
            //    new Point(200,400),new Point(100,300)
            //  }
            //);
            //g.FillRectangle(myTrum, 250, 200, 350, 100); // палуба (прямоугольник)
            //                                             // Море - 12 секторов-полуокружностей
            //int x = 50;
            //int Radius = 50;
            //while (x <= pictureBox1.Width - Radius)
            //{
            //    g.FillPie(mySeа, 0 + x, 375, 50, 50, 0, -180);
            //    x += 50;
            //}
            //// Иллюминаторы 
            //for (int y = 300; y <= 550; y += 50)
            //{
            //    g.DrawEllipse(myWind, y, 240, 20, 20); // 6 окружностей
            //}
        }

        private void pictureBox1_MouseUp(object sender, System.Windows.Forms.MouseEventArgs e)
        {
            isMouseDown = false;
            var width = e.X - startpos.X;
            var height = e.Y - startpos.Y;

            Pen pen = new Pen(Color.Black, TextWide.Value);
            System.Drawing.SolidBrush brush = new System.Drawing.SolidBrush(pen.Color);
            switch (ColorBox.Text)
            {
                case "Чёрный":
                    pen.Color = Color.Black;
                    brush.Color = Color.Black;
                    break;
                case "Красный":
                    pen.Color = Color.Red;
                    brush.Color = Color.Red;
                    break;
                case "Синий":
                    pen.Color = Color.Blue;
                    brush.Color = Color.Blue;
                    break;
                case "Жёлтый":
                    pen.Color = Color.Yellow;
                    brush.Color = Color.Yellow;
                    break;
                case "Зелёный":
                    pen.Color = Color.Green;
                    brush.Color = Color.Green;
                    break;
            }
            switch (LineTypeBox.Text)
            {
                case "___________":
                    pen.DashPattern = new float[] { 5.0F};
                    break;
                case "_._._._._._._.":
                    pen.DashPattern = new float[] { 5.0F, 1.0F, 1.0F, 1.0F };
                    break;
                case "- - - - - - -":
                    pen.DashPattern = new float[] { 5.0F, 5.0F };
                    break;
            }
            switch (ShouldFillBox.Text)
            {
                case "Да":
                    fill = true;
                    break;
                case "Нет":
                    fill = false;
                    break;
            }

            Point pt = new Point(e.X, e.Y);
            switch (DrawMode)
            {
                case 0:
                    
                    g.DrawLine(pen, startpos, pt);

                    break;
                case 1:
                    if (fill)
                        g.FillRectangle(brush, startpos.X, startpos.Y, pt.X - startpos.X, pt.Y - startpos.Y);
                    else
                        g.DrawRectangle(pen, startpos.X, startpos.Y, pt.X - startpos.X, pt.Y - startpos.Y);
                    

                    break;
                case 2:
                    Rectangle rect = new Rectangle(startpos.X, startpos.Y, pt.X - startpos.X, pt.Y - startpos.Y);
                    if (fill)
                        g.FillEllipse(brush, rect);
                    else
                        g.DrawEllipse(pen, rect);

                    break;
                case 3:
                    rect = new Rectangle(startpos.X + (int)(width * 0.15), startpos.Y + (int)(height * 0.15), (int)(width * 0.7), (int)(height * 0.7));
                    if (fill)
                    {
                        g.FillEllipse(brush, rect);
                    }
                    else
                    {
                        g.DrawEllipse(pen, rect);
                    }
                    g.DrawLine(pen, startpos.X, startpos.Y, (float)(startpos.X + width*0.25), (float)(startpos.Y+height*0.25) );
                    g.DrawLine(pen, startpos.X + width/2, startpos.Y, startpos.X + width / 2, (float)(startpos.Y + height * 0.15));
                    g.DrawLine(pen, startpos.X + width, startpos.Y, (float)(startpos.X + width * 0.75), (float)(startpos.Y + height * 0.25));
                    g.DrawLine(pen, startpos.X, startpos.Y+height, (float)(startpos.X + width * 0.25), (float)(startpos.Y +  height*0.75));
                    g.DrawLine(pen, startpos.X+width, startpos.Y+height, (float)(startpos.X + width*0.75), (float)(startpos.Y + height*0.75));
                    g.DrawLine(pen, startpos.X + width / 2, startpos.Y+height, startpos.X + width / 2, (float)(startpos.Y + height * 0.85));
                    break;
                case 4:
                    var h = height / 3.1415; // Коэффицент эластичности функции по высоте

                    var pattlength = pen.DashPattern.Length;
                    var curkey = 0;
                    var counter = 0;
                    for (int y = startpos.Y; y <= e.Y; y++)
                    {
                        // Обработка паттерна
                        counter++;
                        if (counter > pen.DashPattern[curkey])
                        {
                            if (curkey+1 >= pattlength)
                            {
                                curkey = 0;
                            } else
                            {
                                curkey++;
                                counter = 0;
                            }
                        }
                        if (curkey % 2 == 1) continue;

                        var formula = (int)(Math.Sin((y-startpos.Y)/h)*width);
                        label1.Text = formula.ToString();
                        g.FillRectangle(brush, formula + startpos.X, y, TextWide.Value, TextWide.Value);
                        g.FillRectangle(brush, formula/2 + startpos.X, y, TextWide.Value, TextWide.Value);
                        if (fill)
                        {
                            for (int x = startpos.X; x <= e.X; x++)
                            {
                                if (x < formula + startpos.X && x > formula / 2 + startpos.X)
                                {
                                    g.FillRectangle(brush, x, y, 1, 2);
                                }
                            }
                        }

                        g.DrawLine(pen, 
                            (int)(Math.Sin((y - startpos.Y) / h) * width) + startpos.X, y, 
                            (int)(Math.Sin((y + 1 - startpos.Y) / h) * width) + startpos.X, y + 1
                            );
                        g.DrawLine(pen,
                            (int)(Math.Sin((y - startpos.Y) / h) * width)/2 + startpos.X, y,
                            (int)(Math.Sin((y + 1 - startpos.Y) / h) * width)/2 + startpos.X, y + 1
                            );
                    }
                    break;
                case 5:
                    pattlength = pen.DashPattern.Length;
                    curkey = 0;
                    counter = 0;
                    for (int y = startpos.Y; y <= e.Y; y++)
                    {
                        for (int x = startpos.X; x <= e.X; x++)
                        {
                            // Обработка паттерна
                            counter++;
                            if (counter > pen.DashPattern[curkey])
                            {
                                if (curkey + 1 >= pattlength)
                                {
                                    curkey = 0;
                                }
                                else
                                {
                                    curkey++;
                                    counter = 0;
                                }
                            }
                            if (curkey % 2 == 1) continue;

                            var c1 = Math.Pow(x - startpos.X - width * 0.3, 2) + Math.Pow(y-startpos.Y-height*0.3, 2);
                            var c2 = Math.Pow(x - startpos.X - width * 0.5, 2) + Math.Pow(y - startpos.Y - height * 0.3, 2);
                            var c3 = Math.Pow(x - startpos.X - width * 0.7, 2) + Math.Pow(y - startpos.Y - height * 0.3, 2);

                            var c4 = Math.Pow(x - startpos.X - width * 0.3, 2) + Math.Pow(y - startpos.Y - height * 0.5, 2);
                            var c5 = Math.Pow(x - startpos.X - width * 0.5, 2) + Math.Pow(y - startpos.Y - height * 0.5, 2);
                            var c6 = Math.Pow(x - startpos.X - width * 0.7, 2) + Math.Pow(y - startpos.Y - height * 0.5, 2);
                            if (c1 <= Math.Pow((width+height)/2*0.16, 2) || 
                                c2 <= Math.Pow((width + height) / 2 * 0.16, 2) || 
                                c3 <= Math.Pow((width + height) / 2 * 0.16, 2) || 
                                c4 <= Math.Pow((width + height) / 2 * 0.16, 2) || 
                                c5 <= Math.Pow((width + height) / 2 * 0.16, 2) || 
                                c6 <= Math.Pow((width + height) / 2 * 0.16, 2) )
                            {
                                g.FillRectangle(brush, x, y, TextWide.Value, TextWide.Value);
                            }
                          

                        }
                    }
                    
                    if (!fill) 
                    for (int y = startpos.Y; y <= e.Y; y++)
                    {
                        for (int x = startpos.X; x <= e.X; x++)
                        {
                            var c1 = Math.Pow(x - startpos.X - width * 0.3, 2) + Math.Pow(y - startpos.Y - height * 0.3, 2);
                            var c2 = Math.Pow(x - startpos.X - width * 0.5, 2) + Math.Pow(y - startpos.Y - height * 0.3, 2);
                            var c3 = Math.Pow(x - startpos.X - width * 0.7, 2) + Math.Pow(y - startpos.Y - height * 0.3, 2);

                            var c4 = Math.Pow(x - startpos.X - width * 0.3, 2) + Math.Pow(y - startpos.Y - height * 0.5, 2);
                            var c5 = Math.Pow(x - startpos.X - width * 0.5, 2) + Math.Pow(y - startpos.Y - height * 0.5, 2);
                            var c6 = Math.Pow(x - startpos.X - width * 0.7, 2) + Math.Pow(y - startpos.Y - height * 0.5, 2);
                            if (c1 < Math.Pow((width + height) / 2 * 0.16 - TextWide.Value, 2) ||
                                c2 < Math.Pow((width + height) / 2 * 0.16 - TextWide.Value, 2) ||
                                c3 < Math.Pow((width + height) / 2 * 0.16 - TextWide.Value, 2) ||
                                c4 < Math.Pow((width + height) / 2 * 0.16 - TextWide.Value, 2) ||
                                c5 < Math.Pow((width + height) / 2 * 0.16 - TextWide.Value, 2) ||
                                c6 < Math.Pow((width + height) / 2 * 0.16 - TextWide.Value, 2))
                            {
                                g.FillRectangle(new System.Drawing.SolidBrush(Color.White), x, y, TextWide.Value, TextWide.Value);
                            }


                        }
                    }

                    break;
                case 6:
                    var textbox = new System.Windows.Forms.TextBox();
                    textbox.Location = new System.Drawing.Point(e.X, e.Y);
                    textbox.Name = "Text";
                    textbox.Size = new System.Drawing.Size(100, 100);
                    textbox.TabIndex = 11;
                    Font font = new Font(new FontFamily("Arial"), 10, FontStyle.Italic);
                    textbox.Font = font;
                    this.Controls.Add(textbox);
                    textbox.BringToFront();
                    break;
            }
        }

        private void LineBtn_CheckedChanged(object sender, EventArgs e)
        {
            DrawMode = 0;
        }

        private void RectBtn_CheckedChanged(object sender, EventArgs e)
        {
            DrawMode = 1;
        }

        private void CircleBtn_CheckedChanged(object sender, EventArgs e)
        {
            DrawMode = 2;
        }

        private void SunBtn_CheckedChanged(object sender, EventArgs e)
        {
            DrawMode = 3;
        }

        private void LunaBtn_CheckedChanged(object sender, EventArgs e)
        {
            DrawMode = 4;
        }

        private void CloudBtn_CheckedChanged(object sender, EventArgs e)
        {
            DrawMode = 5;
        }

        private void TextBtn_CheckedChanged(object sender, EventArgs e)
        {
            DrawMode = 6;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
