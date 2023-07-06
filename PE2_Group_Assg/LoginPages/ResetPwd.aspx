<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPwd.aspx.cs" Inherits="PE2_Group_Assg.LoginPages.ResetPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New password</title>
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Enter your new password</h1>
        <div class="form-group">
            <asp:Label ID="prompt" runat="server" Text="Please enter your new password for your account" CssClass="prompt"></asp:Label>
        </div>
        <div class="form-group">
            <asp:TextBox ID="newPwd" runat="server" TextMode="Password" CssClass="input" placeholder="New Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="repPwd" runat="server" TextMode="Password" CssClass="input" placeholder="Repeat Your New Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button"/>
        </div>
        <div class="form-group">
            <asp:HyperLink ID="cancel" runat="server" NavigateUrl="~/LoginPages/Reset.aspx" CssClass="link">Cancel</asp:HyperLink>
        </div>
    </form>
</body>
</html>

