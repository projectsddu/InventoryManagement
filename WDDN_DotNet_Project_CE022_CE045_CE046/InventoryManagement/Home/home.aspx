<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="InventoryManagement.Home.home" %>


<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>Home</title>
</head>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->
    <form id="form1" class="container mt-4" runat="server">
        <div class="row">
            <div class="card col-3" style="width: 20rem;border:1px solid grey">
                <div class="card-body">
                    <h1 class="card-title">Welcome Back</h1>
                    <br />
                    <h3 class="card-subtitle mb-2 text-muted"><% Response.Write(ViewState["username"].ToString()); %></h3>
                    <br />
                    <p class="card-text" style="font-weight: bolder">Lets start the day with a fact</p>
                    <p class="card-text">More human twins are being born now than ever before.</p>

                </div>
            </div>
            <div class="card col-9" style="margin-left:10px;border:1px solid grey">
                <div class="card-header">
                    <h5>Your Recent Bills</h5>
                </div>
                <div class="card-body">
                    <% 
                        if(ViewState["bills"]!=null)
                        {
                            BillList b = (BillList)ViewState["bills"];
                            //Response.Write(p.pdtList.Count);
                            for (int i = 0; i < b.billList.Count; i++)
                            {


                                Response.Write(
                                "<ol class='list-group '>" +
                                    "<li class='list-group-item'><b>"+b.billList[i].id+" ) Customer Name:"+b.billList[i].customerName+", Customer Phone No:"+b.billList[i].customerPhone+"</b></li>" +
                                "</ol>");
                            }
                        }
                        else
                        {
                            Response.Write("<h3>No Bills Yet!</h3>");
                        }
                        %>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="card col-12 mt-2" style="border:1px solid grey">
                <div class="card-header">
                    <h5>Recently added products</h5>
                </div>
                <div class="card-body">
                    <% 
                        if (ViewState["products"] != null)
                        {
                            ProductList p = (ProductList)ViewState["products"];
                            //Response.Write(p.pdtList.Count);
                            for (int i = 0; i < p.pdtList.Count; i++)
                            {


                                Response.Write(
                                "<ol class='list-group '>" +
                                    "<li class='list-group-item'><b>"+p.pdtList[i].id+" ) "+p.pdtList[i].productName+" Buying Price:"+p.pdtList[i].buyingPrice+", Selling Price:"+p.pdtList[i].sellPrice+"</b></li>" +
                                "</ol>");
                            }
                        }
                        else
                        {
                            Response.Write("<h3>No Products Yet!</h3>");
                        }
                        %>
                </div>
            </div>
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


