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
        
        @font-face {
            font-family: 'artico-black';
            src: url('Fonts/artico-black.otf') format('truetype');
        }
        @font-face {
            font-family: 'articocond';
            src: url('Fonts/articocond.otf') format('truetype');
        }
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
                <asp:DataList ID="cartList" CssClass="dataList" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"> 
                    <!--OnEditCommand="dl1_EditCommand"      
                    OnCancelCommand="dl1_CancelCommand"      
                    OnUpdateCommand="dl1_updateCommand"      
                    OnDeleteCommand="dl1_DeleteCommand">-->
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td><asp:Image ID="productImage" CssClass="productImage" runat="server" ImageUrl="<%# Eval("ProductImageUrl") %>" AlternateImageUrl="Images/product-tag.jpg"/></td>
                                <td>
                                    <asp:Label ID="productName" CssClass="productName" runat="server" Text="<%# Eval("ProductName") %>"></asp:Label>
                                    <span class="productDescription"><%# Eval("ProductDescription") %></span>
                                </td>
                                <td>
                                    <div class="qty">
                                        <asp:Button ID="-Btn" Cssclass="-Btn" runat="server" Text="-" OnClick="button_ClickMinus" CommandArgument='<%# Eval("ProductID") %>'/>
                                        <asp:Label ID="quantity" CssClass="qtyLabel" runat="server" Text="<%# Eval("ProductQuantity") %>'/>"></asp:Label>
                                        <asp:Button ID="+Btn" Cssclass="+Btn" runat="server" Text="+" OnClick="button_ClickAdd" CommandArgument='<%# Eval("ProductID") %>'/>
                                    </div>
                                </td>
                                <td><asp:Label ID="price" CssClass="priceLabel" runat="server" Text="<%# Eval("ProductPrice") %>'/>"></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div class="checkout">
                <div class="subtotal">
                    <table width="20%" align="right" padding="0" margin="0">
                        <tr>
                            <th>
                                <span>Subtotal</span>
                            </th>
                            <td>
                                <asp:Label ID="total" CssClass="totalLabel" runat="server" Text="RM 50.00"></asp:Label>
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
