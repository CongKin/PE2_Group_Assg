<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPwd.aspx.cs" Inherits="PE2_Group_Assg.LoginPages.ResetPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New password</title>
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
        .prompt {
            color:gray;
            text-align: center;
            font-size: 20px;
            margin-bottom: 15px;
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

