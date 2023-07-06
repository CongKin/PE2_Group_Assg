<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAcc.aspx.cs" Inherits="PE2_Group_Assg.LoginPages.CreateAcc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create account</title>
    <style>
        .gender {
            width: 630px;
        }
        .name {
            width: 280px;
        }
        .fname {
            margin-right: 10px;
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
