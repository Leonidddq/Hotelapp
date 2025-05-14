using Npgsql;
using System.Windows;
using System;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Hotel1
{
    public partial class MainWindow : Window
    {
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=kuropatka;Database=er";

        private int failedAttempts = 0;
        private bool isBlocked = false;

        public MainWindow()
        {
            InitializeComponent();
        }

        private async void Button1_Click(object sender, RoutedEventArgs e)
        {
            if (isBlocked)
            {
                MessageBox.Show("Подождите перед следующей попыткой входа.", "Блокировка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            string login = TextBox1.Text;
            string password = TextBox2.Password;

            if (string.IsNullOrWhiteSpace(login) || string.IsNullOrWhiteSpace(password))
            {
                MessageBox.Show("Поля Логин и Пароль обязательны для заполнения", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // если были ошибки -> сначала капча
            if (failedAttempts >= 1)
            {
                CaptchaWindow captchaWindow = new CaptchaWindow();
                if (captchaWindow.ShowDialog() != true)
                {
                    await BlockLoginAsync();
                    return;
                }
            }

            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();

                using (var cmd = new NpgsqlCommand("SELECT * FROM users WHERE login = @login", conn))
                {
                    cmd.Parameters.AddWithValue("login", login);

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            MessageBox.Show("Пользователь не найден", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                            return;
                        }

                        string storedPassword = reader["password"].ToString();
                        int count = Convert.ToInt32(reader["count"]);
                        bool active = Convert.ToBoolean(reader["active"]);
                        bool isFirstLogin = Convert.ToBoolean(reader["is_first_login"]);
                        int role = Convert.ToInt32(reader["role2"]);
                        DateTime? date = reader["date"] != DBNull.Value ? Convert.ToDateTime(reader["date"]) : (DateTime?)null;

                        reader.Close();

                        if (isFirstLogin && date.HasValue && (DateTime.Now - date.Value).TotalDays > 30)
                        {
                            using (var blockCmd = new NpgsqlCommand("UPDATE users SET active = false WHERE login = @login", conn))
                            {
                                blockCmd.Parameters.AddWithValue("login", login);
                                blockCmd.ExecuteNonQuery();
                            }

                            MessageBox.Show("Ваш аккаунт заблокирован за несвоевременную смену пароля.", "Блокировка", MessageBoxButton.OK, MessageBoxImage.Warning);
                            return;
                        }

                        if (!active)
                        {
                            MessageBox.Show("Вы заблокированы. Обратитесь к администратору.", "Блокировка", MessageBoxButton.OK, MessageBoxImage.Warning);
                            return;
                        }

                        if (storedPassword == password)
                        {
                            if (!isFirstLogin)
                            {
                                var cpw = new ChangePasswordWindow(login, password);
                                cpw.ShowDialog();
                                return;
                            }


                            using (var updateCmd = new NpgsqlCommand("UPDATE users SET date = @date, count = 0 WHERE login = @login", conn))
                            {
                                updateCmd.Parameters.AddWithValue("date", DateTime.Now);
                                updateCmd.Parameters.AddWithValue("login", login);
                                updateCmd.ExecuteNonQuery();
                            }

                            MessageBox.Show("Успешный вход", "ОК", MessageBoxButton.OK, MessageBoxImage.Information);

                            if (role == 1)
                            {
                                new AdminWindow().Show();
                            }
                            else if (role == 4)
                            {
                                new ClientWindow().Show();
                            }
                            else
                            {
                                MessageBox.Show("Неизвестная роль пользователя", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                            }

                            this.Close();
                        }
                        else
                        {
                            count++;
                            failedAttempts++;

                            if (count > 2)
                            {
                                using (var block = new NpgsqlCommand("UPDATE users SET count = @count, active = false WHERE login = @login", conn))
                                {
                                    block.Parameters.AddWithValue("count", count);
                                    block.Parameters.AddWithValue("login", login);
                                    block.ExecuteNonQuery();
                                }

                                MessageBox.Show("Аккаунт заблокирован после 3 неверных попыток.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                            else
                            {
                                using (var updateCount = new NpgsqlCommand("UPDATE users SET count = @count WHERE login = @login", conn))
                                {
                                    updateCount.Parameters.AddWithValue("count", count);
                                    updateCount.Parameters.AddWithValue("login", login);
                                    updateCount.ExecuteNonQuery();
                                }

                                MessageBox.Show("Неверный пароль. Осталось попыток: " + (3 - count), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                        }
                    }
                }
            }
        }

        private async Task BlockLoginAsync()
        {
            isBlocked = true;
            Button1.IsEnabled = false;
            await Task.Delay(10000);
            Button1.IsEnabled = true;
            isBlocked = false;
        }
    }
}
