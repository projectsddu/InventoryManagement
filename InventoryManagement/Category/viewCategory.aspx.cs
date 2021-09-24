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

namespace InventoryManagement.Category
{
    public partial class viewCategory : System.Web.UI.Page
    {
        [Serializable]
        protected class Category
        {
            public int CategoryId { get; set; }

            public string CategoryName { get; set; }
        }

        string conStr;
        protected void Page_Load(object sender, EventArgs e)
        {
            conStr = Convert.ToString(Application["constr"]);
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;

            try
            {
                using(connection)
                {
                    connection.Open();
                    string command = "SELECT * FROM Category";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    List<Category> categories = new List<Category>();
                    while(rdr.Read())
                    {
                        Category category = new Category() { 
                            CategoryId = Convert.ToInt32(rdr["CategoryId"]),
                            CategoryName = Convert.ToString(rdr["CategoryName"])
                        };
                        categories.Add(category);
                    }

                    ViewState["categories"] = categories;
                }
            }
            catch(Exception err)
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