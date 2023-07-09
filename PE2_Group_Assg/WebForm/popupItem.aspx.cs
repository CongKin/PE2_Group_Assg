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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
            int user_id = 0; // seller

            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
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
                user_id = (int)reader["user_id"];
                string productDescription = (string)reader["description"];
                int amount = (int)reader["amount"];

                pImage.ImageUrl = "ProductImageHandler.ashx?product_id=" + pId;
                pName.Text = productName;
                priceLabel.Text = price.ToString();
                pDescrip.InnerText = productDescription;
                amt.Text = amount.ToString();
                
                qty.Attributes["min"] = "1";
                qty.Attributes["max"] = amount.ToString();
                //products.Add(new Products { ProductId=pId,ProductName=productName,Price=price,UserId=userId,ProductDescription=productDescription,Quantity=quantity});
            }
            reader.Close();
            connection.Close();
            userName.Text = GetUserNameById(user_id);
        }

        protected string GetUserNameById(int userId)
        {
            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            connection.Open();

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
            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            string productId = Request.QueryString["productId"];
            int user_id = int.Parse(Database.Database.Base64Decode(Session["user_id"].ToString()));
            int max_amount = 0;
            int cart_amount = 0;
            int amount = int.Parse(qty.Value);

            connection.Open();

            // get maximum amount of the product
            SqlCommand getMaxAmount = new SqlCommand("select amount from PRODUCT where product_id = @product", connection);
            getMaxAmount.Parameters.AddWithValue("@product", productId);
            SqlDataReader maxReader = getMaxAmount.ExecuteReader();
            if(maxReader.Read())
            {
                max_amount = (int)maxReader[0];
                maxReader.Close();
            }
            else
            {
                Response.Write("<script>alert('The item is unvailable. Sorry');</script>");
                maxReader.Close();
                connection.Close();
                return;
            }

            // check the item is in the cart or not
            SqlCommand cmd = new SqlCommand("select amount from CART where user_id = @user and product_id = @product", connection);
            cmd.Parameters.AddWithValue("@user", user_id);
            cmd.Parameters.AddWithValue("@product", productId);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                cart_amount = (int)reader[0];
            }
            reader.Close();

            // calculate total amount to add into cart
            if(cart_amount + amount > max_amount)
            {
                Response.Write("<script>alert('You have exceed the limit of the product. Please check your cart.');</script>");
                connection.Close();
                return;
            }

            // insert or update
            if(cart_amount > 0)
            {
                // if the user has the item in cart
                SqlCommand cmd3 = new SqlCommand("update CART set amount = @amount where user_id = @user and product_id = @product");
                cmd3.Parameters.AddWithValue("@amount", cart_amount + amount);
                cmd3.Parameters.AddWithValue("@user", user_id);
                cmd3.Parameters.AddWithValue("@product", productId);

                int accountRowAffected = cmd3.ExecuteNonQuery();
                if (accountRowAffected > 0)
                {
                    Response.Write("<script>alert('The item is added to your cart');</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('Error in updating cart');</script>");
                }
            }
            else
            {
                // if user do not has the item in cart
                SqlCommand cmd2 = new SqlCommand("insert into CART (user_id, product_id, amount) values (@user_id, @product_id, @quantity);", connection);
                cmd2.Parameters.AddWithValue("@user_id", user_id);
                cmd2.Parameters.AddWithValue("@product_id", productId);
                cmd2.Parameters.AddWithValue("@quantity", amount);

                int accountRowAffected = cmd2.ExecuteNonQuery();
                if (accountRowAffected > 0)
                {
                    Response.Write("<script>alert('The item is added to your cart');</script>");
                    //Response.Write("<script>function showPopup() { var result = confirm('Do you want to proceed?'); if (result) { window.location.href = 'CartPage.aspx'; } else {  } } showPopup(); </script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('Error in updating cart');</script>");
                }
            }

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