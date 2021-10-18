<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Admin.aspx.cs" Inherits="InventoryManagement.Admin.Add_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <title>Add Admin</title>
</head>
    <style>
        .form-control {
    width: 35%;
    border: 2px solid black;
}
    </style>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->
    <% if (ViewState["message"] != null)
        {
            Response.Write("<div class='alert alert-" + ViewState["status"] + " alert-dismissible fade show' role='alert'><strong>" + ViewState["message"] + " </strong> <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
        }            %>
    <form id="form1" class="container" style="margin-top: 4%;" runat="server">
            <h1>ADD ADMIN</h1>
            <hr style="border: 2px solid black" />
            <div class="mb-3">
                <label for="productName" class="form-label">
                    <b>New Admin Name:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </label>
                &nbsp;<asp:TextBox ID="TextBoxNewAdminName" type="text" class="form-control" aria-describedby="emailHelp" runat="server" BorderWidth="2px"></asp:TextBox>

                <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategoryName" runat="server" ControlToValidate="TextBoxNewAdminName" CssClass="auto-style1" ErrorMessage="* New Admin Name is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
                </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            </div>
        <div class="mb-3">
                <label for="productName" class="form-label">
                    <b>New Admin Password:</b>
                </label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBoxNewAdminPassword" type="password" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>

                <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewAdminPassword" runat="server" ControlToValidate="TextBoxNewAdminPassword" CssClass="auto-style1" ErrorMessage="* New Admin Password is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
                </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            </div>
        <div class="mb-3">
                <label for="productName" class="form-label">
                    <b>Root Admin Password:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </label>
                &nbsp;<asp:TextBox ID="TextBoxCurrentAdminPassword" type="password" class="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>

                <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCurrentAdminPassword" runat="server" ControlToValidate="TextBoxCurrentAdminPassword" CssClass="auto-style1" ErrorMessage="* Current Admin Password is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
                </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <br />
                <strong>
                <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                </strong>

            </div>

            <asp:Button ID="addNewAdminBtn" class="btn btn-success" runat="server" Text="Add New Admin" OnClick="addCategoryBtn_Click" />

        </form>
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
