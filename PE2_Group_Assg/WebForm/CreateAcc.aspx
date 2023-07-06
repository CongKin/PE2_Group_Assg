<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAcc.aspx.cs" Inherits="PE2_Group_Assg.WebForm.CreateAcc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Account</title>
    <link href="../CSS/Account.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Create Account</h1>
            <div class="form-group">
                <div style="display: flex;">
                    <asp:TextBox ID="firstName" runat="server" CssClass="input name fname" placeholder="First Name"></asp:TextBox>
                    <asp:TextBox ID="lastName" runat="server" CssClass="input name" placeholder="Last Name"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:DropDownList ID="gender" runat="server" CssClass="input gender">
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:TextBox ID="dob" TextMode="Date" runat="server" CssClass="input" placeholder="Date of Birth"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input" placeholder="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input" placeholder="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="button"/>
            </div>
            <div class="form-group">
                <asp:HyperLink ID="loginLink" runat="server" NavigateUrl="~/WebForm/Login.aspx" CssClass="link">Login</asp:HyperLink>
            </div>
            <div>
                <p class="prompt-end">By signing up, I agree to the Campus Trade's Terms of Service</p>
            </div>
            <div>
                <p class="prompt-end">Privacy Policy and Refund Policy</p>
            </div>
        </div>
    </form>
</body>
</html>
