<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="IssueCandidateSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.Receipt.IssueCandidateSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueCandidate</title>
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
    <br />
    &nbsp;<asp:Button ID="SearchBtn" runat="server" CssClass="detailbutton" Text="Search"
        OnClick="SearchBtn_Click"></asp:Button>
    <br />
    <br>
    <br>
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td>
                <input id="tab1" style="cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                    value="Main Info" runat="server">
                <input id="tab2" style="cursor: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
                    value="Issue Info" runat="server">
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
