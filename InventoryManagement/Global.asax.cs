using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Data;
using System.Web.Configuration;

namespace InventoryManagement
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["constr"] = WebConfigurationManager.ConnectionStrings["connectionStringKeval"].ConnectionString;
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            if(Request.Url.ToString() == "https://localhost:44315/")
            {
                Response.Redirect("/Login/login.aspx");
            }
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}