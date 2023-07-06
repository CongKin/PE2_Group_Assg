﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/Account.Master" AutoEventWireup="true" CodeBehind="Reset.aspx.cs" Inherits="PE2_Group_Assg.WebForm.Reset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reset your password</title>
    <style>
        .email {
            width: 520px !important;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            <asp:HyperLink ID="cancel" runat="server" NavigateUrl="~/WebForm/Login.aspx" CssClass="link">Cancel</asp:HyperLink>
        </div>
</asp:Content>
