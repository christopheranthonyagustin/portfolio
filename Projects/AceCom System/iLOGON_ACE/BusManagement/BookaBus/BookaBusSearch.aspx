<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookaBusSearch.aspx.cs" Inherits="iWMS.Web.BusManagement.BookaBus.BookaBusSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Book-a-BusSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                    <br />
                    <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                        OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="style5">&nbsp;Status
                        </td>
                    </tr>
                    <tr>
                        <td td style="width: 400px" valign="top">
                            <telerik:RadListBox runat="server" ID="StatusList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                                AllowTransfer="true" TransferToID="SelectedStatusList" TransferMode="Move" AllowTransferDuplicates="false"
                                SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                                AutoPostBackOnTransfer="true" OnTransferred="StatusList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedStatusList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false" Style="background-color: Yellow;">
                            </telerik:RadListBox>
                        </td>
                        <td style="width: 25%"></td>
                    </tr>
                </table>
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                <br />
                &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
