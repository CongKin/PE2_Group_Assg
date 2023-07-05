﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reset.aspx.cs" Inherits="PE2_Group_Assg.LoginPages.Reset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset your password</title>
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
        .email {
            width: 520px;
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
        .send-button {
            background-color: gray;
            color: white;
            border: none;
            border-radius: 15px;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            cursor: pointer;
            margin-top: 8px;
            margin-left: 10px;
            width: 70px;
            height: 35px;
        }
        .send-button:hover {
            background-color: black;
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
        <h1>Reset your password</h1>
        <div class="form-group">
            <asp:Label ID="prompt" runat="server" Text="We will send you a 6 digit verification code to your email to reset your password" CssClass="prompt"></asp:Label>
        </div>
        <div class="form-group">
            <div style="display: flex;">
                <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input email" placeholder="Email"></asp:TextBox>
                <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="send-button" />
            </div>
        </div>
        <div class="form-group">
            <asp:TextBox ID="verifCode" runat="server" CssClass="input" placeholder="Verification Code"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button"/>
        </div>
        <div class="form-group">
            <asp:HyperLink ID="cancel" runat="server" NavigateUrl="~/LoginPages/Login.aspx" CssClass="link">Cancel</asp:HyperLink>
        </div>
    </form>
</body>
</html>