using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;
using System.Data;
using System.Web.Configuration;

namespace InventoryManagement.Login
{
    public partial class login : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

       


        protected void loginBtn_Click(object sender, EventArgs e)
        {
            string name = username.Text;
            string passWord = password.Text;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // validation 
            try
            {
                using(connection)
                {
                    connection.Open();
                    string command = "SELECT * FROM AdminUser WHERE Username = '" +
                        name + "' AND Password = '" + passWord + "'";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    int count = 0;
                    while(rdr.Read()) { 
                    
                        count = count + 1;
                    }

                    if(count == 1)
                    {
                        Response.Write("success");
                        Session["userName"] = name;
                        Session.Timeout = 300;
                        Response.Redirect("https://localhost:44315/home/home.aspx");
                    }
                    else
                    {
                        ViewState["errorMessage"] = "Wrong username or password!!";
                        
                    }
                    connection.Close();
                }
            }
            catch(Exception err)
            {
                Response.Write("Error:" + err.Message);
            }
            

        }
    }
}