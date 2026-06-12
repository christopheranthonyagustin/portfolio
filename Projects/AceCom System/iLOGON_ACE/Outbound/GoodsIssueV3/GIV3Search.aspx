<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3Search.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3Search" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Goods Issue V3 Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <style type="text/css">
        .auto-style1 {
            width: 303px;
        }

        .BigCheckBox input {
            width: 30px;
            height: 20px;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table width="100%" id="report" runat="server">
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="searchbtn" />
                            &nbsp;
                            <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding-left:5px;padding-top:10px">
                    <tr>
                        <td class="style5">Status
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 400px" valign="top">
                            <telerik:RadListBox ID="StatusList" runat="server" AllowDelete="false" AllowReorder="false" AllowTransfer="true" AllowTransferDuplicates="false"
                                AutoPostBackOnTransfer="true" ButtonSettings-AreaWidth="35px" Height="120px" OnTransferred="StatusList_Transferred"
                                SelectionMode="Multiple" Skin="Sunset" TransferMode="Move" TransferToID="SelectedStatusList" Width="200px">
                            </telerik:RadListBox>
                            <telerik:RadListBox ID="SelectedStatusList" runat="server" AllowDelete="false" AllowReorder="false"
                                ButtonSettings-AreaWidth="35px" Height="120px" SelectionMode="Multiple" Skin="Sunset" Width="200px">
                            </telerik:RadListBox>
                            <br />
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        &nbsp;
        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
