<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.InvBalSummaryByAccount.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>InvBalanceSummaryByAccountResults</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function onGridCreated(sender, args) {
                $telerik.$(sender.GridDataDiv).on("scroll", function(a, b, e) {
                    this.scrollLeft = 0;
                });
            }

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
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td style="width: 50%;" colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server" />
            </td>
            <td style="width: 50%;" align="right">
                &nbsp;
            </td>
        </tr>
        <tr class="graytitle">
            <td style="width: 5%;">
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td style="width: 2%;">
                :
            </td>
            <td colspan="2" style="width: 93%;">
                <asp:Label ID="TitleLbl" runat="server">Inventory Balance Summary By Account As At </asp:Label><asp:Label
                    ID="AsAtDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td style="width: 5%;">
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td style="width: 2%;">
                :
            </td>
            <td colspan="2" style="width: 93%;">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td style="width: 5%;">
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td style="width: 2%;">
                :
            </td>
            <td colspan="2" style="width: 93%;">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
        <img id="excelImg" border="0" alt="Export to Excel" title="Export to Excel" align="absMiddle"
            src="../../Image/excel.gif" height="20" runat="server" /></a>
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" GridLines="Both" AutoGenerateColumns="false" OnNeedDataSource="ResultDG_NeedDataSource"
        AllowSorting="False" AllowPaging="false" BorderStyle="Solid" OnGridExporting="ResultDG_GridExporting"
        Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" AllowFilteringByColumn="false">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <%--<ClientEvents OnGridCreated="onGridCreated" />--%>
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false">
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="Account" DataField="Accode" />
                <telerik:GridBoundColumn HeaderText="Name" DataField="Acname" />
                <telerik:GridBoundColumn HeaderText="NoOfSku" DataField="NoOfSku" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.##}" />
                <telerik:GridBoundColumn HeaderText="NoOfLot" DataField="NoOfLot" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.##}" />
                <telerik:GridBoundColumn HeaderText="NoOfTuno1" DataField="NoOfTuno1" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.##}" />
                <telerik:GridBoundColumn HeaderText="TotalVol" DataField="TotalVol" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N4}" />
                <telerik:GridBoundColumn HeaderText="NoOfLHU" DataField="NoOfLHU" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.##}" />
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
