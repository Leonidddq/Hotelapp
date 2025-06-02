using System.Windows;
using Npgsql;

namespace Carsharing
{
    public partial class ChangePasswordWindow : Window
    {
        private string login;
        private string currentPassword;
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=kuropatka;Database=carsharing";

        public ChangePasswordWindow(string login, string currentPassword)
        {
            InitializeComponent();
            this.login = login;
            this.currentPassword = currentPassword;
        }

        private void ChangePassword_Click(object sender, RoutedEventArgs e)
        {
            string current = CurrentPasswordBox.Password;
            string newPass = NewPasswordBox.Password;
            string confirm = ConfirmPasswordBox.Password;

            if (string.IsNullOrWhiteSpace(current)  || string.IsNullOrWhiteSpace(confirm))
            {
                MessageBox.Show("Все поля обязательны для заполнения.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (current != currentPassword)
            {
                MessageBox.Show("Текущий пароль неверен.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (newPass != confirm)
            {
                MessageBox.Show("Новый пароль и подтверждение не совпадают.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                string query = "UPDATE users SET password = @password, is_first_login = true WHERE login = @login";
                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("password", newPass);
                    cmd.Parameters.AddWithValue("login", login);
                    cmd.ExecuteNonQuery();
                }
            }

            MessageBox.Show("Пароль успешно изменён.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            this.Close();
        }
    }
}