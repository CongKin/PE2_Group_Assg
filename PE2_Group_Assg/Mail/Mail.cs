using MailKit.Net.Smtp;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Text;

namespace PE2_Group_Assg.Mail
{
    public class Mail
    {
        public static void SendVerificationCode(string receiver_address, string verification_code)
        {
            string sender_address = "campustrade180@gmail.com";
            string app_password = "xopdxfpadojzjosb";
            int port = 587;
            string host = "smtp.gmail.com";

            MailMessage mail = new MailMessage();
            mail.To.Add(receiver_address.Trim());
            mail.From = new MailAddress(sender_address);
            mail.Subject = "Campus Trade Email Verfication Code";
            mail.Body = "<p>Dear User, <br /><br /> Your verification code is: " + verification_code + " <br /><br />"
                + "Please enter this code to complete the verification process.<br /><br />Thank you.<p>";
            mail.IsBodyHtml = true;


            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
            smtp.Port = port;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = host;
            smtp.Credentials = new System.Net.NetworkCredential(sender_address, app_password);
            smtp.Send(mail);
        }

        public static void SendTransactionDone(string receiver_address, int transaction_id)
        {
            string sender_address = "campustrade180@gmail.com";
            string app_password = "xopdxfpadojzjosb";
            int port = 587;
            string host = "smtp.gmail.com";

            decimal total = 0;
            string payment ="";
            string name = "";

            DateTime currentDate = DateTime.Now;

            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            connection.Open();

            SqlCommand cmd = new SqlCommand("select [TRANSACTION].TOTAL, PAYMENT_METHOD.name, [USER].first_name, [USER].last_name from [TRANSACTION], PAYMENT_METHOD, [USER] " +
                "where [TRANSACTION].payment_method_id = PAYMENT_METHOD.method_id and [TRANSACTION].transaction_id = @tran_id and [TRANSACTION].user_id = [USER].user_id", connection);
            cmd.Parameters.AddWithValue("@tran_id", transaction_id);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                total = (decimal)reader[0];
                payment = (string)reader[1];
                name += (string)reader[2];
                name += " ";
                name += (string)reader[3];
            }

            MailMessage mail = new MailMessage();
            mail.To.Add(receiver_address.Trim());
            mail.From = new MailAddress(sender_address);
            mail.Subject = "Confirmation of Your Transaction";
            mail.Body = "<p>Dear " + name + ",</p>"
                + "<p>Thank you for choosing our services and for completing your recent transaction with us. We are writing to confirm the details of your transaction and provide any relevant information you may need.</p>"
                + "<h3>Transaction Details:</h3>"
                + "<ul>"+"<li>Transaction ID: " + transaction_id + "</li>"
                +"<li>Date: " + currentDate.ToString() + "</li>"
                +"<li>Amount: " + total + "</li>"
                +"<li>Payment Method: " + payment + "</li></ul>"
                + "<p>We would like to assure you that your transaction has been successfully processed, and the payment has been received. If you have any questions or concerns regarding your transaction, please do not hesitate to contact our customer support team at campustrade180@gmail.com. We are here to assist you and provide any additional information you may require.</p>"
                + "<p>Additionally, we want to express our gratitude for choosing our services. Your trust and support are highly valued, and we will continue striving to provide you with exceptional service and meet your expectations.</p>"
                + "<p>Please retain this email for your records. If you need any further assistance or have any other inquiries, feel free to reach out to us.</p>"
                + "<p>Thank you once again for your transaction, and we look forward to serving you in the future.</p>"
                + "<p>Best regards,<br>"
                + "Campus Trade </p>";
            mail.IsBodyHtml = true;

            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
            smtp.Port = port;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = host;
            smtp.Credentials = new System.Net.NetworkCredential(sender_address, app_password);
            smtp.Send(mail);
        }
    }
}