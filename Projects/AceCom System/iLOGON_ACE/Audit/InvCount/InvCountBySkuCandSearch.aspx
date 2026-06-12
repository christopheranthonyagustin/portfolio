<%@ Page Language="c#" CodeBehind="InvCountBySkuCandSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.InvCountBySkuCandSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvCountBySkuCandSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="60%">
            <tr>
                <td>
                    <div class="pagetitle">Step 1 of 2</div>
                </td>
                <td align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
						    <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" Visible="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                </td>
            </tr>
            <tr>
               <%-- <telerik:RadButton ID="SaveCandidates" runat="server" Text="Save Candidates"
                    CssClass="detailButton" OnClick="SaveCandidates_Click">
                </telerik:RadButton>
                &nbsp;
                        <telerik:RadButton ID="CancelBtn" runat="server" Text="Cancel" CssClass="detailButton" OnClick="CancelBtn_Click"></telerik:RadButton>
                &nbsp;&nbsp;--%>
                   <asp:Button ID="SaveCandidates" class="white" runat="server" OnClick="SaveCandidates_Click" Text="Save" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;&nbsp;
                                 <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
            </tr>
        </table>
        <br>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
    </form>
</body>
</html>
