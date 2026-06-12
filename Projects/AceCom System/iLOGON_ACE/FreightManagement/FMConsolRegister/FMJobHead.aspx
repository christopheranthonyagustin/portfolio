<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobHead.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsolRegister.FMJobHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Search Results @ Freight Consol Register</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/checkbox.js"></script>
    <script type="text/javascript">
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Job" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td>
                    <telerik:RadMenu ID="DepatureRadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                        OnItemClick="DepatureRadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Blue">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Depature" PostBack="false" Value="Depature">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Value="BookingConfirmation" Text="Booking Confirmation" />
                                    <telerik:RadMenuItem runat="server" Value="CarrierBookingRequest" Text="Carrier Booking Request" />
                                    <telerik:RadMenuItem runat="server" Value="CargoManifest" Text="Cargo Manifest" />
                                    <telerik:RadMenuItem runat="server" Value="DepotReleaseOrder" Text="Depot Release Order" />
                                    <telerik:RadMenuItem runat="server" Value="DepartureTruckingAdvice" Text="Trucking Advice" />

                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td>
                    <telerik:RadMenu ID="ArrivalRadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                        OnItemClick="ArrivalRadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Blue">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Arrival" PostBack="false" Value="Arrival">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Value="BookingConfirmation" Text="Booking Confirmation" />
                                    <telerik:RadMenuItem runat="server" Value="CarrierBookingRequest" Text="Carrier Booking Request" />
                                    <telerik:RadMenuItem runat="server" Value="CargoManifest" Text="Cargo Manifest" />
                                    <telerik:RadMenuItem runat="server" Value="DepotReleaseOrder" Text="Depot Release Order" />
                                    <telerik:RadMenuItem runat="server" Value="DepartureTruckingAdvice" Text="Trucking Advice" />

                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td>
                    <telerik:RadMenu ID="DepatureEmailRadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                        OnItemClick="DepatureEmailRadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Green">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Email<br>Departure" PostBack="false" Value="Email_Departure">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Value="BookingConfirmation" Text=" Booking Confirmation" />
                                    <telerik:RadMenuItem runat="server" Value="CarrierBookingRequest" Text="Carrier Booking Request" />
                                    <telerik:RadMenuItem runat="server" Value="CargoManifest" Text=" Cargo Manifest" />
                                    <telerik:RadMenuItem runat="server" Value="DepotReleaseOrder" Text=" Depot Release Order" />
                                    <telerik:RadMenuItem runat="server" Value="DepartureTruckingAdvice" Text="  Trucking Advice" />


                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td>
                    <telerik:RadMenu ID="ArrivalEmailRadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                        OnItemClick="ArrivalEmailRadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Green">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Email<br>Arrival" PostBack="false" Value="Email_Arrival">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Value="BookingConfirmation" Text=" Booking Confirmation" />
                                    <telerik:RadMenuItem runat="server" Value="CarrierBookingRequest" Text="Carrier Booking Request" />
                                    <telerik:RadMenuItem runat="server" Value="CargoManifest" Text=" Cargo Manifest" />
                                    <telerik:RadMenuItem runat="server" Value="DepotReleaseOrder" Text=" Depot Release Order" />
                                    <telerik:RadMenuItem runat="server" Value="DepartureTruckingAdvice" Text="  Trucking Advice" />


                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td>
                    <asp:Button ID="CloseBtn" runat="server" CssClass="white" Text="Close"
                        OnClick="CloseBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ReopenBtn" runat="server" CssClass="white" Text="Reopen"
                        OnClick="ReopenBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Label ID="RowCountLbl" Font-Bold="true" Font-Size="Medium" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" PagerStyle-AlwaysVisible="true"
                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon">
                                            <HeaderTemplate>
                                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon">
                                            <ItemStyle Wrap="False"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="Blanklbl"
                                                    ImageUrl="../../image/blank.gif" Width="15" Height="15"
                                                    BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="ConsolldEdit"
                                                    ImageUrl="../../image/Circled_C_Orange.png" Width="15" Height="15" AlternateText="Edit"
                                                    OnClick="ConsolldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                &nbsp;
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="JobldEdit"
                                                ImageUrl="../../image/Circled_J_Blue.png" Width="15" Height="15" AlternateText="Edit" OnClick="JobldEdit_Click"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;

                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="CopyBtnButton1"
                                                ImageUrl="../../image/copy.png" Width="15" Height="15" AlternateText="Edit" OnClick="CopyBtn_Click"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="ConsolNo" UniqueName="ConsolNo" SortExpression="ConsolNo"
                                            HeaderText="Consol">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TransportModeDescr" UniqueName="TransportModeDescr" HeaderText="Mode">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo"
                                            HeaderText="Job">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ContainerModeDescr" UniqueName="CtnrMode" SortExpression="CtnrMode" HeaderText="ContainerMode">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ShipperRef" UniqueName="ShipperRef" HeaderText="ShipperRef">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Milestone" UniqueName="Milestone" HeaderText="Milestones"
                                            ItemStyle-Wrap="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Type" UniqueName="Type" HeaderText="Type">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PermitNo" UniqueName="PermitNo" HeaderText="PermitNumber">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FMTransshipmentNumber" UniqueName="FMTransshipmentNumber" HeaderText="Transshipment No">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="shippername" UniqueName="shippername" HeaderText="ShipperName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ConsigneeName" UniqueName="ConsigneeName" HeaderText="ConsigneeName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="LocalClientName" UniqueName="LocalClientName" HeaderText="LocalClientName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="POL" UniqueName="POL" SortExpression="POL"
                                            HeaderText="LoadPort">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD"
                                            HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="POD" UniqueName="POD" SortExpression="POD"
                                            HeaderText="DischargePort">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA"
                                            HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="BranchCode" UniqueName="BranchCode" SortExpression="BranchCode"
                                            HeaderText="BranchCode">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DepartmentCode" UniqueName="DepartmentCode" SortExpression="DepartmentCode"
                                            HeaderText="Department/ProductCode">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Inspectionby" UniqueName="Inspectionby" SortExpression="Inspectionby"
                                            HeaderText="Inspectionby">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Screeningby" UniqueName="Screeningby" SortExpression="Screeningby"
                                            HeaderText="Screeningby">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr"
                                            HeaderText="Status">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="Last Transaction" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("LastTransDate")) %>
                                                <%# DataBinder.Eval(Container.DataItem, "LastTransUser")%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("EditDate")) %>
                                                <%# DataBinder.Eval(Container.DataItem, "EditUser")%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="fmcslid" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ConsolNo" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AcCode" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AcId" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EntId" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TransportMode" UniqueName="TransportMode" Display="false"></telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
