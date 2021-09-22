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
    public partial class viewProduct : System.Web.UI.Page
    {
        [Serializable]
        public class Product
        {
            public int ProductId { get; set; }
            public string ProductName { get; set; }

            public string CategoryName { get; set; }
            public int Quantity { get; set; }

            public int BuyingPrice { get; set; }
            public int SellingPrice { get; set; }

        }

        protected string getCategoryName(int id)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            using (connection)
            {
                connection.Open();
                try
                {
                    string command = "SELECT * from Category WHERE CategoryId=" + id;
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    List<string> catIds = new List<string>();
                    while (rdr.Read())
                    {
                        return Convert.ToString(rdr["CategoryName"]);
                    }

                }
                catch (Exception e)
                {
                    Response.Write("From getCatId" + e.Message);
                }
                finally
                {
                    connection.Close();
                }
            }
            return "NoCategory";
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
                    string command = "SELECT * FROM Product ORDER BY CategoryFK";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    List<Product> products = new List<Product>();
                    while(rdr.Read())
                    {
                        Product p = new Product()
                        {
                            ProductId = Convert.ToInt32(rdr["ProductId"]),
                            ProductName = Convert.ToString(rdr["ProductName"]),
                            Quantity = Convert.ToInt32(rdr["Quantity"]),
                            BuyingPrice = Convert.ToInt32(rdr["BuyingPrice"]),
                            SellingPrice = Convert.ToInt32(rdr["SellingPrice"]),
                            CategoryName = getCategoryName(Convert.ToInt32(rdr["CategoryFK"]))
                        };
                        products.Add(p);
                        //Response.Write(p.ToString());
                    }

                    ViewState["products"] = products;
                    ViewState["noOfProducts"] = products.Count;
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