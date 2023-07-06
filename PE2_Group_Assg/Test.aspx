<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="PE2_Group_Assg.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    .modal {
        position: fixed;
        z-index: 999;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 20% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 60%;
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    
    .modalBackground {
        
        opacity: 0.7;
        background-color: rgba(0, 0, 0, 0.7);
    }
</style>

<!-- JavaScript to handle modal closing -->
<script type="text/javascript">
    function closeModal() {
        $find('<%= modalPopup.ClientID %>').hide();
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Button to trigger the modal -->
<asp:Button ID="openModalButton" runat="server" Text="Open Modal" OnClick="openModalButton_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<!-- ModalPopupExtender control -->
<ajaxToolkit:ModalPopupExtender ID="modalPopup" runat="server" TargetControlID="openModalButton"
    PopupControlID="myModal" BackgroundCssClass="modalBackground" DropShadow="true" />
    
<!-- Modal markup -->
<asp:Panel ID="myModal" runat="server" CssClass="modal" Style="display: none;">
    <div class="modal-content">
        <span class="close" onclick="closeModal();">&times;</span>
        <h2>Modal Title</h2>
        <p>Modal body content goes here...</p>
        <asp:Button ID="closeModalButton" runat="server" Text="&times;" OnClick="closeModalButton_Click" />
    </div>
</asp:Panel>

<!-- CSS for the modal -->


    </form>
</body>
</html>
