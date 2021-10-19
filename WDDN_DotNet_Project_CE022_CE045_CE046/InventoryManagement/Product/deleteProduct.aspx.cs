using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace InventoryManagement.Product
{
    public partial class deleteProduct : System.Web.UI.Page
    {
        string conStr;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("/Login/login.aspx");
            }
            else
            {

            }
            id = Convert.ToInt32(Request.QueryString["id"]);
            conStr = Convert.ToString(Application["constr"]); ;
        }

        protected bool DeleteProduct()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            try
            {
                using (connection)
                {
                    connection.Open();
                    string command = "DELETE FROM Product WHERE ProductId = " + id;
                    SqlCommand cmd = new SqlCommand(command, connection);
                    int rows = cmd.ExecuteNonQuery();
                    if(rows>0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                }
            }
            catch(Exception e)
            {
                Response.Write(e.Message);
            }
            return false;
        }
        protected void No_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Product/viewProduct.aspx");
        }

        protected void Yes_Click(object sender, EventArgs e)
        {
            if(DeleteProduct())
            {
                ViewState["message"] = "Product deleted successfully!!";
                ViewState["status"] = "success";
            }
            else
            {
                ViewState["message"] = "Error deleting your product!!";
                ViewState["status"] = "danger";
            }
        }
    }
}