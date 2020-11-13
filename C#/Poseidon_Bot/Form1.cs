using System;
using System.Threading.Tasks;
using System.Windows.Forms;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;
using Keys = OpenQA.Selenium.Keys;
using System.Drawing;
using System.Collections.ObjectModel;

namespace PoseidonBot
{
    public partial class Form1 : Form
    {
        IWebDriver browser;
        private bool browserChecked = false;
        private bool wasEntry = false;
        private enum Today { WED, SAT, NONE };
        private Today today;
        private DateTime currentTime;
        private DateTime needTime;
        private IWebElement dateButton;
        private IWebElement timeButton;
        private int upRightArrowClicks;
        private IWebElement upRightArrow, upLeftArrow;
        private int upLeftArrowClicks;
        private bool timeGiven = false;
        private bool dateGiven = false;
        private bool cancelButtonClicked = false;
        private bool washerChecked = false;
        private bool curNextMonthChecked = false;
        public Form1()
        {
            InitializeComponent();
            // автозаполнение открытия записи в зависимости от системного времени
            if (DateTime.Now.DayOfWeek == DayOfWeek.Saturday && DateTime.Now.Hour < 18) satarday.Checked = true;
            if (DateTime.Now.DayOfWeek == DayOfWeek.Wednesday && DateTime.Now.Hour < 16) wednesday.Checked = true;
            else noTimeRecord.Checked = true;
        }
        // делает кнопку "записаться" активной, когда все параметры выбраны
        private void checkRunEnabled()
        {
            if ((satarday.Checked || wednesday.Checked || noTimeRecord.Checked) && 
                (hour1.Checked || hour2.Checked || hour3.Checked) && wasEntry
                && timeGiven && dateGiven && browserChecked && washerChecked && curNextMonthChecked)
            {
                run.Enabled = true;
            }
        }
        // кнопка "войти"
        private async void entry_Click(object sender, EventArgs e)
        {
            entryStatus.Text = "выполняем вход...";
            entryStatus.ForeColor = Color.Black;
            if (Firefox.Checked)
            {
                browser = new FirefoxDriver();
            }
            else if (Chrome.Checked)
            {
                browser = new ChromeDriver();
            }
            else
            {
                entryStatus.Text = "выберите бразуер";
                return;
            }

            browser.Manage().Window.Maximize();
            browser.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(2);
            try
            {
                browser.Navigate().GoToUrl("https://esa.dvfu.ru/?bu=https://poseidon.dvfu.ru/index.php");

            }
            catch (Exception)
            {
                entryStatus.Text = "проверьте подключение к интернету";
                entryStatus.ForeColor = Color.Red;
                return;
            }
            IWebElement login = browser.FindElement(By.Id("inputAccount"));
            IWebElement password = browser.FindElement(By.Id("inputPwd"));
            login.SendKeys(loginString.Text);
            password.SendKeys(passwordString.Text + Keys.Enter);
            if (Firefox.Checked)
            {
                try
                {
                    new WebDriverWait(browser, TimeSpan.FromSeconds(15)).Until(browser => browser.Url == "https://poseidon.dvfu.ru/index.php#/");
                    new WebDriverWait(browser, TimeSpan.FromSeconds(15)).Until(d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));
                    entryStatus.Text = "вход успешно выполнен";
                    entryStatus.ForeColor = Color.Green;
                }
                catch (Exception)
                {
                    browser.Quit();
                    entryStatus.Text = "вход не удался";
                    entryStatus.ForeColor = Color.Red;
                    return;
                }
            }
            else
            {
                new WebDriverWait(browser, TimeSpan.FromSeconds(30)).Until(d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));
                if (browser.Url == "https://poseidon.dvfu.ru/index.php#/")
                {
                    entryStatus.Text = "вход успешно выполнен";
                    wasEntry = true;
                    entryStatus.ForeColor = Color.Green;
                }
                else
                {
                    browser.Quit();
                    entryStatus.Text = "вход не удался";
                    entryStatus.ForeColor = Color.Red;
                    return;
                }
            }
            wasEntry = true;
            checkRunEnabled();
        }
        // кнопка "выход"
        private void quit_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.loginString = loginString.Text;
            Properties.Settings.Default.passwordString = passwordString.Text;
            Properties.Settings.Default.hours = hours.Text;
            Properties.Settings.Default.hour1_checked = hour1.Checked;
            Properties.Settings.Default.hour2_checked = hour2.Checked;
            Properties.Settings.Default.hour3_checked = hour3.Checked;
            Properties.Settings.Default.FirefoxChecked = Firefox.Checked;
            Properties.Settings.Default.ChromeChecked = Chrome.Checked;
            Properties.Settings.Default.browserChecked = browserChecked;
            Properties.Settings.Default.Washer1Checked = Washer1.Checked;
            Properties.Settings.Default.Washer2Checked = Washer2.Checked;
            Properties.Settings.Default.recordMonth1Checked = Month1st.Checked;
            Properties.Settings.Default.recordMonth2Checked = Month2nd.Checked;
            Properties.Settings.Default.Save();
            runReadyProgressBar.Value = 0;
            runReadyProgressBar.MarqueeAnimationSpeed = 0;
            if (browser != null) browser.Quit();
            Application.Exit();
        }

        private void date_ValueChanged(object sender, EventArgs e)
        {
            dateGiven = true;
        }

        // кнопка "записаться"
        private async void run_Click(object sender, EventArgs e)
        {
            runReadyLabel.Text = "ожидание открытия записи...";
            runReadyLabel.Visible = true;
            cancelButtonClicked = false;
            runReadyProgressBar.MarqueeAnimationSpeed = 100;
            setArrowClicks();
            while (!timeReady())
            {
                await Task.Delay(2);
                if (cancelButtonClicked)
                {
                    runReadyProgressBar.Value = 0;
                    return;
                }
            }

            try
            {
                IWebElement recordButton = null;
                recordButton = browser.FindElement(By.CssSelector("div.col-12:nth-child(1) > div:nth-child(1) > a:nth-child(1) > div:nth-child(2) > div:nth-child(2)"));
                new WebDriverWait(browser, TimeSpan.FromSeconds(30)).Until(d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));
                recordButton.Click();
            }
            catch (Exception)
            {
                browser.Navigate().GoToUrl("https://poseidon.dvfu.ru/index.php#/");
                IWebElement recordButton = null;
                recordButton = browser.FindElement(By.CssSelector("div.col-12:nth-child(1) > div:nth-child(1) > a:nth-child(1) > div:nth-child(2) > div:nth-child(2)"));
                new WebDriverWait(browser, TimeSpan.FromSeconds(30)).Until(d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));
                recordButton.Click();
                return;
            }

            runReadyProgressBar.Value = 0;
            runReadyProgressBar.Style = ProgressBarStyle.Blocks;
            runReadyLabel.Text = "идет запись...";
            
            runReadyProgressBar.Value = 3;
            browser.SwitchTo().ActiveElement();

            WebDriverWait waitForOkButton = new WebDriverWait(browser, TimeSpan.FromSeconds(15));
            IWebElement okButton = browser.FindElement(By.XPath("/html/body/div[3]/div/div[3]/button[1]"));
            IWebElement okButtonW = waitForOkButton.Until(ExpectedConditions.ElementToBeClickable(okButton));
            okButtonW.Click();

            browser.SwitchTo().ActiveElement();
            setDateButton();
            dateButton.Click();

            // Может появиться еще одно оповещение.
            WebDriverWait waitForOkButton2 = new WebDriverWait(browser, TimeSpan.FromSeconds(15));
            try
            {
                
                IWebElement okButton2 = browser.FindElement(By.CssSelector(".calendar"));
                IWebElement okButtonW2 = waitForOkButton2.Until(ExpectedConditions.ElementToBeClickable(okButton2));
                okButtonW2.Click();
                browser.SwitchTo().ActiveElement();
            }
            catch (OpenQA.Selenium.NoSuchElementException) { }

            
            setTimeButton();
            ((IJavaScriptExecutor)browser).ExecuteScript("arguments[0].click();", timeButton);

            browser.SwitchTo().ActiveElement();
            clickArrowButtons();

            runReadyProgressBar.Value = 6;
            IWebElement confirm = browser.FindElement(By.XPath("/html/body/div[1]/main/main/div[3]/div/div/div[2]/div/div/div/div/div/div/button"));
            WebDriverWait waitForConfirm = new WebDriverWait(browser, TimeSpan.FromSeconds(15));
            IWebElement confirmW = waitForConfirm.Until(ExpectedConditions.ElementToBeClickable(confirm));
            confirmW.Click();

            IWebElement confirm2 = browser.FindElement(By.XPath("/html/body/div[3]/div/div[3]/button[1]"));
            WebDriverWait waitForConfirm2 = new WebDriverWait(browser, TimeSpan.FromSeconds(15));
            IWebElement confirmW2 = waitForConfirm2.Until(ExpectedConditions.ElementToBeClickable(confirm2));
            confirmW2.Click();

            browser.SwitchTo().ActiveElement();
            runReadyLabel.Text = "завершено";
            runReadyProgressBar.Value = 10;
        }
        private void setDateButton()
        {
            //dateButton = browser.FindElement(By.XPath(dayDate.Text));
            IWebElement DivWithDates = browser.FindElement(By.XPath("/html/body/div[1]/main/main/div[1]/div/div/div/div[2]/div"));
            ReadOnlyCollection<IWebElement> dateButtons = DivWithDates.FindElements(By.LinkText(dayDate.Text));
            if (Month2nd.Checked)
            {
                if (dateButtons.Count > 1)
                {
                    dateButton = dateButtons[1];
                } else
                {
                    dateButton = dateButtons[0];
                }
            } 
            else
            {
                dateButton = dateButtons[0];
            }
        }
        private void setTimeButton()
        {
            try
            {
                IWebElement column = browser.FindElement(By.XPath("/html/body/div[1]/main/main/div[1]/div/div/div/div[3]/div/div/div/div[2]/div"));
                ((IJavaScriptExecutor)browser).ExecuteScript("arguments[0].scrollIntoView(true);", column);
                timeButton = column.FindElement(By.PartialLinkText(hours.Text.ToString()));
            }
            catch (OpenQA.Selenium.NoSuchElementException)
            {
                IWebElement column1 = browser.FindElement(By.XPath("/html/body/div[1]/main/main/div[1]/div/div/div/div[4]/div/div/div/div[2]/div[1]"));
                IWebElement column2 = browser.FindElement(By.XPath("/html/body/div[1]/main/main/div[1]/div/div/div/div[4]/div/div/div/div[2]/div[2]"));
                ((IJavaScriptExecutor)browser).ExecuteScript("arguments[0].scrollIntoView(true);", column1);
                if (Washer1.Checked)
                {
                    timeButton = column1.FindElement(By.PartialLinkText(hours.Text.ToString()));
                } else
                {
                    timeButton = column2.FindElement(By.PartialLinkText(hours.Text.ToString()));
                }
                
            }
        }
        private void setArrowClicks()
        {
            if (hour1.Checked)
            {
                upLeftArrowClicks = 0;
                upRightArrowClicks = 2;
            }
            else if (hour2.Checked)
            {
                upLeftArrowClicks = 1;
                upRightArrowClicks = 2;
            }
            else
            {
                upLeftArrowClicks = 3;
                upRightArrowClicks = 0;
            }
        }
        private void clickArrowButtons()
        {
            WebDriverWait waitForUpLeftArrow = new WebDriverWait(browser, TimeSpan.FromSeconds(15));
            IWebElement upLeft = browser.FindElement(By.CssSelector(".table-condensed > tr:nth-child(1) > td:nth-child(1) > a:nth-child(1)"));
            upLeftArrow = waitForUpLeftArrow.Until(ExpectedConditions.ElementToBeClickable(upLeft));

            WebDriverWait waitForUpRightArrow = new WebDriverWait(browser, TimeSpan.FromSeconds(15));
            IWebElement upRight = browser.FindElement(By.CssSelector(".table-condensed > tr:nth-child(1) > td:nth-child(3) > a:nth-child(1)"));
            upRightArrow = waitForUpRightArrow.Until(ExpectedConditions.ElementToBeClickable(upRight));

            for (int i = 0; i < upRightArrowClicks; i++) upRightArrow.Click();
            for (int i = 0; i < upLeftArrowClicks; i++) upLeftArrow.Click();
        }
        private void setNeedTime()
        {
            currentTime = DateTime.Now;
            if (today == Today.WED) needTime = new DateTime(currentTime.Year, currentTime.Month, currentTime.Day, 16, 00, 00);
            else if (today == Today.SAT) needTime = new DateTime(currentTime.Year, currentTime.Month, currentTime.Day, 18, 00, 00);
        }
        // сравнение текущего системного времени с временем записи
        private bool timeReady()
        {
            currentTime = DateTime.Now;
            if (today == Today.NONE) return true;
            if (needTime.CompareTo(currentTime) <= 0) return true; // знак должен быть <=
            return false;
        }
        private void wednesday_CheckedChanged(object sender, EventArgs e)
        {
            today = Today.WED;
            setNeedTime();
            checkRunEnabled();
        }
        private void satarday_CheckedChanged(object sender, EventArgs e)
        {
            today = Today.SAT;
            setNeedTime();
            checkRunEnabled();
        }
        private void hour1_CheckedChanged(object sender, EventArgs e)
        {
            washTime = 1;
            setArrowClicks();
            checkRunEnabled();
        }
        private void hour2_CheckedChanged(object sender, EventArgs e)
        {
            washTime = 2;
            setArrowClicks();
            checkRunEnabled();
        }
        private void hour3_CheckedChanged(object sender, EventArgs e)
        {
            washTime = 3;
            setArrowClicks();
            checkRunEnabled();
        }
        private void runCancel_Click(object sender, EventArgs e)
        {
            runReadyLabel.Text = "";
            runReadyProgressBar.Value = 0;
            runReadyProgressBar.MarqueeAnimationSpeed = 0;
            cancelButtonClicked = true;
        }
        private void hours_TextChanged(object sender, EventArgs e)
        {
            timeGiven = true;
            checkRunEnabled();
        }
        private void dayDate_TextChanged(object sender, EventArgs e)
        {
            dateGiven = true;
            checkRunEnabled();
        }
        private void noTimeRecord_CheckedChanged(object sender, EventArgs e)
        {
            today = Today.NONE;
            setNeedTime();
            checkRunEnabled();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            loginString.Text = Properties.Settings.Default.loginString;
            passwordString.Text = Properties.Settings.Default.passwordString;
            hours.Text = Properties.Settings.Default.hours;
            hour1.Checked = Properties.Settings.Default.hour1_checked;
            hour2.Checked = Properties.Settings.Default.hour2_checked;
            hour3.Checked = Properties.Settings.Default.hour3_checked;
            Firefox.Checked = Properties.Settings.Default.FirefoxChecked;
            Chrome.Checked = Properties.Settings.Default.ChromeChecked;
            browserChecked = Properties.Settings.Default.browserChecked;
            Washer1.Checked = Properties.Settings.Default.Washer1Checked;
            Washer2.Checked = Properties.Settings.Default.Washer2Checked;
            Month1st.Checked = Properties.Settings.Default.recordMonth1Checked;
            Month2nd.Checked = Properties.Settings.Default.recordMonth2Checked;
        }
        private void Form1_Close(object sender, EventArgs e)
        {
            Properties.Settings.Default.passwordString = loginString.Text;
            Properties.Settings.Default.passwordString = passwordString.Text;
            Properties.Settings.Default.hours = hours.Text;
            Properties.Settings.Default.hour1_checked = hour1.Checked;
            Properties.Settings.Default.hour2_checked = hour2.Checked;
            Properties.Settings.Default.hour3_checked = hour3.Checked;
            Properties.Settings.Default.FirefoxChecked = Firefox.Checked;
            Properties.Settings.Default.ChromeChecked = Chrome.Checked;
            Properties.Settings.Default.browserChecked = browserChecked;
            Properties.Settings.Default.Washer1Checked = Washer1.Checked;
            Properties.Settings.Default.Washer2Checked = Washer2.Checked;
            Properties.Settings.Default.recordMonth1Checked = Month1st.Checked;
            Properties.Settings.Default.recordMonth2Checked = Month2nd.Checked;
            Properties.Settings.Default.Save();
        }

        private void Chrome_CheckedChanged(object sender, EventArgs e)
        {
            browserChecked = true;
        }

        private void Firefox_CheckedChanged(object sender, EventArgs e)
        {
            browserChecked = true;
        }

        private void infoLabel_Click(object sender, EventArgs e)
        {

        }

        private void Month1st_CheckedChanged(object sender, EventArgs e)
        {
            curNextMonthChecked = true;
        }

        private void Month2nd_CheckedChanged(object sender, EventArgs e)
        {
            curNextMonthChecked = true;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Washer1_CheckedChanged(object sender, EventArgs e)
        {
            washerChecked = true;
        }

        private void Washer2_CheckedChanged(object sender, EventArgs e)
        {
            washerChecked = true;
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }
    }
}
