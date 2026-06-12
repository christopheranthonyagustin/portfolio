<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingOrderShowTripInfo.aspx.cs" Inherits="iWMS.Web.Job.BookingOrder.BookingOrderShowTripInfo" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trip Info @ Booking Order</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow;
            else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" RenderMode="Lightweight" AllowFilteringByColumn="false"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="true" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <CommandItemSettings ShowRefreshButton="false" />
                <Columns>
                    <telerik:GridBoundColumn UniqueName="Expdate" HeaderText="RequiredDate" DataField="Expdate"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="Expdate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="EqpRemarks" HeaderText="RequiredTime" DataField="EqpRemarks"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="EqpRemarks">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="TripType" HeaderText="TripType" DataField="TripType"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="TripType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="ContainerNo" HeaderText="ContainerNo" DataField="ContainerNo"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="ContainerNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="SealNo" HeaderText="SealNo" DataField="SealNo"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="SealNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="FrExpDate" HeaderText="From" DataField="FrExpDate"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="FrExpDate" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="ToActDate" HeaderText="To" DataField="ToActDate"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="ToActDate" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="PickUp" HeaderText="Pick-up" DataField="FrAddr"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="PickUp">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="DropOff" HeaderText="Drop-Off" DataField="ToAddr"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="Drop-Off">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="DriverName" HeaderText="DriverName" DataField="DriverName"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="DriverName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="VehNo" HeaderText="VehNo" DataField="VehNo"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="VehNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="TrailerNo" HeaderText="TrailerNo" DataField="TrailerNo"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="TrailerNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="StatusColourCode" Display="false" DataField="StatusColourCode" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
