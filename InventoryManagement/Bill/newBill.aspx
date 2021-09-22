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
                       
                    </tbody>
                </table>
            </div>
            <div class="col-6" style="border-left: 2px solid black">
                <form id="form1" runat="server">
                    <h1>Kevak gandevia jenil gandhi riking dfhwdiodwbvdwv</h1>
                </form>
            </div>
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
