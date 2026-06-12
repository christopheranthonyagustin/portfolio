<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GLAnalysisTemplate.aspx.cs" Inherits="iWMS.Web.Accounting.GLAnalysis.GLAnalysisTemplate" %>


<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>General Ledger Analysis Template</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
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
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click" Text="Save"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <asp:Panel ID="GridPnl" runat="server">
            <table>
                <tr>
                    <td valign="top" align="left">
                        <telerik:RadGrid ID="ResultDGAvailable" runat="server" AutoGenerateColumns="false" GridLines="None" Width="260px" Height="455px"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" OnRowDrop="ResultDGAvailable_RowDrop"
                            OnItemDataBound="ResultDGAvailable_ItemDataBound" UseAccessibleHeader="true" AllowFilteringByColumn="true"
                            OnNeedDataSource="ResultDGAvailable_NeedDataSource" AllowMultiRowSelection="true">
                            <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ColumnName" SortExpression="ColumnName" HeaderText="Available Columns"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                    <td valign="top" align="left">
                        <telerik:RadGrid ID="ResultDGPriority" runat="server" AutoGenerateColumns="false" GridLines="None" Width="260px" Height="455"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" OnRowDrop="ResultDGPriority_RowDrop"
                            OnItemDataBound="ResultDGPriority_ItemDataBound" UseAccessibleHeader="true" AllowFilteringByColumn="true"
                            OnNeedDataSource="ResultDGPriority_NeedDataSource" AllowMultiRowSelection="true">
                            <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ColumnName" SortExpression="ColumnName" HeaderText="Rotation Priority"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
