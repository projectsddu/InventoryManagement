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
    public partial class addCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void addCategoryBtn_Click(object sender,EventArgs e)
        {

            string categoryName = TextBoxcategoryName.Text;
            // Making a connection to DB.
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            try
            {
                using (connection)
                {
                    connection.Open();
                    //check entered category is already present or not.
                    string command = "SELECT * FROM Category WHERE CategoryName = '" +
                        categoryName + "'";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    
                    int count = 0;
                    while(rdr.Read())
                    {
                        count++;
                    }
                    connection.Close();
                    if (count == 0)
                    {
                        // success
                        command = "INSERT INTO Category (CategoryName) VALUES ('" +
                       categoryName + "')";
                        //Response.Write(command);
                        cmd = new SqlCommand(command, connection);
                        connection.Open();
                        int rows = cmd.ExecuteNonQuery();
                        connection.Close();

                        if (rows > 0)
                        {
                            ViewState["message"] = "Success! your category is added!!";
                            ViewState["status"] = "success";
                        }
                        else
                        {
                            ViewState["message"] = "Failed! your category is not added!!";
                            ViewState["status"] = "danger";
                        }
                    }
                    else
                    {
                        ViewState["message"] = "Failed! your category is already present!!";
                        ViewState["status"] = "danger";
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