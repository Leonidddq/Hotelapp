using System;
using System.Data;
using System.Windows;
using Npgsql;

namespace Carsharing
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
            using var cmd = new NpgsqlCommand("SELECT * FROM car", conn);
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            RoomDataGrid.ItemsSource = dt.DefaultView;
        }

        private void BookRoom_Click(object sender, RoutedEventArgs e)
        {
            if (RoomDataGrid.SelectedItem == null)
            {
                MessageBox.Show("Выберите машину.");
                return;
            }

            DataRowView selectedRow = (DataRowView)RoomDataGrid.SelectedItem;
            string status = selectedRow["status"].ToString();
            int roomId = Convert.ToInt32(selectedRow["id_car"]);

            if (status != "Свободен")
            {
                MessageBox.Show("Данная машина занята.");
                return;
            }

            var bookingWindow = new BookingWindow(roomId);
            bookingWindow.ShowDialog();

            LoadRooms(); // обновление после бронирования
        }
    }
}