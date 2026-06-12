<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueSearchForJob.aspx.cs"
    Inherits="iWMS.Web.Outbound.Issue.IssueSearchForJob" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>IssueSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle">Issue Search (Step 
						1 of 3)</asp:Label><br>
    <br>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <p>
                    <br />
                    <br />
                    &nbsp;<asp:Label ID="noteLbl" runat="server" Text="Note: Only Issue with status greater than or equal 20 (Partially Allocated), will be retrieved."></asp:Label><br />
                </p>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="detailButton" OnClick="SearchBtn_Click">
    </asp:Button>&nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
