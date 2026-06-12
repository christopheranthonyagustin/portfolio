<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="OPCandidateSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.OrderPlan.OPCandidate" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>OrderPlanCandidate</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
                    <br />
                    <asp:Label ID="OPIdLbl" runat="server" Style="z-index: 0" class="pagetitle"></asp:Label><br />
                    <br />
                    <br />
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="white" OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false"></asp:Button>
                    <%--  <telerik:RadButton ID="SearchBtn" runat="server" Text="Search" CssClass="white"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false" OnClick="SearchBtn_Click">
                    </telerik:RadButton>--%>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    &nbsp;
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
