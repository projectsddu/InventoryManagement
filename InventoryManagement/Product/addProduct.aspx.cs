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
        SqlConnection connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection();
            connection.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        protected int getCategoryId(string categoryName)
        {
            using(connection)
            {
                connection.Open();
                try
                {
                    string command = "SELECT * from Category WHERE CategoryName='" + categoryName+"'";
                    SqlCommand cmd = new SqlCommand(command,connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    List<int> catIds = new List<int>();
                    while(rdr.Read())
                    {
                        return Convert.ToInt32(rdr["CategoryId"]);
                    }

                }
                catch(Exception e)
                {
                    Response.Write("Error:" + e.Message);
                }
                finally
                {
                    connection.Close();
                }
            }
            return -1;
        }
        protected int checkProductExits(string pdtName)
        {
            using(connection)
            {
                try
                {
                    string command = "SELECT * from Product WHERE ProductName='" + pdtName+"'";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    int count = 0;
                    while(rdr.Read())
                    {
                        count++;
                    }
                    if(count == 0)
                    {
                        return -1;
                    }
                    else
                    {
                        return 1;
                    }
                }
                catch(Exception e)
                {
                    Response.Write(e.Message);
                }
            }
            return -1;
        }
        
        protected int getMaxSellingPrice(int price)
        {
            using(connection)
            {
                try
                {
                    connection.Open();
                    string commans
                }
                catch(Exception e)
                {
                    Response.Write(e.Message);
                }
                finally
                {
                    connection.Close();
                }
            }
            return -1;
        }
        protected void submitProduct_Click1(object sender, EventArgs e)
        {
            string productName = TextboxproductName.Text;
            string qty = TextboxQuantity.Text;
            int buyingPrice = Convert.ToInt32(TextBoxBuyingPrice.Text);
            int sellPrice = Convert.ToInt32(sellingPrice.Text);
            string categoryName = categoryDropdown.Text;
            Response.Write(productName + " " + qty + " " + buyingPrice + " " + sellPrice +" "+categoryName+ " " + getCategoryId( categoryName));
            try
            {
                // logic to add data to product table
                // first check that product exists already in the database.
                if(checkProductExits(productName)==1)
                {
                    // here we got the result "Product exists"
                    // if a particular product exists we simply 

                }
                else
                {
                    // here the product does not exists

                }
            }
            catch (Exception err)
            {
                Response.Write("Error:" + err.Message);
            }
        }
    }
}