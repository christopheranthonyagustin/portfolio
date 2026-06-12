<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsIssueTemplate.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.GoodsIssueTemplate" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Freight Analysis Template</title>
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
                        <telerik:RadGrid ID="ResultDGAvailable" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="455"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true" OnRowDrop="ResultDGAvailable_RowDrop"
                            OnItemDataBound="ResultDGAvailable_ItemDataBound" UseAccessibleHeader="true" AllowFilteringByColumn="true"
                            OnNeedDataSource="ResultDGAvailable_NeedDataSource" AllowMultiRowSelection="true">
                            <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="AliasName" SortExpression="AliasName" HeaderText="Available Columns"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ColumnName" UniqueName="ColumnName" Display="false" />
                                    <telerik:GridBoundColumn DataField="Status" UniqueName="Status" Display="false" />
                                    <telerik:GridBoundColumn DataField="DefaultValue" UniqueName="DefaultValue" Display="false" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                    <td valign="top" align="left">
                        <telerik:RadGrid ID="ResultDGPriority" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="455"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true" OnRowDrop="ResultDGPriority_RowDrop"
                            OnItemDataBound="ResultDGPriority_ItemDataBound" UseAccessibleHeader="true" AllowFilteringByColumn="false"
                            OnNeedDataSource="ResultDGPriority_NeedDataSource" AllowMultiRowSelection="true">
                            <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                   <telerik:GridBoundColumn DataField="AliasName" SortExpression="AliasName" HeaderText="Column Sequence"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="DefaultValue" HeaderText="Default Value" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                                        <ItemTemplate>
                                            <telerik:RadTextBox ID="DefaultValueTxt" runat="server" Width="140" Skin="WebBlue"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "DefaultValue") %>' Enabled="false">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="ColumnName" UniqueName="ColumnName" Display="false" />
                                    <telerik:GridBoundColumn DataField="Status" UniqueName="Status" Display="false" />
                                    <telerik:GridBoundColumn DataField="DefaultValue" UniqueName="AssignedDefaultValue" Display="false" />
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
