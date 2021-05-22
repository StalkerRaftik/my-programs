using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Timers;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows;
using System.IO;

namespace Piano
{
    public partial class Form1 : Form
    {
        const int playersAmount = 10;
        WMPLib.WindowsMediaPlayer[] players = new WMPLib.WindowsMediaPlayer[playersAmount];
        int curPlayer = 0;
        bool IsRecording = false;
        string[] SoundsPaths = new string[13];
        List<long> CurrentMelody = new List<long>();
        long RecordTimer = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();
        public Form1()
        {
            InitializeComponent();
            for (int i = 0; i < 13; i++)
            {
                SoundsPaths[i] = "C:\\Important\\Studying\\my-programs\\C#\\Piano\\Resources\\Sounds\\" +
                    (i+1).ToString() + ".wav";
            }
            for (int i = 0; i < playersAmount; i++)
            {
                players[i] = new WMPLib.WindowsMediaPlayer();
            }
        }

        private void PlaySound(long path)
        {
            curPlayer++;
            if (curPlayer == playersAmount)
                curPlayer = 0;
            players[curPlayer].URL = SoundsPaths[path];
            players[curPlayer].controls.play();
        }

        private void StopSound()
        {  
            for (int i = 0; i < playersAmount; i++)
            {
                players[i].controls.stop();
            }
        }

        //private void PlaySoundCallback(int obj)
        //{
        //    int path = (int)obj;
        //    curPlayer++;
        //    if (curPlayer >= playersAmount)
        //        curPlayer = 0;
        //    players[curPlayer].URL = SoundsPaths[path];
        //    players[curPlayer].controls.play();
        //}

        private void PlayButton_Click(object sender, EventArgs e)
        {
            StopSound();

            int i = 0;
            if (CurrentMelody.Count < 2) return;

            var PlayTimer = new System.Windows.Forms.Timer();
            PlayTimer.Interval = (int)CurrentMelody[i];
            PlayTimer.Start();
            PlayTimer.Tick += delegate (object o, EventArgs eArgs) {
                PlaySound(CurrentMelody[i + 1]);
                i += 2;
                if (i >= CurrentMelody.Count)
                {
                    PlayTimer.Stop();
                    return;
                }
                PlayTimer.Interval = (int)CurrentMelody[i];
            };
        }

        private void SaveButton_Click(object sender, EventArgs e)
        {
            StopSound();
            Stream SaveStream;
            SaveFileDialog saveMelodyDialog = new SaveFileDialog();

            saveMelodyDialog.Filter = "Melody files (*.mld)|*.mld";
            saveMelodyDialog.FilterIndex = 2;
            saveMelodyDialog.RestoreDirectory = true;

            if (saveMelodyDialog.ShowDialog() == DialogResult.OK)
            {
                if ((SaveStream = saveMelodyDialog.OpenFile()) != null)
                {
                    string StringData = "";
                    for (int i = 0; i < CurrentMelody.Count; i++)
                    {
                        StringData = StringData + CurrentMelody[i] + " ";
                    }
                    byte[] Data = System.Text.Encoding.Default.GetBytes(StringData);
                    SaveStream.Write(Data, 0, Data.Length);
                    SaveStream.Close();
                }
            }
        }

        private void RecordButton_Click(object sender, EventArgs e)
        {
            StopSound();
            if (!IsRecording)
            {
                CurrentMelody.Clear();
                IsRecording = true;
                this.RecordButton.Text = "Остан. запись";
                RecordTimer = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();
            } else
            {
                IsRecording = false;
                this.RecordButton.Text = "Начать запись";
            }
            
        }

        private void LoadButton_Click(object sender, EventArgs e)
        {
            StopSound();
            Stream LoadStream;
            OpenFileDialog loadMelodyDialog = new OpenFileDialog();

            loadMelodyDialog.Filter = "Melody files (*.mld)|*.mld";
            loadMelodyDialog.FilterIndex = 2;
            loadMelodyDialog.RestoreDirectory = true;

            if (loadMelodyDialog.ShowDialog() == DialogResult.OK)
            {
                if ((LoadStream = loadMelodyDialog.OpenFile()) != null)
                {
                    // преобразуем строку в байты
                    byte[] array = new byte[LoadStream.Length];
                    // считываем данные
                    LoadStream.Read(array, 0, array.Length);
                    // декодируем байты в строку
                    string textFromFile = System.Text.Encoding.Default.GetString(array);

                    CurrentMelody.Clear();
                    string[] Data = textFromFile.Split(' ');
                    for (int i = 0; i < Data.Length-1; i++)
                    {
                        long ParsedData = Convert.ToInt64(Data[i]);
                        CurrentMelody.Add(ParsedData);
                    }
                }
            }
        }

        private void PianoButtonHandler(int Button)
        {
            PlaySound(Button);

            if (IsRecording)
            {
                long CurTime = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();
                long WaitTime = CurTime - RecordTimer;
                RecordTimer = CurTime;

                CurrentMelody.Add(WaitTime);
                CurrentMelody.Add((long)Button);
            }
        }

        private void Piano1_Click(object sender, EventArgs e)
        {
            int Button = 0;
            PianoButtonHandler(Button);
        }

        private void Piano2_Click(object sender, EventArgs e)
        {
            int Button = 1;
            PianoButtonHandler(Button);
        }

        private void Piano3_Click(object sender, EventArgs e)
        {
            int Button = 2;
            PianoButtonHandler(Button);
        }

        private void Piano4_Click(object sender, EventArgs e)
        {
            int Button = 3;
            PianoButtonHandler(Button);
        }

        private void Piano5_Click(object sender, EventArgs e)
        {
            int Button = 4;
            PianoButtonHandler(Button);
        }

        private void Piano6_Click(object sender, EventArgs e)
        {
            int Button = 5;
            PianoButtonHandler(Button);
        }

        private void Piano7_Click(object sender, EventArgs e)
        {
            int Button = 6;
            PianoButtonHandler(Button);
        }

        private void Piano8_Click(object sender, EventArgs e)
        {
            int Button = 7;
            PianoButtonHandler(Button);
        }

        private void Piano9_Click(object sender, EventArgs e)
        {
            int Button = 8;
            PianoButtonHandler(Button);
        }

        private void Piano10_Click(object sender, EventArgs e)
        {
            int Button = 9;
            PianoButtonHandler(Button);
        }

        private void Piano11_Click(object sender, EventArgs e)
        {
            int Button = 10;
            PianoButtonHandler(Button);
        }

        private void Piano12_Click(object sender, EventArgs e)
        {
            int Button = 11;
            PianoButtonHandler(Button);
        }

        private void Piano13_Click(object sender, EventArgs e)
        {
            int Button = 12;
            PianoButtonHandler(Button);
        }
    }
}
