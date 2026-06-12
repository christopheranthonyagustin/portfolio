<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUPackSearch.aspx.cs" Inherits="iWMS.Web.Master.Sku.SKUPackSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title>SKU Pack Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="SKUPackSearch" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <div>
                    <table width="20%" id="report" runat="server">
                        <tr>
                            <td class="style1">
                                <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                                    OnClientClick="disableBtn(this.id,false)" ToolTip="Search" CssClass="white" UseSubmitBehavior="false" />
                                &nbsp;
                    <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                        <tr>
                            <td><br />
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>                <br />

                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" GridLines="None"
                                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowPaging="true"
                                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                        </tr>
                    </table>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
