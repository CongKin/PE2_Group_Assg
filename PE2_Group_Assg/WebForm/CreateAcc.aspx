<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/Account.Master" AutoEventWireup="true" CodeBehind="CreateAcc.aspx.cs" Inherits="PE2_Group_Assg.WebForm.CreateAcc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Create account</title>
    <style>
        .gender {
            width: 650px !important;
        }
        .name {
            width: 267px !important;
        }
        .fname {
            margin-right: 10px !important;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Create Account</h1>
        <div class="form-group">
            <div style="display: flex;">
                <asp:TextBox ID="firstName" runat="server" CssClass="input name fname" placeholder="First Name"></asp:TextBox>
                <asp:TextBox ID="lastName" runat="server" CssClass="input name" placeholder="Last Name"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="gender" runat="server" CssClass="input gender">
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
            <asp:HyperLink ID="loginLink" runat="server" NavigateUrl="~/WebForm/Login.aspx" CssClass="link">Login</asp:HyperLink>
        </div>
        <div>
            <p class="prompt">By signing up, I agree to the Canpus Trade's Terms of Service</p>
        </div>
        <div>
            <p class="prompt">Privacy Policy and Refund Policy</p>
        </div>
</asp:Content>
