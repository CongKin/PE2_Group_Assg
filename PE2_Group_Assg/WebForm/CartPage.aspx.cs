using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using PE2_Group_Assg.WebForm;
using Org.BouncyCastle.Asn1.Ocsp;
using System.Web.UI.HtmlControls;

namespace PE2_Group_Assg
{
    public partial class CartPage : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["user_id"] = Database.Database.Base64Encode("");

            if(!IsPostBack)
            {
                /*if (Request.Form["productId"] != null)
                {
                    string productId = Request.Form["productId"];
                    string quantity = Request.Form["quantity"];

                    // Update the database with the new quantity
                    UpdateQuantityInDatabase(productId, quantity);

                }*/

                InitProductsTable();
                
                Bind();
                cartList.DataSource = GetProductsTable();
                cartList.DataBind();
                subtotal.Text = "RM " + CalculateSubtotal().ToString("0.00");
            }
        }

        private DataTable pTable = new DataTable();

        private void InitProductsTable()
        {
            pTable.Columns.Add("ProductID", typeof(int));
            pTable.Columns.Add("ProductName", typeof(string));
            pTable.Columns.Add("Price", typeof(decimal));
            pTable.Columns.Add("ProductDescription", typeof(string));
            pTable.Columns.Add("ProductQuantity", typeof(int));
            pTable.Columns.Add("MaxQuantity", typeof(int));
            pTable.Columns.Add("TotalPrice", typeof(decimal));
            pTable.PrimaryKey = new DataColumn[] { pTable.Columns["ProductID"] };
        }
        private void AddProducts(int pId, string pName, decimal price, string pdesc, int qty, int maxQty) {

            DataRow existingRow = pTable.Rows.Find(pId);

            if (existingRow != null)
            {
                int existingQty = Convert.ToInt32(existingRow["ProductQuantity"]);
                int newQty = existingQty + qty;
                decimal existingPrice = Convert.ToDecimal(existingRow["Price"]);
                decimal newTotal = Convert.ToDecimal(newQty) * existingPrice;
                existingRow["ProductQuantity"] = newQty;
                existingRow["TotalPrice"] = newTotal;
            }
            else
            {
                decimal total_price = Convert.ToDecimal(qty * price);
                pTable.Rows.Add(pId, pName, price, pdesc, qty,maxQty, total_price);
            }
            
        }

        private DataTable GetProductsTable()
        {
            return pTable;
        }

        public void Bind()
        {
            connection.Open();
            /*SqlCommand cmd = new SqlCommand("select product_id, amount from CART where user_Id = @UserId", con);
            cmd.Parameters.AddWithValue("@UserId", user_id.ToString());*/
            DataTable dt = new DataTable();


            SqlCommand cmd = new SqlCommand("select PRODUCT.product_id, PRODUCT.name, PRODUCT.price, PRODUCT.description, PRODUCT.amount as max_amount, CART.amount as cart_amount " +
                "from PRODUCT, CART where PRODUCT.product_id = CART.product_id and CART.user_id = @user_id and PRODUCT.amount>0;", connection);
            int userId = int.Parse(Database.Database.Base64Decode(Session["user_id"].ToString()));

            cmd.Parameters.AddWithValue("@user_id", userId);
            SqlDataReader reader = cmd.ExecuteReader();

            

            while (reader.Read())
            {
                int pId = 0;
                int amount = 0;
                pId = (int)reader["product_id"];
                amount = (int)reader["cart_amount"];
                string productName = (string)reader["name"];
                decimal price = (decimal)reader["price"];
                string productDescription = (string)reader["description"];
                int maxAmount = (int)reader["max_amount"];

                AddProducts(pId, productName, price, productDescription, amount, maxAmount);
                
            }
        }

        private decimal CalculateSubtotal()
        {
            decimal subtotal = 0;

            foreach (DataRow row in pTable.Rows)
            {
                decimal totalPrice = Convert.ToDecimal(row["TotalPrice"]);
                subtotal += totalPrice;
            }

            return subtotal;
        }

        protected void save_OnClick(object sender, EventArgs e)
        {
            foreach (DataListItem item in cartList.Items)
            {
                HtmlInputGenericControl qtyInput = (HtmlInputGenericControl)item.FindControl("qtyInput");
                if (qtyInput != null)
                {
                    string productId = qtyInput.Attributes["data-productid"];
                    int quantity = Convert.ToInt32(qtyInput.Value);

                    UpdateQuantityInDatabase(productId, quantity);
                }
            }
            Bind();
            cartList.DataSource = GetProductsTable();
            cartList.DataBind();
            subtotal.Text = CalculateSubtotal().ToString();
        }

        protected void checkout_OnClick(object sender, EventArgs e)
        {
            if(decimal.Parse(subtotal.Text) > 0)
            {
                foreach (DataListItem item in cartList.Items)
                {
                    HtmlInputGenericControl qtyInput = (HtmlInputGenericControl)item.FindControl("qtyInput");
                    if (qtyInput != null)
                    {
                        string productId = qtyInput.Attributes["data-productid"];
                        int quantity = Convert.ToInt32(qtyInput.Value);

                        UpdateQuantityInDatabase(productId, quantity);
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Cart is empty.');</script>");
            }
            

            Response.Redirect("Transaction.aspx");
        }

        private void UpdateQuantityInDatabase(string productId, int quantity)
        {
            connection.Open();
            // Update the database with the new quantity using SQL query or stored procedure
            if(quantity <= 0)
            {
                SqlCommand cmd2 = new SqlCommand("delete from CART WHERE product_id = @productID;", connection);
                cmd2.Parameters.AddWithValue("@productID", productId);
                cmd2.ExecuteNonQuery();
                Response.Write("<script>alert('deleted');</script>");
            }
            else
            {
                SqlCommand cmd3 = new SqlCommand("update CART set amount = @amount WHERE product_id = @productID;", connection);
                cmd3.Parameters.AddWithValue("@productID", productId);
                cmd3.Parameters.AddWithValue("@amount", quantity.ToString());
                cmd3.ExecuteNonQuery();
                
            }
           
            connection.Close();
        }
    }
}