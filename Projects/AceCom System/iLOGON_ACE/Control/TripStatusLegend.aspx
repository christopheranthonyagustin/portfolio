<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripStatusLegend.aspx.cs" Inherits="iWMS.Web.Control.TripStatusLegend" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripStatusLegend</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <link rel="stylesheet" type="text/css" href="../css/iWMS.css" />
    <script src="../js/Script.js" type="text/javascript"></script>
    <link href="../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
<body onload="javascript:window.focus();" bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table width="100%">
            <tr>
                <td style="width: 5px"></td>
                <td>
                    <asp:Label ID="Label1" runat="server" CssClass="pagetitle">Trip Status Legend</asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel runat="server" ID="pnlButtons" />
    </form>
</body>
</html>

