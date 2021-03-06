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
    
    public partial class newBill : System.Web.UI.Page
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
            public string ToString()
            {
                return this.ProductName + " X " + this.Quantity + " , Per Piece Price: " + this.SellingPrice;
            }

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
            if (Session["userName"] == null)
            {
                Response.Redirect("/Login/login.aspx");
            }
            else
            {
                for (int i = 0; i < ListBoxAllItems.Items.Count; i++)
                {
                    ListBoxAllItems.Items[i].Attributes.CssStyle.Add("padding", "10px");
                    ListBoxAllItems.Items[i].Attributes.CssStyle.Add("margin", "5px");
                    ListBoxAllItems.Items[i].Attributes.CssStyle.Add("color", "#303030");
                    ListBoxAllItems.Items[i].Attributes.CssStyle.Add("background-color", "#FFDAB9");
                }
            }
            conStr = Convert.ToString(Application["constr"]);
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            LabelMakeBillStatus.Text = "";
            try
            {
                using (connection)
                {
                    connection.Open();
                    string command = "SELECT * FROM Product ORDER BY CategoryFK";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    List<Product> products = new List<Product>();
                    while (rdr.Read())
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
                    }

                    ViewState["products"] = products;
                    ViewState["noOfProducts"] = products.Count;
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
        protected Product getPdtById(int id)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            Product p = new Product();
            try
            {
                using(connection)
                {
                    connection.Open();
                    string command = "SELECT * FROM Product WHERE ProductId = " + id;
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while(rdr.Read())
                    {
                        p = new Product()
                        {
                            ProductName = Convert.ToString(rdr["ProductName"]),
                            SellingPrice = Convert.ToInt32(rdr["SellingPrice"]),
                            Quantity = Convert.ToInt32(rdr["Quantity"])
                        };
                        return p;
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
            return p;
        }
        protected string[] getDataFromStr(string str)
        {
            return str.Split(' ');
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(DropDownListItems.SelectedItem.Value);
            Product pdt = getPdtById(id);
            LabelProductName.Text = pdt.ProductName;
            LabelQuantity.Text = Convert.ToString(pdt.Quantity);
            LabelSellingPrice.Text = Convert.ToString(pdt.SellingPrice);
            TextBoxSellingPrice.Text = Convert.ToString(pdt.SellingPrice);
            TextBoxLabelQuantity.Text = Convert.ToString(pdt.Quantity);
        }

        protected void ButtonAddItem_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(DropDownListItems.SelectedItem.Value);
            string pdtName = LabelProductName.Text;
            int sellingPrice = Convert.ToInt32(TextBoxSellingPrice.Text);
            int qty = Convert.ToInt32(TextBoxLabelQuantity.Text);

            Product p = new Product()
            {
                ProductName = pdtName,
                SellingPrice = sellingPrice,
                Quantity = qty,
                ProductId = id
            };
            //ListBoxAllItems.Items.Add( new ListItem( "Product Name: "+pdtName + "    Quantity:" + qty + "      Price:" + sellingPrice));
            ListBoxAllItems.Items.Add(new ListItem(p.ToString()));
            ListBoxid.Items.Add(new ListItem(Convert.ToString(p.ProductId+" "+p.Quantity+" "+p.SellingPrice)));
            int idx = ListBoxAllItems.Items.Count;
            for(int i = 0; i < ListBoxAllItems.Items.Count; i++)
            {
                ListBoxAllItems.Items[i].Attributes.CssStyle.Add("padding", "10px");
                ListBoxAllItems.Items[i].Attributes.CssStyle.Add("margin", "5px");
                ListBoxAllItems.Items[i].Attributes.CssStyle.Add("color", "#303030");
                ListBoxAllItems.Items[i].Attributes.CssStyle.Add("background-color", "#FFDAB9");
            }
            ListBoxAllItems.Items[idx - 1].Attributes.CssStyle.Add("font-weight", "bold");
            
            
        }

        protected void ButtonRemoveItems_Click(object sender, EventArgs e)
        {
            int idx = ListBoxAllItems.SelectedIndex;
            ListBoxAllItems.Items.Remove(ListBoxAllItems.SelectedItem);
            ListBoxid.Items.RemoveAt(idx);

            for (int i = 0; i < ListBoxAllItems.Items.Count; i++)
            {
                ListBoxAllItems.Items[i].Attributes.CssStyle.Add("padding", "10px");
                ListBoxAllItems.Items[i].Attributes.CssStyle.Add("margin", "5px");
                ListBoxAllItems.Items[i].Attributes.CssStyle.Add("color", "#303030");
                ListBoxAllItems.Items[i].Attributes.CssStyle.Add("background-color", "#FFDAB9");
            }
        }

        public bool addBillItems(int billId)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            try
            {
                using (connection)
                {
                    connection.Open();   
                    int cntr = ListBoxid.Items.Count;
                    for(int i=0;i<cntr;i++)
                    {
                        // 0->Id 1->Qty 2->selling price
                        string[] c = getDataFromStr(Convert.ToString(ListBoxid.Items[i]));
                        string command = "INSERT INTO BillDetails (ProductId,Quantity,SellingPrice,BillId) VALUES (@idx,@qty,@sellprice,@BillId)";
                        SqlCommand cmd = new SqlCommand(command, connection);
                        cmd.Parameters.AddWithValue("idx", c[0]);
                        cmd.Parameters.AddWithValue("qty", c[1]);
                        cmd.Parameters.AddWithValue("sellprice", c[2]);
                        cmd.Parameters.AddWithValue("BillId", billId);
                        int row = cmd.ExecuteNonQuery();
                        if(row==0)
                        {
                            return false;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Response.Write("Adbill items"+e.Message);
            }

            return false;
        }

        protected int getBillId()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            try
            {
                using(connection)
                {
                    connection.Open();
                    string command = "SELECT * FROM Bill ORDER BY BillId DESC";
                    SqlCommand cmd = new SqlCommand(command, connection);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while(rdr.Read())
                    {
                        return Convert.ToInt32(rdr["BillId"]);
                    }
                }
            }
            catch(Exception err)
            {
                Response.Write("getBillId" + err.Message);
            }
            return -1;
        }
        protected bool addBill()
        {
            string customerName = TextBoxCustomerName.Text;
            string phoneNumber = TextBoxPhoneNumber.Text;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conStr;
            try
            {
                using(connection)
                {
                    DateTime dt = DateTime.Now;
                    connection.Open();
                    string command = "INSERT INTO Bill (BillDate,CustomerName,CustomerPhoneNo) VALUES ('" + dt + "','"+customerName+"','"+phoneNumber+"')";
                    Response.Write(command);
                    SqlCommand cmd = new SqlCommand(command, connection);
                    int rows = cmd.ExecuteNonQuery();
                    if(rows>0)
                    {
                        addBillItems(getBillId());
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
                Response.Write("From Addbill"+e.Message);
            }

            return false;
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if(ListBoxAllItems.Items.Count != 0)
            {
                addBill();
                int id = getBillId();
                if(id==-1)
                {
                    Response.Write("Error");
                }
                else
                {
                    Response.Redirect("/Bill/viewBill.aspx?idx=" + id);
                }
            }
            else
            {
                LabelMakeBillStatus.Text = "Please Add items to make bill!!";
            }
     
        }
    }
}