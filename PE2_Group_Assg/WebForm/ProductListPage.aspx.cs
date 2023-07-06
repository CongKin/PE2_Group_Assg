using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{
    public partial class ProductListPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable pTable= GetProducts();

                // Set the data source and bind it to the DataList
                productList.DataSource = pTable;
                productList.DataBind();
            }
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
        protected void button_ClickMinus(object sender, EventArgs e)
        {
            
        }

        /*protected void button_ClickAdd(object sender, EventArgs e)
        {

        }

        protected void openModalButton_Click(object sender, EventArgs e)
        {
            modalPopup.Show();
        }
*/
        /*protected void productList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "OpenModal")
            {
                // Retrieve the relevant data for the selected item
                //string itemID = e.CommandArgument.ToString();
                // Perform data retrieval or processing based on the itemID

                // Set the data in the modal panel
                //modalDataLabel.Text = "Data for Item ID: " + itemID;

                // Show the modal panel
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "showModal();", true);
            }
        }*/


    }
}