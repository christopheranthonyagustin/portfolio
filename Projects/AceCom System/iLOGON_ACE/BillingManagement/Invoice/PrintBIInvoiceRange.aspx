<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintBIInvoiceRange.aspx.cs" Inherits="iWMS.Web.BillingManagement.Invoice.PrintBIInvoiceRange" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>PrintInvoiceRange</title>
        <script src="../../js/CastleBusyBox.js" language="javascript"></script>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<base target="_self">
		<meta http-equiv="Pragma" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td style="width:22%;">Print From Invoice
            </td>
            <td style="width:3%;">
                &nbsp;
            </td>
            <td style="width:27%;">
                <asp:TextBox ID="invno_tbox" runat="server" Width="95%" />
            </td>
            <td style="width:8%;">
                &nbsp;&nbsp;&nbsp;To&nbsp;&nbsp;&nbsp;
            </td>
            <td style="width:40%;" align="left">
                <asp:TextBox ID="invno2_tbox" runat="server" Width="70%" />
            </td>
        </tr>
        <tr>
            <td colspan="5" style="height:5px;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Button ID="PrintInv_Btn" runat="server" Text="Print Invoice" OnClick="PrintInv_Btn_Click" OnClientClick="busyBox.Show();" />
            </td>
        </tr>
    </table>
    </div>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameBorder="0" name="BusyBoxIFrame" scrolling="no"></iframe>
    <script>
       // Instantiate our BusyBox object
       var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>
</body>
</html>
