<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="PE2_Group_Assg.WebForm.Transaction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction</title>
    <style type="text/css">
        body{
            background-color: #D9D9D9;
        }

        .trans{
            display:flex;
        }

        .deli{
            width: 60%;
        }

        .deli-info{
            display: flex;
        }

        .info{
            margin-left:10px;
            margin-right:10px;
            width: auto;

        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="trans">
            <!-- delivery information -->
            <div class ="deli">
                <h1>Delivery Information</h1>
                <div class="deli-info">
                    <!-- personal information -->
                    <div class ="info">
                        <h2>Full Name</h2>
                        <asp:TextBox ID="name" runat="server" placeholder="Please enter your name"></asp:TextBox>
                        <h2>Phone Number</h2>
                        <asp:TextBox ID="phone" runat="server" placeholder="Please enter your phone number"></asp:TextBox>
                    </div>
                    <!-- address information -->
                    <div class="info">
                        <h2>Building</h2>
                        <asp:DropDownList ID="building" runat="server"></asp:DropDownList>
                        <h2>Room Number</h2>
                        <asp:TextBox ID="room" runat="server" placeholder="Please enter your room number. eg: A401"></asp:TextBox>
                        <h2>Message</h2>
                        <asp:TextBox ID="message" runat="server" placeholder="Leave your message"></asp:TextBox>
                    </div>
               </div>
            </div>

            <!-- payment -->
            <div>
                <!-- payment method -->
                <div>
                    <h1>Select Payment Method</h1>
                    <asp:DataList ID="paymentlist" runat="server"></asp:DataList>
                </div>
                <!-- summary -->
                <div>
                    <!-- detail -->
                    <table>
                        <tr>
                            <td>
                                <p>Subtotal</p>
                                <asp:Label ID="item_count" runat="server" Text="(0 item)"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="item_price" runat="server" Text="RM0.00"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Shipping Fee</p>
                            </td>
                            <td>
                                <asp:Label ID="shiping_fee" runat="server" Text="RM0.00"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <!-- total -->
                    <div>
                        <span>Total</span>
                        <asp:Label ID="total" runat="server"></asp:Label>
                    </div>
                </div>
                <!-- button -->
                <asp:Button ID="submit" runat="server" Text="PLACE ORDER" />
            </div>
        </div>
    </form>
</body>
</html>
