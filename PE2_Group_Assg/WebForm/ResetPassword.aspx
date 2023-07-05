<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/Account.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="PE2_Group_Assg.WebForm.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .email{
            font-size:16px;
            width:60%;
            min-width:470px;
            margin-bottom:5px;
            margin-top:5px;
            transform:  translateX(50px);
            border:none;
        }

        .send{
            color:white;
            background-color:darkgray;
            padding: 5px 25px 5px 25px;
            font-size:16px;
            border-radius:10px;
            margin-top:10px;
            transform: translateX(-80px);
        }

        .email-container{
            padding:10px 20px 10px 20px;
            border:solid;
            border-radius:30px;
            display:flex;


        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Reset your password</h1>
        <p>We will send you a 6 digit verification code to your email to reset your password</p>
        <div class ="email-container">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Email" placeholder ="Email" CssClass="email"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="SEND" CssClass="send"/>
        </div>
        <br />
        <asp:TextBox ID="veriCode" runat="server" placeholder ="Verification Code" CssClass="textbox"></asp:TextBox><br />
        <asp:Button ID="submit" runat="server" Text="submit" OnClick="submit_clicked" CssClass="button"/><<br />
        <a>Cancel</a>
    </div>
</asp:Content>
