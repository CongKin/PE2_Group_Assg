using PE2_Group_Assg.Database;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static PE2_Group_Assg.WebForm.ProductList;
using System.Xml.Linq;

namespace PE2_Group_Assg.WebForm
{
    
    public partial class popupItem : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
        
        private int user_id = 0;
        private int amount = 0;
        private int quantity = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.QueryString["productId"] != null){

                    string productId = Request.QueryString["productId"];
                   
                    cartBtn.CommandArgument = productId;
                    GetProductWithID(productId);
                }
            }
        }

        private void GetProductWithID(string productId)
        {

            connection.Open();
            //var products = new List<Products>();
            SqlCommand cmd = new SqlCommand("SELECT name,price,user_id,description,amount FROM PRODUCT WHERE product_id = @ProductId", connection);
            cmd.Parameters.AddWithValue("@ProductId", productId);
            
            
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                int pId = int.Parse(productId);
                string productName = (string)reader["name"];
                decimal price = (decimal)reader["price"];
                this.user_id = (int)reader["user_id"];
                Session["user_id"] = user_id;
                string productDescription = (string)reader["description"];
                this.amount = (int)reader["amount"];

                pImage.ImageUrl = "ProductImageHandler.ashx?product_id=" + pId;
                pName.Text = productName;
                priceLabel.Text = price.ToString();
                pDescrip.InnerText = productDescription;
                
                qty.Attributes["min"] = "0";
                qty.Attributes["max"] = amount.ToString();
                //products.Add(new Products { ProductId=pId,ProductName=productName,Price=price,UserId=userId,ProductDescription=productDescription,Quantity=quantity});
            }
            reader.Close();
            userName.Text = GetUserNameById(this.user_id);
        }

        protected string GetUserNameById(int userId)
        {
            string name = null;
            SqlCommand cmd = new SqlCommand("SELECT first_name,last_name FROM [USER] WHERE user_Id = @UserId", connection);
            cmd.Parameters.AddWithValue("@UserId", userId.ToString());

            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string fName = (string)reader["first_name"];
                string lName = (string)reader["last_name"];
                name = fName +" " + lName;
            }
            reader.Close();
            connection.Close();
            return name;
        }

        
        protected void addToCart(object sender, EventArgs e)
        {
            string productId = Request.QueryString["productId"];
            connection.Open();
            SqlCommand cmd2 = new SqlCommand("insert into CART (user_id, product_id, amount) values (@user_id, @product_id, @quantity);", connection);
            cmd2.Parameters.AddWithValue("@user_id", Session["user_id"]);
            cmd2.Parameters.AddWithValue("@product_id", productId);
            quantity = int.Parse(qty.Value);
            cmd2.Parameters.AddWithValue("@quantity", qty.Value);

            int accountRowAffected = cmd2.ExecuteNonQuery();
            if (accountRowAffected > 0)
            {
                Response.Write("<script>function showPopup() { var result = confirm('Do you want to proceed?'); if (result) { window.location.href = 'CartPage.aspx'; } else {  } } showPopup(); </script>");

                return;
            }

            amount = amount - quantity;
            SqlCommand cmd3 = new SqlCommand("update PRODUCT set amount = @amount WHERE product_id = @productID;", connection);
            cmd3.Parameters.AddWithValue("@product_id", productId);
            cmd3.Parameters.AddWithValue("@amount", amount);
            connection.Close();
        }

        /*protected void button_ClickMinus(object sender, EventArgs e)
        {
            int quantity = int.Parse(qty.Text);
            amount = (int)Session["amount"];
            if (quantity > 0)
            {
                quantity--;
            }
            amt.Text = amount.ToString();
            qty.Text = quantity.ToString();
        }

        protected void button_ClickAdd(object sender, EventArgs e)
        {
            int quantity = int.Parse(qty.Text);
            amount = (int)Session["amount"];
            
            if (quantity < amount)
            {
                quantity++;
            }
            amt.Text = amount.ToString();
            qty.Text = quantity.ToString();
        }*/
    }

    /*public class Products
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int UserId { get; set; }
        public string ProductDescription { get; set; }
        public int Quantity { get; set; }

    }*/


    }