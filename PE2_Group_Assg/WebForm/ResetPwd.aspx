<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPwd.aspx.cs" Inherits="PE2_Group_Assg.WebForm.ResetPwd1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Password</title>
    <link href="../CSS/Account.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Enter your new password</h1>
            <div class="form-group">
                <asp:Label ID="prompt" runat="server" Text="Please enter your new password for your account" CssClass="prompt"></asp:Label>
            </div>
            <!-- new password -->
            <div class="form-group">
                <asp:TextBox ID="newPwd" runat="server" TextMode="Password" CssClass="input" placeholder="New Password"></asp:TextBox>
            </div>
            <!-- validation --> 
                <asp:RequiredFieldValidator ID="RVD_password" runat="server" ErrorMessage="*Required" ControlToValidate="newPwd" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="newPwd" ID="max_password" ValidationExpression="^[\s\S]{0,20}$" runat="server" 
                    ErrorMessage="*Maximum 20 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="newPwd" ID="min_password" ValidationExpression="^[\s\S]{4,}$" runat="server" 
                    ErrorMessage="*Minimum 4 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
            
            <!-- repeat password -->
            <div class="form-group">
                <asp:TextBox ID="repPwd" runat="server" TextMode="Password" CssClass="input" placeholder="Repeat Your New Password"></asp:TextBox>
            </div>
            <!-- validation -->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="repPwd" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="repPwd" ID="RegularExpressionValidator1" ValidationExpression="^[\s\S]{0,20}$" runat="server" 
                    ErrorMessage="*Maximum 20 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="repPwd" ID="RegularExpressionValidator2" ValidationExpression="^[\s\S]{4,}$" runat="server" 
                    ErrorMessage="*Minimum 4 characters allowed" CssClass="error"></asp:RegularExpressionValidator>

            <!-- submit -->
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
