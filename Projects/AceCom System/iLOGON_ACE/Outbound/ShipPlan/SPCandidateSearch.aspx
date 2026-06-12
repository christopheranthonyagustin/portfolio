<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="SPCandidateSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.ShipPlan.SPCandidateSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipPlanCandidate</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
     <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="Searchbtn">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td>
                <asp:Label ID="SearchLbl" runat="server" CssClass="pagetitle">Ship Plan #</asp:Label><asp:Label
                    ID="SPIdLbl" runat="server" CssClass="pagetitle"></asp:Label>&nbsp;<asp:Label ID="StepLbl"
                        runat="server" CssClass="pagetitle">Candidate Search (Step 
						1 of 3)</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                &nbsp;
               <%-- <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="detailbutton" OnClick="SearchBtn_Click">
                </asp:Button>&nbsp;--%>
                <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
            OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
