<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAcc.aspx.cs" Inherits="PE2_Group_Assg.WebForm.CreateAcc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Account</title>
    <link href="../CSS/Account.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .separate{
            width:310px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Create Account</h1>
            <!-- name -->
            <div class="form-group">
                <div style="display: flex;">
                    <asp:TextBox ID="firstName" runat="server" CssClass="input name fname" placeholder="First Name"></asp:TextBox>
                    <asp:TextBox ID="lastName" runat="server" CssClass="input name" placeholder="Last Name"></asp:TextBox>
                </div>
            </div>
            <div style="display: flex;">
                <div>
                    <asp:RequiredFieldValidator ID="RVD_fname" runat="server" ErrorMessage="*Required" ControlToValidate="firstName" CssClass="error separate" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="firstName" ID="max_fname" ValidationExpression="^[\s\S]{0,45}$" runat="server" 
                        ErrorMessage="*Maximum 45 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="firstName" ID="min_fname" ValidationExpression="^[\s\S]{5,}$" runat="server" 
                        ErrorMessage="*Minimum 5 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="RVD_lname" runat="server" ErrorMessage="*Required" ControlToValidate="lastName" CssClass="error separate" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="lastName" ID="max_lname" ValidationExpression="^[\s\S]{0,45}$" runat="server" 
                        ErrorMessage="*Maximum 45 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="lastName" ID="min_lname" ValidationExpression="^[\s\S]{5,}$" runat="server" 
                        ErrorMessage="*Minimum 5 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                </div>
            </div>

            <!-- gender-->
            <div class="form-group">
                <asp:DropDownList ID="gender" runat="server" CssClass="input gender">
                    <asp:ListItem Text="Gender" Value=""></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator ID="RVD_gender" runat="server" ErrorMessage="*Required" ControlToValidate="gender" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
            
            <!-- dob -->
            <div class="form-group">
                <asp:TextBox ID="dob" TextMode="Date" runat="server" CssClass="input" placeholder="Date of Birth"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="RVD_dob" runat="server" ErrorMessage="*Required" ControlToValidate="dob" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
            

            <!-- email -->
            <div class="form-group">
                <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input" placeholder="Email"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="RVD_email" runat="server" ErrorMessage="*Required" ControlToValidate="email" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="email" ID="max_email" ValidationExpression="^[\s\S]{0,45}$" runat="server" 
                ErrorMessage="*Maximum 45 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="email" ID="min_email" ValidationExpression="^[\s\S]{5,}$" runat="server" 
                ErrorMessage="*Minimum 5 characters allowed" CssClass="error"></asp:RegularExpressionValidator>

            <!-- password -->
            <div class="form-group">
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input" placeholder="Password"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="RVD_password" runat="server" ErrorMessage="*Required" ControlToValidate="password" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="password" ID="max_password" ValidationExpression="^[\s\S]{0,20}$" runat="server" 
                ErrorMessage="*Maximum 20 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="password" ID="min_password" ValidationExpression="^[\s\S]{4,}$" runat="server" 
                ErrorMessage="*Minimum 4 characters allowed" CssClass="error"></asp:RegularExpressionValidator>

            <!-- button -->
            <div class="form-group">
                <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="button" OnClick="create_clicked"/>
            </div>

            <!-- link -->
            <div class="form-group">
                <asp:HyperLink ID="loginLink" runat="server" NavigateUrl="javascript: history.go(-1)" CssClass="link">Login</asp:HyperLink>
            </div>

            <!-- other -->
            <div>
                <p class="prompt-end">By signing up, I agree to the Campus Trade's Terms of Service</p>
            </div>
            <div>
                <p class="prompt-end">Privacy Policy and Refund Policy</p>
            </div>
        </div>
    </form>
</body>
</html>
