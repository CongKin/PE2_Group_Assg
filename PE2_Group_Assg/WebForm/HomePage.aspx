<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="PE2_Group_Assg.WebForm.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/font.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Istok+Web&display=swap" rel="stylesheet"/>
    <style>
        body{
            font-family: Arial;
        }
        .container-fluid{
            padding: 0;
            
        }
        .bg-grey {
            background-color: #f1f1f1;
            padding: 0; /* Adjust the spacing here */
            width: 100%;
            margin: 0;
            border-bottom: 3px solid #E5E5E5;
        }
        h1{
            font-family: "artico-black", Arial, sans-serif;
        }
        .form-control {
            border-radius: 20px; 
            width:300px;
        }
        .custom-button {
          width: auto; /* Adjust the width to fit the content */
          background: #21211F; 
          border-color: #21211F;
          color: #FFFFFF;
        }
        .custom-button:hover{
            border-color: #21211F;
            background: #FFFFFF;
            color: #21211F;
            font-weight: bold;
        }
        .nav-link{
            color: #21211F;
            font-weight: 500;
        }
        .nav-link:hover{
            color: #21211F;
        }
        .bg-grey-text {
            background-color: #E2E2E2;
            display: flex;
            align-items: center;
            max-width: 540px;
            margin: 0;
            padding-bottom: 20px; /* Adjust the spacing here */
        }
        .custom-row{
            margin: 0;
            padding:0;
            width:100%;
        }
        .navbar-light {
            background-color: #f1f1f1;
            margin: 0; /* Adjust the spacing here */
        }
        .navbar-collapse{
            margin-left: 60px;
        }
        .col-md-6.text-center {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .custom-img {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            object-fit:cover;
        }
        .card {
            margin-bottom: 20px; /* Adjust the spacing here */
        }
    </style>
</head>
<body>
   <form runat="server" id="form1">
   <div class="container-fluid" >
        <div class="bg-grey">
            <div class="row align-items-center custom-row">
                <div class="col-md-4 text-center" >
                    <h1>Campus Trade</h1>
                </div>
                <div class="col-md-4">
                    
                        <div class="input-group">
                            <div class="input-group-append col-md-9">
                                <asp:TextBox ID="searchTextBox" runat="server" CssClass="form-control mr-sm-2 col-md-12" placeholder="Search" aria-label="Search"></asp:TextBox>
                            </div>
                            <div class="input-group-append col-md-2">
                                <asp:Button ID="searchButton" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0 custom-button" Text="Search" />
                            </div>
                        </div>
                    
                </div>
                <div class="col-md-4 d-flex justify-content-end" >
                    <nav class="navbar navbar-expand">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item d-flex align-items-center">
                                <img class="userIcon" src="../Images/user-icon.png" alt="" />
                                <a class="nav-link" href="#">Login</a>
                            </li>
                            <li class="nav-item d-flex align-items-center">
                                <img class="cartIcon" src="../Images/cart-icon.png" alt=""/>
                                <a class="nav-link" href="#">Cart</a>
                            </li>
                            <li class="nav-item d-flex align-items-center">
                                <img class="wishlistIcon" src="../Images/wishlist-icon.png" alt=""/>
                                <a class="nav-link" href="#">Wishlist</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <nav class="navbar navbar-expand-lg navbar-light" >
                <div class="collapse navbar-collapse ">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="categoriesDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Categories
                            </a>
                            <div class="dropdown-menu" aria-labelledby="categoriesDropdown">
                                <a class="dropdown-item" href="#">Category 1</a>
                                <a class="dropdown-item" href="#">Category 2</a>
                                <a class="dropdown-item" href="#">Category 3</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Add Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Transaction</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="row bg-grey custom-row" style="margin: 0; padding:0; width: 100%; height: 500px;" >
            <div class="col-md-6 align-items-center" style="width:50%;margin: 0; padding:0;">
                <img src="../Images/homepage.png" alt="Image" class="img-fluid custom-img"/>
            </div>
            <div class="col-md-6 bg-grey-text" style="width:50%; margin:0; padding: 0; max-width:100%;">
                <div class="row align-items-center justify-content-center" style="width:100%; margin: 0;">
                    <div class="col-md-10 text-center" style="width:100%; margin: 0; padding: 0 100px 0 100px;">
                        <h1>Your text description here...</h1>
                        <p>Your text description here...</p>
                        <a href="#" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
