<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="PeriodicSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Periodic.PeriodicSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PeriodicSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div class="pagetitle">
        &nbsp;Search Periodic:
        <br>
    </div>
    <br>
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td style="height: 20px">
                <input id="tab1" style="cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                    value="Header" runat="server">&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:Button Style="z-index: 0" ID="SearchBtn" runat="server" CssClass="detailbutton"
        Text="Search" OnClick="SearchBtn_Click"></asp:Button>&nbsp;<asp:Label Style="z-index: 0"
            ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label></form>
</body>
</html>
