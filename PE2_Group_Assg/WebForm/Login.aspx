<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PE2_Group_Assg.WebForm.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../CSS/Account.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <h1>Login</h1>
        <asp:Label ID="test" runat="server"></asp:Label>
        <!-- login -->
        <div class="form-group">
            <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input" placeholder="Email"></asp:TextBox>
        </div>
            <!-- validation -->
            <asp:RequiredFieldValidator ID="RVD_email" runat="server" ErrorMessage="*Required" ControlToValidate="email" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="email" ID="max_email" ValidationExpression="^[\s\S]{0,45}$" runat="server" 
                ErrorMessage="*Maximum 45 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="email" ID="min_email" ValidationExpression="^[\s\S]{5,}$" runat="server" 
                ErrorMessage="*Minimum 5 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
            <asp:Label ID="error_email" runat="server" CssClass="error"></asp:Label>
        
        <!-- password-->
        <div class="form-group">
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input" placeholder="Password"></asp:TextBox>           
        </div>
            <!--validation-->
            <asp:RequiredFieldValidator ID="RVD_password" runat="server" ErrorMessage="*Required" ControlToValidate="password" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator> 
             <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="password" ID="max_password" ValidationExpression="^[\s\S]{0,20}$" runat="server" 
                ErrorMessage="*Maximum 20 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="password" ID="min_password" ValidationExpression="^[\s\S]{4,}$" runat="server" 
                ErrorMessage="*Minimum 4 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
            <asp:Label ID="error_password" runat="server" CssClass="error"></asp:Label>
       
        <!-- submit button -->
        <div class="form-group">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" OnClick="login_clicked"/>
        </div>

        <!-- other link-->
        <div class="form-group">
            <asp:HyperLink ID="forgotPassword" runat="server" NavigateUrl="~/WebForm/Reset.aspx" Class="link">Forgot your password?</asp:HyperLink>
        </div>
        <div class="form-group">
            <asp:HyperLink ID="createAccount" runat="server" NavigateUrl="~/WebForm/CreateAcc.aspx" CssClass="link">Create account</asp:HyperLink>
        </div>
    </div>
    </form>
</body>
</html>
