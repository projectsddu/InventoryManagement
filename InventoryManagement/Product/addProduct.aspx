<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProduct.aspx.cs" Inherits="InventoryManagement.Product.addProduct" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>Add Product</title>
</head>
<body>

    <!--#include file="~/static/Home/shared_navbar.html"-->
    <% 
        if(ViewState["message"]!=null)
        {
            Response.Write("<div class='alert alert-"+ViewState["status"]+" alert-dismissible fade show' role='alert'><strong>"+ViewState["message"]+"</strong> <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
        }
        %>
    <div class="container">
        <form id="form1" class="container" style="margin-top: 8%;" runat="server">
            <div class="mb-3">
                <label for="productName" class="form-label">
                    <b>Product Name: </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage=" *Product name is required!" BackColor="White" ControlToValidate="TextboxproductName" ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:TextBox ID="TextboxproductName" type="text" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="TextboxQuantity" class="form-label"><b>Quantity: </b></label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity" runat="server" ErrorMessage=" *Quantity is required!!" BackColor="White" ControlToValidate="TextboxQuantity" ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
                &nbsp;<asp:TextBox ID="TextboxQuantity" type="number" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="TextBoxBuyingPrice" class="form-label"><b>Buying Price:</b><asp:RequiredFieldValidator ID="buyingPriceValidator" runat="server" ControlToValidate="TextBoxBuyingPrice" ErrorMessage=" *Buying Price is required" ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:TextBox ID="TextBoxBuyingPrice" type="number" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="TextBoxBuyingPrice" class="form-label"><b>Selling Price: </b>
                <asp:RequiredFieldValidator ID="sellingPriceValidator" runat="server" ControlToValidate="sellingPrice" ErrorMessage=" *Selling price validator" ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:TextBox ID="sellingPrice" type="number" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="TextBoxBuyingPrice" class="form-label"><b>Select Category:</b></label><br />
                <asp:DropDownList ID="categoryDropdown" class="btn btn-secondary dropdown-toggle" type="button" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource>
            </div>
            <div class="mb-3">
                <asp:Button ID="submitProduct"   runat="server" Text="Add Product" class="btn btn-success" OnClick="submitProduct_Click1" />
            </div>

        </form>
    </div>

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
