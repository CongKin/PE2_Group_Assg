<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PE2_Group_Assg.LoginPages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            background-color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            font-family: Andale Mono;
            text-align: center;
            color: black;
            font-size: 50px;
        }
        .input {
            border: 1px solid black;
            border-radius: 30px;
            padding: 15px;
            width: 600px;
            font-size: 18px;
        }
        .button {
            background-color: black;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            cursor: pointer;
            width: 150px;
            margin-bottom: 20px;
            margin-top: 10px;
        }
        .button:hover {
            background-color: gray;
        }
        .link {
            color: gray;
            text-decoration: none;
            display: block;
            text-align: center;
            font-size: 16px;
        }
        .link:hover {
            text-decoration: underline;
        }
        .form-group {
            margin-bottom: 10px;
            display: flex;
            justify-content: center;
        }
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
