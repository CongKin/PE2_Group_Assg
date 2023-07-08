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

namespace PE2_Group_Assg
{
    public partial class CartPage : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["user_id"] = Database.Database.Base64Encode("6");

                InitProductsTable();
                
                Bind();
                cartList.DataSource = GetProductsTable();
                cartList.DataBind();
                subtotal.Text = CalculateSubtotal().ToString();
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
            

            /*SqlCommand cmd = new SqlCommand("select PRODUCT.product_id, PRODUCT.name, PRODUCT.price, PRODUCT.description, PRODUCT.amount as max_amount, CART.amount as cart_amount from PRODUCT, CART where PRODUCT.product_id = CART.product_id and CART.user_id = @user_id;", con);
            cmd.Parameters.AddWithValue("@user_id", user_id.ToString());*/
            SqlCommand cmd = new SqlCommand("select PRODUCT.price, CART.amount from PRODUCT, CART where PRODUCT.product_id = CART.product_id and CART.user_id = @user_id  ", connection);
            int userId = int.Parse(Database.Database.Base64Decode(Session["user_id"].ToString()));

            cmd.Parameters.AddWithValue("@user_id", userId);
            SqlDataReader reader = cmd.ExecuteReader();

            

            while (reader.Read())
            {
                int pId = 0;
                int amount = 0;
                pId = (int)reader["PRODUCT.product_id"];
                amount = (int)reader["cart_amount"];


                /*SqlCommand cmd2 = new SqlCommand("select name, price, description,amount from PRODUCT where product_id = @ProductId", con);
                cmd2.Parameters.AddWithValue("@ProductId", pId.ToString());*/

                /*while (reader.Read())
                {*/
                    string productName = (string)reader["PRODUCT.name"];
                    decimal price = (decimal)reader["PRODUCT.price"];
                    string productDescription = (string)reader["PRODUCT.description"];
                    int maxAmount = (int)reader["max_amount"];

                    AddProducts(pId, productName, price, productDescription, amount, maxAmount);
                //}
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

        /*protected void dl1_EditCommand(object sender, DataListCommandEventArgs e)
        {
            cartList.EditItemIndex = e.Item.ItemIndex;
            Bind();
        }
        protected void dl1_CancelCommand(object sender, DataListCommandEventArgs e)
        {
            cartList.EditItemIndex = -1;
            Bind();
        }*/
        /*protected void dl1_updateCommand(object sender, DataListCommandEventArgs e)
        {
            int index = e.Item.ItemIndex;
            int productID = Convert.ToInt32(((TextBox)cartList.Items[index].FindControl("txtempid")).Text);
            string  = ((TextBox)cartList.Items[index].FindControl("txtempname")).Text;
            string empmail = ((TextBox)cartList.Items[index].FindControl("txtempmail")).Text;
            long empmbnum = Convert.ToInt64(((TextBox)cartList.Items[index].FindControl("txtmbnum")).Text);
            FileUpload fu = (FileUpload)cartList.Items[index].FindControl("fu1");
            // to update image name in data base and image in server, If he selectted new Image  
            if (fu.HasFile)
            {
                string filepath = System.IO.Path.Combine(Server.MapPath("~/Images/"), fu.FileName);
                fu.SaveAs(filepath);
                SqlCommand fcmd = new SqlCommand();
                fcmd.CommandText = "update employee set EmpImage='" + fu.FileName + "'";
                fcmd.Connection = con;
                con.Open();
                fcmd.ExecuteNonQuery();
                con.Close();
            }
            SqlCommand cmd = new SqlCommand("update Employee set EmpName = '" + empname + "',EmpEmailId='" + empmail + "',EmpMobileNum =" + empmbnum + " where EmpId = " + empid + "", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                Response.Write("<script>alert('Successfully updated')</script>");
                cartList.EditItemIndex = -1;
                Bind();
            }
        }
        protected void dl1_DeleteCommand(object sender, DataListCommandEventArgs e)
        {
            int index = e.Item.ItemIndex;
            Label empid;
            empid = (Label)cartList.Items[index].FindControl("lblempid");

            SqlCommand cmd = new SqlCommand("delete from employee where EmpId = " + Convert.ToInt32(empid.Text) + "", con);
            con.Open();
            int res = cmd.ExecuteNonQuery();
            con.Close();
            if (res == 1)
            {
                Response.Write("<script>alert('Successfully deleted')</script>");
                Bind();
            }

        }*/
    }
}