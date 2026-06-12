<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetlResult.aspx.cs" Inherits="iWMS.Web.Report.DailyTripSummaryByVehicle.DetlResult" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DailyTripDetails</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
        .RadPivotGrid_Metro .rpgContentZoneDiv td
        {
            white-space: nowrap;
        }
    </style>
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
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="LicenseNameLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td colspan="2">
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="Daily Trip Summary " />
                <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" />
            </td>
        </tr>
        <tr class="graytitle">
            <td width="8%">
                <asp:Label ID="AccLbl" runat="server" class="graytitle">Account</asp:Label>
            </td>
            <td width="92%">
                :&nbsp;<asp:Label ID="AccountLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td width="8%">
                <asp:Label ID="BillSizeLbl" runat="server" class="graytitle">BillSizeType</asp:Label>
            </td>
            <td width="92%">
                :&nbsp;<asp:Label ID="BillSizeTypeLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/excel.gif"
        OnClick="ButtonExcel_Click" />
    <div id="div-datagrid">
        <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
            AllowSorting="false" OnSelectedIndexChanged="ResultRadGrid_SelectedIndexChanged"
            BorderStyle="Solid" Skin="Office2007" OnPreRender="ResultRadGrid_PreRender" OnItemDataBound="ResultRadGrid_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false">
                <Selecting AllowRowSelect="false" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true"></HeaderStyle>
            <FooterStyle Font-Bold="true" Wrap="true"></FooterStyle>
            <MasterTableView AllowMultiColumnSorting="false" DataKeyNames="id" TableLayout="Fixed" ShowFooter="True"
                Name="Master">
                <Columns>
                    <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="billsizetype" AllowFiltering="true"
                        UniqueName="billsizetype" ColumnGroupName="billsizetype">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Date" DataField="frexpdate" AllowFiltering="true"
                        UniqueName="frexpdate" ColumnGroupName="frexpdate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" AllowFiltering="true"
                        ColumnGroupName="jobno">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CustRef" DataField="exref1" AllowFiltering="true"
                        ColumnGroupName="exref1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Deliver" DataField="toaddr" AllowFiltering="true"
                        ColumnGroupName="toaddr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PickList" DataField="permitno" AllowFiltering="true"
                        ColumnGroupName="permitno">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OrderType" DataField="exportername" AllowFiltering="true"
                        ColumnGroupName="exportername">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="S/O" DataField="bkref" AllowFiltering="true"
                        ColumnGroupName="bkref">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Description" DataField="jobdescr" AllowFiltering="true"
                        ColumnGroupName="jobdescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Div" DataField="exporteraddr" AllowFiltering="true"
                        ColumnGroupName="exporteraddr">
                    </telerik:GridBoundColumn>
                    <telerik:GridNumericColumn Aggregate="Sum" DataField="actvol" DataType="System.Decimal"
                        HeaderText="Vol" SortExpression="actvol" ColumnGroupName="actvol">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn Aggregate="Sum" DataField="actpkg" DataType="System.Decimal"
                        HeaderText="Pkg" SortExpression="actpkg" ColumnGroupName="actpkg">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn Aggregate="Sum" DataField="actplt" DataType="System.Decimal"
                        HeaderText="Plt" SortExpression="actplt" ColumnGroupName="actplt">
                    </telerik:GridNumericColumn>
                    <telerik:GridBoundColumn HeaderText="Time" DataField="fracttime" AllowFiltering="true"
                        ColumnGroupName="fracttime">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vehicle" DataField="Vehicle" AllowFiltering="true"
                        ColumnGroupName="Vehicle">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AMPM" DataField="ampm" AllowFiltering="true"
                        ColumnGroupName="AMPM">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Reason" DataField="reasondescr" AllowFiltering="true"
                        ColumnGroupName="Reason">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Categories" DataField="jbctpttypedescr" AllowFiltering="true"
                        ColumnGroupName="Categories">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="jbremarks" AllowFiltering="true"
                        ColumnGroupName="jbremarks">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
