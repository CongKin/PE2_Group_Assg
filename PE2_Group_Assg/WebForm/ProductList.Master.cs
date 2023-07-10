using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using static PE2_Group_Assg.WebForm.ProductList;

namespace PE2_Group_Assg.WebForm
{

    public partial class ProductList : System.Web.UI.MasterPage
    {
        SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());

        protected void Page_Load(object sender, EventArgs e)
        {
            Mail.Mail.sendTransactionEmails(1005);

            // check user is login or not
            if (isLogin())
            {
                account_button.Text = "Logout";
                welcome.Text = "Welcome, " + getName();
            }
            else
            {
                account_button.Text = "Login";
                welcome.Text = "Welcome, user";
            }

            
            // Retrieve categories from the database
            List<Category> categories = new List<Category>();
            
            categories = GetCategoriesFromDatabase();

            // Bind the categories to the list control
            catList.DataSource = categories;
            catList.DataBind();


        }

        public void Bind()
        {
            SqlCommand cmd = new SqlCommand("select * from CATEGORY", connection);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet, "CATEGORY");
            catList.DataSource = dataSet.Tables[0];
            catList.DataBind();
        }

        protected void categoryList_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                int categoryId = int.Parse(e.CommandArgument.ToString());

                // Redirect to another page and pass the category ID as a query parameter
                if(categoryId == 0)
                {
                    Response.Redirect("ProductListPage.aspx");
                }
                else
                {
                    Response.Redirect("ProductListPage.aspx?categoryId=" + categoryId);
                }
               
            }
        }

        protected void account_clicked(object sender, EventArgs e)
        {
            if(!isLogin())
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session["user_id"] = null;
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }

        protected void cart_clicked(object sender, EventArgs e)
        {
            if(!isLogin())
            {
                Response.Write("<script>alert('You haven't login, Please login to your account');</script>");
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("CartPage.aspx");
            }
        }

        protected void addProduct_clicked(object sender, EventArgs e)
        {
            if(!isLogin())
            {
                Response.Write("<script>alert('You haven't login, Please login to your account');</script>");
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("AddProduct.aspx");
            }
        }

        protected void search_clicked(object sender, EventArgs e)
        {
            string search_Text = searchTextBox.Text;
            if (search_Text.IsNullOrWhiteSpace())
            {
                Response.Redirect("ProductListPage.aspx");
            }
            else
            {
                Response.Redirect("ProductListPage.aspx?keyword=" + search_Text);
            }
        }


        private List<Category> GetCategoriesFromDatabase()
        {
            // Code to retrieve categories from the database using ADO.NET or an ORM
            // Example using ADO.NET:

            var categories = new List<Category>();
            Category category = new Category();
            category.CategoryId = 0;
            category.CategoryName = "All Category";
            categories.Add(category);
            // Create a connection to the SQL Server database
            using (SqlConnection connection = new SqlConnection(Database.Database.getConnectionString()))
            {
                connection.Open();

                // Create a command to execute the SQL query
                using (var command = new SqlCommand("SELECT * FROM CATEGORY", connection))
                {
                    // Execute the query and read the results
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int categoryId = (int)reader["category_id"];
                            string categoryName = (string)reader["name"];

                            categories.Add(new Category { CategoryId = categoryId, CategoryName = categoryName });
                        }
                        reader.Close();
                    }
                }

                connection.Close();
               
            }

            return categories;
        }
        public class Category
        {
            public int CategoryId { get; set; }
            public string CategoryName { get; set; }
        }

        private bool isLogin()
        {
            if (Session["user_id"] == null)
                return false;
            else
                return true;
        }

        private string getName()
        {
            int user_id = int.Parse(Database.Database.Base64Decode(Session["user_id"].ToString()));
            string name = string.Empty;
            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            connection.Open();
            SqlCommand command = new SqlCommand("select first_name, last_name from [USER] where user_id = @user", connection);
            command.Parameters.AddWithValue("@user", user_id);
            SqlDataReader reader = command.ExecuteReader();
            if(reader.Read())
            {
                name += (string)reader[0];
                name += " ";
                name += (string)reader[1];
            }
            reader.Close();
            connection.Close();
            return name;
        }

        /*private DataTable GetCategories()
        {
            DataTable categoriesTable = new DataTable();
            categoriesTable.Columns.Add("CategoryID", typeof(int));
            categoriesTable.Columns.Add("CategoryName", typeof(string));

            // Add sample data rows with image URLs and ratings
            categoriesTable.Rows.Add(1, "Watches");
            categoriesTable.Rows.Add(2, "Headphones");
            categoriesTable.Rows.Add(3, "Cameras");

            return categoriesTable;
        }*/
    }

    
}