<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="PE2_Group_Assg.CartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/font.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Istok+Web&display=swap" rel="stylesheet"/>
    <style>
        body{
            font-family: Arial;
        }
        header{
            display: grid;
            grid-template-columns: 1fr 300px;
            align-items:center;
        }
        h1 {
            font-family: "artico-black", Arial, sans-serif;
            padding-left: 40px;
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
            padding-left: 30px;
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
        .content{
            margin: 0 40px 40px 30px;
            height: 260px;
            border-top:3px solid #F4F4F4;
            border-bottom: 3px solid #F4F4F4;
        }
        .dataList{
            width: 100%;
            padding:0;
            margin: 0;
        }
        .dataList table{
            width: 100%;
            margin-top: 15px;
            font-family: "articocond";
        }
        td{
            text-align: center;
            vertical-align: top;
        }
        .productImage{
            object-fit:cover;
            width: 100px;
            height: 100px;
        }
        .qty{
            text-align:right;
            margin-right: 125px;
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
    <script>
        function updatePrice() {
            var qtyInput = document.getElementById("qtyInput");
            var total = document.getElementById("price");
            var price = document.getElementById("priceLabel");

            var quantity = parseInt(qtyInput.value);
            var pricePerUnit = parseFloat(price.value);
            var totalPrice = quantity * pricePerUnit; 
    
            total.innerText = totalPrice.toFixed(2);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        
        <header>
            <h1>Your Cart</h1>
            <a href="">Continue Shopping</a>
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
                                        <span class="productDescription" style="margin-top: 20px; line-height: 0.8;"><%# Eval("ProductDescription") %></span>
                                        <asp:Label ID="priceLabel" CssClass="priceLabel" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                    </div>
                                </td>
                                <td width="25%">
                                    <div class="qty">
                                        <input id="qtyInput" class="input-group-field" type="number" name="quantity" value='<%# Eval("ProductQuantity") %>' runat="server" min="0" max='<%# Eval("MaxQuantity") %>' onchange="updatePrice(this)"/>
                                    </div>
                                </td>
                                <td width="20%"><div style="text-align:right;"><asp:Label ID="price" CssClass="priceLabel" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label></div></td>
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
                                 <asp:Label ID="subtotal" CssClass="totalLabel" runat="server" Text="RM 50.00"></asp:Label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:Label ID="infoColumn" CssClass="checkoutInfo" runat="server" Text="Shipping, taxes, and discounts will be calculated at checkout."></asp:Label>
                <div class="btn" text-align="right">
                    <button class="checkoutBtn" type="button" onclick="">Checkout</button>
                </div>
            </div>
        </div>
        <footer></footer>
    </form>
</body>
</html>
