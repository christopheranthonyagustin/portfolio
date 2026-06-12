<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.TripSumByTptType.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TripSumByTptType</title>
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
            <td width="70%" align="right">
                <a id="a1" runat="server" onserverclick="ExportExcel">
                    <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server" />
                </a>
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
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Trip Summary By Transport Type</asp:Label><asp:Label
                    ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="InfoLbl" runat="server">Info</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="InfoDescrLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    <div id="div-Consumable">
        <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="Both" AutoGenerateColumns="false"
            AllowSorting="false" OnPreRender="ResultRadGrid_PreRender" BorderStyle="Solid" OnGridExporting="RadGrid1_GridExporting"
            Skin="Office2007" OnSortCommand="ResultRadGrid_SortCommand" OnItemDataBound="ResultRadGrid_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <ClientEvents OnGridCreated="onGridCreated" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="custref">
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Document No" DataField="custref" AllowFiltering="true" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Sell To Customer Name" DataField="orderby" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Ship To Address" DataField="toaddr" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Description" DataField="jobdescr" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="qty" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="jobremarks" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Delivery Date" DataField="expdate" AllowFiltering="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Weight" DataField="actwt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="M3" DataField="actvol" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rates for < 5 Kgs" DataField="rate1" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rates for < 15 Kgs" DataField="rate2" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rates for < 200 Kgs" DataField="rate3" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rates for > 201 Kgs" DataField="rate4" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Amount" DataField="amt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="RE-Attempt" DataField="attempt" AllowFiltering="true"  DataFormatString="{0:G2}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="No of Man power" DataField="labourcnt" AllowFiltering="true" DataFormatString="{0:G2}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Option" DataField="sector" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Total" DataField="totalamt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <div id="div-Machine">
        <telerik:RadGrid ID="ResultRadGrid2" runat="server" GridLines="Both" AutoGenerateColumns="false"
            AllowSorting="False" OnPreRender="ResultRadGrid_PreRender" BorderStyle="Solid" OnGridExporting="RadGrid1_GridExporting"
            Skin="Office2007" OnSortCommand="ResultRadGrid_SortCommand" OnItemDataBound="ResultRadGrid_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <ClientEvents OnGridCreated="onGridCreated" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true">
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Document No" DataField="custref" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Sell To Customer Name" DataField="orderby" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Ship To Address" DataField="toaddr" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Description" DataField="jobdescr" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty To Ship" DataField="qty" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="jobremarks" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Delivery Date" DataField="expdate" AllowFiltering="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Weight" DataField="actwt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="M3" DataField="actvol" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Transport" DataField="amt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="No of Man power" DataField="labourcnt" AllowFiltering="true" DataFormatString="{0:G2}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Option" DataField="sector" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Labour Amt" DataField="labouramt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Total" DataField="totalamt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <div id="div-SpareParts">
        <telerik:RadGrid ID="ResultRadGrid3" runat="server" GridLines="Both" AutoGenerateColumns="false"
            AllowSorting="False" OnPreRender="ResultRadGrid_PreRender" BorderStyle="Solid" OnGridExporting="RadGrid1_GridExporting"
            Skin="Office2007" OnSortCommand="ResultRadGrid_SortCommand" OnItemDataBound="ResultRadGrid_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <ClientEvents OnGridCreated="onGridCreated" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed">
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Document No" DataField="custref" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Sell To Customer Name" DataField="orderby" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Ship To Address" DataField="toaddr" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Description" DataField="jobdescr" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="qty" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="jobremarks" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Delivery Date" DataField="expdate" AllowFiltering="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Weight" DataField="actwt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="M3" DataField="actvol" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rates for < 15 Kgs" DataField="rate1" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rates for < 15 Kgs" DataField="rate2" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rates for > 201 Kgs" DataField="rate3" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Amount" DataField="amt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="RE-Attempt" DataField="attempt" AllowFiltering="true"  DataFormatString="{0:G2}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="No of Man power" DataField="labourcnt" AllowFiltering="true" DataFormatString="{0:G2}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Option" DataField="sector" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Total" DataField="totalamt" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
