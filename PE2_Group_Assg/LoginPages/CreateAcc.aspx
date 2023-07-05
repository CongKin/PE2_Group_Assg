<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAcc.aspx.cs" Inherits="PE2_Group_Assg.LoginPages.CreateAcc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create account</title>
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
        .gender {
            width: 630px;
        }
        .name {
            width: 280px;
        }
        .fname {
            margin-right: 10px;
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
            font-size: 18px;
            margin-bottom: 20px;
        }
        .link:hover {
            text-decoration: underline;
        }
        .prompt {
            color:gray;
            text-align: center;
            font-size: 16px;
            margin-bottom: 5px;
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
        <h1>Create Account</h1>
        <div class="form-group">
            <div style="display: flex;">
                <asp:TextBox ID="firstName" runat="server" CssClass="input name fname" placeholder="First Name"></asp:TextBox>
                <asp:TextBox ID="lastName" runat="server" CssClass="input name" placeholder="Last Name"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="gender" runat="server" CssClass="input gender">
                <asp:ListItem Text="Gender" Value="" Selected="True"></asp:ListItem>
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
            <asp:HyperLink ID="loginLink" runat="server" NavigateUrl="~/LoginPages/Login.aspx" CssClass="link">Login</asp:HyperLink>
        </div>
        <div>
            <p class="prompt">By signing up, I agree to the Canpus Trade's Terms of Service</p>
        </div>
        <div>
            <p class="prompt">Privacy Policy and Refund Policy</p>
        </div>
    </form>
</body>
</html>
