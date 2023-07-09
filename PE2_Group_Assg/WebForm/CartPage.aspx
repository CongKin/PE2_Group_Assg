<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="PE2_Group_Assg.CartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/font.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Istok+Web&display=swap" rel="stylesheet"/>
    <style>
        body{
            font-family: Arial;
        }
        header{
            display: grid;
            grid-template-columns: 1fr 50px 200px;
            align-items:center;
        }
        h1 {
            font-family: "artico-black", Arial, sans-serif;
            padding-left: 40px;
        }
        .saveBtn{
            width: fit-content;
            text-decoration: underline;
            background: none;
            border: none;
            font-weight:600;
            font-size: 17px;
            color: #551A8B;
        }
        a{
            text-align: right;
            padding-right: 40px;
            font-weight:600;
        }
        .titleLabel{
            align-items:center;
            color: #c6c6c6;
        }
        th{
            padding: 5px;
            height: 50px;
            font-weight:600;
            font-size: 12px;
        }
        .title1{
            width: 50%;
            padding-left: 70px;
        }
        .title1, title2{
            text-align: left;
        }
        .title2, .title3{
            width: 25%;
        }
        .title3{
            text-align: right;
            padding-right: 40px;
        }
        .container{
            height: 100%;
        }
        .content{
            margin: 0 40px 40px 30px;
            border-top:3px solid #F4F4F4;
            scrollbar-width: none; /* Hide the scrollbar for Firefox */
            -ms-overflow-style: none;
            border-bottom: 3px solid #F4F4F4;
        }
        .content::-webkit-scrollbar {
            width: 0; /* Hide the scrollbar for Chrome, Safari, and Opera */
        }
        .dataList{
            width: 100%;
            padding:0;
            margin: 0;
        }
        .dataList table{
            width: 100%;
            margin-top: 15px;
            font-family: "engula-medium","articocond";
        }
        td{
            text-align: center;
            vertical-align: top;
        }
        .productImage{
            object-fit:contain;
            width: 100px;
            height: 100px;
        }   
        .qty{
            text-align:center;
            margin-right: 80px;
        }
        .checkout{
            display:flex;
            flex-direction:column;
            text-align:right;
            justify-content: flex-end;
            padding: 0 40px 0 0;
            margin: 0;
        }
        .subtotal{
            width: 100%;
            margin: 0 0 8px 0;
            padding: 0;
            text-align: right;
        }
        .subtotal th{
            font-size: 20px;
            font-weight: 900;
            text-align: right;
            padding: 0;
            margin: 0;
        }
        .subtotal td{
            font-family: 'Istok Web';
            text-align: right;
            padding: 0;
            margin: 0;
            font-size: 24px;
            font-weight: 100;
            color: #7f7f7f;
        }
        .checkoutInfo{
            margin-bottom: 20px;
            color: #7f7f7f;
            font-weight: 300;
        }
        .checkoutBtn{
            height:fit-content;
            padding: 10px;
            width: 30%;
            background-color: #121212;
            border-radius: 20px;
            color: #FCFCFF;
            font-weight:500;
            letter-spacing: 2px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <header>
            <h1>Your Cart</h1>
                <asp:Button ID="saveBtn" CssClass="saveBtn" runat="server" OnClick="save_OnClick" Text="Save" />
            
            <a href="#" onclick="saveConfirmation();">Continue Shopping</a>
        </header>

        <div class="container">
            <table style="width:100%; margin: 0;">
                <tr>
                    <th class="title1">
                        <asp:Label ID="title1Label" CssClass="titleLabel" runat="server" Text="PRODUCT"></asp:Label>
                    </th>
                    <th class="title2">
                        <asp:Label ID="title2Label" CssClass="titleLabel" runat="server" Text="QUANTITY"></asp:Label>
                    </th>
                    <th class="title3">
                        <asp:Label ID="title3Label" CssClass="titleLabel" runat="server" Text="TOTAL"></asp:Label>
                    </th>
                </tr>
            </table>

            <div class =" content">
                <asp:DataList ID="cartList" CssClass="dataList" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"> 
                    
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td width="15%"><asp:Image ID="productImage" CssClass="productImage" runat="server" ImageUrl='<%# "ProductImageHandler.ashx?product_id=" + Eval("ProductID") %>'/></td>
                                <td width="40%">
                                    <div style="text-align:left; display: flex; flex-direction: column;">
                                        <asp:Label ID="productName" CssClass="productName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                        <span class="productDescription" style="margin-top:10px; margin-bottom: 10px; line-height: 0.8;"><%# Eval("ProductDescription") %></span>
                                        <asp:Label ID="priceLabel" CssClass="priceLabel" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                    </div>
                                </td>
                                <td width="25%">
                                    <div class="qty">
                                        <input id="qtyInput" class="input-group-field" type="number" name="quantity" value='<%# Eval("ProductQuantity") %>' runat="server" min="0" max='<%# Eval("MaxQuantity") %>' onchange="updatePrice(this)" data-price='<%# Eval("Price") %>' data-productid='<%# Eval("ProductID") %>'/>
                                    </div>
                                </td>
                                <td width="20%"><div style="text-align:right;"><asp:Label ID="totalPrice" CssClass="ttlPriceLabel" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label></div></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div class="checkout">
                <div class="subtotal">
                    <table width="30%" align="right" padding="0" margin="0">
                        <tr>
                            <th>
                                <span >Subtotal</span>
                            </th>
                            <td style="margin: 0; padding:0; vertical-align:bottom; padding-bottom: 8px;">
                                <div style="height: 100%; vertical-align: middle;">
                                 <asp:Label ID="subtotal" CssClass="subtotalLabel" runat="server" Text="RM 50.00"></asp:Label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:Label ID="infoColumn" CssClass="checkoutInfo" runat="server" Text="Shipping, taxes, and discounts will be calculated at checkout."></asp:Label>
                <div class="btn" text-align="right">
                    <asp:Button ID="checkoutBtn" CssClass="checkoutBtn" runat="server" OnClick="checkout_OnClick" Text="Checkout" />
                </div>
            </div>
        </div>
        <footer></footer>


    </form>
    <script>
        function updatePrice(qtyInput) {
            var currentItem = qtyInput.closest("tr");
            var priceLabel = currentItem.querySelector(".ttlPriceLabel");
            

            var quantity = parseFloat(qtyInput.value);
            var pricePerUnit = parseFloat(qtyInput.getAttribute("data-price"));
            var totalPrice = quantity * pricePerUnit;

            priceLabel.innerHTML = totalPrice.toFixed(2);
            alert("priceLabel updated");
            updateSubtotal();
        }
        function updateSubtotal() {
            var subtotalLabel = document.getElementById("<%= subtotal.ClientID %>");
            var ttlPriceLabels = document.querySelectorAll(".ttlPriceLabel");
            var subtotal = 0;

            for (var i = 0; i < ttlPriceLabels.length; i++) {
                var price = parseFloat(ttlPriceLabels[i].innerText);
                subtotal += price;
            }

            subtotalLabel.innerHTML = "RM " + subtotal.toFixed(2);
            alert("subtotal updated");
        }
        function updateQuantityInDatabase(productId, quantity) {
            // Prepare the data for submission
            var formData = new FormData();
            formData.append("productId", productId);
            formData.append("quantity", quantity);

            // Make an AJAX request to update the quantity in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", window.location.href, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Success, do something if needed
                }
            };
            xhr.send(formData);
        }

        function save() {
            var qtyInputs = document.querySelectorAll(".qtyInput");
            var updatedProducts = [];

            for (var i = 0; i < qtyInputs.length; i++) {
                var qtyInput = qtyInputs[i];
                var currentItem = qtyInput.closest("tr");
                var productId = qtyInput.getAttribute("data-productid");
                var quantity = parseFloat(qtyInput.value);

                updateQuantityInDatabase(productId, quantity);
                updatedProducts.push(productId);
            }

            // Redirect to the desired page after updating all quantities
            window.location.href = "ProductListPage.aspx?updatedProducts=" + encodeURIComponent(updatedProducts.join(","));
        }

        var qtyInputs = document.querySelectorAll(".qtyInput");
        for (var i = 0; i < qtyInputs.length; i++) {
            qtyInputs[i].addEventListener("change", function () {
                updatePrice(this);
            });
        }

        var confirmButton = document.getElementById("saveBtn");
        if (confirmButton) {
            confirmButton.addEventListener("click", save);
        }

        function saveConfirmation() {
            var result = confirm("Continue without saving?");
            if (result) {
                window.location.href = "ProductListPage.aspx";
            }
            else {
                alert("Save changes before continuing.");
            }
        }
    </script>
</body>
</html>
