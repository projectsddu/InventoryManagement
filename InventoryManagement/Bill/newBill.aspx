<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newBill.aspx.cs" Inherits="InventoryManagement.Bill.newBill" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- custom CSS for searchBox  -->
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/viewProductSearchBox/searchBox.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <title>New Bill</title>
    <style type="text/css">
        .editListBox {
            background-color: white;
        }
        .hideme{
            display:none;
        }
        .auto-style8 {
            margin-left: 30;
        }
        .auto-style14 {
            width: 296px;
        }
        .auto-style15 {
            width: 363px;
        }
        .auto-style16 {
            width: 296px;
            height: 29px;
        }
        .auto-style17 {
            width: 363px;
            height: 29px;
        }
        .dropDownDesign{
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->
    <div class="container">
    <form runat="server" id="form2">
       
        
        <table class="w-100 mb-4 mt-1">
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td rowspan="33">
                    <asp:Label ID="LabelMakeBillStatus" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:Label>
                    
                    <br />
                    <br />
                    
            <asp:ListBox CssClass="auto-style13 border-4" ID="ListBoxAllItems" runat="server" Height="500px" Width="581px" style="margin-top: 0" Font-Bold="True"></asp:ListBox>
                    <br />
                    <br />

    
                    <strong>

    
        <asp:Button ID="SubmitButton" runat="server" Text="Make Bill" OnClick="SubmitButton_Click" Height="48px" Width="159px" CssClass="btn btn-success" style="font-weight: bold" />
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <strong>
        <asp:Button ID="ButtonRemoveItems" runat="server" OnClick="ButtonRemoveItems_Click" Text="Remove Item" Height="48px" Width="183px" CssClass="btn btn-danger" style="font-weight: bold" />
                    </strong>
                    </td>
            </tr>
            
            <tr>
                <td class="auto-style14"><strong>Customer Name: </strong></td>
                <td class="auto-style15"> 
                    <br />
                    <asp:TextBox ID="TextBoxCustomerName" runat="server" Width="250px" BorderColor="Black" BorderWidth="2px" Font-Bold="True" ForeColor="Black"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCustomerName" ErrorMessage="Please enter the customer name!!" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14"><strong>Phone Number:</strong></td>
                <td class="auto-style15"> 
                    <br />
                    <asp:TextBox ID="TextBoxPhoneNumber" runat="server" CssClass="auto-style8" Width="250px" BorderColor="Black" BorderWidth="2px" Font-Bold="True" ForeColor="Black"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPhoneNumber" ErrorMessage="Enter the phone number!!" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            
            <tr>
                
                <td class="auto-style14"><hr 
                    style="border: 2px solid black; background-color: black"/>&nbsp;</td>
                <td class="auto-style15"><hr style="width: 75%; border: 2px solid black; background-color: black" />&nbsp;</td>
            </tr>
            
            <tr>
                
                <td class="auto-style16"><strong>Select Product:</strong></td>
                <td class="auto-style17">
                        <asp:DropDownList ID="DropDownListItems" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ProductName" DataValueField="ProductId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Font-Bold="True" BackColor="#CCCCCC" ForeColor="Black" Height="30px" Width="246px" CssClass="dropDownDesign">
                        </asp:DropDownList>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionStringJenil %>" SelectCommand="SELECT [ProductId], [ProductName], [Quantity], [BuyingPrice], [SellingPrice] FROM [Product]"></asp:SqlDataSource>
                    </td>
            </tr>
            
            <tr>
                
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14"><strong>Product Name:</strong></td>
                <td class="auto-style15">
                        <asp:Label ID="LabelProductName" runat="server" Text="none" Font-Bold="True"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14"><strong>Selling&nbsp; Price (<asp:Label ID="LabelSellingPrice" runat="server" Text="none"></asp:Label>):</strong></td>
                <td class="auto-style15">
                        <asp:TextBox ID="TextBoxSellingPrice" type="number" runat="server" Text="none" Width="250px" BorderColor="Black" BorderWidth="2px" Font-Bold="True"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14"><strong>Quantity: (<asp:Label ID="LabelQuantity" runat="server" Text="none"></asp:Label>)</strong></td>
                <td class="auto-style15">
                        <asp:TextBox ID="TextBoxLabelQuantity" type="number" runat="server" Text="none" Width="250px" BorderColor="Black" BorderWidth="2px" Font-Bold="True" ForeColor="Black"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">
                        <strong>
            <asp:Button ID="ButtonAddItem" runat="server" OnClick="ButtonAddItem_Click" Text="Add Item" Height="48px" Width="179px" CssClass="btn btn-primary" style="font-weight: bold" />
                        </strong>
                    </td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">

    
                    <asp:ListBox ID="ListBoxid" runat="server" Height="71px" Width="112px" style="display:none"></asp:ListBox>
                </td>
                <td class="auto-style15">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
        </table>
    </form>
    </div>



    <script>
        $(document).ready(function () {
            $('.search').on('keyup', function () {
                var searchTerm = $(this).val().toLowerCase();
                $('#productTable tbody tr').each(function () {
                    var lineStr = $(this).text().toLowerCase();
                    if (lineStr.indexOf(searchTerm) === -1) {
                        $(this).hide();
                    }
                    else {
                        $(this).show();
                    }
                });
            });
        });
    </script>


    <script src="../static/Bill/newBillSelect.js"></script>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    -->
</body>
</html>
