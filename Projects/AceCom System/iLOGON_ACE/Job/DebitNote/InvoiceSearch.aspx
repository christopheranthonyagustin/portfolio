<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="InvoiceSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.DebitNote.InvoiceSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .style1 {
            width: 60px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
            <Tabs>
                <telerik:RadTab Text="Dashboard" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />
                &nbsp;
                &nbsp;

                    <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />
                             &nbsp;
                &nbsp;

                    <asp:Button ID="ExcelIDMBtn" runat="server" Text="DelvMethod" OnClick="ExcelIDMBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />
                  &nbsp;
                    <asp:Button ID="XeroExcelFormatBtn" runat="server" Text="Xero Excel Format" OnClick="XeroExcelFormatBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelGreen" ToolTip="Xero Excel Format" />
                <br />
                <br />

                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <%--  <tr>
                        <td class="style5">&nbsp;Status
                        </td>
                    </tr>--%>
                 <%--   <tr>
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
                    </tr>--%>
                </table>
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                    </td>
                </tr>

                &nbsp;&nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Font-Bold="True" Visible="False"
        CssClass="errorLabel"></asp:Label>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="InvoiceRegisterDashboardRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
