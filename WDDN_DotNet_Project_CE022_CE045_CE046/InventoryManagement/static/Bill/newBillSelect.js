$(document).ready(function () {
    $('.selectHandle').click(function () {
        //alert("clicked!!" + this.id);
        var pdtName = document.getElementById('pdtName' + this.id).innerText;
        var pdtQty = document.getElementById('pdtQty' + this.id).innerText;
        var pdtSellPrice = document.getElementById('pdtSellPrice' + this.id).innerText.split(" ")[1];
        var data = document.getElementById("tbodyIdBill");
        var serial_no = data.childElementCount + 1;
        let temp = document.createElement('tr');
        temp.innerHTML = "<td>" + serial_no + "</td>" +
            "<td>" + pdtName + "</td>" +
            "<td><asp:TextBox ID='TextBoxQty' runat='server' type='number' Text='0'></asp:TextBox ></td>" +
            "<td><></td>"
            "<td>" + pdtSellPrice+"</td>" +
            "<td>500</td>" +
            "<td>delete</td>";
        data.appendChild(temp);
        alert(pdtName + " " + pdtQty + " " + pdtSellPrice);
    });


});