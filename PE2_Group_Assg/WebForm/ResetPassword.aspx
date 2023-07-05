<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/Account.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="PE2_Group_Assg.WebForm.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Reset your password</h1>
        <p>We will send you a 6 digit verification code to your email to reset your password</p>
        <asp:TextBox ID="email" runat="server" TextMode="Email" placeholder ="Email"></asp:TextBox>
        <asp:Button ID="send" runat="server" Text="SEND" /><br />
        <a href="../Images/">../Images/</a>
        <asp:TextBox ID="veriCode" runat="server" TextMode="Number" placeholder ="Email" CssClass="textbox"></asp:TextBox><br />
        <asp:Button ID="submit" runat="server" Text="submit" OnClick="submit_clicked" CssClass="button"/><<br />
        <a>Cancel</a>
    </div>
</asp:Content>
