<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewBill.aspx.cs" Inherits="InventoryManagement.Bill.viewBill" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>View Bill</title>
</head>
<body>
    <!--#include file="~/static/Home/shared_navbar.html"-->

            <%

                    if (ViewState["type"] == "single")
                    {
                        Bill b = (Bill)ViewState["data"];
                        List<BillDetails> b1 = b.BillItems;
                        int totalPrice = 0;
                        int totalQuantity = 0;
                        Response.Write(
                            "<table style='width: 60%' class='table container text-center mt-4 table-hover'>" +
                            "<thead>" +
                              "<tr>" +
                                "<th scope='col'> Product Name </th>" +
                                "<th scope='col'> Quantity </th>" +
                                "<th scope='col'> Price </th>" +
                                "<th scope='col'> Total </th>" +
                              "</tr>" +
                            "</thead>" +
                            "<tbody>"
                            );
                        for (int i = 0; i < b1.Count; i++)
                        {
                            totalPrice += b1[i].sellingPrice * b1[i].Quantity;
                            totalQuantity += b1[i].Quantity;
                            Response.Write(
                                "<tr>" +
                                  "<td>" + b1[i].productName + "</td>" +
                                  "<td>" + b1[i].Quantity + "</td>" +
                                  "<td>" + b1[i].sellingPrice + "</td>" +
                                  "<td>" + b1[i].sellingPrice * b1[i].Quantity + "</td>" +
                                "</tr>"
                            );
                        }
                        Response.Write(
                            "<tr>" +
                                  "<th scope='row'>" + "Total" + "</th>" +
                                  "<th scope='row'>" + totalQuantity + "</th>" +
                                  "<th scope='row'> </th>" +
                                  "<th scope='row'>" + totalPrice + "</th>" +
                                "</tr>"
                         );
                        Response.Write(
                            "</tbody>" +
                            "</table>"
                        );
                    }
                    else
                    {
                        Response.Write(
                            "<table style='width: 60%' class='table container text-center mt-4 table-hover'>" +
                            "<thead>" +
                              "<tr>" +
                                "<th scope='col'> Bill Id </th>" +
                                "<th scope='col'> Customer Name </th>" +
                                "<th scope='col'> Customer Phone Number </th>" +
                                "<th scope='col'> View Bill </th>" +
                              "</tr>" +
                            "</thead>" +
                            "<tbody>"
                            );
                        List<Bills> b = (List<Bills>)ViewState["data"];
                        for (int i = 0; i < b.Count; i++)
                        {
                            Response.Write(
                            "<tr>" +
                              "<td>" + b[i].id + "</td>" +
                              "<td>" + b[i].customerName + "</td>" +
                              "<td>" + b[i].customerPhoneNumber + "</td>" +
                              "<td><a href='/Bill/viewBill.aspx?idx="+ b[i].id +"'><button class='btn btn-success'>View Bill</button></a></td>" +
                            "</tr>"
                            );
                        }
                        Response.Write(
                            "</tbody>" +
                            "</table>"
                        );
                }

            %>
        
    <button id="printBtn" class="btn btn-success container" onclick="handlePrint()" style="display: block; width: 10%">Print</button>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <script>

        function handlePrint() {
            document.getElementById("printBtn").style.display = "none";
            window.print();
            document.getElementById("printBtn").style.display = "block";
        }
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
