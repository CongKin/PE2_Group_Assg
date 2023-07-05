<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="PE2_Group_Assg.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .bg-grey {
            background-color: #f0f0f0;
            padding-bottom: 20px; /* Adjust the spacing here */
        }
        .bg-grey-text {
            background-color: #f0f0f0;
            display: flex;
            align-items: center;
            max-width: 540px;
            margin: 0;
            padding-bottom: 20px; /* Adjust the spacing here */
        }
        .navbar-light {
            background-color: #f0f0f0;
            margin-bottom: 20px; /* Adjust the spacing here */
        }
        .col-md-6.text-center {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .custom-img {
            max-width: 540px;
            height: auto;
        }
        .card {
            margin-bottom: 20px; /* Adjust the spacing here */
        }
    </style>
</head>
<body>
    <div class="container-fluid" >
        <div class="bg-grey">
            <div class="row align-items-center">
                <div class="col-md-4 text-center">
                    <h1>Campus Trade</h1>
                </div>
                <div class="col-md-4">
                    <form class="form-inline" runat="server" id="searchForm">
                        <div class="input-group">
                            <asp:TextBox ID="searchTextBox" runat="server" CssClass="form-control mr-sm-2 col-md-9" placeholder="Search" aria-label="Search"></asp:TextBox>
                            <div class="input-group-append col-md-1"></div>
                            <div class="input-group-append col-md-2">
                                <asp:Button ID="searchButton" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0" Text="Search" />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4">
                    <nav class="navbar navbar-expand">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Cart</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Wishlist</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="collapse navbar-collapse">
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
        <div class="row bg-grey" style="margin: auto;">
            <div class="col-md-6 align-items-center" style="margin: auto;">
                <img src="Images/homepage.png" alt="Image" class="img-fluid custom-img">
            </div>
            <div class="col-md-6 bg-grey-text">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-10 text-center">
                        <h1>Your text description here...</h1>
                        <p>Your text description here...</p>
                        <a href="#" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container" style="margin: auto;">
        <div class="card" style="margin: auto; margin-top: 50px;">
            <div class="card-header">
                卡片标题
            </div>
            <div class="card-body">
                <div class="row">
                    <!-- 商品 1 -->
                    <div class="col-sm-4">
                        <div class="card">
                            <img class="card-img-top" src="商品1的图片链接" alt="商品1">
                            <div class="card-body">
                                <p class="card-text">商品1的描述</p>
                            </div>
                        </div>
                    </div>
                    <!-- 商品 2 -->
                    <div class="col-sm-4">
                        <div class="card">
                            <img class="card-img-top" src="商品2的图片链接" alt="商品2">
                            <div class="card-body">
                                <p class="card-text">商品2的描述</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card">
                            <img class="card-img-top" src="商品2的图片链接" alt="商品2">
                            <div class="card-body">
                                <p class="card-text">商品2的描述</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- 商品 3 -->
                    <div class="col-sm-4">
                        <div class="card">
                            <img class="card-img-top" src="商品3的图片链接" alt="商品3">
                            <div class="card-body">
                                <p class="card-text">商品3的描述</p>
                            </div>
                        </div>
                    </div>
                    <!-- 商品 4 -->
                    <div class="col-sm-4">
                        <div class="card">
                            <img class="card-img-top" src="商品4的图片链接" alt="商品4">
                            <div class="card-body">
                                <p class="card-text">商品4的描述</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card">
                            <img class="card-img-top" src="商品4的图片链接" alt="商品4">
                            <div class="card-body">
                                <p class="card-text">商品4的描述</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
