using System;
using System.Linq;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace Hotel1
{
    public partial class CaptchaWindow : Window
    {
        private string captchaText;

        public CaptchaWindow()
        {
            InitializeComponent();
            GenerateCaptcha();
        }

        private void GenerateCaptcha()
        {
            Random rand = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            captchaText = new string(Enumerable.Repeat(chars, 4).Select(s => s[rand.Next(s.Length)]).ToArray());

            DrawingVisual visual = new DrawingVisual();
            using (DrawingContext dc = visual.RenderOpen())
            {
                dc.DrawRectangle(Brushes.White, null, new Rect(0, 0, 300, 100));

                for (int i = 0; i < captchaText.Length; i++)
                {
                    FormattedText text = new FormattedText(
                        captchaText[i].ToString(),
                        System.Globalization.CultureInfo.InvariantCulture,
                        FlowDirection.LeftToRight,
                        new Typeface("Verdana"),
                        40,
                        Brushes.Black,
                        VisualTreeHelper.GetDpi(this).PixelsPerDip);

                    double angle = rand.Next(-30, 30);
                    dc.PushTransform(new RotateTransform(angle, 30 + i * 60, 50));
                    dc.DrawText(text, new Point(30 + i * 60, rand.Next(20, 40)));
                    dc.Pop();
                }

                for (int i = 0; i < 15; i++)
                {
                    dc.DrawLine(new Pen(Brushes.Gray, 1),
                        new Point(rand.Next(0, 300), rand.Next(0, 100)),
                        new Point(rand.Next(0, 300), rand.Next(0, 100)));
                }
            }

            RenderTargetBitmap bmp = new RenderTargetBitmap(300, 100, 96, 96, PixelFormats.Pbgra32);
            bmp.Render(visual);
            CaptchaImage.Source = bmp;
        }

        private void CheckButton_Click(object sender, RoutedEventArgs e)
        {
            if (CaptchaInput.Text.Trim().ToUpper() == captchaText)
            {
                DialogResult = true;
            }
            else
            {
                DialogResult = false;
            }
            Close();
        }
    }
}