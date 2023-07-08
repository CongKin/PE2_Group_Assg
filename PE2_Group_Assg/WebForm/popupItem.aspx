<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popupItem.aspx.cs" Inherits="PE2_Group_Assg.WebForm.popupItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"  style="width:100%;height:100%;padding:0;margin:0;">
<head runat="server">
    <title></title>
    <link href="../CSS/font.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>
    <style>
        .modalContainer{
            width: 700px;
            height: 350px;
            border-radius: 10px;
            padding: 50px 30px 50px 30px;
            margin: 20px;
        }
        .pContainer{
            display: flex;
            flex-direction: row;
            height: 100%;
            width: 100%;
        }
        .pImgContainer{
            height: 100%;
            width: 50%;
            text-align:center;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
        }
        .pImg{
            text-align:center;
            object-fit: fill;
            width: 90%;
            height: 100%;
            border-radius: 10px;
        }
        .pDetails{
            background-color: #F5F5F5;
            height: 100%;
            width: 50%;
            display: flex;
            flex-direction: column;
            border-radius: 10px;
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
            font-family:'engula-medium', 'articocond';
        }
        .userName{
            margin-left: 10px;
        }
        td p{
            padding: 0;
            margin: 0;
            max-width: 90%;
        }
        .qBtn{
            height:20px;
            width: 20px;
            padding: 0;
            border-radius: 5px;
            background-color: #121212;
            color:#FCFCFF;
            font-size: 20px;
            font-weight:500;
            display: flex;
            justify-content:center;
            line-height: 0.8;
        }
        .input-group-field{
            font-family: 'engula-medium', 'articocond';
            font-size: 14px;
            font-weight: 400;
            margin: 0 8px 0 8px;
            width: 10%;
            line-height: 1.5;
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
<body style="width:100%;height:100%;padding:0;margin:0;">
    <form id="form1" runat="server" style="background-color:#FFFFFF;width:100%;height:100%;padding:0;margin:0;display:flex;text-align:center;justify-content:center;">
        <div class="modalContainer">
            <div class="pContainer">
                <div class="pImgContainer">
                    <asp:Image ID="pImage" CssClass="pImg" runat="server" AlternateText="Product Image"/>
                </div>
                <div class="pDetails">
                    <div class="head">
                        <asp:Label ID="pName" CssClass="pName" runat="server" >Product</asp:Label>
                        <div class="wishListIcon">
                            <asp:ImageButton ID="addWishList" CssClass="addWishList" runat="server" ImageUrl="../Images/wishlist-icon.png" />
                        </div>
                    </div>
                    <div class="content">
                        <table>
                            <tr>
                                <td><asp:Label ID="priceLabel" CssClass="priceLabel" runat="server" >RM 0.00</asp:Label></td>
                            </tr>
                            <tr>
                                <td> 
                                    <div style="display: flex;  align-items: center; margin-bottom: 15px;">
                                        <img class="userIcon" src="../Images/user-icon.png" alt="" />
                                        <asp:Label ID="userName" CssClass="userName" runat="server" >Hello</asp:Label>
                                    </div>
                                    <p class="productDescription" id="pDescrip" runat="server">ASSSSDFGHKJH FGHJIKOLFYUILO:LKBVCYKILO:PJLJBL</p>
                                </td>
                            </tr>
                        
                            <tr>
                                <td >
                                    <div style="display:flex;align-items:center;">
                                    <label id="quantityLabel" style="margin-right:5px;">Quantity</label>
                                    <input id="qty" class="input-group-field" type="number" name="quantity" value="1" runat="server"/>
                                    <asp:Label ID="amt" CssClass="qtyLabel" runat="server" >4</asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr style="margin-top: 10px;">
                                <td>
                                    <asp:Button ID="cartBtn" Cssclass="cartBtn" runat="server" Text="Add to Cart" OnClick="addToCart"/>
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
