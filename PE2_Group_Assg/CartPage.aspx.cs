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

namespace PE2_Group_Assg
{
    public partial class CartPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
            }
        }

            /*public void Bind()
            {
                SqlCommand cmd = new SqlCommand("select * from Employee", con);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet, "Employee");
                cartList.DataSource = dataSet.Tables[0];
                cartList.DataBind();
            }

            protected void dl1_EditCommand(object sender, DataListCommandEventArgs e)
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