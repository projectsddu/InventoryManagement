<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteProduct.aspx.cs" Inherits="InventoryManagement.Product.deleteProduct" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Delete Product</title>
</head>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->
    <% 
        if (ViewState["message"] != null)
        {
            Response.Write("<div class='alert alert-" + ViewState["status"] + " alert-dismissible fade show' role='alert'><strong>" + ViewState["message"] + "</strong> <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
        }
    %>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <form id="form1" class="container" style="margin-top: 3%; margin-left: 50px;" runat="server">
        <div class="alert alert-light" role="alert">
            <h3 class="alert-heading" style="color:black">Are you sure you want to delete this product?</h3>
            <div class="row" style="margin-top:2%">
                <div class="col-2">

                    <asp:Button style="width:50%" ID="Yes" runat="server" Text="Yes" class="btn btn-danger" OnClick="Yes_Click" />
                </div>
                <div class="col-2">
                    <asp:Button ID="No" style="width:50%" runat="server" Text="No" class="btn btn-success" OnClick="No_Click" />
                </div>
            </div>
            
            <p class="mb-0"></p>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    -->
</body>
</html>
