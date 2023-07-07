<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="PE2_Group_Assg.WebForm.Transaction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction</title>
    <link href="../CSS/Transaction.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="trans">
            <!-- delivery information -->
            <div class ="deli background">
                <h1>Delivery Information</h1>
                <div class="deli-info">
                    <!-- personal information -->
                    <div class ="info">
                        <h2>Full Name</h2>
                        <asp:TextBox ID="name" runat="server" placeholder="Please enter your name" CssClass="textbox"></asp:TextBox>
                        <h2>Phone Number</h2>
                        <asp:TextBox ID="phone" runat="server" placeholder="Please enter your phone number" CssClass="textbox"></asp:TextBox>
                    </div>
                    <!-- address information -->
                    <div class="info">
                        <h2>Building</h2>
                        <asp:DropDownList ID="building" runat="server" CssClass="textbox"></asp:DropDownList>
                        <h2>Room Number</h2>
                        <asp:TextBox ID="room" runat="server" placeholder="Please enter your room number. eg: A401" CssClass="textbox"></asp:TextBox>
                        <h2>Message</h2>
                        <asp:TextBox ID="message" runat="server" placeholder="Leave your message" CssClass="textbox"></asp:TextBox>
                    </div>
               </div>
            </div>

            <!-- payment -->
            <div class="payment background" >
                <!-- payment method -->
                <div>
                    <h2>Select Payment Method</h2>
                    <!-- cod -->
                    <div class="pay-method">
                        <asp:RadioButton ID="cod" runat="server" GroupName="payment" />
                        <img src="../Images/cod-icon.png" />
                        <span>Cash On Delivery</span>
                    </div>
                    <!-- tng -->
                    <div class="pay-method">
                        <asp:RadioButton ID="tng" runat="server" GroupName="payment" />
                        <img src="../Images/tng-icon.png" />
                        <span>Touch 'n Go eWallet</span>
                    </div>
                </div>
                <!-- summary -->
                <div class ="order">
                    <h2>Order Summary</h2>
                    <!-- detail -->
                    <table class ="summary">
                        <tr>
                            <td style="width:70%; height:40px;" >
                                <div  class="summary-title">
                                    <span>Subtotal</span>
                                    <asp:Label ID="item_count" runat="server" Text="(0 item)"></asp:Label>
                                </div>
                            </td>
                            <td style="width:30%; height:40px; text-align: right;">
                                <asp:Label ID="item_price" runat="server" Text="RM0.00" CssClass="summary-price"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="summary-title">Shipping Fee</span>
                            </td>
                            <td style=" text-align: right;">
                                <asp:Label ID="shiping_fee" runat="server" Text="RM0.00" CssClass="summary-price"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <!-- total -->
                    <div class="total">
                        <span class="total-title">Total</span>
                        <asp:Label ID="total" runat="server" Text="RM0.00" CssClass="total-price"></asp:Label>
                    </div>
                    <!-- button -->
                    <div class="submit-container">
                        <asp:Button ID="submit" runat="server" Text="PLACE ORDER" CssClass="submit"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
