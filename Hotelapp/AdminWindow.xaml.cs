using System;
using System.Data;
using System.Windows;
using Npgsql;
using System.Windows.Controls;

namespace Carsharing
{
    public partial class AdminWindow : Window
    {
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=kuropatka;Database=carsharing";

        public AdminWindow()
        {
            InitializeComponent();
            LoadUsers();
        }

        private void LoadUsers()
        {
            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT * FROM users", conn))
                {
                    using (var adapter = new NpgsqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        GridUser.ItemsSource = dt.DefaultView;
                    }
                }
            }
        }

        private void button3_Click(object sender, RoutedEventArgs e)
        {
            string login = TextBox1.Text;
            string password = TextBox2.Text;
            string surname = TextBox3.Text;
            string name = TextBox4.Text;
            string sname = TextBox5.Text;

            if (typeRole.SelectedItem is ComboBoxItem selectedItem && selectedItem.Tag != null)
            {
                int role = int.Parse(selectedItem.Tag.ToString());

                using (var conn = new NpgsqlConnection(connectionString))
                {
                    conn.Open();

                    // Проверка на существование логина
                    string checkQuery = "SELECT COUNT(*) FROM users WHERE login = @login";
                    using (var checkCmd = new NpgsqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("login", login);
                        int userCount = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (userCount > 0)
                        {
                            MessageBox.Show("Пользователь с таким логином уже существует!");
                            return; // Прерываем добавление
                        }
                    }

                    // Добавление нового пользователя
                    string insertQuery = @"INSERT INTO users
                    (login, password, surname, name, sname, role2, count, active, is_first_login, date)
                    VALUES (@login, @password, @surname, @name, @sname, @role2, 0, true, false, CURRENT_DATE)";
                    using (var insertCmd = new NpgsqlCommand(insertQuery, conn))
                    {
                        insertCmd.Parameters.AddWithValue("login", login);
                        insertCmd.Parameters.AddWithValue("password", password);
                        insertCmd.Parameters.AddWithValue("surname", surname);
                        insertCmd.Parameters.AddWithValue("name", name);
                        insertCmd.Parameters.AddWithValue("sname", sname);
                        insertCmd.Parameters.AddWithValue("role2", role);
                        insertCmd.ExecuteNonQuery();
                    }
                }

                MessageBox.Show("Пользователь добавлен!");
                LoadUsers();
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите роль из списка!");
            }
        }
        private void button4_Click(object sender, RoutedEventArgs e)
        {
            if (GridUser.SelectedItem is DataRowView row)
            {
                var editWindow = new EditUserWindow(row);
                if (editWindow.ShowDialog() == true)
                {
                    LoadUsers(); // Обновить таблицу после сохранения
                }
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите пользователя для изменения.");
            }

        }
        private void buttonDelete_Click(object sender, RoutedEventArgs e)
        {
            if (GridUser.SelectedItem is DataRowView row)
            {
                int userId = Convert.ToInt32(row["id_users"]);

                var result = MessageBox.Show("Вы действительно хотите удалить этого пользователя?",
                                             "Подтверждение удаления", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                if (result == MessageBoxResult.Yes)
                {
                    using (var conn = new NpgsqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "DELETE FROM users WHERE id_users = @id";
                        using (var cmd = new NpgsqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("id", userId);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    MessageBox.Show("Пользователь удален.");
                    LoadUsers(); // Обновляем таблицу
                }
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите пользователя для удаления.");
            }
        }
        private void buttonExit_Click(object sender, RoutedEventArgs e)
        {
            Authorization mainWindow = new Authorization();
            mainWindow.Show();
            this.Close();
        }
    }
}