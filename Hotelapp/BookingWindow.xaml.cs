using System;
using System.Windows;
using Npgsql;

namespace Carsharing
{
    public partial class BookingWindow : Window
    {
        private int serviceId;
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=kuropatka;Database=carsharing";

        public BookingWindow(int serviceId)
        {
            InitializeComponent();
            this.serviceId = serviceId;
        }

        private void ConfirmBooking_Click(object sender, RoutedEventArgs e)
        {
            string name = NameBox.Text;
            string surname = SurnameBox.Text;
            string secondname = SecondnameBox.Text;
            string passport = PassportBox.Text;
            string phone = PhoneBox.Text;
            string address = AddresslBox.Text;
            DateTime checkIn = CheckInPicker.SelectedDate ?? DateTime.Now;
            bool paid = PaidCheckBox.IsChecked ?? false;

            using var conn = new NpgsqlConnection(connectionString);
            conn.Open();

            
            int guestId;
            using (var cmd = new NpgsqlCommand("INSERT INTO guest (name, surname, secondname, passport, phone, address) VALUES (@name, @surname, @secondname, @passport, @phone, @address) RETURNING id_guest", conn))
            {
                cmd.Parameters.AddWithValue("name", name);
                cmd.Parameters.AddWithValue("surname", surname);
                cmd.Parameters.AddWithValue("secondname", secondname);
                cmd.Parameters.AddWithValue("passport", passport);
                cmd.Parameters.AddWithValue("phone", phone);
                cmd.Parameters.AddWithValue("address", address);
                guestId = (int)cmd.ExecuteScalar();
            }

            // Вставка в booking
            using (var cmd = new NpgsqlCommand("INSERT INTO booking (guest_id, service_id, check_in, paid) VALUES (@guest_id, @service_id, @check_in, @paid)", conn))
            {
                cmd.Parameters.AddWithValue("guest_id", guestId);
                cmd.Parameters.AddWithValue("service_id", serviceId);
                cmd.Parameters.AddWithValue("check_in", checkIn);
                cmd.Parameters.AddWithValue("paid", paid);
                cmd.ExecuteNonQuery();
            }

            // Обновление статуса номера
            using (var cmd = new NpgsqlCommand("UPDATE services SET status = 'Занят' WHERE id_service = @id", conn))
            {
                cmd.Parameters.AddWithValue("id", serviceId);
                cmd.ExecuteNonQuery();
            }

            MessageBox.Show("Бронирование успешно!");
            this.Close();
        }
    }
}