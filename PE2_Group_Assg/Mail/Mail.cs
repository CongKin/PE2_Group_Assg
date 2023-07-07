using MailKit.Net.Smtp;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

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
    }
}