using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE2_Group_Assg
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void openModalButton_Click(object sender, EventArgs e)
        {
            modalPopup.Show();
        }

        protected void closeModalButton_Click(object sender, EventArgs e)
        {
            modalPopup.Hide();
        }
    }
}