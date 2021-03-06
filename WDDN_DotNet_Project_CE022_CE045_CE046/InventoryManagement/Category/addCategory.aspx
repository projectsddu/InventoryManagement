<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCategory.aspx.cs" Inherits="InventoryManagement.Category.addCategory" %>

<!doctype html>


<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link href="../bootstrap/css/addProduct.css" rel="stylesheet" />
    <title>Add Category</title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->
    <% if (ViewState["message"] != null)
        {
            Response.Write("<div class='alert alert-" + ViewState["status"] + " alert-dismissible fade show' role='alert'><strong>" + ViewState["message"] + " </strong> <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
        }            %>
    <div class="container">

        <form id="form1" class="" style="margin-top: 4%;" runat="server">
            <h1>ADD CATEGORY</h1>
            <hr style="border: 2px solid black" />
            <div class="mb-3">
                <label for="productName" class="form-label">
                    <b>Category Name:</b>
                </label>
                &nbsp;<asp:TextBox ID="TextBoxcategoryName" type="text" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>

                <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategoryName" runat="server" ControlToValidate="TextBoxcategoryName" CssClass="auto-style1" ErrorMessage="* Category Name is required!!"></asp:RequiredFieldValidator>
                </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            </div>

            <asp:Button ID="addCategoryBtn" class="btn btn-success" runat="server" Text="Add Category" OnClick="addCategoryBtn_Click" />

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

