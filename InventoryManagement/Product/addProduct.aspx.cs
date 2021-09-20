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
      
        string conStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["userName"]==null)
            {
                Response.Redirect("/login/login.aspx");
            }
        }

        protected int getCategoryId(string categoryName)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            using (connection)
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
                    Response.Write("From getCatId" + e.Message);
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
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            using (connection)
            {

                try
                {
                        
                    string command = "SELECT * from Product WHERE ProductName='" + pdtName+"'";
                    connection.Open();
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    int count = 0;
                    
                    while (rdr.Read())
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
                    Response.Write("From checkPdt"+e.Message);
                }
                finally
                {
                    connection.Close();
                }
            }
            return -1;
        }
        
        protected bool setProductSellPrice(string pdtName,int maxSellPrice)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            using(connection)
            {
                try
                {

                    connection.Open();
                    string command = "UPDATE Product SET SellingPrice=@maxSellPrice WHERE ProductName=@pdtName";
                    SqlCommand cmd = new SqlCommand(command,connection);
                    cmd.Parameters.AddWithValue("maxSellPrice", maxSellPrice);
                    cmd.Parameters.AddWithValue("pdtName", pdtName);

                    int rows = cmd.ExecuteNonQuery();
                    connection.Close();
                    if(rows!=0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                }
                catch(Exception e)
                {
                    Response.Write(e.Message);
                }
                return false;
            }
        }

        protected int getMaxSellingPrice(string pdtName,int price)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            using (connection)
            {
                try
                {
                    connection.Open();
                    string command = "SELECT * FROM Product WHERE ProductName='"+pdtName+"'";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while(rdr.Read())
                    {
                        int sellPrice = Convert.ToInt32(rdr["SellingPrice"]);
                        if(sellPrice>price)
                        {
                            price = sellPrice;
                        }
                    }
                    return price;
                }
                catch(Exception e)
                {
                    Response.Write("From addPdt"+e.Message);
                }
                finally
                {
                    connection.Close();
                }
            }
            return -1;
        }


        protected bool addPdt(string prodName,int buyPrice,int sellPrice,int qty,int categoryFk)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            using (connection)
            {
                try
                {
                    connection.Open();
                    string quer1 = "INSERT INTO Product (ProductName,Quantity,BuyingPrice,SellingPrice,CategoryFK) VALUES ('" + prodName + "'," + qty + "," + buyPrice + "," + sellPrice + "," + categoryFk + ")";
                    SqlCommand cmd = new SqlCommand(quer1, connection);
                    int rows = cmd.ExecuteNonQuery();
                    if(rows==1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch(Exception e)
                {
                    Response.Write("Error" + e.Message);
                    return false;
                }
                finally
                {
                    connection.Close();
                    
                }
                
            }
            
        }


        protected void submitProduct_Click1(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            string productName = TextboxproductName.Text;
            int qty = Convert.ToInt32(TextboxQuantity.Text);
            int buyingPrice = Convert.ToInt32(TextBoxBuyingPrice.Text);
            int sellPrice = Convert.ToInt32(sellingPrice.Text);
            string categoryName = categoryDropdown.Text;
            try
            {
                // logic to add data to product table
                // first check that product exists already in the database.

                int maxSellPrice = getMaxSellingPrice(productName, sellPrice);
                bool status = addPdt(productName, buyingPrice, sellPrice, qty, getCategoryId(categoryName));
                    if(status)
                    {
                       
                        bool status1 = setProductSellPrice(productName, maxSellPrice);
                        if(status1)
                        {
                             ViewState["message"] = "Success! saved your details successfully!";
                             ViewState["status"] = "success";
                        }
                        else
                        {
                            ViewState["message"] = "Error! updating all products max selling price!";
                            ViewState["status"] = "danger";
                        }
                    }
                    else
                    {
                        ViewState["message"] = "Error! saving your product!";
                        ViewState["status"] = "danger";
                    }
                
            }
            catch (Exception err)
            {
                Response.Write("from main" + err.Message);
            }
        }
    }
}