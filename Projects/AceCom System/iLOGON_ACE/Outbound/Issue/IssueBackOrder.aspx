<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueBackOrder.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueBackOrder" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Back Order @ Goods Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </ContentTemplate>
        </asp:UpdatePanel>
        <table>
            <tr>
                <td>
                    <telerik:RadLabel Text="Reason" Font-Size="Small" runat="server"></telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="ReasonTxt" TextMode="MultiLine" runat="server" Skin="Sunset"
                        Font-Size="Medium" Height="150px" Width="320px" BackColor="#ded7c6">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ProceedBtn" runat="server" CssClass="white" Text="Proceed"
            OnClick="ProceedBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
    </form>
</body>
</html>
