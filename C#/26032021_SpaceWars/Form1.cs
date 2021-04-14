using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Windows.Forms;

namespace _26032021_SpaceWars
{
    public partial class Form1 : Form
    {
        readonly Random Random = new Random();
        bool GameInitialized = false;
        bool GameOnPause = true;
        
        public Form1()
        {
            InitializeComponent();
            
            this.Background.BackColor = Color.Black;
        }


        //---------------------------------
        //----Обработка нажатых клавиш-----
        //---------------------------------
        Dictionary<Keys, bool> PressedButtons = new Dictionary<Keys, bool>();
        private void Form1_KeyDown(object sender, KeyEventArgs e)
        {
            //---------------------------------
            //----------Обработка Enter--------
            //---------------------------------
            if (e.KeyCode == Keys.Enter)
            {
                if (!GameInitialized)
                {
                    GameInit();
                    GameInitialized = true;
                    PauseLabel.Text = "Пауза";
                    PauseLabel.Location = new Point(PauseLabel.Location.X + 50, PauseLabel.Location.Y);
                    
                }

                if (GameOnPause)
                {
                    GameOnPause = false;
                    PauseLabel.Visible = false;
                }
                else
                {
                    GameOnPause = true;
                    PauseLabel.Visible = true;
                }
                return;
            }

            try
            {
                PressedButtons.Add(e.KeyCode, true);
            }
            catch (System.ArgumentException exc) { }

        }
        private void Form1_KeyUp(object sender, KeyEventArgs e)
        {
            PressedButtons.Remove(e.KeyCode);
        }


        //-----------------------------------------------
        //------------------Инициализация игры-----------
        //-----------------------------------------------
        List<Point> Stars = new List<Point>();
        List<Projectile> Proj = new List<Projectile>();
        List<Projectile> HProj = new List<Projectile>();
        List<Intruder> Intruders = new List<Intruder>();
        GameObject ply = new GameObject(0,0,46,74);
        int leftPadding = 0;

        
        Bitmap IntruderPng = Properties.Resources.intruder_removebg_preview;
        Bitmap RocketPng = Properties.Resources.rocket_removebg_preview;
        Bitmap HeartPng = Properties.Resources.plyheart;
        
        public void GameInit()
        {
            for (int i = 0; i < 50; i++)
            {
                Point pt = new Point(Random.Next(1263), Random.Next(674));
                Stars.Add(pt);

                var rect = ply.rect;
                rect.Location = new Point(450, 473);
                ply.rect = rect;
            }
        }

        bool GameEnd = false;
        public void GameOver()
        {
            GameEnd = true;
            PauseLabel.Text = "Игра окончена!";
            PauseLabel.Visible = true;
            PauseLabel.Location = new Point(PauseLabel.Location.X - 40, PauseLabel.Location.Y);
        }

        //-----------------------------------------------
        //----------Функция отрисовки звезд--------------
        //-----------------------------------------------
        public void DrawStars(Graphics g)
        {
            System.Drawing.SolidBrush br = new System.Drawing.SolidBrush(Color.White);
            for (int i = 0; i < Stars.Count(); i++)
            {
                Point pt = Stars[i];
                g.FillCircle(br, pt.X, pt.Y, 2);
            }
        }

        //-----------------------------------------------
        //----------Общая функция отрисовки--------------
        //-----------------------------------------------
        public async Task DrawObjects(object obj)
        {
            Graphics g = (Graphics)obj;
            // Отрисовка звезд
            DrawStars(g);
            // Выстрелы пришельцев
            for (int i = 0; i < HProj.Count; i++)
            {
                Projectile proj = HProj[i];
                g.FillRectangle(proj.brush, proj.rect.X, proj.rect.Y, proj.rect.Width, proj.rect.Height);
            }
            // Пришельцы
            for (int i = 0; i < Intruders.Count; i++)
            {
                g.DrawImage(IntruderPng, Intruders[i].rect.X, Intruders[i].rect.Y);
            }
            // Выстрелы
            for (int i = 0; i < Proj.Count; i++)
            {
                Projectile proj = Proj[i];
                g.FillRectangle(proj.brush, proj.rect.X, proj.rect.Y, proj.rect.Width, proj.rect.Height);
            }
            // Ракета
            g.DrawImage(RocketPng, ply.rect.X, ply.rect.Y);
            

            for (int i = 0; i <= ply.hp; i++)
            {
                g.DrawImage(HeartPng, 10 + 30*i, 10);
            }
        }

        //-----------------------------------------------
        //------Функция обработки логики пришельцев------
        //-----------------------------------------------
        long IntruderDelay = 0;
        long GiantShipShootDelay = DateTimeOffset.Now.ToUnixTimeMilliseconds() + 20000;
        public async Task IntrudersLogicProcessing()
        {
            Debug.Text = Intruders.Count.ToString();

            //----------Обработка движения пришельцев, выстрелов--------
            for (int i = 0; i < Intruders.Count; i++)
            {
                Rectangle rect = Intruders[i].rect;
                // Удаление линии пришельцев за экраном
                if (rect.Y > Background.Height + Intruders[i].rect.Height)
                {
                    Intruders.RemoveAt(i);
                    continue;
                }

                

                // Качание линии пришельцев с помощью синуса, спуск
                int addx;
                if (Math.Sin((DateTimeOffset.Now.ToUnixTimeMilliseconds()+Intruders[i].SinAdd) * 0.0015)  > 0)
                    addx = 1;
                else
                    addx = -1;
                rect.X += addx;
                rect.Y += 4;
                Intruders[i].rect = rect;


                // Обработка выстрела
                if (Intruders[i].ReloadingMilis < DateTimeOffset.Now.ToUnixTimeMilliseconds())
                {
                    Intruders[i].ReloadingMilis = DateTimeOffset.Now.ToUnixTimeMilliseconds() + Intruders[i].ReloadTime;

                    Rectangle IntruderRect = Intruders[i].rect;
                    HProj.Add(new Projectile(
                        IntruderRect.X + IntruderRect.Width/2, 
                        IntruderRect.Y + IntruderRect.Height / 2,
                        6, 15,
                        new SolidBrush(Color.Purple),
                        8
                    ));
                }
            }

            //----------Создание новой линии пришельцев------
            if (IntruderDelay < DateTimeOffset.Now.ToUnixTimeMilliseconds())
            {
                IntruderDelay = DateTimeOffset.Now.ToUnixTimeMilliseconds() + 2000 + Random.Next(1000);

                int IntrudersCount = 10;
                int space = Random.Next(IntrudersCount - 1);

                if (leftPadding == 0) leftPadding = 35;
                else leftPadding = 0;

                int specialAttack = Random.Next(15);
                int doubleAttack = Random.Next(3);
                int SecondWaveSinRandom = Random.Next(10000);
                if (doubleAttack == 0) {
                    IntruderDelay = DateTimeOffset.Now.ToUnixTimeMilliseconds() + 3000 + Random.Next(1000);
                    
                }
                for (int i = 0; i < IntrudersCount; i++)
                {
                    if (i != space)
                    {
                        Intruder Intruder = new Intruder(leftPadding -30 + i * 96 + 10 * i,
                            -70, 96, 79, 2000 + Random.Next(3000),
                            DateTimeOffset.Now.ToUnixTimeMilliseconds()
                        );
                        if (specialAttack != 0)
                        {
                            Intruder.ReloadingMilis = DateTimeOffset.Now.ToUnixTimeMilliseconds() + Intruder.ReloadTime / (1 + Random.Next(3));
                        }
                        Intruders.Add(Intruder);

                        if (doubleAttack == 0)
                        {
                            Intruder = new Intruder(
                                leftPadding + 60 - 30 + i * 96 + 10 * i,
                                -200, 96, 79, 2000 + Random.Next(3000),
                                DateTimeOffset.Now.ToUnixTimeMilliseconds() + SecondWaveSinRandom
                            );

                            if (specialAttack != 0)
                            {
                                Intruder.ReloadingMilis = DateTimeOffset.Now.ToUnixTimeMilliseconds() + Intruder.ReloadTime / (1 + Random.Next(3));
                            }
                            Intruders.Add(Intruder);
                        }
                    }
                }
            }

            // Создание выстрела гигантского пришельца
            if (GiantShipShootDelay < DateTimeOffset.Now.ToUnixTimeMilliseconds())
            {
                GiantShipShootDelay = DateTimeOffset.Now.ToUnixTimeMilliseconds() + 10000;

                HProj.Add(new Projectile(ply.rect.X + ply.rect.Width/2 - 5, -20, 10, 40, new SolidBrush(Color.Purple), 16));
            }
        }

        //-----------------------------------------------
        //------Функция обработки проджектайлов----------
        //----------------и коллизий---------------------
        public async Task ProjectileProcessing()
        {
            //-------Выстрелы игрока-------
            for (int i = 0; i < Proj.Count; i++)
            {
                var projrect = Proj[i].rect;

                // Коллизия
                var destroyed = false;
                var rectForCollisions = projrect;
                rectForCollisions.Y = rectForCollisions.Y + 40;
                for (int j = 0; j < Intruders.Count; j++)
                {
                    if (rectForCollisions.IntersectsWith(Intruders[j].rect))
                    {
                        Proj.RemoveAt(i);
                        destroyed = true;
                        Intruders[j].hp--;
                        if (Intruders[j].hp < 0)
                        {
                            Intruders.RemoveAt(j);
                        }
                    }
                }

                // Движение
                if (!destroyed)
                {
                    projrect.Y = projrect.Y - 8;
                    Proj[i].rect = projrect;

                    if (projrect.Y + projrect.Height < 0)
                    {
                        Proj.RemoveAt(i);
                    }
                }
            }

            //-------Выстрелы пришельцев-------
            for (int i = 0; i < HProj.Count; i++)
            {
                Rectangle proj = HProj[i].rect;

                // Коллизия
                var destroyed = false;
                if (proj.IntersectsWith(ply.rect))
                {
                    destroyed = true;
                    HProj.RemoveAt(i);
                    
                    ply.hp = ply.hp - 1;

                    if (ply.hp < 0) GameOver(); 
                }

                // Движение
                if (!destroyed)
                {
                    proj.Y += HProj[i].speed;
                    HProj[i].rect = proj;
                }
            }

            // Коллизия игрока с инопланетянами
            for (int i = 0; i < Intruders.Count; i++)
            {
                Rectangle rect = Intruders[i].rect;
                if (rect.IntersectsWith(ply.rect))
                {
                    Intruders.RemoveAt(i);

                    ply.hp = ply.hp - 1;

                    if (ply.hp < 0) GameOver();
                }
            }
        }

        //-----------------------------------------------
        //------Функция обработки логики игры------------
        //-----------------------------------------------
        long ReloadTime = 300;
        public async Task MainLogicProcessing()
        {
            // ------------Обработка движения звезд----------
            for (int i = 0; i < Stars.Count(); i++)
            {
                Point pt = Stars[i];
                pt.Y = pt.Y + 1;
                if (pt.Y > this.Background.Height)
                {
                    pt.Y = 0;
                    pt.X = Random.Next(1263);
                }
                Stars[i] = pt;
            }

            //----------Обработка Управления кораблём--------
            foreach (var key in PressedButtons.Keys)
            {
                Point pos = ply.rect.Location;
                switch (key)
                {
                    case Keys.W:
                        pos.Y = GMath.Clamp(pos.Y - 4, 0, Background.Height - ply.rect.Height);
                        break;

                    case Keys.S:
                        pos.Y = GMath.Clamp(pos.Y + 4, 0, Background.Height - ply.rect.Height);
                        break;

                    case Keys.A:
                        pos.X = GMath.Clamp(pos.X - 4, 0, Background.Width - ply.rect.Width);
                        break;

                    case Keys.D:
                        pos.X = GMath.Clamp(pos.X + 4, 0, Background.Width - ply.rect.Width);
                        break;
                    case Keys.Space:
                        if (DateTimeOffset.Now.ToUnixTimeMilliseconds() > gunReload)
                        {
                            if (DateTimeOffset.Now.ToUnixTimeMilliseconds() > gunLongReload)
                            {
                                mag--;
                                Proj.Add(new Projectile(pos.X + ply.rect.Width / 2, pos.Y, 3, 15, new System.Drawing.SolidBrush(Color.Red), -8));
                                gunReload = DateTimeOffset.Now.ToUnixTimeMilliseconds() + ReloadTime;
                                

                                if (mag == 0)
                                {
                                    gunLongReload = DateTimeOffset.Now.ToUnixTimeMilliseconds() + 2000;
                                    mag = 10;
                                }
                            } 
                        }
                        break;
                }
                var rect = ply.rect;
                rect.Location = pos;
                ply.rect = rect;
            }    
        }


        //-----------------------------------------------
        //----------Основной игровой цикл----------------
        //-----------------------------------------------
        long KeyboardDelay = 0;
        long gunReload = 0;
        long gunLongReload = 0;
        int mag = 10;
        long HeavyLogicDelay = 0;
        static object LogickLocker = new object();
        static object DrawLocker = new object();
        private async void Background_Paint(object sender, PaintEventArgs e)
        {
            if (!GameInitialized || GameOnPause || GameEnd) {
                this.Background.Invalidate();
                return;
            };


            //-----------------------------------------------
            //----------Объявление глобальных переменных-----
            //-----------------------------------------------
            Graphics g = e.Graphics;


            //-----------------------------------------------
            //---Мультипоток функций отрисовки, логики игры--
            //-----------------------------------------------
            var DrawingObjectsTask = DrawObjects(g);
            List<Task> Tasks = new List<Task> { DrawingObjectsTask };
            if (DateTimeOffset.Now.ToUnixTimeMilliseconds() > KeyboardDelay)
            {
                KeyboardDelay = DateTimeOffset.Now.ToUnixTimeMilliseconds() + 16;

                var MainLogicProcessingTask = MainLogicProcessing();
                
                var ProjectileProcessingTask = ProjectileProcessing();
                Tasks.Add(MainLogicProcessingTask);
                
                Tasks.Add(ProjectileProcessingTask);
            }

            if (DateTimeOffset.Now.ToUnixTimeMilliseconds() > HeavyLogicDelay)
            {
                HeavyLogicDelay = DateTimeOffset.Now.ToUnixTimeMilliseconds() + 32;

                var IntrudersLogicProcessingTask = IntrudersLogicProcessing();
                Tasks.Add(IntrudersLogicProcessingTask);
            }

            while (Tasks.Count > 0)
            {
                Task finishedTask = await Task.WhenAny(Tasks);
                Tasks.Remove(finishedTask);
            }

            this.Background.Invalidate();
        }

        private void Background_Click(object sender, EventArgs e)
        {

        }
    }


    class GameObject
    {
        
        public GameObject(int X, int Y, int WIDTH, int HEIGHT)
        {
            rect = new Rectangle(X, Y, WIDTH, HEIGHT);
        }
        public Rectangle rect { get; set; }
        public int hp = 2;
        public override string ToString() => $"({rect.X}, {rect.Y}, {rect.Width}, {rect.Height})";
    }

    class Projectile : GameObject
    {
        public Projectile(int X, int Y, int WIDTH, int HEIGHT, System.Drawing.SolidBrush BRUSH, int SPEED) : base(X, Y, WIDTH, HEIGHT)
        {
            rect = new Rectangle(X, Y, WIDTH, HEIGHT);
            brush = BRUSH;
            speed = SPEED;
        }
        public SolidBrush brush { get; set; }
        public int speed { get; set; }
    }

    class Intruder : GameObject
    {
        public Intruder(int X, int Y, int WIDTH, int HEIGHT, int reloadTime, long SINADDITIONAL) : base(X, Y, WIDTH, HEIGHT)
        {
            rect = new Rectangle(X, Y, WIDTH, HEIGHT);
            ReloadTime = reloadTime;
            SinAdd = SINADDITIONAL;
        }
        public long SinAdd { get; set; }
        public int ReloadTime { get; set; }
        public long ReloadingMilis { get; set; }
    }

    public static class GraphicsExtensions
    {
        public static void DrawCircle(this Graphics g, Pen pen,
                                      float centerX, float centerY, float radius)
        {
            g.DrawEllipse(pen, centerX - radius, centerY - radius,
                          radius + radius, radius + radius);
        }

        public static void FillCircle(this Graphics g, Brush brush,
                                      float centerX, float centerY, float radius)
        {
            g.FillEllipse(brush, centerX - radius, centerY - radius,
                          radius + radius, radius + radius);
        }


    }

    public static class GMath
    {
        public static T Clamp<T>(this T value, T min, T max)
        where T : System.IComparable<T>
        {
            T result = value;
            if (value.CompareTo(max) > 0)
                result = max;
            if (value.CompareTo(min) < 0)
                result = min;
            return result;
        }

        public static Point Normalize(Point pt)
        {
            double inv_length = 1.0 / Math.Sqrt(pt.X * pt.X + pt.Y * pt.Y);
            pt.X = (int)(pt.X * inv_length);
            pt.Y = (int)(pt.Y * inv_length);
            return pt;
        }
    }
}
