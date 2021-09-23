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
        .auto-style1 {
            width: 184px;
        }

        .auto-style2 {
            width: 184px;
            height: 24px;
        }

        .auto-style3 {
            width: 282px;
        }

        .auto-style4 {
            width: 282px;
            height: 24px;
        }
        .editListBox {
            background-color: white;
        }
        .hideme{
            display:none;
        }
    </style>
</head>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->
    <form runat="server" id="form2">
        <div>
            <asp:DropDownList ID="DropDownListItems" runat="server" DataSourceID="SqlDataSource1" DataTextField="ProductName" DataValueField="ProductId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionStringRikin %>" SelectCommand="SELECT [ProductId], [ProductName], [Quantity], [BuyingPrice], [SellingPrice] FROM [Product]"></asp:SqlDataSource>
            <table class="w-100">
                <tr>
                    <td class="auto-style1">Product Name:</td>
                    <td class="auto-style3">
                        <asp:Label ID="LabelProductName" runat="server" Text="none"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Selling&nbsp; Price (<asp:Label ID="LabelSellingPrice" runat="server" Text="none"></asp:Label>):</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBoxSellingPrice" type="number" runat="server" Text="none"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Quantity: (<asp:Label ID="LabelQuantity" runat="server" Text="none"></asp:Label>)</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxLabelQuantity" type="number" runat="server" Text="none"></asp:TextBox>
                    </td>
                </tr>

            </table>
            <asp:Button ID="ButtonAddItem" runat="server" OnClick="ButtonAddItem_Click" Text="Add Item" />
            <br />
            <br />
            Customer Name:<asp:TextBox ID="TextBoxCustomerName" runat="server"></asp:TextBox>
&nbsp;&nbsp; Phone Number<asp:TextBox ID="TextBoxPhoneNumber" runat="server"></asp:TextBox>
&nbsp;<br />
            <br />
            <br />
            <asp:ListBox CssClass="accordion-item" ID="ListBoxAllItems" runat="server" Height="137px" Width="507px"></asp:ListBox>
            &nbsp;<asp:ListBox CssClass="hideme" ID="ListBoxid" runat="server"></asp:ListBox>
            <br />
            <br />
        </div>

    
        <asp:Button ID="SubmitButton" runat="server" Text="Make Bill" OnClick="SubmitButton_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonRemoveItems" runat="server" OnClick="ButtonRemoveItems_Click" Text="Remove" />
    </form>




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
