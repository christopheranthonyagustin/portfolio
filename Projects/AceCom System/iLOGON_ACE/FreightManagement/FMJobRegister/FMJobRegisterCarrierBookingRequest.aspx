<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterCarrierBookingRequest.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterCarrierBookingRequest" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Carrier Booking Request</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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
                    <asp:Button Id="PrintBtn" runat="server" Text="Print" CssClass="white" Enabled="True" OnClick="PrintBtn_Click" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button Id="CancelBtn" runat="server" Text="Cancel" CssClass="white" OnClick="CancelBtn_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Style="z-index: 0" ID="ErrorLbl" runat="server" CssClass="errorLabel"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

