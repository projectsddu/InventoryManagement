using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryManagement.Admin
{
    public partial class Add_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("/Login/login.aspx");
            }
            else
            {

            }
        }

        protected bool isAdminExisting(string username)
        {
            
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = Convert.ToString(Application["constr"]);
            try
            {
                using(connection)
                {
                    connection.Open();
                    string command = "SELECT * FROM AdminUser WHERE Username='" + username + "'";
                    int count = 0;
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while(rdr.Read())
                    {
                        count++;
                    }
                    if (count==0)
                    {
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }
            }
            catch(Exception err)
            {
                return false;
            }
        }


        protected void addCategoryBtn_Click(object sender, EventArgs e)
        {
            string newAdminName = TextBoxNewAdminName.Text;
            string newAdminPassword = TextBoxNewAdminPassword.Text;
            string rootAdminPassword = TextBoxCurrentAdminPassword.Text;
            if(rootAdminPassword=="admin")
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = Convert.ToString(Application["constr"]);
                try
                {
                    using(connection)
                    {
                        connection.Open();
                        string command = "INSERT INTO AdminUser (Username,Password,EmailAddress) VALUES ('" + newAdminName + "','" + newAdminPassword + "','not@considered.com')";
                        SqlCommand cmd = new SqlCommand(command, connection);
                        if (isAdminExisting(newAdminName) == true)
                        {
                            ViewState["message"] = "Admin is already existing!";
                            ViewState["status"] = "danger";
                        }
                        else
                        { 
                            int n = cmd.ExecuteNonQuery();
                            if (n > 0)
                            {
                                ViewState["message"] = "Success New Admin Added!";
                                ViewState["status"] = "success";
                            }
                            else
                            {
                                ViewState["message"] = "Error adding new Admin!";
                                ViewState["status"] = "danger";
                            }
                        }
                        
                    }
                }
                catch(Exception err)
                {

                }
            }
            else
            {
                LabelErrorMessage.Text = "* Root Admin Password is not valid!";
            }
        }
    }
}