<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateProduct.aspx.cs" Inherits="InventoryManagement.Product.updateProduct" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->
    <% 
        if (ViewState["message"] != null)
        {
            Response.Write("<div class='alert alert-" + ViewState["status"] + " alert-dismissible fade show' role='alert'><strong>" + ViewState["message"] + "</strong> <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
        }
    %>
    <div class="container">
        <form id="form1" class="container" style="margin-top: 5%;" runat="server">
            <div class="mb-3">
                <label for="productName" class="form-label">
                    <b>Product Name: 
                <asp:Label ID="LabelPdtName" runat="server" Style="font-style: italic; color: #009933"></asp:Label>
                        &nbsp; </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage=" *Product name is required!" BackColor="White" ControlToValidate="TextboxproductName" ForeColor="Red" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:TextBox ID="TextboxproductName" type="text" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="TextboxQuantity" class="form-label">
                    <b>Quantity: 
                <asp:Label ID="LabelCurQty" runat="server" Style="font-style: italic; color: #009933"></asp:Label>
                        &nbsp;&nbsp; </b>
                </label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity" runat="server" ErrorMessage=" *Quantity is required!!" BackColor="White" ControlToValidate="TextboxQuantity" ForeColor="Red" Style="font-weight: 700"></asp:RequiredFieldValidator>
                &nbsp;<asp:TextBox ID="TextboxQuantity" type="number" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="TextBoxBuyingPrice" class="form-label">
                    <b>Buying Price:
                <asp:Label ID="LabelBuyPrice" runat="server" Style="font-style: italic; color: #009933"></asp:Label>
                        &nbsp;</b><asp:RequiredFieldValidator ID="buyingPriceValidator" runat="server" ControlToValidate="TextBoxBuyingPrice" ErrorMessage=" *Buying Price is required" ForeColor="Red" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:TextBox ID="TextBoxBuyingPrice" type="number" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="TextBoxBuyingPrice" class="form-label">
                    <b>Selling Price: 
                <asp:Label ID="LabelCurrentSellPrice" runat="server" Style="font-style: italic; color: #009900"></asp:Label>
                        &nbsp; </b>
                    <asp:RequiredFieldValidator ID="sellingPriceValidator" runat="server" ControlToValidate="sellingPrice" ErrorMessage=" *Selling price validator" ForeColor="Red" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:TextBox ID="sellingPrice" type="number" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3">
                <%--<asp:Button ID="submitProduct"   runat="server" Text="Update Product" class="btn btn-success" OnClick="HandleSubmit"  />--%>
                <asp:Button ID="submitProduct" runat="server" Text="Update Product" class="btn btn-success" OnClick="submitProduct_Click" />
            </div>

        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
