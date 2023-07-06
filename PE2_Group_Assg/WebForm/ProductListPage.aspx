<%@ Page Title="" Language="C#" MasterPageFile="~/WebForm/ProductList.Master" AutoEventWireup="true" CodeBehind="ProductListPage.aspx.cs" Inherits="PE2_Group_Assg.WebForm.ProductListPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/font.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">

        function openPopup(itemId) {
        //var popup = $find('<%= popupExtender.ClientID %>');
            var panel = document.getElementById('<%= popupPanel.ClientID %>');
            var iframe = document.getElementById('iframeContent');

            // Set the source of the iframe
            iframe.src = "popout_item.aspx?itemId=" + itemId;

            // Show the panel and open the popup
            panel.style.display = 'block';
            //popup.show();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    
    <div class="product">
        <asp:Label ID="catTitle" runat="server" Text="All product"></asp:Label>
        <asp:DataList ID="productList" CssClass="productList" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"> 
            <ItemTemplate>
                <div id="modalButton" runat="server" onclick='<%# "openPopup(" + Eval("ProductID") + ");" %>' >
                    <asp:Image ID="<%# Eval("ImageID") %>" CssClass="image" runat="server" AlternateText="Product Image" />
                    <asp:Label ID="productNameLabel" CssClass="nameLabel product" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    <p>$<asp:Label ID="priceLabel" CssClass="priceLabel" runat="server" Text='<%# Eval("Price") %>'></asp:Label></p>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Panel ID="popupPanel" runat="server" CssClass="modal" Style="display: none;">
        <iframe id="iframeContent" style=" width: 100%; height: 100%;" runat="server"></iframe> 
        <asp:Button ID="closeBtn" runat="server" Text="Close" />    
    </asp:Panel>

    <cc1:ModalPopupExtender ID="popupExtender" runat="server" TargetControlID="dummyTarget"
      PopupControlID="popupPanel" BackgroundCssClass="modalBackground" CancelControlID="Button2"/>
    <asp:Button ID="dummyTarget" runat="server" Style="display: none" />

    
    

</asp:Content>
