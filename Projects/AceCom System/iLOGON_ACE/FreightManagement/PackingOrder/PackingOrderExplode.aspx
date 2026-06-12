<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingOrderExplode.aspx.cs" Inherits="iWMS.Web.FreightManagement.PackingOrder.PackingOrderExplode" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Explode @ Items not Packed</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self">
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>&nbsp;<asp:Button ID="ExplodeBtn" CssClass="white" runat="server" OnClick="ExplodeBtn_Click" Text="Explode"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" /><br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td class="style1">&nbsp;<asp:Label ID="Label" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label1" Text="1. The last box will contain the residual quantity from the explosion " Font-Size="15px" runat="server"></asp:Label>
                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
