<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookCtnrListHead.aspx.cs"
    Inherits="iWMS.Web.Job.CashBookPV.CashBookCtnrListHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CashBookCtnrListHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function pageLoad() {
                var grid = $find("<%= ResultDG.ClientID %>");
                var columns = grid.get_masterTableView().get_columns();
                for (var i = 0; i < columns.length; i++) {
                    columns[i].resizeToFit(false, true);
                }
            }
        </script>

    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound"
        OnPageIndexChanged="ResultDG_PageIndexChanged">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
            <Scrolling AllowScroll="true" ScrollHeight="520px" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:Label ID="CbAddLbl" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="ContainerNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="jbctnrexpdate" SortExpression="expdate" HeaderText="EqpDate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="acname" SortExpression="acname" HeaderText="Account">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="triptypedescr" SortExpression="triptypedescr"
                    HeaderText="TripType">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Driver">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="vehnodescr" SortExpression="vehnodescr" HeaderText="VehNo">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
