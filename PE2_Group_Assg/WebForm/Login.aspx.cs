using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_clicked (object sender, EventArgs e)
        {
            if (IsPostBack) {
                string emailText = email.Text;
                string salt = "";
                int user_id = 0;

                SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
                SqlCommand cmd = new SqlCommand("select salt from ACCOUNT where email = @email", connection);
                cmd.Parameters.AddWithValue("@email", emailText);
                connection.Open();

                // get salt
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    salt = (string)reader[0];
                    error_email.Text = "";
                    reader.Close();
                }
                else
                {
                    error_email.Text = "The email is not registered";
                    //Response.Write("<script>alert('The email is not registered');</script>");
                    reader.Close();
                    return;
                }

                // get hash
                string passwordText = Database.Database.HashString(password.Text + salt);

                SqlCommand cmd2 = new SqlCommand("select user_id from ACCOUNT where email = @email and password = @password", connection);
                cmd2.Parameters.AddWithValue("@email", emailText);
                cmd2.Parameters.AddWithValue("@password", passwordText);

                SqlDataReader reader2 = cmd2.ExecuteReader();
                if (reader2.Read())
                {
                    user_id = (int)reader2[0];
                    Session["user_id"] = Database.Database.Base64Encode(user_id.ToString());
                    error_password.Text = Database.Database.Base64Encode(user_id.ToString());
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    error_password.Text = "The password is incorrect";
                    return;
                }

            }    
        }
    }
}