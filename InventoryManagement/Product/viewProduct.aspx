<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewProduct.aspx.cs" Inherits="InventoryManagement.Product.viewProduct" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- custom CSS for searchBox  -->
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/viewProductSearchBox/searchBox.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <title>View Product Table</title>
</head>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->

    <form id="form1" runat="server">
    <div class="container" style="margin-top: 7%;">
        <div class="form-wrapper cf">
            <input type="text" class="search" placeholder="Search Product here" required>
        </div>
            <asp:LinkButton
                class="btn btn-success btn-add-product"
                Style="display: inline;"
                ID="addProductBtn"
                runat="server"
                PostBackUrl="~/Product/addProduct.aspx">
            ADD PRODUCT

            </asp:LinkButton>

        

            <br />

            <br />
    </div>
    </form>
    <div class="container">
        <table class="table table-hover mt-1" id="productTable">
            <thead>
                <tr>
                    <th scope="col">Product Id</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">CategoryName</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Buying Price</th>
                    <th scope="col">Selling Price</th>
                    <th scope="col">Update</th>
                    <th scope="col">Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (ViewState["products"] != null)
                    {
                        List<Product> products = new List<Product>((List<Product>)ViewState["products"]);
                        //products = (List<Product>)ViewState["products"];
                        for (int i = 0; i < Convert.ToInt32(ViewState["noOfProducts"]); i++)
                        {
                            Response.Write("<tr>" +
                                 "<th scope='row'>" + products[i].ProductId + "</th>" +
                                 "<td>" + products[i].ProductName + "</td>" +
                                 "<td>" + products[i].CategoryName + "</td>" +
                                 "<td>" + products[i].Quantity + "</td>" +
                                 "<td>&#x20B9; " + products[i].BuyingPrice + "</td>" +
                                 "<td>&#x20B9; " + products[i].SellingPrice + "</td>" +
                                 "<td><a href='/Product/updateProduct.aspx/?id=" + products[i].ProductId + "'><button class='btn btn-success'>Update</button></a></td>" +
                                 "<td><a href='/Product/deleteProduct.aspx/?id=" + products[i].ProductId + "'><button class='btn btn-danger'>Delete</button></a></td>" +
                             "</tr>");
                        }
                    }
                %>
            </tbody>
        </table>
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
