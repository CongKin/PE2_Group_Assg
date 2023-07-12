using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{
    public partial class Reset1 : System.Web.UI.Page
    {
        private string veri_code;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void send_clicked(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                string email_text = email.Text;
                SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
                SqlCommand cmd = new SqlCommand("select COUNT(*) from ACCOUNT where email = @email;", connection);
                cmd.Parameters.AddWithValue("email", email_text);
                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                if ((int)reader[0] <= 0)
                {
                    Response.Write("<script>alert('The email is not registered');</script>");
                    reader.Close();
                    connection.Close();
                    return;
                }
                reader.Close();

                Random random = new Random();
                veri_code = random.Next(1, 999999).ToString("D6");

                Mail.Mail.SendVerificationCode(email_text, veri_code);
                Response.Write("<script>alert('The verification code is sent to to your email');</script>");
            }
        }

        protected void submit_clicked(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                string email_text = email.Text;
                string veriCode_text = verifCode.Text.Trim();

                SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
                SqlCommand cmd = new SqlCommand("select COUNT(*) from ACCOUNT where email = @email;", connection);
                cmd.Parameters.AddWithValue("email", email_text);
                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                if ((int)reader[0] <= 0)
                {
                    Response.Write("<script>alert('The email is not registered');</script>");
                    reader.Close();
                    connection.Close();
                    return;
                }
                reader.Close();
                connection.Close();

                if (!veriCode_text.Equals(veri_code))
                {
                    Session["email_veri"] = Database.Database.Base64Encode(email_text);
                    Response.Redirect("ResetPwd.aspx");
                }
                else
                {
                    Response.Write("<script>alert('The verification code is not correct. Please check your email properly or resend the verification code');</script>");
                }
            }
        }
    }
}