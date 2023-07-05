<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/Account.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PE2_Group_Assg.WebForm.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        

        .button{
            color:white;
            background-color:black;
            padding: 10px 40px 10px 40px;
            font-size:16px;
             border-radius:30px;
             margin-top:10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Login</h1>
        <asp:TextBox ID="email" runat="server" TextMode="Email" placeholder="Email" CssClass="textbox"></asp:TextBox><br />
        <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Password"  CssClass="textbox"></asp:TextBox><br />
        <asp:Button ID="sign_in" runat="server" OnClick="sign_in_clicked" Text="Sign In" CssClass="button" /><br />
        <a>Forget your password?</a><br />
        <a>Create account</a>
    </div>
</asp:Content>
