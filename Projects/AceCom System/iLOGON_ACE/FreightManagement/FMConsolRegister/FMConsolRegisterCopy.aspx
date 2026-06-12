<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMConsolRegisterCopy.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsolRegister.FMConsolRegisterCopy" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Freight Consol Register Copy</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
        <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
        <form id="Form1" method="post" runat="server">
        <asp:ScriptManager Id="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button Id="CopyBtn" runat="server" Text="Copy" CssClass="white" Enabled="False" OnClick="CopyBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button Id="CancelBtn" runat="server" Text="Cancel" CssClass="white" OnClick="CancelBtn_Click" OnClientClick="return confirm('Confirm to Cancel?');" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <iWMS:iForm Id="formCtl" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

