<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WavePickingWorkbenchViewLog.aspx.cs" Inherits="iWMS.Web.Outbound.WavePickingWorkbench.WavePickingWorkbenchViewLog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pick Task @ WavePackingWorkbenchPackingPool</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="580px" ID="CartonSummaryRadPageView">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <ItemStyle></ItemStyle>
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="category" SortExpression="category" HeaderText="Category"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tablename" SortExpression="tablename" HeaderText="TableName"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="columnname" SortExpression="columnname" HeaderText="ColumnName"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="beforevalue" SortExpression="beforevalue" HeaderText="BeforeValue"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="aftervalue" SortExpression="aftervalue" HeaderText="AfterValue"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
