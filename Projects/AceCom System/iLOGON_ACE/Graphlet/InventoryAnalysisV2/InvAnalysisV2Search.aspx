<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvAnalysisV2Search.aspx.cs" Inherits="iWMS.Web.Graphlet.InventoryAnalysisV2.InvAnalysisV2Search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head id="Head1" runat="server">
    <title>InventoryAnalysisV2Search</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="15" style="border-spacing: 0px;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
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
                    </table>
                </td>
            </tr>            
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="ReconcileBtn" class="white" runat="server" OnClick="Reconcile_Click" Text="Reconcile"
                    UseSubmitBehavior="true" />
                </td>
            </tr>
        </table>       
        <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
            ForeColor="#ff0000"></asp:Label><br />
        <br />        
    </form>
</body>
</html>
