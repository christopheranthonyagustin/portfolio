<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PSInterface.aspx.cs" Inherits="iWMS.Web.Job.Shipment.PSInterface" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PSInterfaceUpload</title>
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
                <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" Text="Patron Spirits Interface Upload" />
                <br />
                <br />
                <asp:Label runat="server" ID="FilePathLbl" Text="Path" />
                <br />
                <telerik:RadTextBox runat="server" ID="FilePathTxt" Width="250px" Skin="Office2007" ReadOnly="true"></telerik:RadTextBox>
                <br />
                <br />
            </td>
            <td style="width: 50%;" rowspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadDropDownList ID="StatusDDL" runat="server" DefaultMessage="Select a Status"
                    DropDownWidth="150px" Skin="WebBlue" Width="150px" 
                    AutoPostBack="true" OnSelectedIndexChanged="StatusDDL_Changed">
                </telerik:RadDropDownList>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadButton ID="UploadBtn" runat="server" OnClick="UploadBtn_Click" Text="Upload" ToolTip="Click to Upload Selected Files" Skin="WebBlue">
                </telerik:RadButton>
                <br />
                <br />
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" OnItemCreated="ResultRadGrid_ItemCreated"
        OnItemCommand="ResultRadGrid_ItemCommand" Skin="Office2007" OnPreRender="ResultRadGrid_PreRender"
        OnItemDataBound="ResultRadGrid_ItemDataBound">
        <clientsettings allowcolumnsreorder="false" reordercolumnsonclient="false" enablepostbackonrowclick="false"
            resizing-allowcolumnresize="true">
            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
        </clientsettings>
        <alternatingitemstyle wrap="true"></alternatingitemstyle>
        <itemstyle wrap="true"></itemstyle>
        <headerstyle wrap="true"></headerstyle>
        <footerstyle font-bold="true" wrap="true"></footerstyle>
        <mastertableview allowmulticolumnsorting="false" tablelayout="Fixed" name="Master"
            width="100%">
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
                <telerik:GridBoundColumn HeaderText="PurchaseNo" DataField="purchaseno" AllowFiltering="true"
                    HeaderStyle-Width="100px" FilterControlWidth="80px" ColumnGroupName="purchaseno"
                    SortExpression="purchaseno" UniqueName="PurchaseNo" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ShipDate" DataField="shipdate" AllowFiltering="true"
                    HeaderStyle-Width="100px" FilterControlWidth="80px" ColumnGroupName="shipdate"
                    SortExpression="shipdate" UniqueName="ShipDate" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
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
                <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" AllowFiltering="true"
                    FilterControlWidth="70px" HeaderStyle-Width="80px" ColumnGroupName="jobno"
                    SortExpression="jobno" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false" UniqueName="JobNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="JobStatus" DataField="jbstatus" AllowFiltering="false"
                    HeaderStyle-Width="70px" ColumnGroupName="jbstatus" SortExpression="jbstatus"
                    UniqueName="JobStatus">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FilePath" DataField="filepath" AllowFiltering="false"
                    ColumnGroupName="filepath" SortExpression="filepath" UniqueName="FilePath" Display="false">
                </telerik:GridBoundColumn>
            </Columns>
        </mastertableview>
    </telerik:RadGrid>
    </form>
</body>
</html>
