using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{
    public partial class CreateAcc1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create_clicked(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string fname_text;
                string lname_text;
                string gender_text;
                string dob_text;
                string email_text;
                string password_text;
                string salt;
                bool gender_bool;

                email_text = email.Text;
                SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
                SqlCommand cmd = new SqlCommand("select COUNT(*) from ACCOUNT where email = @email;", connection);
                cmd.Parameters.AddWithValue("email", email_text);
                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                if ((int)reader[0] > 0) 
                {
                    Response.Write("<script>alert('The email is registered');</script>");
                    return;
                }
                reader.Close();

                fname_text = firstName.Text;
                lname_text = lastName.Text;
                gender_text = gender.SelectedItem.Value;
                salt = GenerateRandomString(8);
                password_text = Database.Database.HashString(password.Text + salt); ;
                dob_text = dob.Text;

                if (gender_text == "Female")
                {
                    gender_bool = false;
                }
                else if (gender_text == "Male")
                {
                    gender_bool = true;
                }
                else
                {
                    Response.Write("<script>alert('Error in convert gender');</script>");
                    return;
                }

                SqlCommand cmd2 = new SqlCommand("insert into ACCOUNT (email, password, salt) values (@email, @password, @salt);", connection);
                cmd2.Parameters.AddWithValue("@email", email_text);
                cmd2.Parameters.AddWithValue("@password", password_text);
                cmd2.Parameters.AddWithValue("@salt", salt);

                int accountRowAffected = cmd2.ExecuteNonQuery();
                if(accountRowAffected <= 0)
                {
                    Response.Write("<script>alert('Error in register user account 1');</script>");
                    return;
                }

                SqlCommand cmd3 = new SqlCommand("insert into [USER] (first_name, last_name, gender, date_of_birth, email) values (@fname, @lname, @gender, @dob, @email);", connection);
                cmd3.Parameters.AddWithValue("@fname", fname_text);
                cmd3.Parameters.AddWithValue("@lname", lname_text);
                cmd3.Parameters.AddWithValue("@gender", gender_bool);
                cmd3.Parameters.AddWithValue("@dob", Convert.ToDateTime(dob_text));
                cmd3.Parameters.AddWithValue("@email", email_text);

                int userRowAffected = cmd3.ExecuteNonQuery();

                if (userRowAffected <= 0)
                {
                    Response.Write("<script>alert('Error in register user account 2');</script>");
                    return;
                }

                SqlCommand cmd_getUserId = new SqlCommand("select user_id from [USER] where email = @email", connection);
                cmd_getUserId.Parameters.AddWithValue("@email", email_text);

                SqlDataReader reader2 = cmd_getUserId.ExecuteReader();
                if (reader2.Read())
                {
                    int user_id = (int)reader2[0];
                    Session["user_id"] = Database.Database.Base64Encode(user_id.ToString());
                    reader2.Close();
                    connection.Close();
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Error in retrieve user information');</script>");
                    reader2.Close();
                    connection.Close();
                }

            }
        }

        private static Random random = new Random();
        private const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        public static string GenerateRandomString(int length)
        {
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}