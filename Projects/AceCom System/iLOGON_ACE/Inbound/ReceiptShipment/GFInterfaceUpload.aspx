<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GFInterfaceUpload.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.GFInterfaceUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GrundfosInterfaceUpload</title>
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

    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td style="width: 50%;">
                <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" Text="Grundfos Interface Upload" />
                <br />
                <br />
                <asp:Label runat="server" ID="FilePathLbl" Text="Path" />
                <br />
                <asp:TextBox runat="server" ID="FilePathTxt" ReadOnly="true" />
                <br />
                <br />
            </td>
            <td style="width: 50%;" rowspan="3">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 100%;" valign="top">
                            <asp:CheckBoxList runat="server" ID="settingList" Width="99%" CellSpacing="4" CellPadding="5"
                                Enabled="false">
                                <asp:ListItem Text="Allow Auto-Create SKU(s)" Value="autocreatesku" />
                                <asp:ListItem Text="Default In-transit Quantity with ExpectedQty" Value="defintransit" />
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="StatusDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="StatusDDL_Changed" />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="UploadBtn" runat="server" OnClick="UploadBtn_Click" Text="Upload" />
                <br />
                <br />
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" OnItemCreated="ResultRadGrid_ItemCreated" OnItemCommand="ResultRadGrid_ItemCommand"
        Skin="Office2007" OnPreRender="ResultRadGrid_PreRender" OnItemDataBound="ResultRadGrid_ItemDataBound">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
            Resizing-AllowColumnResize="true">
            <Selecting AllowRowSelect="false" EnableDragToSelectRows="false" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <FooterStyle Font-Bold="true" Wrap="true"></FooterStyle>
        <MasterTableView AllowMultiColumnSorting="false" TableLayout="Fixed" Name="Master"
            Width="100%">
            <Columns>
                <telerik:GridTemplateColumn HeaderStyle-Width="40px" AllowFiltering="false">
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectChkBox" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="browseLnkBtn" runat="server" Text="Preview" OnClick="browseLnkBtn_Click" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlWidth="50px" HeaderStyle-Width="80px" ItemStyle-Width="80px" AllowFiltering="true" 
                    DataField="status" ColumnGroupName="status" ShowFilterIcon="false" SortExpression="status" 
                    UniqueName="Status" HeaderText="Status" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                    <ItemTemplate>
                        &nbsp;
                        <asp:LinkButton ID="logLnkBtn" runat="server" OnClick="logLnkBtn_Click" Text='<% #DataBinder.Eval(Container,"DataItem.status")%>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="ExRef1" DataField="exref1" AllowFiltering="true"
                    HeaderStyle-Width="100px" FilterControlWidth="80px" ColumnGroupName="exref1"
                    SortExpression="exref1" UniqueName="ExRef1" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ExRef2" DataField="exref2" AllowFiltering="true"
                    HeaderStyle-Width="100px" FilterControlWidth="80px" ColumnGroupName="exref2"
                    SortExpression="exref2" UniqueName="ExRef2" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lines" DataField="lines" AllowFiltering="false"
                    HeaderStyle-Width="70px" ColumnGroupName="lines" SortExpression="lines" UniqueName="Lines">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FileName" DataField="filename" AllowFiltering="true"
                    FilterControlWidth="80px" ColumnGroupName="filename" SortExpression="filename"
                    UniqueName="FileName" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridDateTimeColumn DataField="filereceived" HeaderText="FileReceived" UniqueName="FileReceived"
                    FilterControlWidth="100px" SortExpression="filereceived" PickerType="DatePicker"
                    EnableTimeIndependentFiltering="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridDateTimeColumn>
                <telerik:GridBoundColumn HeaderText="ReceiptNo" DataField="receiptno" AllowFiltering="true"
                    FilterControlWidth="70px" HeaderStyle-Width="80px" ColumnGroupName="receiptno"
                    SortExpression="receiptno" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false" UniqueName="ReceiptNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="RCStatus" DataField="rcstatus" AllowFiltering="false"
                    HeaderStyle-Width="70px" ColumnGroupName="rcstatus" SortExpression="rcstatus"
                    UniqueName="RCStatus">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FilePath" DataField="filepath" AllowFiltering="false"
                    ColumnGroupName="filepath" SortExpression="filepath" UniqueName="FilePath" Display="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
