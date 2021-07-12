using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Лаба_3_ООП
{
    public partial class Form1 : Form
    {
        //размер поля
        static int w = 120;
        static int h = 67;
        //создание массива цветов
        public Color[,] matrix = new Color[w,h];
           
        public Graphics g;
        public Form1()
        {
            InitializeComponent();
            g = pictureBox1.CreateGraphics();

            //обход массива
            for (int i = 0; i < w; i++) {
                for (int j = 0; j < h; j++) {
                    matrix[i, j] = Color.White;
                }
            }
        }

        private void load_Click(object sender, EventArgs e)
        {
          
            Stream LoadStream;  //данные
            OpenFileDialog loadMapDialog = new OpenFileDialog();  //диалог для загрузки файла

            loadMapDialog.Filter = "Map files (*.map)|*.map"; //формат
            loadMapDialog.FilterIndex = 2;
            loadMapDialog.RestoreDirectory = true;

            if (loadMapDialog.ShowDialog() == DialogResult.OK) //нажали загрузить
            {
                if ((LoadStream = loadMapDialog.OpenFile()) != null)
                {
                    // преобразуем строку в байты
                    byte[] array = new byte[LoadStream.Length];
                    // считываем данные
                    LoadStream.Read(array, 0, array.Length);
                    // декодируем байты в строку
                    string textFromFile = System.Text.Encoding.Default.GetString(array); 

                      

                    string[] Rows = textFromFile.Split('\n'); //просматриваем строку и разбивает ее на подстроки
                    for (int j = 0; j < Rows.Length - 1; j++) //разбить на строки
                    {
                        string[] points = Rows[j].Split(' ');//разбить на цвета
                        for (int i = 0; i < Rows.Length - 1; i++) {
                            Color pointclr;
                            string[] RGB = points[i].Split(','); //разбить на RGB
                            pointclr = Color.FromArgb(Convert.ToInt32(RGB[0]), Convert.ToInt32(RGB[1]), Convert.ToInt32(RGB[2]));
                            matrix[i, j] = pointclr;  //занести значения в массив
                            g.FillRectangle(new SolidBrush(pointclr), i * 5, j * 5, 5, 5); //отрисовать квадратик 5*5
                           
                        }
                    }
                }
            }
        }

    





        bool init = false;
        //квадратики 
        SolidBrush br = new SolidBrush(Color.Black); //кисть
        private void paint(object sender, MouseEventArgs e)
        {
            if (!init) // белый фон
            {
                init = true;
                g.Clear(Color.White);
            }
            //выбор цвета кисти (кнопка цвет)
            br.Color = colorDialog1.Color;

            Point point = new Point(e.X,e.Y); //точки, куда нажал пользователь
            point.X = point.X - (point.X % 5); //находим границы блока
            point.Y = point.Y - (point.Y % 5);

            //закинули в матрицу цвета
            matrix[point.X/5, point.Y/5] = colorDialog1.Color; //ячеек в 5  раз меньше
            g.FillRectangle(br, point.X, point.Y, 5, 5); //закрашиваем квадратик 5*5 пикселей


        }

        private void colour_Click(object sender, EventArgs e)
        {
            //выбор цвета
            colorDialog1.ShowDialog();
        
        }

        private void save_Click(object sender, EventArgs e)
        {
            //работа с файлом
            Stream SaveStream; //класс для передачи данных
            SaveFileDialog SaveMapDialog = new SaveFileDialog(); //окно сохраниния на пк

            SaveMapDialog.Filter = "Map files (*.map)|*.map"; //формат файла
            SaveMapDialog.FilterIndex = 2;
            SaveMapDialog.RestoreDirectory = true;

            if (SaveMapDialog.ShowDialog() == DialogResult.OK) //если пользователь сохраняет
            {
                if ((SaveStream = SaveMapDialog.OpenFile()) != null)   //открывается файл, куда сохранить
                {
                    string StringData = "";  //одна строка
                    for (int j = 0; j < h; j++)
                    {
                        for (int i = 0; i < w; i++)
                        {
                            StringData += matrix[i, j].R + "," + matrix[i, j].G + "," + matrix[i, j].B + " ";  //закидываем посртрочкно RGB
                        }
                        StringData += "\n";
                    }

                   
                    byte[] Data = System.Text.Encoding.Default.GetBytes(StringData);  //закодировать в файл
                    SaveStream.Write(Data, 0, Data.Length);
                    SaveStream.Close();  //закрыть файл
                }
            }
        }
    }

}
