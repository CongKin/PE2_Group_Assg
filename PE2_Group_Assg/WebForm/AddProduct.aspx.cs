using Antlr.Runtime.Tree;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user_id"] = Database.Database.Base64Encode("6");

            // drop down list - category 
            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            connection.Open();

            SqlDataAdapter adp = new SqlDataAdapter("select * from CATEGORY", connection);

            DataTable categorylist = new DataTable();
            adp.Fill(categorylist);

            category.DataSource = categorylist;
            category.DataBind();
            category.DataTextField = "name";
            category.DataValueField = "category_id";
            category.DataBind();

            connection.Close();
        }

        protected void submit_clicked(object sender, EventArgs e)
        {
            string name_text = name.Text;
            string description_text = description.Text;
            int category_id = Convert.ToInt32(category.SelectedItem.Value);
            byte[] bytes;
            decimal price_value = Convert.ToDecimal(price.Text);
            int amount_value = Convert.ToInt32(amount.Text);
            int user_id = int.Parse(Database.Database.Base64Decode(Session["user_id"].ToString()));

            using (Stream fs = image.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    bytes = br.ReadBytes((Int32)fs.Length);
                }
            }

            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            connection.Open();
            SqlCommand cmd = new SqlCommand("insert into PRODUCT (name, price, user_id, description, amount, category_id, image) values (@name, @price, @user, @description, @amount, @category_id, @image", connection);
            cmd.Parameters.AddWithValue("@name", name_text);
            cmd.Parameters.AddWithValue("@price", price_value);
            cmd.Parameters.AddWithValue("@user", user_id);
            cmd.Parameters.AddWithValue("description", description_text);
            cmd.Parameters.AddWithValue("@amoumt", amount_value);
            cmd.Parameters.AddWithValue("@category_id", category_id);
            cmd.Parameters.AddWithValue("@image", bytes);

            int productRowAffected = cmd.ExecuteNonQuery();
            if (productRowAffected > 0)
            {
                Response.Write("<script>alert('Your product is added successfully');</script>");
                Response.Redirect("ProductListPage.aspx");
                connection.Close();
            }
            else
            {
                Response.Write("<script>alert('Error in adding your product');</script>");
                connection.Close();
                return;
            }

        }
    }
}