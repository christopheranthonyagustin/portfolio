<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionFabricationOrderCopy.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionFabricationOrder.DistributionFabricationOrderCopy" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution Fabrication Order Copy</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
    <script type="text/javascript" src="../../js/Script.js"></script>
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
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="FOCopyLbl" runat="server">Distribution Fabrication Order Copy</asp:Label>
                    <br />
                    <asp:TextBox ID="FOTxt" runat="server" AutoPostBack="True" BackColor="Yellow" OnTextChanged="FOTxt_TextChanged" Width="140px" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="noOfTimesLbl" runat="server"> Number of Copies</asp:Label>
                    <br />
                    <asp:DropDownList ID="FODDL" runat="server" Width="140px" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:CheckBox ID="DetailChkBox" runat="server" Text="Include Detail Lines" Enabled="False"></asp:CheckBox>
                    <br />
                    <asp:Label Style="z-index: 0" ID="errorLbl" runat="server" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="CopyBtn" runat="server" Text=" Copy " CssClass="White" Enabled="False" OnClick="CopyBtn_Click" OnClientClick="return confirm('Confirm Copy Sales Order?');" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
