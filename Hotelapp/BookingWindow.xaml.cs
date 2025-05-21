using System;
using System.Windows;
using Npgsql;

namespace Carsharing
{
    public partial class BookingWindow : Window
    {
        private int carId;
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=kuropatka;Database=er";

        public BookingWindow(int carId)
        {
            InitializeComponent();
            this.carId = carId;
        }

        private void ConfirmBooking_Click(object sender, RoutedEventArgs e)
        {
            string name = NameBox.Text;
            string surname = SurnameBox.Text;
            string secondname = SecondnameBox.Text;
            string passport = PassportBox.Text;
            string phone = PhoneBox.Text;
            string email = EmailBox.Text;
            DateTime checkIn = CheckInPicker.SelectedDate ?? DateTime.Now;
            DateTime checkOut = CheckOutPicker.SelectedDate ?? DateTime.Now.AddDays(1);
            bool paid = PaidCheckBox.IsChecked ?? false;

            using var conn = new NpgsqlConnection(connectionString);
            conn.Open();

            
            int guestId;
            using (var cmd = new NpgsqlCommand("INSERT INTO guest (name, surname, secondname, passport, phone, email) VALUES (@name, @surname, @secondname, @passport, @phone, @email) RETURNING id_guest", conn))
            {
                cmd.Parameters.AddWithValue("name", name);
                cmd.Parameters.AddWithValue("surname", surname);
                cmd.Parameters.AddWithValue("secondname", secondname);
                cmd.Parameters.AddWithValue("passport", passport);
                cmd.Parameters.AddWithValue("phone", phone);
                cmd.Parameters.AddWithValue("email", email);
                guestId = (int)cmd.ExecuteScalar();
            }

            // Вставка в booking
            using (var cmd = new NpgsqlCommand("INSERT INTO booking (guest_id, car_id, check_in, check_out, paid) VALUES (@guest_id, @car_id, @check_in, @check_out, @paid)", conn))
            {
                cmd.Parameters.AddWithValue("guest_id", guestId);
                cmd.Parameters.AddWithValue("car_id", carId);
                cmd.Parameters.AddWithValue("check_in", checkIn);
                cmd.Parameters.AddWithValue("check_out", checkOut);
                cmd.Parameters.AddWithValue("paid", paid);
                cmd.ExecuteNonQuery();
            }

            // Обновление статуса номера
            using (var cmd = new NpgsqlCommand("UPDATE car SET status = 'Занят' WHERE id_car = @id", conn))
            {
                cmd.Parameters.AddWithValue("id", carId);
                cmd.ExecuteNonQuery();
            }

            MessageBox.Show("Бронирование успешно!");
            this.Close();
        }
    }
}