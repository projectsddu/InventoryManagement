<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewAdmin.aspx.cs" Inherits="InventoryManagement.Admin.viewAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <title>View Admin</title>
</head>
<body>
    <%--<form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
    <!--#include file="~/static/Home/shared_navbar.html"-->
    <div class="container">
        <table style="width: 50%; margin-left: 23%;" class="table table-hover mt-4 text-center" id="productTable">
            <thead>
                <tr>
                    <th scope="col">Admin Id</th>
                    <th scope="col">Admin Name</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <%
                    if (ViewState["data"] != null)
                    {
                        List<Admin> adList = (List<Admin>)(ViewState["data"]);
                        for (int i = 0; i < adList.Count; i++)
                        {
                            Response.Write("<tr>" +
                                             "<td scope='row'>" + adList[i].adminId + "</td>" +
                                             "<td>" + adList[i].adminName + "</td>" +
                                         "</tr>");
                        }
                    }
                %>
            </tbody>
        </table>
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
