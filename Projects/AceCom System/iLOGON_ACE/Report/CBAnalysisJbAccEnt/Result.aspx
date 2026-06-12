<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.CBAnalysisJbAccEnt.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CBAnalysisJbAccEnt</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

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

    <script type="text/javascript">
        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
          
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">CashBook Analysis by Job Account Entity</asp:Label><asp:Label
                    ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="TypeLbl" runat="server">Type</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TypeTxtLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                Entity
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="EntLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                Bank</td>
            <td>
                :</td>
            <td colspan="2">
                <asp:Label ID="BankLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                &nbsp; <a id="a1" runat="server" onserverclick="ExportExcel">
                    <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server" /></a></td>
            <td>
                &nbsp;
            </td>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="Both" AutoGenerateColumns="false"
        AllowSorting="false"  BorderStyle="Solid"
        OnGridExporting="RadGrid1_GridExporting" Skin="Office2007" OnSortCommand="ResultRadGrid_SortCommand"
        OnItemDataBound="ResultRadGrid_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <ClientEvents OnGridCreated="onGridCreated" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <ExportSettings HideStructureColumns="true" ExportOnlyData="true" >
        </ExportSettings>
        <GroupingSettings RetainGroupFootersVisibility="true" />
        <MasterTableView ShowGroupFooter="true" AllowMultiColumnSorting="true" Name="Master"
            GroupLoadMode="Client" GroupsDefaultExpanded="false">
            <Columns>
                <telerik:GridBoundColumn HeaderText="Entity" DataField="Entity" AllowFiltering="true"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                    UniqueName="type" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TransactionDate" DataField="trandate" AllowFiltering="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TransactionNo" DataField="number" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Invoice/Receipt No" DataField="exref1" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobnumber" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Account" DataField="acname" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="chargedescr" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Amount" DataField="fcamt" AllowFiltering="true"
                Aggregate="sum" FooterText="AmountTotal:  "  DataFormatString="{0:#,0.00}">
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
            </Columns>
            <GroupByExpressions>
                <telerik:GridGroupByExpression>
                    <SelectFields>
                        <telerik:GridGroupByField FieldName="Entity"></telerik:GridGroupByField>
                    </SelectFields>
                    <GroupByFields>
                        <telerik:GridGroupByField FieldName="Entity"></telerik:GridGroupByField>
                    </GroupByFields>
                </telerik:GridGroupByExpression>
                <telerik:GridGroupByExpression>
                    <SelectFields>
                        <telerik:GridGroupByField FieldAlias="type" FieldName="type"></telerik:GridGroupByField>
                    </SelectFields>
                    <GroupByFields>
                        <telerik:GridGroupByField FieldName="type"></telerik:GridGroupByField>
                    </GroupByFields>
                </telerik:GridGroupByExpression>
            </GroupByExpressions>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
