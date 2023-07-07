using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{
    public partial class ResetPwd1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_clicked(object sender, EventArgs e)
        {
            string password_text1 = newPwd.Text;
            string password_text2 = repPwd.Text;

            if(password_text1 != password_text2)
            {
                Response.Write("<script>alert('The repeat password is not correct. Please repeat same password');</script>");
                return;
            }

            string email_text = Database.Database.Base64Decode(Session["email_veri"].ToString());
            string salt = GenerateRandomString(8);

            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            SqlCommand cmd = new SqlCommand("update ACCOUNT set password = @password, salt=@salt  where email = @email", connection);
            cmd.Parameters.AddWithValue("@email", email_text);
            cmd.Parameters.AddWithValue("@password", Database.Database.HashString(password_text1));
            cmd.Parameters.AddWithValue("@salt", salt);
            connection.Open();

            int AccountRowAffected = cmd.ExecuteNonQuery();
            connection.Close();

            if(AccountRowAffected > 0) {
                Response.Write("<script>alert('Your password is updated');</script>");
                Session["email_veri"] = null;
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error in updating password');</script>");
            }


        }

        private static Random random = new Random();
        private const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        private static string GenerateRandomString(int length)
        {
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}