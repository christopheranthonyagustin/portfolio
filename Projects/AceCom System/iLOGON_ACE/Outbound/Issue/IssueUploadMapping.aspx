<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueUploadMapping.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueUploadMapping" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Upload Column Mapping</title>
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Panel ID="GridPnl" runat="server">
            <table>
                <tr>
                    <td valign="top" align="left">
                        <asp:Label runat="server" Font-Bold="true" Font-Size="Medium" Text="ISHEAD"></asp:Label>
                        <br /><br />
                        <telerik:RadGrid ID="ResultDGIsHead" runat="server" AutoGenerateColumns="true" GridLines="None" Width="655px" Height="455px"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true"
                            UseAccessibleHeader="true" AllowFilteringByColumn="false" OnNeedDataSource="ResultDGIsHead_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                            AllowMultiRowSelection="true">
                            <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                    <td valign="top" align="left">
                        <asp:Label runat="server" Font-Bold="true" Font-Size="Medium" Text="ISDETL"></asp:Label>
                        <br /><br />
                        <telerik:RadGrid ID="ResultDGIsDetl" runat="server" AutoGenerateColumns="true" GridLines="None" Width="655px" Height="455px"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true" OnNeedDataSource="ResultDGIsDetl_NeedDataSource"
                            UseAccessibleHeader="true" AllowFilteringByColumn="false" OnColumnCreated="ResultDG_ColumnCreated"
                            AllowMultiRowSelection="true">
                            <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
