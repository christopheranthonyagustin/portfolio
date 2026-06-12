<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterSearch.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Search @ Freight Job Register</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Dashboard" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <div>
                    <asp:Button ID="SearchBtn" runat="server" CssClass="searchbtn" Text="Search"
                        OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Text="Excel"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                </div>
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="DashboardRadPageView" ContentUrl="FMJobRegisterDashboard.aspx" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
