using System;
using System.Data;
using System.Windows;
using Npgsql;

namespace Hotel1
{
    public partial class ClientWindow : Window
    {
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=kuropatka;Database=er";

        public ClientWindow()
        {
            InitializeComponent();
            LoadRooms();
        }

        private void LoadRooms()
        {
            using var conn = new NpgsqlConnection(connectionString);
            conn.Open();
            using var cmd = new NpgsqlCommand("SELECT * FROM room", conn);
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            RoomDataGrid.ItemsSource = dt.DefaultView;
        }

        private void BookRoom_Click(object sender, RoutedEventArgs e)
        {
            if (RoomDataGrid.SelectedItem == null)
            {
                MessageBox.Show("Выберите номер.");
                return;
            }

            DataRowView selectedRow = (DataRowView)RoomDataGrid.SelectedItem;
            string status = selectedRow["status"].ToString();
            int roomId = Convert.ToInt32(selectedRow["id_room"]);

            if (status != "Чистый")
            {
                MessageBox.Show("Данный номер занят.");
                return;
            }

            var bookingWindow = new BookingWindow(roomId);
            bookingWindow.ShowDialog();

            LoadRooms(); // обновление после бронирования
        }
    }
}