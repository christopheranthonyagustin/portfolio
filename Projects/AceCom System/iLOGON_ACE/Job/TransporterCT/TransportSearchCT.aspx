<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportSearchCT.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterCT.TransportSearchCT" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TransporttSearchCT</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form2" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <asp:Button Style="z-index: 0" ID="SearchBtn" runat="server" CssClass="detailbutton"
        Text="Search" OnClick="SearchBtn_Click"></asp:Button>
    <br />
    <table id="table1" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
        <tbody>
            <tr>
                <td style="height: 20px">
                    <input id="tab1" style="cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                        value="Header" runat="server">&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server" />
                    <iWMS:iForm ID="formCtl4" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl2" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl3" runat="server" />
                </td>
            </tr>
        </tbody>
    </table>
    &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
        CssClass="errorLabel"></asp:Label></form>
</body>
</html>
