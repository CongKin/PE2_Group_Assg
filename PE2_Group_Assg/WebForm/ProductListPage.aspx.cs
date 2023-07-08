using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static PE2_Group_Assg.WebForm.ProductList;

namespace PE2_Group_Assg.WebForm
{
    public partial class ProductListPage : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["categoryId"] != null)
                {
                    string categoryId = Request.QueryString["categoryId"];

                    if (categoryId.Equals("0"))
                    {
                        Bind();
                    }
                    else
                    {

                        SqlCommand cmd = new SqlCommand("SELECT name FROM CATEGORY WHERE category_id = @CategoryId", connection);
                        cmd.Parameters.AddWithValue("@CategoryId", categoryId);

                        SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                        DataTable catTable = new DataTable();
                        dataAdapter.Fill(catTable);

                        if (catTable.Rows.Count > 0)
                        {
                            string categoryName = catTable.Rows[0]["name"].ToString();
                            catTitle.Text = categoryName;
                        }

                        GetProductWithCategory(categoryId);
                    }
                }
                else
                {
                    Bind();
                }

                //Bind();
                /*DataTable pTable = GetProducts();

                // Set the data source and bind it to the DataList
                productList.DataSource = pTable;
                productList.DataBind();*/
            }
        }

        public void Bind()
        {
            SqlCommand cmd = new SqlCommand("select * from PRODUCT where amount > 0", connection);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet, "PRODUCT");
            if(productList.DataSource == dataSet.Tables[0])
            {
                return;
            }
            else
            {
                productList.DataSource = dataSet.Tables[0];
                productList.DataBind();
            }
        }

        private void GetProductWithCategory(string categoryId)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM PRODUCT WHERE category_id = @CategoryId and amount > 0", connection);
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);

            SqlDataAdapter dataAdapter1 = new SqlDataAdapter(cmd);
            DataTable productTable = new DataTable();
            dataAdapter1.Fill(productTable);

            productList.DataSource = productTable;
            productList.DataBind();
        }
        private DataTable GetProducts()
        {
            DataTable pTable= new DataTable();
            pTable.Columns.Add("ProductID", typeof(int));
            pTable.Columns.Add("ProductName", typeof(string));
            pTable.Columns.Add("Price", typeof(decimal));
            pTable.Columns.Add("ProductImageUrl", typeof(string));
            pTable.Columns.Add("UserName", typeof(string));
            pTable.Columns.Add("ProductQuantity", typeof(int));

            pTable.Rows.Add(1, "Product1", 199.89, "../Images/product-tag.jpg","abc",1);

            return pTable;

        }

        /*protected void button_Click(object sender, EventArgs e)
        {

        }
        protected void openModalButton_Click(object sender, EventArgs e)
        {
            modalPopup.Show();
        }

        protected void closeModalButton_Click(object sender, EventArgs e)
        {
            modalPopup.Hide();
        }*/
        

        /*protected void openModalButton_Click(object sender, EventArgs e)
        {
            modalPopup.Show();
        }*/

        /*protected void productList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "OpenModal")
            {
                // Retrieve the relevant data for the selected item
                //string productId= e.CommandArgument.ToString();
                // Perform data retrieval or processing based on the itemID

                // Set the data in the modal panel
                //modalDataLabel.Text = "Data for Item ID: " + itemID;

                // Show the modal panel
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "showModal();", true);
            }
        }*/

    }
}