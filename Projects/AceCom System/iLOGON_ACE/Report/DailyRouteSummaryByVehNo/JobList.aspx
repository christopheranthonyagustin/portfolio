<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobList.aspx.cs" Inherits="iWMS.Web.Report.DailyRouteSummaryByVehNo.JobList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JobList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function onGridCreated(sender, args) {
                $telerik.$(sender.GridDataDiv).on("scroll", function(a, b, e) {
                    this.scrollLeft = 0;
                });
            }
        </script>

        <script type="text/javascript">
            function pageLoad() {
                var grid = $find("<%= ResultRadGrid.ClientID %>");
                var columns = grid.get_masterTableView().get_columns();
                for (var i = 0; i < columns.length; i++) {
                    columns[i].resizeToFit(false, true);
                }
            }
        </script>

    </telerik:RadCodeBlock>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div id="div-datagrid">
        <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
            AllowSorting="True" BorderStyle="Solid" Skin="Office2007" OnItemDataBound="ResultRadGrid_ItemDataBound"
            OnNeedDataSource="ResultRadGrid_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" TableLayout="Fixed"
                Name="Master">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="sno" HeaderText="S/N">
                        <ItemTemplate>
                            <asp:Label ID="numberLabel" runat="server" Width="35px" />
                        </ItemTemplate>
                        <HeaderStyle Width="35px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderStyle Width="30px" />
                        <ItemTemplate>
                            <asp:Label ID="AttcLbl" runat="server"></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="CustRef" DataField="CustRef" AllowFiltering="true"
                        ColumnGroupName="CustRef">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Date" DataField="frexpdate" AllowFiltering="true"
                        ColumnGroupName="Date">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Time" DataField="fracttime" AllowFiltering="true"
                        ColumnGroupName="Time">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="From" DataField="fraddr" AllowFiltering="true"
                        ColumnGroupName="From">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="To" DataField="toaddr" AllowFiltering="true"
                        ColumnGroupName="To">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Wt" DataField="actwt" AllowFiltering="true"
                        ColumnGroupName="Wt" DataFormatString="{0:#,0.0000}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vol" DataField="actvol" AllowFiltering="true"
                        ColumnGroupName="Vol" DataFormatString="{0:#,0.0000}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="qty" AllowFiltering="true" ColumnGroupName="Qty">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Reason" DataField="reasondescr" AllowFiltering="true"
                        ColumnGroupName="reasondescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                        ColumnGroupName="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="False" />
                    <telerik:GridBoundColumn DataField="jbid" UniqueName="jbid" Display="False" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
