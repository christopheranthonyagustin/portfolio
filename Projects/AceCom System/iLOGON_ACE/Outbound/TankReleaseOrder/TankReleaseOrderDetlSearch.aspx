<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankReleaseOrderDetlSearch.aspx.cs" Inherits="iWMS.Web.Outbound.TankReleaseOrder.TankReleaseOrderDetlSearch" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TankReleaseOrderDetl</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>    
    <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="Search_Click" Visible="true"  
            Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Search" />

    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="width: 20%">
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

