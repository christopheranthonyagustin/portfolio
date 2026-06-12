<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.StockValuation.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>StockValuationAsAt</title>
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%">
                <p>
                    &nbsp;</p>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="detailbutton"
                    OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();"></asp:Button>&nbsp;<input
                        class="detailbutton" value="Reset" type="reset"><br>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>
    </form>
</body>
</html>
