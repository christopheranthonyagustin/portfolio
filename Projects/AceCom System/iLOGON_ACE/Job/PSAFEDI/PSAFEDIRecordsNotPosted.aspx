<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PSAFEDIRecordsNotPosted.aspx.cs" Inherits="iWMS.Web.Job.PSAFEDI.PSAFEDIRecordsNotPosted" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>PSAFEDIRecordsNotPosted</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="ExcelBtn" CssClass="green" runat="server" OnClick="ExcelBtn_Click" Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="PSACfmBtn" CssClass="green" runat="server" OnClick="PSACfmImgBtn_Click" Text="Post" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnColumnCreated="ResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                <ClientEvents OnBatchEditClosed="BatchEditClosed" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                EditMode="Batch" CommandItemDisplay="None">
                <BatchEditingSettings EditType="Row" />
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
