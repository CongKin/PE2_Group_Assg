using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Schema;

namespace PE2_Group_Assg.WebForm
{
    public partial class Transaction : System.Web.UI.Page
    {
        private decimal total_price = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user_id"] = Database.Database.Base64Encode("6");

            //  building drop down lsit
            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            connection.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select * from BUILDING", connection);

            DataTable buildingList = new DataTable();
            adp.Fill(buildingList);

            building.DataSource = buildingList;
            building.DataBind();
            building.DataTextField = "name";
            building.DataValueField = "building_id";
            building.DataBind();

            // cart detail
            SqlCommand cmd = new SqlCommand("select PRODUCT.price, CART.amount from PRODUCT, CART where PRODUCT.product_id = CART.product_id and CART.user_id = @user_id and PRODUCT.amount > 0 ", connection);
            int userId = int.Parse(Database.Database.Base64Decode(Session["user_id"].ToString()));

            cmd.Parameters.AddWithValue("@user_id", userId);
            SqlDataReader reader = cmd.ExecuteReader();

            total_price = 0;
            int total_amount = 0;

            while (reader.Read())
            {
                decimal price = 0;
                int amount = 0;

                price = (decimal)reader[0];
                amount = (int)reader[1];

                total_price += price * amount;
                total_amount += amount;
            }

            item_count.Text = "(" + total_amount +" items)";
            item_price.Text = "RM" + String.Format("{0:0.00}", total_price);

            total.Text = "RM" + String.Format("{0:0.00}", total_price /* + shipping_fee */); 
            reader.Close();

            connection.Close();
        }

        protected void submit_clicked(object sender, EventArgs e)
        {
            string fullname_text = name.Text;
            string phoneNumber_text = phone.Text;
            int building_id = Convert.ToInt32(building.SelectedItem.Value);
            string roomNo_text = room.Text;
            string message_text = message.Text;
            int payment_id = 0;
            int user_id = int.Parse(Database.Database.Base64Decode(Session["user_id"].ToString()));

            int cart_amount = 0;
            string email = "";

            if(cod.Checked == true)
            {
                payment_id = 1;
            }
            else if(tng.Checked == true)
            {
                payment_id = 2;
            }

            // sql connection
            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            connection.Open();

            // get cart product count
            SqlCommand getCartAmount = new SqlCommand("select CART.count(*) from CART,PRODUCT where CART.user_id = @user and CART.product_id = PRODUCT.product_id and PRODUCT.amount>0", connection);
            getCartAmount.Parameters.AddWithValue("@user", user_id);

            SqlDataReader reader1 = getCartAmount.ExecuteReader();
            if(reader1.Read())
            {
                cart_amount = (int)reader1[0];
            }
            else
            {
                Response.Write("<script>alert('Error in updating transaction information. No item in cart');</script>");
                reader1.Close();
                connection.Close();
                return;
            }
            reader1.Close();

            // insert transaction
            SqlCommand cmd = new SqlCommand("insert into [TRANSACTION] (full_name, phone_number, building_id, room_number, message, payment_method_id, total, user_id) "
                +"values(@name, @phone, @building, @room, @message, @payment, @total, @user)", connection);
            cmd.Parameters.AddWithValue("@name", fullname_text);
            cmd.Parameters.AddWithValue("@phone", phoneNumber_text);
            cmd.Parameters.AddWithValue("@building", building_id);
            cmd.Parameters.AddWithValue("@room", roomNo_text);  
            cmd.Parameters.AddWithValue("@message", message_text);
            cmd.Parameters.AddWithValue("@payment", payment_id);
            cmd.Parameters.AddWithValue("@total", total_price);
            cmd.Parameters.AddWithValue("@user", user_id);

            int transactionRowAffected = cmd.ExecuteNonQuery();

            if(transactionRowAffected <= 0)
            {
                Response.Write("<script>alert('Error in updating transaction information 1');</script>");
                connection.Close();
                return;
            }

            // get the transaciton id 
            SqlCommand getTransactionId = new SqlCommand("select transaction_id from [TRANSACTION] where user_id = @user order by transaction_id DESC", connection);
            getTransactionId.Parameters.AddWithValue("@user", user_id);

            int transaction_id = 0;
            SqlDataReader reader = getTransactionId.ExecuteReader();
            if(reader.Read())
            {
                transaction_id= (int)reader[0];
            }
            else
            {
                Response.Write("<script>alert('Error in updating transaction information 2');</script>");
                reader.Close();
                connection.Close();
                return;
            }
            reader.Close();

            // insert product in the transaction
            SqlCommand cmd2 = new SqlCommand("insert into TRANSACTION_PRODUCT (transaction_id, product_id, amount) " +
                "select @tran_id, CART.product_id, CART.amount from CART, PRODUCT where CART.user_id = @user and CART.product_id = PRODUCT.product_id and PRODUCT.amount>0", connection);
            cmd2.Parameters.AddWithValue("@tran_id", transaction_id);
            cmd2.Parameters.AddWithValue("@user", user_id);

            int transactionProductRowAffected = cmd2.ExecuteNonQuery();
            if(transactionProductRowAffected != cart_amount)
            {
                Response.Write("<script>alert('Error in updating transaction information 3');</script>");
                connection.Close();
                return;
            }

            // reduce amount at product table
            SqlCommand cmd3 = new SqlCommand("update PRODUCT set PRODUCT.amount = PRODUCT.amount - CART.amount"+
                " from CART where PRODUCT.product_id = CART.product_id and CART.user_id = @user and PRODUCT.amount > 0;");
            cmd3.Parameters.AddWithValue("@user", user_id);
            int productRowAffected = cmd3.ExecuteNonQuery();
            if (productRowAffected != cart_amount)
            {
                Response.Write("<script>alert('Error in updating transaction information 4');</script>");
                connection.Close();
                return;
            }

            // send Email to buyer and seller
            Mail.Mail.sendTransactionEmails(transaction_id);

            // clear the user cart
            SqlCommand cmd4 = new SqlCommand("delete from CART where user_id = @user and product_id in (select product_id from PRODUCT where amount>0)", connection);
            cmd3.Parameters.AddWithValue("@user", user_id);

            int cartRowAffected = cmd4.ExecuteNonQuery();
            if (cartRowAffected != cart_amount)
            {
                Response.Write("<script>alert('Error in updating transaction information 4');</script>");
                connection.Close();
                return;
            }
            else
            {
                Response.Write("<script>alert('You have successfully done the transaciton');</script>");
                connection.Close();
                Response.Redirect("ProductListPage.aspx");
            }
        }
    }
}