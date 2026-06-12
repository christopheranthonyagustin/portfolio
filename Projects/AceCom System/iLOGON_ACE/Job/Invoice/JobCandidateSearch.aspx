<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="JobCandidateSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Invoice.JobCandidateSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>JobCandidate</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="5" cellpadding="5" width="100%">
        <tr>
            <td class="pagetitle">
                <asp:Label Style="z-index: 0" ID="IdLbl" runat="server"></asp:Label>&nbsp;Job&nbsp;Candidate
                Search (Step 1 of 2)
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                &nbsp;
                <asp:Button ID="SearchBtn" runat="server" CssClass="formbtn" Text="Search" OnClick="SearchBtn_Click">
                </asp:Button>&nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
