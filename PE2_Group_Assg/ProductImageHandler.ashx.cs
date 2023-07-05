using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PE2_Group_Assg.WebForm
{
    /// <summary>
    /// Summary description for ProductImageHandler
    /// </summary>
    public class ProductImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string product_id = context.Request.QueryString["product_id"].ToString();
                byte[] image;

                SqlConnection connection = new SqlConnection("Data Source=192.168.0.179,49170; Initial Catalog=CampusTrade; Integrated Security=True; User ID=admin; Password=admin");
            SqlCommand cmd = new SqlCommand("select image from PRODUCT where product_id = " + product_id, connection);
                connection.Open();

                // Initialize a data reader
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                image = (Byte[])reader[0];

                // Configure the Response
                context.Response.BinaryWrite(image);
                context.Response.ContentType = "image/jpg";
                context.Response.End();
            } catch (Exception ex)
            {
                throw ex;
            }
            

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}