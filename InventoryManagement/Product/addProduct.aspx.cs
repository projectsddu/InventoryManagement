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
    public partial class addProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            try
            {
                using(connection)
                {
                    connection.Open();
                    string command = "SELECT (CategoryName) FROM Category";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while(rdr.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = rdr["CategoryName"].ToString();
                        categoryDropdown.Items.Add(new ListItem(item.Text));
                    }
                    rdr.Close();
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