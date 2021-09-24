<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewCategory.aspx.cs" Inherits="InventoryManagement.Category.viewCategory" %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>View Category</title>
  </head>
  <body>
      <!--#include file="~/static/Home/shared_navbar.html"-->

      <div class="container">
        <table class="table table-hover mt-4 text-center" id="productTable">
            <thead>
                <tr>
                    <th scope="col">Category Id</th>
                    <th scope="col">CategoryName</th>
                </tr>
            </thead>
            <tbody class="text-center">
            <%
                if (ViewState["categories"] != null)
                {
                    List<Category> categories = new List<Category>((List<Category>)ViewState["categories"]);
                    for(int i = 0; i < categories.Count; i++)
                    {
                        Response.Write("<tr>" +
                                 "<td scope='row'>" + categories[i].CategoryId + "</td>" +
                                 "<td>" + categories[i].CategoryName+ "</td>" +
                             "</tr>");
                    }

                } 
            %>
            </tbody>
        </table>
    </div>

    <form id="form1" runat="server">
        <div>
        </div>
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