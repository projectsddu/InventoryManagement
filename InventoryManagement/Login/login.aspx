<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="InventoryManagement.Login.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/bootstrap/css/bootstrap_main.css" />
    <link rel="stylesheet" href="~/bootstrap/css/login/login.css" />
</head>
<body>
    <%--include navbar from static folder--%>
    <!--#include file="~/static/login_navbar.html"-->

    <form id="form1" runat="server">
        <div class="container content-login-center">
            <div>
                <h1>Login</h1>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Username</label>

                    <asp:TextBox type="text" ID="username" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter Username"></asp:TextBox>

                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <asp:TextBox type="password" ID="password" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter Password"></asp:TextBox>

                    </div>
                <asp:Button ID="loginBtn" class="btn btn-success" runat="server" Text="Login" OnClick="loginBtn_Click" />
            </div>

        </div>
    </form>


    <script src="~/bootstrap/js/bootstrap_main_javascript.js"></script>
</body>
</html>
