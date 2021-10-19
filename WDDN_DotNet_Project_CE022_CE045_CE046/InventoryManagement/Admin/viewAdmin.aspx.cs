using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryManagement.Admin
{
    public partial class viewAdmin : System.Web.UI.Page
    {
        [Serializable]
        public class Admin
        {
            public int adminId { get; set; }
            public string adminName { get; set; }
        }

        [Serializable]
        public class AdminList
        {
            public List<Admin> adminList { get; set; }
            public AdminList()
            {
                
            }
            public void setData(string conStr)
            {
                
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("/Login/login.aspx");
            }
            else
            {

            }
            List<Admin> adminList = new List<Admin>();


            string conStr = Convert.ToString(Application["constr"]);


            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            try
            {
                connection.Open();
                string command = "SELECT * FROM AdminUser";
                SqlCommand cmd = new SqlCommand(command, connection);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Admin ad = new Admin() { adminId = Convert.ToInt32(rdr["UserId"]), adminName = Convert.ToString(rdr["Username"]) };
                    adminList.Add(ad);
                }
                ViewState["data"] = adminList;
            }
            catch (Exception err)
            {

            }






        }
    }
}