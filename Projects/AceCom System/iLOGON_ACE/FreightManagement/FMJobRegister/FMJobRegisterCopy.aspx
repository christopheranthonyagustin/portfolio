<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterCopy.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterCopy" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Freight Job Copy</title>
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
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager Id="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button Id="CopyBtn" runat="server" Text="Copy" CssClass="white" Enabled="False" OnClick="CopyBtn_Click" OnClientClick="return confirm('Confirm to Copy?');" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button Id="CancelBtn" runat="server" Text="Cancel" CssClass="white" OnClick="CancelBtn_Click" OnClientClick="return confirm('Confirm to Cancel?');" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <iWMS:iForm Id="formCtl" runat="server" />
                    &nbsp;<asp:Label Id="NoOfTimeLbl" runat="server"> No. of Times to Duplicate</asp:Label>
                    <br />
                    &nbsp;<telerik:RadDropDownList ID="JobDDL" runat="server" Width="155px" Height="155px" Skin="Sunset"/>
                </td>
            </tr>
             <tr>
                <td>
                    <br />
                    <asp:CheckBox Id="LinkConsolChkBox" runat="server" Text="Link to same Consol"></asp:CheckBox>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:CheckBox Id="IncludeRouteChkBox" runat="server" Text="Include Route" Enabled="False" Checked="true"></asp:CheckBox>
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
