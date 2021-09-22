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
</head>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->
    <div class="row container-fluid">
        <div class="col-6" style="border-right: 2px solid black;">
            <div class="form-wrapper cf" style="margin-left: 7%;">
                <input type="text" class="search" placeholder="Search Product here" required>
            </div>
            <div class="">
                <table class="table table-hover mt-1" id="productTable">
                    <thead>
                        <tr>
                            <th scope="col">Product Id</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">CategoryName</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Selling Price</th>
                            <th scope="col">Select</th>

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
                                         "<td id='pdtName" + products[i].ProductId + "'>" + products[i].ProductName + "</td>" +
                                         "<td>" + products[i].CategoryName + "</td>" +
                                         "<td id='pdtQty" + products[i].ProductId + "'>" + products[i].Quantity + "</td>" +

                                         "<td id='pdtSellPrice" + products[i].ProductId + "'>&#x20B9; " + products[i].SellingPrice + "</td>" +
                                         "<td><button id='" + products[i].ProductId + "' class='btn btn-success selectHandle' onClick=''>Select</button></td>" +
                                     "</tr>");
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>

        </div>
        <div class="col-6 mt-4" style="border-left: 2px solid black">
            <form id="form1" runat="server"> 
                <div class="row">
                    <div class="col-6">
                        Name:
                        <asp:TextBox ID="TextBoxName" runat="server" type="text"
                            class="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-6">
                        PhoneNumber:
                        <asp:TextBox ID="TextBoxPhoneNo" runat="server" type="text"
                            class="form-control " Style="display: inline"></asp:TextBox>
                    </div>
                </div>
                <hr />
                <div>
                    <table class="table table-hover mt-1" id="productTable">
                        <thead>
                            <tr>
                                <th scope="col">S.No</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Selling Price</th>
                                <th scope="col">Total Price</th>
                                <th scope="col">Delete</th>

                            </tr>
                        </thead>
                        <tbody id="tbodyIdBill">
                            <tr><th scope="row">1</th><td id="pdtName1">SandWitch </td><td>medicine</td><td id="pdtQty1">3</td><td id="pdtSellPrice1">₹ 500</td><td><button id="1" class="btn btn-success selectHandle" onclick="">Select</button></td></tr>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>
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
