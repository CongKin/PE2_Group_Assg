w<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reset.aspx.cs" Inherits="PE2_Group_Assg.WebForm.Reset1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset your password</title>
    <link href="../CSS/Account.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Reset your password</h1>
            <div class="form-group">
                <asp:Label ID="prompt" runat="server" Text="We will send you a 6 digit verification code to your email to reset your password" CssClass="prompt"></asp:Label>
            </div>
            <!-- email to veri -->
            <div class="form-group">
                <div style="display: flex;">
                    <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input email" placeholder="Email"></asp:TextBox>
                    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="send-button" OnClick="send_clicked" />
                </div>
            </div>
            <!-- validation -->
            <asp:RequiredFieldValidator ID="RVD_email" runat="server" ErrorMessage="*Required" ControlToValidate="email" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="email" ID="max_email" ValidationExpression="^[\s\S]{0,45}$" runat="server" 
                ErrorMessage="*Maximum 45 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="email" ID="min_email" ValidationExpression="^[\s\S]{5,}$" runat="server" 
                ErrorMessage="*Minimum 5 characters allowed" CssClass="error"></asp:RegularExpressionValidator>

            <!-- veri code -->
            <div class="form-group">
                <asp:TextBox ID="verifCode" runat="server" CssClass="input" placeholder="Verification Code"></asp:TextBox>
            </div>

            <!-- button -->
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button" OnClick="submit_clicked"/>
            </div>

            <!-- cancel -->
            <div class="form-group">
                <asp:HyperLink ID="cancel" runat="server" NavigateUrl="javascript: history.go(-1)" CssClass="link">Cancel</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
