using System;
using System.Data;
using System.Windows;
using Npgsql;

namespace Carsharing
{
    public partial class EditUserWindow : Window
    {
        private int userId;
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=kuropatka;Database=er";

        public EditUserWindow(DataRowView row)
        {
            InitializeComponent();
            userId = Convert.ToInt32(row["id_users"]);

            LoginBox.Text = row["login"].ToString();
            PasswordBox.Text = row["password"].ToString();
            SurnameBox.Text = row["surname"].ToString();
            NameBox.Text = row["name"].ToString();
            SnameBox.Text = row["sname"].ToString();
            RoleBox.Text = row["role2"].ToString();
            CountBox.Text = row["count"].ToString();
            ActiveBox.Text = row["active"].ToString();
            FirstLoginBox.Text = row["is_first_login"].ToString();
            DateBox.Text = Convert.ToDateTime(row["date"]).ToString("yyyy-MM-dd");
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (!int.TryParse(RoleBox.Text, out int role) ||
                !int.TryParse(CountBox.Text, out int count) ||
                !bool.TryParse(ActiveBox.Text, out bool active) ||
                !bool.TryParse(FirstLoginBox.Text, out bool isFirstLogin) ||
                !DateTime.TryParse(DateBox.Text, out DateTime date))
            {
                MessageBox.Show("Проверьте правильность введённых данных.");
                return;
            }

            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                string query = @"UPDATE users SET 
                    login=@login, password=@password, surname=@surname, name=@name, sname=@sname,
                    role2=@role2, count=@count, active=@active, is_first_login=@is_first_login, date=@date
                    WHERE id_users=@id";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("login", LoginBox.Text);
                    cmd.Parameters.AddWithValue("password", PasswordBox.Text);
                    cmd.Parameters.AddWithValue("surname", SurnameBox.Text);
                    cmd.Parameters.AddWithValue("name", NameBox.Text);
                    cmd.Parameters.AddWithValue("sname", SnameBox.Text);
                    cmd.Parameters.AddWithValue("role2", role);
                    cmd.Parameters.AddWithValue("count", count);
                    cmd.Parameters.AddWithValue("active", active);
                    cmd.Parameters.AddWithValue("is_first_login", isFirstLogin);
                    cmd.Parameters.AddWithValue("date", date);
                    cmd.Parameters.AddWithValue("id", userId);
                    cmd.ExecuteNonQuery();
                }
            }

            MessageBox.Show("Пользователь успешно обновлён.");
            DialogResult = true;
            Close();
        }
    }
}