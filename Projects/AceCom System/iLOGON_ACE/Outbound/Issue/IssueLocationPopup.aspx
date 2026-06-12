<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueLocationPopup.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueLocationPopup" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView ID="formCtlSize" runat="server" Height="200px">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server" />
                        </td>
                </table>
                <br />
                <asp:Button ID="ConfirmBtn" class="white" runat="server" OnClick="ConfirmBtn_Click"
                    Text="Confirm" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
