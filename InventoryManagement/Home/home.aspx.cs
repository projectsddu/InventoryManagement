using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace InventoryManagement.Home
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userName"] == null)
            {
                Response.Redirect("https://localhost:44315/login/login.aspx");
            }
            else
            {
             
            }
        }
    }
}