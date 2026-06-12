<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderJobSummary.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderJobSummary" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Job Summary @ TMS Booking Order</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="800px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <asp:Panel ID="ContainerPanel" runat="server" Width="100%" Height="30%">
            <table>
                <tr>
                    <td>
                        <asp:Label Text="Container" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <telerik:RadGrid ID="ContainerResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
                            OnNeedDataSource="ContainerResultDG_NeedDataSource" OnItemDataBound="ContainerResultDG_ItemDataBound" AllowPaging="true" Width="150%"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" PageSize="50">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="SNo" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            S/N
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%> 
                                            &nbsp;
                                            <asp:ImageButton runat="server" ID="ContainerAttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                                BorderWidth="0" BackColor="Transparent" OnClick="ContainerAttcImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="TripDate" UniqueName="TripDate" SortExpression="TripDate" HeaderText="TripDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TripType" UniqueName="TripType" SortExpression="TripType" HeaderText="TripType" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ContainerNumber" UniqueName="ContainerNumber" SortExpression="ContainerNumber" HeaderText="ContainerNumber" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SealNumber" UniqueName="SealNumber" SortExpression="SealNumber" HeaderText="SealNumber" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="VGM" UniqueName="VGM" SortExpression="VGM" HeaderText="VGM" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ContainerDescription" UniqueName="ContainerDescription" SortExpression="ContainerDescription" HeaderText="ContainerDescription" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ReadyDate" UniqueName="ReadyDate" SortExpression="ReadyDate" HeaderText="ReadyDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FromAddress" UniqueName="FromAddress" SortExpression="FromAddress" HeaderText="FromAddress" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ToAddress" UniqueName="ToAddress" SortExpression="ToAddress" HeaderText="ToAddress" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="VehicleNumber" UniqueName="VehicleNumber" SortExpression="VehicleNumber" HeaderText="VehicleNumber" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Driver" UniqueName="Driver" SortExpression="Driver" HeaderText="Driver" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TrailerNo" UniqueName="TrailerNo" SortExpression="TrailerNo" HeaderText="TrailerNo" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="NonContainerPanel" runat="server" Width="100%" Height="30%">
            <table>
                <tr>
                    <td>
                        <br />
                        <asp:Label Text="NonContainer" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <telerik:RadGrid ID="NonContainerResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
                            OnNeedDataSource="NonContainerResultDG_NeedDataSource" OnItemDataBound="NonContainerResultDG_ItemDataBound" AllowPaging="true" Width="150%"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" PageSize="50">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="SNo" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            S/N
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                            &nbsp;
                                            <asp:ImageButton runat="server" ID="NonContainerAttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                                BorderWidth="0" BackColor="Transparent" OnClick="NonContainerAttcImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="TripDate" UniqueName="TripDate" SortExpression="TripDate" HeaderText="TripDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="135px" ItemStyle-Width="135px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FromTime" UniqueName="FromTime" SortExpression="FromTime" HeaderText="FromTime" AutoPostBackOnFilter="true" HeaderStyle-Width="135px" ItemStyle-Width="135px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ToTime" UniqueName="ToTime" SortExpression="ToTime" HeaderText="ToTime" AutoPostBackOnFilter="true" HeaderStyle-Width="135px" ItemStyle-Width="135px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType" AutoPostBackOnFilter="true" HeaderStyle-Width="135px" ItemStyle-Width="135px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TransportType" UniqueName="TransportType" SortExpression="TransportType" HeaderText="TransportType" AutoPostBackOnFilter="true" HeaderStyle-Width="135px" ItemStyle-Width="135px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FromAddress" UniqueName="FromAddress" SortExpression="FromAddress" HeaderText="FromAddress" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ToAddress" UniqueName="ToAddress" SortExpression="ToAddress" HeaderText="ToAddress" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Vehicle" UniqueName="Vehicle" SortExpression="Vehicle" HeaderText="Vehicle" AutoPostBackOnFilter="true" HeaderStyle-Width="135px" ItemStyle-Width="135px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Driver" UniqueName="Driver" SortExpression="Driver" HeaderText="Driver" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TrailerNo" UniqueName="TrailerNo" SortExpression="TrailerNo" HeaderText="TrailerNo" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="ManpowerPanel" runat="server" Width="100%" Height="30%">
            <table>
                <tr>
                    <td>
                        <br />
                        <asp:Label Text="Manpower" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <telerik:RadGrid ID="ManpowerResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
                            OnNeedDataSource="ManpowerResultDG_NeedDataSource" OnItemDataBound="ManpowerResultDG_ItemDataBound" AllowPaging="true"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBPerAtvtId" PageSize="50">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="SNo" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            S/N
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                            &nbsp;
                                            <asp:ImageButton runat="server" ID="ManpowerAttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                                BorderWidth="0" BackColor="Transparent" OnClick="ManpowerAttcImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="Activity" UniqueName="Activity" SortExpression="Activity" HeaderText="Activity" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FromDate" UniqueName="FromDate" SortExpression="FromDate" HeaderText="FromDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ToDate" UniqueName="ToDate" SortExpression="ToDate" HeaderText="ToDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Remarks" UniqueName="Remarks" SortExpression="Remarks" HeaderText="Remarks" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="PaymentPanel" runat="server" Width="100%" Height="30%">
            <table>
                <tr>
                    <td>
                        <br />
                        <asp:Label Text="Payment" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <telerik:RadGrid ID="PaymentResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
                            OnNeedDataSource="PaymentResultDG_NeedDataSource" AllowPaging="true"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="PaymentResultDG_ItemDataBound">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="CBDId" PageSize="50">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="SNo" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            S/N
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                            &nbsp;
                                         <asp:ImageButton runat="server" ID="PaymentAttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                             BorderWidth="0" BackColor="Transparent" OnClick="PaymentAttcImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="ReferenceNo" DataField="Number" UniqueName="Number" SortExpression="Number" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Date" DataField="TranDate" UniqueName="TranDate" SortExpression="TranDate" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Type" DataField="Type" UniqueName="Type" SortExpression="Type" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="VendorDocNo" DataField="Exref1" UniqueName="Exref1" SortExpression="Exref1" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="VendorDocDate" DataField="ExDate1" UniqueName="ExDate1" SortExpression="ExDate1" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="CtnrNo" DataField="CbdCtnrNo" UniqueName="CbdCtnrNo" SortExpression="CbdCtnrNo" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Charge" DataField="ChargeDescr" UniqueName="ChargeDescr" SortExpression="ChargeDescr" HeaderStyle-Width="300px" ItemStyle-Width="300px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="CbDetlCharge" UniqueName="CbDetlCharge" SortExpression="CbDetlCharge" HeaderStyle-Width="300px" ItemStyle-Width="300px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Qty" DataField="CbdQty" UniqueName="CbdQty" SortExpression="TranDate" DataFormatString="{0:#,0.##}" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Rate" DataField="CbdUnitRate" UniqueName="CbdUnitRate" SortExpression="CbdUnitRate" DataFormatString="{0:#,0.##}" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Amount" DataField="CbdFcAmt" UniqueName="CbdFcAmt" SortExpression="CbdFcAmt" DataFormatString="{0:#,0.##}" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Remark" DataField="CbdRem1" UniqueName="CbdRem1" SortExpression="CbdRem1" HeaderStyle-Width="400px" ItemStyle-Width="400px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="RecoverableType" DataField="RecoverableTypeDescr" UniqueName="RecoverableTypeDescr" SortExpression="RecoverableTypeDescr" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="RecoverableRemarks" DataField="RecoverableRemarks" UniqueName="RecoverableRemarks" SortExpression="RecoverableRemarks" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="VendorName" DataField="CbdVdname" UniqueName="CbdVdname" SortExpression="CbdVdname" HeaderStyle-Width="270px" ItemStyle-Width="270px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Personnel" DataField="CbdPerCode" UniqueName="CbdPerCode" SortExpression="CbdPerCode" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Vehicle" DataField="CbdVehNo" UniqueName="CbdVehNo" SortExpression="CbdVehNo" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="PINo" DataField="PINo" UniqueName="PINo" SortExpression="PINo" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="PIInvno" DataField="PIInvno" UniqueName="PIInvno" SortExpression="PIInvno" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Id" Display="false"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="EquipmentRentalPanel" runat="server" Width="100%" Height="30%">
            <table>
                <tr>
                    <td>
                        <br />
                        <asp:Label Text="Equipment Rental" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <telerik:RadGrid ID="EQRResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
                            OnNeedDataSource="EQRResultDG_NeedDataSource" OnItemDataBound="EQRResultDG_ItemDataBound" AllowPaging="true" Width="150%"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBCtnrId" PageSize="50">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="SNo" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            S/N
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="VehNo1Descr" UniqueName="EquipmentNo" SortExpression="EquipmentNo" HeaderText="EquipmentNo" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TpterDriverName" UniqueName="Operator" SortExpression="Operator" HeaderText="Operator" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillingNotesDescr" UniqueName="AddOnService" SortExpression="AddOnService" HeaderText="AddOnService" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ExpDate" UniqueName="FromDate" SortExpression="FromDate" HeaderText="FromDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EndDate" UniqueName="ToDate" SortExpression="ToDate" HeaderText="ToDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FrServicePt" UniqueName="FromServicePointAndAddr" SortExpression="FromServicePointAndAddr" HeaderText="FromServicePoint" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FrAddr" UniqueName="FrAddr" SortExpression="FrAddr" HeaderText="FromAddress" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ToServicePt" UniqueName="ToServicePointAndAddr" SortExpression="ToServicePointAndAddr" HeaderText="ToServicePoint" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ToAddr" UniqueName="ToAddr" SortExpression="ToAddr" HeaderText="ToAddress" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusDescr" HeaderText="Status" UniqueName="StatusDescr" ReadOnly="true" HeaderStyle-Width="130px" ItemStyle-Width="130px" />
                                    <telerik:GridBoundColumn DataField="JBCtnrId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Status" Display="false"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
