using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg.WebForm
{
    public partial class Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //  building drop down lsit
            SqlConnection connection = new SqlConnection(Database.Database.getConnectionString());
            SqlDataAdapter adp = new SqlDataAdapter("select * from BUILDING", connection);

            DataTable buildingList = new DataTable();
            adp.Fill(buildingList);

            building.DataSource = buildingList;
            building.DataBind();
            building.DataTextField = "name";
            building.DataValueField = "building_id";
            building.DataBind();

            // cart detail
            SqlCommand cmd = new SqlCommand("select amount from CART where user_id = @user_id", connection);
            SqlDataReader reader = cmd.ExecuteReader();

            int amount = 0;
            if (reader.Read())
            {
                amount += (int)reader[0];
            }
            reader.Close();
            item_count.Text = "(" + amount + " items)";



        }
    }
}