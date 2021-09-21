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
    public partial class updateProduct : System.Web.UI.Page
    {
        string conStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            try
            {
                using(connection)
                {
                    //connection.Open();
                    //int id = Convert.ToInt32(Request.QueryString["id"]);
                    //string command = "SELECT * FROM Product WHERE ProductId = " + id;
                    //SqlCommand cmd = new SqlCommand(command, connection);
                    //SqlDataReader rdr = cmd.ExecuteReader();
                    //int count = 0;
                    //while(rdr.Read())
                    //{
                    //    count++;
                    //}
                    //if(count == 0)
                    //{

                    //}
                }
            }
            catch (Exception err)
            {
                Response.Write("Error: " + err.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}