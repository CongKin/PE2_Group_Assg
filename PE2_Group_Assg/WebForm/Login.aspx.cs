using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_clicked(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
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
                    reader.Close();
                }
                else
                {
                    Response.Write("<script>alert('The email is not registered');</script>");
                    reader.Close();
                    connection.Close();
                    return;
                }

                // get hash
                string passwordText = Database.Database.HashString(password.Text + salt);

                SqlCommand cmd2 = new SqlCommand("select COUNT(*) from ACCOUNT where email = @email and password = @password", connection);
                cmd2.Parameters.AddWithValue("@email", emailText);
                cmd2.Parameters.AddWithValue("@password", passwordText);

                SqlDataReader reader2 = cmd2.ExecuteReader();

                if (!reader2.Read())
                {
                    Response.Write("<script>alert('The password is incorrect');</script>");
                    reader.Close();
                    connection.Close();
                    return;
                }

                reader2.Close();

                SqlCommand cmd3 = new SqlCommand("select user_id from [USER] where email = @email", connection);
                cmd3.Parameters.AddWithValue("@email", emailText);

                SqlDataReader reader3 = cmd3.ExecuteReader();
                if (reader3.Read())
                {
                    user_id = (int)reader3[0];
                    Session["user_id"] = Database.Database.Base64Encode(user_id.ToString());
                    reader3.Close();
                    connection.Close();
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Error in retrieve user information');</script>");
                    reader3.Close();
                    connection.Close();
                }
            }
        }
    }
}