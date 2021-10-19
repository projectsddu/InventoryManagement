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
using InventoryManagement.Bill;
using InventoryManagement.Product;

namespace InventoryManagement.Home
{
    public partial class home : System.Web.UI.Page
    {

        public string constr;
        [Serializable]
        protected class Bill
        {
            public int id { get; set; }
            public string customerName { get; set; }
            public string customerPhone { get; set; }
            public string constr { get; set; }
            public void setData()
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = constr;
                try
                {
                    using(connection)
                    {
                        connection.Open();
                        string query = "SELECT * FROM Bill WHERE BillId=" + id;
                        SqlCommand cmd = new SqlCommand(query, connection);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while(rdr.Read())
                        {
                            this.customerName = rdr["CustomerName"].ToString(); 
                            this.customerPhone = rdr["CustomerPhoneNo"].ToString(); 

                        }
                    }
                }
                catch (Exception err)
                {
                    System.Diagnostics.Debug.WriteLine("From Bill");
                    throw err;
                }
            }

        }
       [Serializable]
       protected class BillList
        {
            public List<Bill> billList { get; set; }
            public string constr { get; set; }
            public BillList(string constr)
            {
                this.constr = constr;
                this.billList = new List<Bill>();
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = constr;
                try
                {
                    using (connection)
                    {
                        connection.Open();
                        string query = "SELECT * FROM Bill ORDER BY BillId DESC";
                        SqlCommand cmd = new SqlCommand(query, connection);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        int cntr = 4;
                        while(rdr.Read())
                        {
                            if(cntr==0)
                            {
                                break;
                            }
                            cntr--;
                            Bill b = new Bill();
                            b.id = Convert.ToInt32(rdr["billId"]);
                            b.customerName = rdr["CustomerName"].ToString();
                            b.customerPhone = rdr["CustomerPhoneNo"].ToString();
                            b.constr = this.constr;
                            b.setData();
                            this.billList.Add(b);
                        }
                    }
                }
                catch (Exception err)
                {
                    System.Diagnostics.Debug.WriteLine("From BillList");
                    throw err;
                }
            }
        }

        [Serializable]
        protected class Product
        {
            public int id;
            public string productName;
            public int buyingPrice;
            public int sellPrice;

            public Product(int id,string pdtName,int buyPrice,int sellPrice)
            {
                this.id = id;
                this.productName = pdtName;
                this.buyingPrice = buyPrice;
                this.sellPrice = sellPrice;
            }
        }
        [Serializable]
        protected class ProductList
        {
            public List<Product> pdtList { get; set; }
            public string constr { get; set; }
            public ProductList(string contr)
            {
                
                try
                {
                    pdtList = new List<Product>();
                    this.constr = contr;
                    SqlConnection connection = new SqlConnection();
                    connection.ConnectionString = constr;
                    using (connection)
                    {
                        connection.Open();
                        string query = "SELECT * FROM Product ORDER BY ProductId DESC";
                        SqlCommand cmd = new SqlCommand(query, connection);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        int cnt = 4;
                        while(rdr.Read())
                        {
                            if(cnt==0)
                            {
                                break;
                            }
                            cnt--;
                            int pid = Convert.ToInt32(rdr["ProductId"]);
                            string pdtName = rdr["ProductName"].ToString();
                            int sell = Convert.ToInt32(rdr["SellingPrice"]);
                            int buy = Convert.ToInt32(rdr["BuyingPrice"]);
                            Product p = new Product(pid, pdtName, buy, sell);
                            pdtList.Add(p);
                        }
                    }
                }
                catch (Exception err)
                {
                    System.Diagnostics.Debug.WriteLine("From PdtList"+err.Message);
                    throw err;
                }
            }
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            constr = Application["constr"].ToString();
            if(Session["userName"] == null)
            {
                Response.Redirect("/Login/login.aspx");
            }
            else
            {
                try
                {
                    BillList b = new BillList(Application["constr"].ToString());
                    ProductList p = new ProductList(Application["constr"].ToString());
                    ViewState["bills"] = b;
                    ViewState["products"] = p;
                    ViewState["username"] = Session["userName"].ToString();
                }
                catch(Exception err)
                {
                    Response.Write(err.Message);
                }
            }
        }
        
    }
}