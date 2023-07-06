<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/Account.Master" AutoEventWireup="true" CodeBehind="ResetPwd.aspx.cs" Inherits="PE2_Group_Assg.WebForm.ResetPwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>New password</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            <asp:HyperLink ID="cancel" runat="server" NavigateUrl="~/WebForm/Reset.aspx" CssClass="link">Cancel</asp:HyperLink>
        </div>
</asp:Content>
