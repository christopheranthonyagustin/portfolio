<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReprintTU1.aspx.cs" Inherits="iWMS.Web.Inbound.RegisterTU1.ReprintTU1" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ReprintTU1</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td>
                <iwms:iform ID="formCtl" runat="server"></iwms:iform>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="reprntBtn" CssClass="formbtn" Text=" REPRINT " runat="server" OnClick="reprntBtn_Click"
                    OnClientClick="return busyBox.Show();" />
                <br />
                <br />
            </td>
        </tr>
    </table>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
               // Instantiate our BusyBox object
               var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
