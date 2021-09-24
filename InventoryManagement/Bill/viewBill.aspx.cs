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


namespace InventoryManagement.Bill
{
  
    public partial class viewBill : System.Web.UI.Page
    {
        string conStr;
        [Serializable]
        protected class Bill
        {
            public Bill()
            {
                BillItems = new List<BillDetails>();
            }
            // public HttpResponse response { get; set; }
            public int BillId { get; set; }
            public string connectionString { get; set; }
            public List<BillDetails> BillItems { get; set; }

            public void AddItem(BillDetails b)
            {
                BillItems.Add(b);
            }
            public void setBillItems()
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = this.connectionString;
                try
                {
                   
                    using(connection)
                    {
                        connection.Open();
                        string command = "SELECT * FROM BillDetails WHERE BillId = " + this.BillId;
                        SqlCommand cmd = new SqlCommand(command, connection);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while(rdr.Read())
                        {
                            BillDetails b1 = new BillDetails() {
                                id = Convert.ToInt32(rdr["BillDetailsId"]),
                                Quantity = Convert.ToInt32(rdr["Quantity"]),
                                sellingPrice = Convert.ToInt32(rdr["SellingPrice"]),
                                connectionString = connectionString

                            };
                            b1.setProductName(Convert.ToInt32(rdr["ProductId"]));
                            AddItem(b1);
                        }
                    }
                }
                catch (Exception e)
                {
                    throw e;
                }
                finally
                {
                    connection.Close();
                }

            }
        }

        [Serializable]
        public class Bills
        {
            public int id { get; set; }
            public string customerName { get; set; }
            public string customerPhoneNumber { get; set; }

        }

        [Serializable]
        protected class BillDetails
        {
            public int id { get; set; }
            public int sellingPrice { get; set; }
            public int Quantity { get; set; }
            
            public string productName { get; set; }
            public string connectionString { get; set; }
            public void setProductName(int id) 
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = this.connectionString;
                try
                {

                    using (connection)
                    {
                        connection.Open();
                        string command = "SELECT * FROM Product WHERE ProductId = " + id;
                        SqlCommand cmd = new SqlCommand(command, connection);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            productName = Convert.ToString(rdr["ProductName"]);
                            return;
                        }
                    }
                }
                catch (Exception err)
                {
                    throw err;
                }
                finally
                {
                    connection.Close();
                }
            }




        }

        protected int getBillId()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            try
            {
                using (connection)
                {
                    connection.Open();
                    string command = "SELECT * FROM Bill ORDER BY BillId DESC";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        return Convert.ToInt32(rdr["BillId"]);
                    }
                }
            }
            catch (Exception err)
            {
                Response.Write("getBillId" + err.Message);
            }
            return -1;
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
            conStr = Convert.ToString(Application["constr"]);
            if (Request.QueryString["idx"] != null)
            {
                try
                {
                int id = Convert.ToInt32(Request.QueryString["idx"]);
                Bill b1 = new Bill()
                {
                    connectionString = conStr,
                    BillId = id
                };
                b1.setBillItems();
                ViewState["data"] = b1;
                ViewState["type"] = "single";

                }
                catch (Exception err)
                {
                    Response.Write("From getCatId" + err.Message);
                }
                finally
                {
                    
                }
            }
            else
            {
                List<Bills> b = new List<Bills>();
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = conStr;
                try
                {
                    using (connection)
                    {
                        connection.Open();
                        string command = "SELECT * FROM Bill ORDER BY BillId DESC";
                        SqlCommand cmd = new SqlCommand(command, connection);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            Bills b1 = new Bills()
                            {
                                id = Convert.ToInt32(rdr["BillId"]),
                                customerName = Convert.ToString(rdr["CustomerName"]),
                                customerPhoneNumber = Convert.ToString(rdr["CustomerPhoneNo"])
                            };
                            b.Add(b1);
                        }
                        ViewState["type"] = "allBills";
                        ViewState["data"] = b;
                    }
                }
                catch (Exception err)
                {
                    Response.Write("getBillId" + err.Message);
                }
            }
        }
    }
}