<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="RegisterNewPallet.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.ProductOrder.RegisterNewPallet" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RegisterNewPallet</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
</head>
<body onload="javascript:window.focus();" bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="80%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <br />
                <span class="pagetitle">&nbsp;<asp:Label ID="LotNoLbl" runat="server" CssClass="pagetitle">LotNo </asp:Label><br />
                </span>
            </td>
            <td align="center">
                <br />
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                <asp:Button Style="z-index: 0" ID="RegisterBtn" runat="server" CssClass="detailButton"
                    Text="   Register   " OnClick="RegisterBtn_Click"></asp:Button>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
