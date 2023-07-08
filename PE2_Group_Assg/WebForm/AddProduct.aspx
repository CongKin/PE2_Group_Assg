<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="PE2_Group_Assg.WebForm.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Submission Form</title>
    <link href="../CSS/AddProduct.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function previewImage() {
            var fileUpload = document.getElementById("image");
            var uploadedImage = document.getElementById("product_image");

            if (fileUpload.files && fileUpload.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    uploadedImage.src = e.target.result;
                }

                reader.readAsDataURL(fileUpload.files[0]);
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Product Submission Form</h1>
            <div class ="content">
                <!-- form -->
                <table>
                    <!-- Product name -->
                    <tr>
                        <td style="width:25%">
                            <div class ="title">
                                <h3>Product Name</h3>
                            </div>
                        </td>
                        <td style="width:55%">
                            <div>
                                <asp:TextBox ID="name" runat="server" placeholder="Please enter product name" CssClass="input"></asp:TextBox>
                            </div>
                        </td>
                        <td style="width:20%">
                            <asp:RequiredFieldValidator ID="RVD_name" runat="server" ErrorMessage="*Required" ControlToValidate="name" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="name" ID="max_name" ValidationExpression="^[\s\S]{0,45}$" runat="server" 
                                ErrorMessage="*Maximum 45 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="name" ID="min_name" ValidationExpression="^[\s\S]{5,}$" runat="server" 
                                ErrorMessage="*Minimum 5 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <!-- product description -->
                    <tr>
                        <td>
                            <div class ="title">
                                <h3>Product Description</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <asp:TextBox ID="description" runat="server" placeholder ="Please enter product description" CssClass="input"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RVD_description" runat="server" ErrorMessage="*Required" ControlToValidate="description" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="description" ID="max_description" ValidationExpression="^[\s\S]{0,150}$" runat="server" 
                                ErrorMessage="*Maximum 150 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="description" ID="min_description" ValidationExpression="^[\s\S]{5,}$" runat="server" 
                                ErrorMessage="*Minimum 5 characters allowed" CssClass="error"></asp:RegularExpressionValidator>
                        </td>
                    </tr>          
                    <!-- product category -->
                    <tr>
                        <td>
                            <div class="title">
                                <h3>Category</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <asp:DropDownList ID="category" runat="server" CssClass="input"></asp:DropDownList>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RVD_category" runat="server" ErrorMessage="*Required" ControlToValidate="description" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <!-- product image -->
                    <tr>
                        <td>
                            <div class="title">
                                <h3>Product Image</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <asp:FileUpload ID="image" runat="server" CssClass="image-class" onchange="previewImage()"/>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RVD_image" runat="server" ErrorMessage="*Required" ControlToValidate="image" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="image" ID="type_image" ValidationExpression="^.*\.(jpg|JPG)$" runat="server" 
                                ErrorMessage="*only .jpg file type allowed" CssClass="error"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <!-- product price -->
                    <tr>
                        <td>
                            <div class="title">
                                <h3>Price (RM)</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <asp:TextBox ID="price" runat="server" placeholder="Please enter product price" CssClass="input"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RVD_price" runat="server" ErrorMessage="*Required" ControlToValidate="price" CssClass="error" Display="Dynamic" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="price" ID="digit_price" ValidationExpression="^\d+(\.\d{1,2})?$" runat="server" 
                                ErrorMessage="*only 2 decimal point allowed" CssClass="error"></asp:RegularExpressionValidator> 
                        </td>
                    </tr>
                    <!-- amount -->
                    <tr>
                        <td>
                            <div class="title">
                                <h3>Amount</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <asp:TextBox ID="amount" runat="server" TextMode="Number" min="1" max="9999" placeholder ="Please enter the amount to sell" CssClass="input"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RVD_amount" runat="server" ErrorMessage="*Required" ControlToValidate="amount" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <div class="preview">
                <h3>Image Preview</h3>
                    <div class="image-container">
                        <asp:Image ID="product_image" runat="server"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="submit-container">
            <asp:Button ID="submit" runat="server" Text="SUBMIT" CssClass="submit" OnClick="submit_clicked" />
        </div>
    </form>
</body>
</html>
