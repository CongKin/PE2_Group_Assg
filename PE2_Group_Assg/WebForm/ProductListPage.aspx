﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/ProductList.Master" AutoEventWireup="true" CodeBehind="ProductListPage.aspx.cs" Inherits="PE2_Group_Assg.WebForm.ProductListPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/font.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">

        function openPopup(productId) {
            //var popup = $find('<%= popupExtender.ClientID %>');
            var panel = document.getElementById('<%= popupPanel.ClientID %>');
            var iframe = document.getElementById('iframeContent');

            // Set the source of the iframe
            iframe.src = "popupItem.aspx?productId=" + productId;

            // Show the panel and open the popup
            panel.style.display = 'block';
            //popup.show();
        }

    </script>
    <style>
        .product{
            width: 100%;
            height: 100%;
            padding: 10px 20px 30px 30px;
            
        }
        .catTitle{
            font-family: "Arial";
            font-size: 25px;
            font-weight: 900;
            letter-spacing: 1px;
            margin-left:50px;
        }
        .listContainer{
            min-height: 450px;
            background: #F5F5F7;            
            border-radius: 10px;
            width: fit-content;
            text-align: center;
            padding: 0;
        }
        .productList{
            margin-top: 15px;
            
        }
        .productList td{
            width:25%;
            height: 100%;
            text-align: center;
            padding: 15px 15px;
        }
        .pdiv{
            display: flex;
            flex-direction: column;
            padding: 0;
            margin: 0;
            text-align:center;
        }
        .pImage{
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        .pNameLabel, .priceLabel, p{
            font-family: 'Times New Roman';
            font-weight: 600;
            word-wrap: break-word;
            overflow-wrap: break-word;
        }

        .image-container{
            max-height:200px;
            min-width: 200px; 
            min-height: 200px; 
            border-radius: 10px;
            margin-bottom: 5px;
            display:flex;
            justify-content:center;
            align-items: center;
            background-color: lightgray;
            overflow:hidden;

        }

        .container{
            width: 200px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    
    <div class="product">
        <asp:Label ID="catTitle" CssClass="catTitle" runat="server" Text="All products"></asp:Label>
        <div class="listContainer">
            <asp:DataList ID="productList" CssClass="productList" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"> 
                <ItemTemplate>
                    <div id="modalButton" class="pdiv" runat="server" onclick='<%# "openPopup(" + Eval("product_id").ToString() + ");" %>' >
                        <div class ="image-container">
                            <asp:Image ID="productImage" CssClass="pImage" runat="server" ImageUrl='<%# "ProductImageHandler.ashx?product_id=" + Eval("product_id") %>' AlternateText="Product Image" />
                         </div>
                        <div class="container">
                            <asp:Label ID="productNameLabel" CssClass="pNameLabel" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            <p>RM <asp:Label ID="priceLabel" CssClass="priceLabel" runat="server" Text='<%# Eval("price") %>'></asp:Label></p>
                        </div>
                        
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Panel ID="popupPanel" runat="server" CssClass="modal" Style="display: none;background-color:rgba(191, 191, 191, 0.5); width:100%; height:100%;">
        <div style="width:100%; height:100%; display:flex; flex-direction:column; justify-content:center; text-align:center">
            <div style="height:70%; width:60%; background-color:white; margin:auto; border-radius: 10px; padding: 20px 30px 20px 30px;">
                <div id="closediv" style="display:flex; text-align:right;float: right;">
                    <asp:Button ID="closeBtn" runat="server" Text="&times;" style="border: none;background-color:#ffffff;font-size: 30px;"/> 
                </div>
                <iframe id="iframeContent" src="" style="width: 100%; height: 80%;"></iframe> 
            </div>
        </div>
        
    </asp:Panel>

    <cc1:ModalPopupExtender ID="popupExtender" runat="server" TargetControlID="dummyTarget"
      PopupControlID="popupPanel" BackgroundCssClass="modalBackground" CancelControlID="closeBtn"/>
    <asp:Button ID="dummyTarget" runat="server" Style="display: none" />

    
    

</asp:Content>
