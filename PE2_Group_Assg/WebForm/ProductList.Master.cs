using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{

    public partial class ProductList : System.Web.UI.MasterPage
    {
        SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());

        protected void Page_Load(object sender, EventArgs e)
        {
            /*DataTable categories = GetCategories();

            catList.DataSource = categories;
            catList.DataBind();*/
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

        protected void CategoryList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                int categoryId = int.Parse(e.CommandArgument.ToString());

                // Redirect to another page and pass the category ID as a query parameter
                Response.Redirect("ProductListPage.aspx?categoryId=" + categoryId);
            }
        }

        private List<Category> GetCategoriesFromDatabase()
        {
            // Code to retrieve categories from the database using ADO.NET or an ORM
            // Example using ADO.NET:

            var categories = new List<Category>();

            // Create a connection to the SQL Server database
            using (var connection = new SqlConnection("YourConnectionString"))
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
                    }
                }
            }

            return categories;
        }
        public class Category
        {
            public int CategoryId { get; set; }
            public string CategoryName { get; set; }
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