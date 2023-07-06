<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popupItem.aspx.cs" Inherits="PE2_Group_Assg.WebForm.popupItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .modalProduct{
            margin: 20px;
            border: 1px solid #000000;
            width: 700px;
            height: 350px;
            border-radius: 10px;
            padding: 50px 30px 50px 30px;
        }
        .pContainer{
            display: flex;
            flex-direction: row;
            height: 100%;
            width: 100%;
        }
        .pImgContainer{
            border: 1px solid #000000;
            height: 100%;
            width: 40%;
            text-align:center;
            display: flex;
            justify-content: center;
        }
        .pImg{
            text-align:center;
            object-fit: fill;
            width: 100%;
            height: 100%;
        }
        .pDetails{
            border: 1px solid #000000;
            height: 100%;
            width: 60%;
            display: flex;
            flex-direction: column;
        }
        .head{
            margin: 20px 10px 5px 20px;
            display: flex;
            flex-direction: row;
            width: 80%;
            padding: 0;
            text-align: left;
        }
        .pName{
            width: 50%;
            font-family: "artico-black", Arial, sans-serif;
            font-size: 20px;    
        }
        .wishListIcon{
            text-align: right;
            justify-content: center;
            width: 50%;
        }
        .content{
            width: 100%;
        }
        .content table{
            width: 100%;
            height: 100%;
        }
        .content table tr{
            text-align: left;
        }
        .content table td{
            padding-left: 20px;
            padding-bottom: 10px;
        }
        td p{
            padding: 0;
            margin: 0;
        }
        .qBtn{
            height:25px;
            width: 25px;
            padding-top: 0;
        }
        .cartBtn{
            margin-top: 5px;
            height:fit-content;
            padding: 5px;
            width: 90%;
            background-color: #121212;
            border-radius: 20px;
            color: #FCFCFF;
            font-weight:500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="modalContainer">
            <div class="pContainer">
                <asp:Button ID="closeModalButton" runat="server" Text="&times;" OnClick="closeModalButton_Click" />
                <div class="pImgContainer">
                    <asp:Image ID='<%# Eval("ImageID") %>' CssClass="pImg" runat="server" AlternateText="Product Image"/>
                </div>
                <div class="pDetails">
                    <div class="head">
                        <asp:Label ID="pName" CssClass="pName" runat="server" Text='<%# Eval("ProductName") %>'>Product Name</asp:Label>
                        <div class="wishListIcon">
                            <asp:ImageButton ID="addWishList" CssClass="addWishList" runat="server" ImageUrl="../Images/wishlist-icon.png" />
                        </div>
                    </div>
                    <div class="content">
                        <table>
                            <tr>
                                <td><asp:Label ID="priceLabel" CssClass="priceLabel" runat="server" Text='<%# Eval("Price") %>'>RM 0.00</asp:Label></td>
                            </tr>
                            <tr>
                                <td> 
                                    <img class="userIcon" src="../Images/user-icon.png" alt="" />
                                    <asp:Label ID="userName" CssClass="userName" runat="server" Text='<%# Eval("UserName") %>'>User name</asp:Label>
                                    <p class="productDescription"><%# Eval("ProductDescription") %>Product Description</p>
                                </td>
                            </tr>
                        
                            <tr>
                                <td >
                                    <label id="quantityLabel" style="margin-right:5px;">Quantity</label>
                                    <asp:Button ID="Button1" Cssclass="qBtn" runat="server" Text="-" OnClick="button_ClickMinus" CommandArgument='<%# Eval("ProductID") %>'/>
                                    <asp:Label ID="quantity" CssClass="qtyLabel" runat="server" Text='<%# Eval("ProductQuantity") %>'>1</asp:Label>
                                    <asp:Button ID="Button2" Cssclass="qBtn" runat="server" Text="+" OnClick="button_ClickAdd" CommandArgument='<%# Eval("ProductID") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="button" Cssclass="cartBtn" runat="server" Text="Add to Cart" OnClick="addToCart" CommandArgument='<%# Eval("ProductID") %>'/>
                                </td>
                            </tr>
                        </table>
                    
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
