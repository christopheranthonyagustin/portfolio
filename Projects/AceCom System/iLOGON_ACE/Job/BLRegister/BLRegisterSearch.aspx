<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BLRegisterSearch.aspx.cs" Inherits="iWMS.Web.Job.BLRegister.BLRegisterSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>BLRegister</title>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        &nbsp;
        <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <table>
            <tr>
                <td valign="top">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
                <td valign="top">
                    <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Font-Bold="True" Visible="False"
            CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
