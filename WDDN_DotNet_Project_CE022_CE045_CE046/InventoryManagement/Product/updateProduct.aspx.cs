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
    public partial class updateProduct : System.Web.UI.Page
    {
        string conStr;
        int pid;
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
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            try
            {
                using(connection)
                {
                    connection.Open();
                    pid = Convert.ToInt32(Request.QueryString["id"]);
                    if(pid==null)
                    {
                        Response.Redirect("/Product/viewProduct.aspx");
                    }
                    string command = "SELECT * FROM Product WHERE ProductId = " + pid;
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while(rdr.Read())
                    {
                        LabelPdtName.Text = "";
                        LabelCurQty.Text = "";
                        LabelBuyPrice.Text = "";
                        LabelCurrentSellPrice.Text = "";
                        LabelPdtName.Text += "( Current Product Name:"+ Convert.ToString(rdr["ProductName"])+" )";
                        LabelCurQty.Text += "( Current Quantity :" + Convert.ToString(rdr["Quantity"]) + " )";
                        LabelBuyPrice.Text += "( Current Buying Price :" + Convert.ToString(rdr["BuyingPrice"]) + " )";
                        LabelCurrentSellPrice.Text += "( Current Selling Price :" + Convert.ToString(rdr["SellingPrice"]) + " )";
                    }
                    
                }
            }
            catch (Exception err)
            {
                Response.Write("Error: " + err.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        protected bool pdtUpdate(string pdtName,int qty,int buyPrice,int sellPrice)
        {
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = conStr;
                using(connection)
                {
                    connection.Open();
                    string command = "UPDATE Product SET ProductName='" + pdtName + "', Quantity = " + qty + ", BuyingPrice = " + buyPrice + ", Sellingprice = " +
                    sellPrice + " WHERE ProductId = " + pid;
                    SqlCommand cmd = new SqlCommand(command, connection);
                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch(Exception e)
            {
                Response.Write(e.Message);
            }
            finally
            {
                
            }
            return true;

        }
        

        protected void submitProduct_Click(object sender, EventArgs e)
        {
            string pdtName = TextboxproductName.Text;
            int qty = Convert.ToInt32(TextboxQuantity.Text);
            int buyPrice = Convert.ToInt32(TextBoxBuyingPrice.Text);
            int sellPrice = Convert.ToInt32(sellingPrice.Text);
            bool status = pdtUpdate(pdtName, qty, buyPrice, sellPrice);
            if(status)
            {
                ViewState["message"] = "Product updated successfully!!";
                ViewState["status"] = "success";
            }
            else
            {
                ViewState["message"] = "Error updating your product!!";
                ViewState["status"] = "danger";
            }
        }
    }
}