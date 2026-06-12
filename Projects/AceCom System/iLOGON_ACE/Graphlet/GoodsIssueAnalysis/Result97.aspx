<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result97.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.Result97" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GIAnalysis</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .ItemStyle {
            border-left-width: 0px !important;
        }

        .BoldStyle {
            border-left-width: 2px !important;
            border-left-color: dimgrey !important;
        }
    </style>
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr class="GrayTitle">
                <td>
                    <asp:Label ID="lblComapanyName" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>
                    <asp:Label ID="Title" runat="server" Text="GI Analysis" class="graytitle"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr class="GrayTitle">
                <td>
                    <asp:Label ID="FormatLbl" runat="server" class="graytitle" Text="Format" />
                </td>
                <td>
                    <asp:Label ID="FormatTxt" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>
                    <asp:Label ID="AccountLbl" runat="server" class="graytitle" Text="Account" />
                </td>
                <td>
                    <asp:Label ID="AccountTxt" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>
                    <asp:Label ID="RefLbl" runat="server" class="graytitle" Text="RefNo." />
                </td>
                <td>
                    <asp:Label ID="RefTxt" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>
                    <asp:Label ID="PrintDateLbl" runat="server" class="graytitle" Text="Printed Date" />
                </td>
                <td>
                    <asp:Label ID="PrintDateTxt" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>
                    <asp:Label ID="PrintByLbl" runat="server" class="graytitle" Text="Printed By" />
                </td>
                <td>
                    <asp:Label ID="PrintByTxt" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
            UseSubmitBehavior="false" />
        <br />
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False" AllowFilteringByColumn="false"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true"
                HeaderStyle-HorizontalAlign="Center">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <ExportSettings UseItemStyles="True" Excel-DefaultCellAlignment="Left">
                </ExportSettings>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridBoundColumn HeaderText="Consignee" DataField="Consignee" SortExpression="Consignee" UniqueName="Consignee" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Location" DataField="Location" SortExpression="Location" UniqueName="Location" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BatchNo" DataField="BatchNo" SortExpression="BatchNo" UniqueName="BatchNo" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Rec Date <br/> Expiry Date">
                            <ItemTemplate>
                                <%# string.Format("{0:dd/MMM/yyyy}",Eval("RecDate")) %>
                                <br />
                                <%# string.Format("{0:dd/MMM/yyyy}",Eval("ExpiryDate")) %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="SKU" HeaderText="SKU Description <br/> Packing">
                            <ItemTemplate>
                                <%# string.Format("{0:}",Eval("SKU")) %>
                                <br />
                                <%# string.Format("{0:}",Eval("Packing")) %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="Qty" DataField="Qty" SortExpression="Qty" UniqueName="Qty" Reorderable="true" ItemStyle-HorizontalAlign="Right">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="GINo" HeaderText="CustRef No. <br/> (SAP PickList No.)/ <br/> GI No.">
                            <ItemTemplate>
                                <%# string.Format("{0:}",Eval("Number")) %>
                                <br />
                                <%# string.Format("{0:}",Eval("ExRef2")) %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="Base No <br/> (SAP SO No.)" DataField="SAPBaseKey" SortExpression="SAPBaseKey" UniqueName="SAPBaseKey" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="Status" SortExpression="Status" UniqueName="Status" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" SortExpression="Remarks" UniqueName="Remarks" Reorderable="true">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
