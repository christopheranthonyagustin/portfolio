<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMSeaConsolRegisterJob.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsolRegister.FMSeaConsolRegisterJob" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMSeaConsolRegisterJob</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .mainMenu {
            text-transform: uppercase;
        }

            .mainMenu .rmRootGroup .rmRootLink {
                padding: 2px 7px;
                line-height: 20px;
                height: 20px;
                border-bottom: solid 1px #b7b7b7;
                border-right: solid 1px #b7b7b7;
            }

                .mainMenu .rmRootGroup .rmRootLink .rmToggle {
                    height: 30px;
                }
    </style>
    <script type="text/javascript">
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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
        function ShowHideBtn_Click() {
            document.getElementById("DescriptionTxt").removeAttribute("disabled");
        }
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="false" />

        <telerik:RadWindowManager runat="server" ID="RadWindowManager"></telerik:RadWindowManager>

        <table width="100%">
            <tr>
                <td>
                    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
                        CausesValidation="false" SelectedIndex="0" Skin="Office2007" Visible="false">
                        <Tabs>
                            <telerik:RadTab Id="ListTab" Text="List" Value="0" runat="server">
                            </telerik:RadTab>
                            <telerik:RadTab Id="FormTab" Text="Form" Value="100" runat="server">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                        <telerik:RadPageView runat="server" Height="5px" Width="100%" ID="HeaderRadPageView">
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="NewJobBtn" runat="server" CssClass="white" Text="New" CausesValidation="false"
                                            OnClick="NewJobBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    </td>
                                    <td>
                                        <asp:Button ID="UnAssignBtn" runat="server" CssClass="white" Text="UnAssign" OnClick="UnAssignBtn_Click"
                                            UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BookWarehouseBtn" runat="server" CssClass="LongLabelWhite" Text="Book Warehouse" OnClick="BookWarehouseBtn_Click"
                                            UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                                    </td>
                                    <td>
                                        <asp:Button ID="BookPackingBtn" runat="server" CssClass="LongLabelWhite" Text="Book Packing" OnClick="BookPackingBtn_Click"
                                            UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                                    </td>
                                    <td>
                                        <telerik:RadMenu ID="DepatureRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true" CssClass="mainMenu"
                                            OnItemClick="DepatureRadMenu_ItemClick" Width="115px" OnClientItemClicked="RadMenuClientOnClick">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" Text="Departure" PostBack="false" BackColor="#b0e0e6"
                                                    Value="Print" CssClass="WrappingItem" Font-Bold="true">
                                                    <Items>
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="BookingConfirmation" Text="Booking Confirmation"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CarrierBookingRequest" Text="Carrier Booking Request"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CargoManifest" Text="Cargo Manifest"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepotReleaseOrder" Text="Depot Release Order"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepartureTruckingAdvice" Text="Trucking Advice"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ShippingOrder" Text="Shipping Order"
                                                            Visible="true" BackColor="White" />
                                                    </Items>
                                                </telerik:RadMenuItem>
                                            </Items>
                                        </telerik:RadMenu>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <telerik:RadMenu ID="ArrivalRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                                            OnItemClick="ArrivalRadMenu_ItemClick" Width="115px" CssClass="mainMenu" OnClientItemClicked="RadMenuClientOnClick">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;&nbsp;Arrival&nbsp;&nbsp;" PostBack="false"
                                                    Value="Print" CssClass="WrappingItem" BackColor="#b0e0e6" Font-Bold="true">
                                                    <Items>
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ArrivalNotice" Text="Arrival Notice"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AuthorisationRelease" Text="Authorisation Release"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AuthorisationReleaseExcel" Text="Authorisation Release(Excel)"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DeliveryOrder" Text="Delivery Order"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepotStoringOrder" Text="Depot Storing Order"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ArrivalTruckingAdvice" Text="Trucking Advice"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="LetterofIndemnity" Text="Letter of Indemnity"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="LetterofIndemnityExcel" Text="Letter of Indemnity(Excel)"
                                                            Visible="true" BackColor="White" />
                                                    </Items>
                                                </telerik:RadMenuItem>
                                            </Items>
                                        </telerik:RadMenu>
                                    </td>
                                    <td>
                                        <telerik:RadMenu ID="DepatureEmailRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true" CssClass="mainMenu"
                                            OnItemClick="DepatureEmailRadMenu_ItemClick" Width="155px" OnClientItemClicked="RadMenuClientOnClick">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" Text="Email_Departure" PostBack="false" BackColor="#88fd64"
                                                    Value="Print" CssClass="WrappingItem" Font-Bold="true">
                                                    <Items>
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="BookingConfirmation" Text="Booking Confirmation"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CarrierBookingRequest" Text="Carrier Booking Request"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CargoManifest" Text="Cargo Manifest"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepotReleaseOrder" Text="Depot Release Order"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepartureTruckingAdvice" Text="Trucking Advice"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ShippingOrder" Text="Shipping Order"
                                                            Visible="true" BackColor="White" />
                                                    </Items>
                                                </telerik:RadMenuItem>
                                            </Items>
                                        </telerik:RadMenu>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <telerik:RadMenu ID="ArrivalEmailRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true" CssClass="mainMenu"
                                            OnItemClick="ArrivalEmailRadMenu_ItemClick" Width="135px" OnClientItemClicked="RadMenuClientOnClick">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" Text="Email_Arrival" PostBack="false" BackColor="#88fd64"
                                                    Value="Print" CssClass="WrappingItem" Font-Bold="true">
                                                    <Items>
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ArrivalNotice" Text="Arrival Notice"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AuthorisationRelease" Text="Authorisation Release"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AuthorisationReleaseExcel" Text="Authorisation Release(Excel)"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DeliveryOrder" Text="Delivery Order"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepotStoringOrder" Text="Depot Storing Order"
                                                            Visible="true" BackColor="White" />
                                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ArrivalTruckingAdvice" Text="Trucking Advice"
                                                            Visible="true" BackColor="White" />
                                                    </Items>
                                                </telerik:RadMenuItem>
                                            </Items>
                                        </telerik:RadMenu>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Button ID="CustomsDeclarationBtn" runat="server" CssClass="LongLabelWhite" Text="Customs Declaration" OnClick="CustomsDeclarationBtn_Click"
                                            UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                                    </td>
                                    <td>
                                        <asp:Button ID="CloseBtn" runat="server" CssClass="white" Text="Close"
                                            OnClick="CloseBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    </td>
                                    <td>
                                        <asp:Button ID="GeodisEDIBtn" runat="server" CssClass="green" Text="Geodis EDI"
                                            OnClick="GeodisEDIBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    </td>
                                    <asp:Label ID="GeodisEDILbl" runat="server"> </asp:Label>
                                </tr>
                            </table>
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                        <ItemStyle Wrap="false"></ItemStyle>
                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                            <Columns>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                    <HeaderTemplate>
                                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="20px">
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="JobEdit"
                                                            ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                                            OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                        &nbsp;
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="CopyBtnButton1"
                                                ImageUrl="../../image/copy.png" Width="15" Height="15" AlternateText="Edit" OnClick="CopyBtn_Click"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;                                            
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="JobNo" UniqueName="Number" SortExpression="Number" HeaderText="Number">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="HouseBill" UniqueName="HouseBill" HeaderText="HouseBill" ShowFilterIcon="true" AllowFiltering="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="TransportModeDescr" UniqueName="TransportModeDescr" ShowFilterIcon="true" AllowFiltering="true" HeaderText="FreightMode">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ContainerModeDescr" UniqueName="CtnrMode" ShowFilterIcon="true" AllowFiltering="true" HeaderText="CtnrMode">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="shippername" UniqueName="shippername" HeaderText="Shipper" ShowFilterIcon="true" AllowFiltering="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ConsigneeName" UniqueName="ConsigneeName" HeaderText="Consignee" ShowFilterIcon="true" AllowFiltering="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="LocalClientName" UniqueName="LocalClientName" HeaderText="LocalClient" ShowFilterIcon="true" AllowFiltering="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="POLDescr" UniqueName="POL" HeaderText="LoadPort" ShowFilterIcon="true" AllowFiltering="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PODDescr" UniqueName="POD" HeaderText="DischargePort" ShowFilterIcon="true" AllowFiltering="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD" HeaderText="ETD" AllowFiltering="false"
                                                    DataFormatString="{0:dd/MMM/yyyy}">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA" HeaderText="ETA" AllowFiltering="false"
                                                    DataFormatString="{0:dd/MMM/yyyy}">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="INCOTerm" UniqueName="INCOTerm" HeaderText="INCOTerms" ShowFilterIcon="true" AllowFiltering="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="WT" UniqueName="WT" SortExpression="WT" ShowFilterIcon="true" AllowFiltering="true"
                                                    HeaderText="Gross Weight">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="VOL" UniqueName="Volume" SortExpression="VOL" ShowFilterIcon="true" AllowFiltering="false"
                                                    HeaderText="VOL">
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
                                                <telerik:GridBoundColumn DataField="status" Display="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="JobNo" Display="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="AcCode" Display="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="FMCSLId" Display="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Type" Display="false"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="TransportMode" UniqueName="TransportMode" Display="false"></telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </ContentTemplate>
                                <Triggers>
                                </Triggers>
                            </asp:UpdatePanel>
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" Height="100%" ID="JobRadPageView">
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="400px" Top="0"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
