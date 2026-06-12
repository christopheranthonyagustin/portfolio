<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositRequestListOfSKU.aspx.cs" Inherits="iWMS.Web.Inbound.DepositRequest.DepositRequestListOfSKU" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>ListOfSKU @ Deposit Request</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self">
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnItemCommand="ResultDG_ItemCommand"
            AllowPaging="false" Skin="Office2007" EnableViewState="false" UseAccessibleHeader="True"
            OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true" CssClass="DGItem"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="DGAlternateItem"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SKUCode" ClientDataKeyNames="SKUCode">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridButtonColumn Text="Select" CommandName="Select"></telerik:GridButtonColumn>
                    <telerik:GridBoundColumn DataField="SKUCode" UniqueName="SKUCode" HeaderText="SKUCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUDescr" UniqueName="SKUDescr" HeaderText="SKUDescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUCode2" UniqueName="SKUCode2" HeaderText="SKUCode2">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>