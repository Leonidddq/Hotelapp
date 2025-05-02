using System;
using System.Windows;
using Npgsql;

namespace Hotel1
{
    public partial class BookingWindow : Window
    {
        private int roomId;
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=kuropatka;Database=er";

        public BookingWindow(int roomId)
        {
            InitializeComponent();
            this.roomId = roomId;
        }

        private void ConfirmBooking_Click(object sender, RoutedEventArgs e)
        {
            string name = NameBox.Text;
            string surname = SurnameBox.Text;
            string sname = SnameBox.Text;
            string passport = PassportBox.Text;
            string phone = PhoneBox.Text;
            string email = EmailBox.Text;
            DateTime checkIn = CheckInPicker.SelectedDate ?? DateTime.Now;
            DateTime checkOut = CheckOutPicker.SelectedDate ?? DateTime.Now.AddDays(1);
            bool paid = PaidCheckBox.IsChecked ?? false;

            using var conn = new NpgsqlConnection(connectionString);
            conn.Open();

            // Вставка в guest
            int guestId;
            using (var cmd = new NpgsqlCommand("INSERT INTO guest (name, surname, sname, passport, phone, email) VALUES (@name, @surname, @sname, @passport, @phone, @email) RETURNING id_guest", conn))
            {
                cmd.Parameters.AddWithValue("name", name);
                cmd.Parameters.AddWithValue("surname", surname);
                cmd.Parameters.AddWithValue("sname", sname);
                cmd.Parameters.AddWithValue("passport", passport);
                cmd.Parameters.AddWithValue("phone", phone);
                cmd.Parameters.AddWithValue("email", email);
                guestId = (int)cmd.ExecuteScalar();
            }

            // Вставка в booking
            using (var cmd = new NpgsqlCommand("INSERT INTO booking (guest_id, room_id, check_in, check_out, paid) VALUES (@guest_id, @room_id, @check_in, @check_out, @paid)", conn))
            {
                cmd.Parameters.AddWithValue("guest_id", guestId);
                cmd.Parameters.AddWithValue("room_id", roomId);
                cmd.Parameters.AddWithValue("check_in", checkIn);
                cmd.Parameters.AddWithValue("check_out", checkOut);
                cmd.Parameters.AddWithValue("paid", paid);
                cmd.ExecuteNonQuery();
            }

            // Обновление статуса номера
            using (var cmd = new NpgsqlCommand("UPDATE room SET status = 'Занят' WHERE id_room = @id", conn))
            {
                cmd.Parameters.AddWithValue("id", roomId);
                cmd.ExecuteNonQuery();
            }

            MessageBox.Show("Бронирование успешно!");
            this.Close();
        }
    }
}