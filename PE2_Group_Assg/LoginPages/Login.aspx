<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PE2_Group_Assg.LoginPages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Login</h1>
        <div class="form-group">
            <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input" placeholder="Email"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input" placeholder="Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button"/>
        </div>
        <div class="form-group">
            <asp:HyperLink ID="forgotPassword" runat="server" NavigateUrl="~/LoginPages/Reset.aspx" Class="link">Forgot your password?</asp:HyperLink>
        </div>
        <div class="form-group">
            <asp:HyperLink ID="createAccount" runat="server" NavigateUrl="~/LoginPages/CreateAcc.aspx" CssClass="link">Create account</asp:HyperLink>
        </div>
    </form>
</body>
</html>
