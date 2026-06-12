<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PutAwayTaskSearch.aspx.cs" Inherits="iWMS.Web.Inbound.PutAwayTask.PutAwayTaskSearch" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PutAway Task</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .style1 {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
       
        <div>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td>
                        &nbsp;<asp:Button ID="Searchbtn" CssClass="white" runat="server" OnClick="Searchbtn_Click" Text="Search"
                            OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CausesValidation="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <br />
                                    &nbsp;<asp:Label ID="shTypeLbl" runat="server">LocCategory</asp:Label><br />
                                    &nbsp;<telerik:RadListBox runat="server" ID="LocCategoryList" Height="100px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedLocCategoryList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="LocCategoryList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedLocCategoryList" Height="100px" Width="160px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false" AutoPostBack="true"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>  
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>          
        </div>
    </form>
</body>
</html>
