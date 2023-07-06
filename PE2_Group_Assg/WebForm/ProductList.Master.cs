using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{
    public partial class ProductList : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable categories = GetCategories();

            catList.DataSource = categories;
            catList.DataBind();
        }

        private DataTable GetCategories()
        {
            DataTable categoriesTable = new DataTable();
            categoriesTable.Columns.Add("CategoryID", typeof(int));
            categoriesTable.Columns.Add("CategoryName", typeof(string));

            // Add sample data rows with image URLs and ratings
            categoriesTable.Rows.Add(1, "Watches");
            categoriesTable.Rows.Add(2, "Headphones");
            categoriesTable.Rows.Add(3, "Cameras");

            return categoriesTable;
        }
    }

    
}