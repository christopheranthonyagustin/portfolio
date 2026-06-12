<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Graphlet.iCMSStoringOrderAnalysis.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>iCMSStoringOrderAnalysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">iCMS Storing Order Analysis </asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="FormatDescLbl" runat="server" CssClass="Graytitle">Storing Order Container Details from </asp:Label><asp:Label
                    ID="DateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="TypeLbl" runat="server">Type</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="TypeDescrLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007" GridLines="None"
        AutoGenerateColumns="false" GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true"
        FilterType="Classic" AllowSorting="true" BorderStyle="Solid" ExportSettings-UseItemStyles="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
            Resizing-AllowColumnResize="true">
            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <FooterStyle Font-Bold="true" Wrap="true"></FooterStyle>
        <MasterTableView AllowMultiColumnSorting="false" TableLayout="Fixed" Name="Master"
            Width="100%">
            <Columns>
                <telerik:GridBoundColumn HeaderText="StoringOrder" DataField="StoringOrder" AllowFiltering="true"
                    FilterControlWidth="100px" HeaderStyle-Width="150px" ColumnGroupName="StoringOrder"
                    SortExpression="StoringOrder" UniqueName="StoringOrder">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Type" DataField="TypeDescr" ItemStyle-Width="80px"
                    AllowFiltering="true" HeaderStyle-Width="100px" FilterControlWidth="50px" ColumnGroupName="TypeDescr"
                    SortExpression="TypeDescr" UniqueName="TypeDescr">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ReceivedFrom" DataField="ReceivedFrom" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="ReceivedFrom" SortExpression="ReceivedFrom"
                    UniqueName="ReceivedFrom">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="skucode" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="ContainerNo" SortExpression="ContainerNo"
                    UniqueName="ContainerNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SizeType" DataField="sizetype" AllowFiltering="true"
                    FilterControlWidth="100px" HeaderStyle-Width="150px" ColumnGroupName="sizetype"
                    SortExpression="sizetype" UniqueName="sizetype">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="StoringDate" DataField="lot1" AllowFiltering="true" SortExpression="lot1" UniqueName="lot1"
                    HeaderStyle-Width="130px" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ReleaseOrder" DataField="ReleaseOrder" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="ReleaseOrder" SortExpression="ReleaseOrder"
                    UniqueName="ReleaseOrder">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ROContainerNo" DataField="ROContainerNo" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="ROContainerNo" SortExpression="ROContainerNo"
                    UniqueName="ROContainerNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ROContainerType" DataField="ROContainerType"
                    AllowFiltering="true" HeaderStyle-Width="150px" ColumnGroupName="ROContainerType"
                    SortExpression="ROContainerType" UniqueName="ROContainerType">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Commodity" DataField="lot5" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="Commodity" SortExpression="Commodity"
                    UniqueName="Commodity">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Condition" DataField="lot6" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="Condition" SortExpression="Condition"
                    UniqueName="Condition">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Rate" DataField="lot7" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="Rate" SortExpression="Rate" UniqueName="Rate">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Currency" DataField="lot9" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="Currency" SortExpression="Currency"
                    UniqueName="Currency">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TaxType" DataField="lot10" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="TaxType" SortExpression="TaxType"
                    UniqueName="TaxType">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Period" DataField="lot11" AllowFiltering="true"
                    HeaderStyle-Width="200px" ColumnGroupName="Period" SortExpression="Period" UniqueName="Period">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="StatusDescr" SortExpression="StatusDescr"
                    UniqueName="StatusDescr">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem1" AllowFiltering="true"
                    HeaderStyle-Width="200px" ColumnGroupName="rem1" SortExpression="rem1"
                    UniqueName="rem1">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
