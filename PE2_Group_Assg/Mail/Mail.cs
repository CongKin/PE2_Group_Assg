using MailKit.Net.Smtp;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Text;
using System.Xml.Linq;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.Mail
{
    public class Mail
    {
        public static void SendVerificationCode(string receiver_address, string verification_code)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(receiver_address.Trim());
            mail.Subject = "Campus Trade Email Verfication Code";
            mail.Body = "<p>Dear User, <br /><br /> Your verification code is: " + verification_code + " <br /><br />"
                + "Please enter this code to complete the verification process.<br /><br />Thank you.<p>";
            mail.IsBodyHtml = true;

            sendMail(mail);
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

        public static void sendTransactionEmails(int transaction_id)
        {
            decimal total = 0;
            string payment = "";
            string buyer_name = "";
            string buyer_email = "";

            DateTime currentDate = DateTime.Now;

            // send notification to buyer
            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            connection.Open();
            SqlCommand cmd = new SqlCommand("select [TRANSACTION].TOTAL, PAYMENT_METHOD.name, CONCAT([USER].first_name, ' ', [USER].last_name) as buyer_name, " +
                "[USER].email from [TRANSACTION], PAYMENT_METHOD, [USER] where [TRANSACTION].payment_method_id = PAYMENT_METHOD.method_id " +
                "and [TRANSACTION].transaction_id = @trans and [TRANSACTION].user_id = [USER].user_id;", connection);
            cmd.Parameters.AddWithValue("@trans", transaction_id);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                total = (decimal)reader[0];
                payment = (string)reader[1];
                buyer_name = (string)reader[2];
                buyer_email = (string)reader[3];
            }
            reader.Close();

            MailMessage buyer_mail = new MailMessage();
            buyer_mail.To.Add(buyer_email.Trim());
            buyer_mail.Subject = "Confirmation of Your Transaction";
            buyer_mail.Body = "<p>Dear " + buyer_email + ",</p>"
                + "<p>Thank you for choosing our services and for completing your recent transaction with us. We are writing to confirm the details of your transaction and provide any relevant information you may need.</p>"
                + "<h3>Transaction Details:</h3>"
                + "<ul>" + "<li>Transaction ID: " + transaction_id + "</li>"
                + "<li>Date: " + currentDate.ToString() + "</li>"
                + "<li>Amount: " + total + "</li>"
                + "<li>Payment Method: " + payment + "</li></ul>"
                + "<p>We would like to assure you that your transaction has been successfully processed, and the payment has been received. If you have any questions or concerns regarding your transaction, please do not hesitate to contact our customer support team at campustrade180@gmail.com. We are here to assist you and provide any additional information you may require.</p>"
                + "<p>Additionally, we want to express our gratitude for choosing our services. Your trust and support are highly valued, and we will continue striving to provide you with exceptional service and meet your expectations.</p>"
                + "<p>Please retain this email for your records. If you need any further assistance or have any other inquiries, feel free to reach out to us.</p>"
                + "<p>Thank you once again for your transaction, and we look forward to serving you in the future.</p>"
                + "<p>Best regards,<br>"
                + "Campus Trade </p>";
            buyer_mail.IsBodyHtml = true;

            sendMail(buyer_mail);

            // send notification to seller
            SqlCommand cmd2 = new SqlCommand("select [USER].email as seller_email, CONCAT([USER].first_name, ' ', [USER].last_name) as seller_name, PRODUCT.name, " +
                "PRODUCT.price, TRANSACTION_PRODUCT.amount, PAYMENT_METHOD.name " +
                "from [USER], PRODUCT, [TRANSACTION], TRANSACTION_PRODUCT, PAYMENT_METHOD " +
                "where [TRANSACTION].transaction_id = TRANSACTION_PRODUCT.transaction_id and TRANSACTION_PRODUCT.product_id = PRODUCT.product_id " +
                "and PRODUCT.user_id = [USER].user_id and [TRANSACTION].payment_method_id = PAYMENT_METHOD.method_id " +
                "and [TRANSACTION].transaction_id = @trans;", connection);
            cmd2.Parameters.AddWithValue("@trans", transaction_id);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            while (reader2.Read())
            {
                string seller_email = (string)reader2[0];
                string seller_name = (string)reader2[1];
                string product_name = (string)reader2[2];
                decimal price = (decimal)reader2[3];
                int amount = (int)reader2[4];
                string method = (string)reader2[5];

                MailMessage seller_mail = new MailMessage();
                seller_mail.To.Add(seller_email.Trim());
                seller_mail.Subject = "Transaction Confirmation - " + seller_name;
                seller_mail.Body = "<p>Dear " + seller_name + ",</p>" +
                    "<p>We are writing to confirm that a transaction has taken place for the sale of " + product_name +
                    ". As the seller, we want to provide you with the details of this transaction for your reference:</p>"+
                    "<h3>Transaction Details:</h3>"+
                    "<ul>" +
                    "<li>Buyer's Name: " +  buyer_name+ "</li>" +
                    "<li>Transaction ID:" + transaction_id + "</li>" +
                    "<li>Date of Transaction: " + currentDate + "</li>" +
                    "<li>Product Name: " + product_name + "</li>" +
                    "<li>Total Amount: RM " + amount * price +"</li>" +
                    "<li>Payment Method: " + method + "</li>"+
                    "</ul>"+
                    "<p>Please review the provided information and ensure its accuracy. If you have any concerns or questions regarding this transaction, " +
                    "please don't hesitate to contact us immediately at campustrade180@gmail.com. We are here to assist you and address any issues that may arise.</p>"+
                    "<p>We kindly request your prompt attention to this matter. As per our policy, please prepare the item for shipment to the buyer within " +
                    "5 working days and provide us with the tracking information once available. This will help us ensure a smooth and timely delivery to the buyer.</p>"+
                    "<p>We appreciate your cooperation and professionalism in handling this transaction. Your dedication to customer satisfaction is highly valued, " +
                    "and we trust that you will provide excellent service to the buyer.</p>"+
                    "<p>Thank you for your attention to this matter. We look forward to a successful transaction and a continued partnership between our businesses.</p>"+
                    "<p>Best regards,<br> Campus Trade </p>";

                seller_mail.IsBodyHtml = true;
                sendMail(seller_mail);
            }
        }

        private static void sendMail(MailMessage mail)
        {
            string sender_address = "campustrade180@gmail.com";
            string app_password = "xopdxfpadojzjosb";
            int port = 587;
            string host = "smtp.gmail.com";

            mail.From = new MailAddress(sender_address);

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