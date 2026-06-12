<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="POInterfaceUpload.aspx.cs" Inherits="iWMS.Web.Inbound.PurchaseOrder.POInterfaceUpload" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PurchaseOrderInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet"/>
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <br />
                <table>
                    <tr>
                        <td>
                            <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iwms:iform ID="formCtl2" runat="server"></iwms:iform>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>       
                            <asp:Button ID="OkBtn" class="white" runat="server" OnClick="OkBtn_Click" Visible="false"
                                Text="OK" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
