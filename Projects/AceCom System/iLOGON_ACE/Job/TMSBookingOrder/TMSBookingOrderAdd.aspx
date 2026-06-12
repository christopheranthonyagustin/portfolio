<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderAdd.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderAdd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add @ TMS Booking Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="False" RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7"
            AutoPostBack="True">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="BillingInstruction" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="AddBtn" runat="server" Text="Add" class="white" OnClick="AddBtn_Click"
                                OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td style="position: relative;">
                                                <iWMS:iForm ID="formCtl_JBHead" runat="server" />
                                                <iWMS:iForm ID="formCtl_JBCtnr" runat="server" />
                                                <iWMS:iForm ID="formCtl_JBCtnrTrip" runat="server" />
                                                <iWMS:iForm ID="formCtl_JBCtnrItem" runat="server" />
                                            </td>
                                            <td style="position: absolute;">
                                                <iWMS:iForm ID="formCtl_Branch" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel runat="server" ID="ContruckingGridPanel" Visible="false">
                            <asp:Panel ID="BillSizeTypePnl" runat="server">
                                <table>
                                    <tr>
                                        <td>&nbsp;
                                        <asp:Button ID="AddContainerBtn" runat="server" Text="Add Container" CssClass="LongLabelWhite" OnClick="AddContainerBtn_Click"
                                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="false" />
                                            <br />
                                            <br />
                                            <telerik:RadGrid ID="ResultDG_20BillSizeType" runat="server" AutoGenerateColumns="true" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="false" Skin="Metro" EnableViewState="false" UseAccessibleHeader="True"
                                                OnNeedDataSource="ResultDG_20BillSizeType_NeedDataSource" OnItemDataBound="ResultDG_20BillSizeType_ItemDataBound" Width="80%">
                                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true"></ItemStyle>
                                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                    <Columns>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadGrid ID="ResultDG_40BillSizeType" runat="server" AutoGenerateColumns="true" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="false" Skin="Metro" EnableViewState="false" UseAccessibleHeader="True"
                                                OnNeedDataSource="ResultDG_40BillSizeType_NeedDataSource" OnItemDataBound="ResultDG_40BillSizeType_ItemDataBound" Width="80%">
                                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true"></ItemStyle>
                                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                    <Columns>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <br />
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="CtnrGridUpdatePanel" runat="server">
                                            <ContentTemplate>
                                                <telerik:RadGrid ID="ResultDG_Ctnr" runat="server" AutoGenerateColumns="false" GridLines="None" Visible="false"
                                                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnItemDataBound="ResultDG_Ctnr_ItemDataBound"
                                                    AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_Ctnr_NeedDataSource" Width="50%">
                                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                        <Selecting AllowRowSelect="true" />
                                                    </ClientSettings>
                                                    <SortingSettings EnableSkinSortStyles="false" />
                                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                    <ItemStyle Wrap="true"></ItemStyle>
                                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="CtnrNoGrid">
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
                                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    S/N
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#Container.ItemIndex+1%>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="BillSizeType" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# BillSizeTypeDS%>' Width="100px" DropDownWidth="100px"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "BillSizeType").ToString())%>'>
                                                                    </telerik:RadDropDownList>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="ContainerNo" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    ContainerNo
                                                                <br />
                                                                    <asp:LinkButton ID="SameCtnrLnkBtn" OnClick="Control_Fill" runat="server" Text="SameContainer" ForeColor="Blue" CausesValidation="false"></asp:LinkButton>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="ContainerNoTxt" runat="server" Width="140px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo") %>'
                                                                        Style="text-transform: uppercase"
                                                                        ClientEvents-OnValueChanging='ConvertToUpperCaseOnValueChanging'
                                                                        ClientEvents-OnValueChanged='<%# "function (s,a){CheckCtnrNoDigit(s,a," + Container.ItemIndex + ");}" %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="CrossDock<br/>Container" HeaderStyle-HorizontalAlign="Center" UniqueName="CrossDockContainer">
                                                                <ItemTemplate>
                                                                    <telerik:RadDropDownList ID="CrossDockCtnrDDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                                        DataValueField="Item" DataTextField="Descr" DataSource='<%# CrossDockCtnrDS%>' Width="140px" DropDownWidth="140px"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CrossDockCtnrDS,DataBinder.Eval(Container.DataItem, "CrossDockContainer").ToString())%>'>
                                                                    </telerik:RadDropDownList>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="SealNo<br/>VGM(KG)" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="SealNoTxt" runat="server" Width="100" Skin="WebBlue"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "SealNo") %>'>
                                                                    </telerik:RadTextBox>
                                                                    <telerik:RadTextBox ID="VGMTxt" runat="server" Width="100" Skin="WebBlue" CausesValidation="true"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "VGM") %>'>
                                                                    </telerik:RadTextBox>
                                                                    <asp:CompareValidator ID="VGMCompVal" runat="server" ControlToValidate="VGMTxt" EnableClientScript="true" ErrorMessage="Only numbers allowed" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="RequiredDate <br/> RequiredTime" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadDateTimePicker ID="RequiredDateDP" runat="server" Width="140px" Skin="Office2007" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "RequiredDate") %>'
                                                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm">
                                                                    </telerik:RadDateTimePicker>
                                                                    <br />
                                                                    <telerik:RadTextBox runat="server" ID="RequiredTimeTxt" TextMode="SingleLine" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "EqpRemarks") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Depot" HeaderStyle-HorizontalAlign="Center" UniqueName="Depot"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    Depot
                                                                <br />
                                                                    DepotAddress
                                                                <br />
                                                                    <asp:LinkButton ID="SameDepotLnkBtn" OnClick="Control_Fill" runat="server" Text="SameDepot" ForeColor="Blue" CausesValidation="false"></asp:LinkButton>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="DepotCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled" RenderMode="Lightweight" ShowMoreResultsBox="true"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "Depot").ToString())%>'
                                                                        OnClientSelectedIndexChanged="DepotCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="DepotAddrTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "DepotAddr") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Warehouse" HeaderStyle-HorizontalAlign="Center" UniqueName="Warehouse"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    Warehouse
                                                                <br />
                                                                    WarehouseAddress
                                                                <br />
                                                                    <asp:LinkButton ID="SameWarehouseLnkBtn" OnClick="Control_Fill" runat="server" Text="SameWarehouse" ForeColor="Blue" CausesValidation="false">
                                                                    </asp:LinkButton>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="WarehouseCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled" RenderMode="Lightweight" ShowMoreResultsBox="true"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "Warehouse").ToString())%>'
                                                                        OnClientSelectedIndexChanged="WarehouseCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="WarehouseAddrTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "WarehouseAddr") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Pick-Up" HeaderStyle-HorizontalAlign="Center" UniqueName="PickUp"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    Pick-Up
                                                                <br />
                                                                    Pick-Up Address
                                                                <br />
                                                                    <asp:LinkButton ID="SamePickUpLnkBtn" OnClick="Control_Fill" runat="server" Text="SamePick-Up" ForeColor="Blue" CausesValidation="false"></asp:LinkButton>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="PickUpCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled" RenderMode="Lightweight" ShowMoreResultsBox="true"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "PickUp").ToString())%>'
                                                                        OnClientSelectedIndexChanged="PickUpCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="PickUpAddrTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "PickUpAddr") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Drop-Off" HeaderStyle-HorizontalAlign="Center" UniqueName="DropOff"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    Drop-Off
                                                                <br />
                                                                    Drop-Off Address
                                                                <br />
                                                                    <asp:LinkButton ID="SameDropOffLnkBtn" OnClick="Control_Fill" runat="server" Text="SameDrop-Off" ForeColor="Blue" CausesValidation="false">
                                                                    </asp:LinkButton>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="DropOffCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled" RenderMode="Lightweight" ShowMoreResultsBox="true"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "DropOff").ToString())%>'
                                                                        OnClientSelectedIndexChanged="DropOffCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="DropOffAddrTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "DropOffAddr") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="PermitNo <br/>Temperature" HeaderStyle-HorizontalAlign="Center" UniqueName="PermitNo"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="PermitNoTxt" runat="server" Width="140px" Skin="WebBlue"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "PermitNo") %>'>
                                                                    </telerik:RadTextBox>
                                                                    <telerik:RadTextBox ID="TemperatureTxt" runat="server" Width="140px" Skin="WebBlue"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "Temperature") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="BookingRef" HeaderStyle-HorizontalAlign="Center" UniqueName="BookingRef"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    BookingRef
                                                                <br />
                                                                    <asp:LinkButton ID="SameBkRefLnkBtn" OnClick="Control_Fill" runat="server" Text="SameBookingRef" ForeColor="Blue" CausesValidation="false">
                                                                    </asp:LinkButton>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="BookingRefTxt" runat="server" Width="140px" Skin="WebBlue"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "BookingRef") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Portnet/PickUp Ref" HeaderStyle-HorizontalAlign="Center" UniqueName="PortnetNo"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    Portnet/PickUp Ref
                                                                <br />
                                                                    <asp:LinkButton ID="SamePortnetNoLnkBtn" OnClick="Control_Fill" runat="server" Text="SamePortnet/PickUp Ref" ForeColor="Blue" CausesValidation="false">
                                                                    </asp:LinkButton>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="PortnetNoTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "PortnetNo") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="ContainerDescription" HeaderStyle-HorizontalAlign="Center" UniqueName="ContainerDescr"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="ContainerDescrTxt" runat="server" Width="140px" Skin="WebBlue"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "ContainerDescr") %>' TextMode="MultiLine" Rows="3">
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="BillOption1 <br/> BillOption2" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadDropDownList ID="BillOption1DDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# BillOption1DS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption1DS,DataBinder.Eval(Container.DataItem, "BillOption1").ToString())%>'>
                                                                    </telerik:RadDropDownList>
                                                                    <br />
                                                                    <telerik:RadDropDownList ID="BillOption2DDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# BillOption2DS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption2DS,DataBinder.Eval(Container.DataItem, "BillOption2").ToString())%>'>
                                                                    </telerik:RadDropDownList>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="ElectricityExpiry <br/> DemurrageExpiry <br/> SFAInspection" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false" UniqueName="ElectricityDemurrageExpirySFAInspection">
                                                                <ItemTemplate>
                                                                    <telerik:RadDateTimePicker ID="ElectricityExpiryDP" runat="server" Width="170px" Skin="WebBlue" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "ElectricityExpiryDate") %>'
                                                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm">
                                                                    </telerik:RadDateTimePicker>
                                                                    <br />
                                                                    <telerik:RadDateTimePicker ID="DemurrageExpiryDP" runat="server" Width="170px" Skin="WebBlue" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "DemurrageExpiryDate") %>'
                                                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm">
                                                                    </telerik:RadDateTimePicker>
                                                                    <br />
                                                                    <telerik:RadDropDownList ID="SFAInspectionDDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# SFAInspectionDS%>' Width="170px" DropDownAutoWidth="Enabled"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SFAInspectionDS,DataBinder.Eval(Container.DataItem, "SFAInspection").ToString())%>'>
                                                                    </telerik:RadDropDownList>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="SKU <br/> Quantity <br/> Size" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false" UniqueName="SkuQuantitySize">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="SKUTxt" runat="server" Width="140px" Skin="WebBlue"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "EqpGoodsDescr") %>'>
                                                                    </telerik:RadTextBox>
                                                                    <telerik:RadTextBox ID="QuantityTxt" runat="server" Width="140px" Skin="WebBlue"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "CargoPackingType") %>'>
                                                                    </telerik:RadTextBox>
                                                                    <telerik:RadTextBox ID="SizeTxt" runat="server" Width="140px" Skin="WebBlue"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "ctnrsize") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="AddCtnr" ValidationGroup="NA"
                                                                        ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Edit"
                                                                        OnClick="AddCtnr_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                                                ItemStyle-Width="10px">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" Visible="True" ID="Delete" ImageUrl="../../image/deleted.png" ValidationGroup="NA"
                                                                        Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteCtnr_Click"
                                                                        BorderWidth="0"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="hidden" runat="server" id="HdnConfirm" clientidmode="Static" value="n" />
                                        <br />
                                        &nbsp;
                                    <asp:Button ID="AddBtn2" runat="server" Text="Add" class="white" OnClick="AddBtn_Click" ClientIDMode="Static"
                                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" Visible="false" />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel runat="server" ID="MobileCranePanel" Visible="false">
                            <table>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="MobileCraneUpdatePanel" runat="server">
                                            <ContentTemplate>
                                                <telerik:RadGrid ID="MCResultDG_Ctnr" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                    AllowPaging="false" Skin="Metro" OnNeedDataSource="MCResultDG_Ctnr_NeedDataSource" Width="50%">
                                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                        <Selecting AllowRowSelect="true" />
                                                    </ClientSettings>
                                                    <SortingSettings EnableSkinSortStyles="false" />
                                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                    <ItemStyle Wrap="true"></ItemStyle>
                                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="CtnrNoGrid">
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
                                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    S/N
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#Container.ItemIndex+1%>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="ShipmentType <br/> JobType" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <telerik:RadDropDownList ID="ShipmentTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue" OnSelectedIndexChanged="ShipmentTypeDDL_SelectedIndexChanged"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# MCShipmentTypeDS%>' Width="100px" DropDownWidth="100px" AutoPostBack="true" CausesValidation="false"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(MCShipmentTypeDS,DataBinder.Eval(Container.DataItem, "ShipmentType").ToString())%>'>
                                                                    </telerik:RadDropDownList>
                                                                    <br />
                                                                    <telerik:RadDropDownList ID="JobTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false"
                                                                        DataValueField="item" DataTextField="descr" Width="100px" DropDownWidth="100px" OnLoad="JobTypeDDL_Load">
                                                                    </telerik:RadDropDownList>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="TransportType <br/> BillSizeType" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <telerik:RadDropDownList ID="TransportTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false"
                                                                        DataValueField="item" DataTextField="descr" Width="100px" DropDownWidth="100px" OnLoad="TransportTypeDDL_Load">
                                                                    </telerik:RadDropDownList>
                                                                    <br />
                                                                    <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false"
                                                                        DataValueField="item" DataTextField="descr" Width="100px" DropDownWidth="100px" OnLoad="BillSizeTypeDDL_Load">
                                                                    </telerik:RadDropDownList>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="StartDate <br/> EndDate" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadDateTimePicker ID="StartDateDP" runat="server" Width="170px" Skin="Office2007" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "StartDate") %>'
                                                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm">
                                                                    </telerik:RadDateTimePicker>
                                                                    <br />
                                                                    <telerik:RadDateTimePicker ID="EndDateDP" runat="server" Width="170px" Skin="Office2007" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "EndDate") %>'
                                                                        DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm">
                                                                    </telerik:RadDateTimePicker>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Pick-Up" HeaderStyle-HorizontalAlign="Center" UniqueName="PickUp"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    Pick-Up
                                                                <br />
                                                                    Pick-Up Address
                                                                <br />
                                                                    <asp:LinkButton ID="SamePickUpLnkBtn" OnClick="Control_Fill" runat="server" Text="SamePick-Up" ForeColor="Blue" CausesValidation="false"></asp:LinkButton>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="PickUpCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# MCServicePtDS%>' Width="170px" DropDownAutoWidth="Enabled" RenderMode="Lightweight" ShowMoreResultsBox="true"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(MCServicePtDS,DataBinder.Eval(Container.DataItem, "PickUp").ToString())%>'
                                                                        OnClientSelectedIndexChanged="PickUpCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="PickUpAddrTxt" runat="server" Width="170px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "PickUpAddr") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Drop-Off" HeaderStyle-HorizontalAlign="Center" UniqueName="DropOff"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <HeaderTemplate>
                                                                    Drop-Off
                                                                <br />
                                                                    Drop-Off Address
                                                                <br />
                                                                    <asp:LinkButton ID="SameDropOffLnkBtn" OnClick="Control_Fill" runat="server" Text="SameDrop-Off" ForeColor="Blue" CausesValidation="false">
                                                                    </asp:LinkButton>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="DropOffCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="item" DataTextField="descr" DataSource='<%# MCServicePtDS%>' Width="170px" DropDownAutoWidth="Enabled" RenderMode="Lightweight" ShowMoreResultsBox="true"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(MCServicePtDS,DataBinder.Eval(Container.DataItem, "DropOff").ToString())%>'
                                                                        OnClientSelectedIndexChanged="DropOffCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="DropOffAddrTxt" runat="server" Width="170px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "DropOffAddr") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="AddMCCtnr" CausesValidation="false"
                                                                        ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Edit"
                                                                        OnClick="AddMCCtnr_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                                                ItemStyle-Width="10px">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" Visible="True" ID="DeleteMCCtnr" ImageUrl="../../image/deleted.png" CausesValidation="false"
                                                                        Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteMCCtnr_Click"
                                                                        BorderWidth="0"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <asp:UpdatePanel runat="server" ID="MCAddBtnPanel">
                                            <ContentTemplate>
                                                &nbsp;
                                                <asp:Button ID="AddBtn3" runat="server" Text="Add" class="white" OnClick="AddBtn_Click" ClientIDMode="Static"
                                                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                                <br />
                                                <br />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="AddBtn3" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="AddBtn2" />
                    </Triggers>
                </asp:UpdatePanel>

                <asp:Panel runat="server" ID="EqpRentalPanel" Visible="false">
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="EqpRentalUpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <telerik:RadGrid ID="EqpRentalResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                            AllowPaging="false" Skin="Metro" OnNeedDataSource="EqpRentalResultDG_NeedDataSource" Width="50%">
                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                <Selecting AllowRowSelect="true" />
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                            <ItemStyle Wrap="true"></ItemStyle>
                                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
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
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                        <HeaderTemplate>
                                                            S/N
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%#Container.ItemIndex+1%>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="EquipmentNo" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="EquipmentNoCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains" OnClientDropDownClosed="EquipmentNo_ClientDropDownClosed"
                                                                DataValueField="Item" DataTextField="Descr" DataSource='<%# EqpRentalEquipmentNoDS%>' Width="140px" DropDownAutoWidth="Enabled" RenderMode="Lightweight" EnableVirtualScrolling="true" ShowMoreResultsBox="true"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(EqpRentalEquipmentNoDS,DataBinder.Eval(Container.DataItem, "EquipmentNo").ToString())%>'>
                                                            </telerik:RadComboBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Operator" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="OperatorCombo" runat="server" Skin="WebBlue" CausesValidation="false" Text='<%# DataBinder.Eval(Container.DataItem, "Operator") %>'
                                                                DataValueField="Item" DataTextField="Descr" Width="140px" ItemsPerRequest="20" DropDownAutoWidth="Enabled" Filter="Contains" AllowCustomText="false" RenderMode="Lightweight" EnableVirtualScrolling="true" ShowMoreResultsBox="true"
                                                                DataSource='<%# EqpRentalOperatorDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(EqpRentalOperatorDS,DataBinder.Eval(Container.DataItem, "Operator").ToString())%>'>
                                                            </telerik:RadComboBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="AddOnService" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="AddOnServiceCombo" runat="server" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" Width="140px" Skin="WebBlue" DataValueField="Item" DataTextField="Descr"
                                                                DropDownAutoWidth="Enabled" RenderMode="Lightweight" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Filter="Contains" AllowCustomText="false"
                                                                DataSource='<%# EqpRentalAddOnServiceDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(EqpRentalAddOnServiceDS,DataBinder.Eval(Container.DataItem, "AddOnService").ToString())%>'>
                                                            </telerik:RadComboBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Panel runat="server" ID="PackingPanel" Visible="false">
                    <table>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="JBCtnrItemUpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <telerik:RadGrid ID="JBCtnrItemResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                            AllowPaging="false" Skin="Metro" OnNeedDataSource="JBCtnrItemResultDG_NeedDataSource" Width="50%">
                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                <Selecting AllowRowSelect="true" />
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                            <ItemStyle Wrap="true"></ItemStyle>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
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
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                        <HeaderTemplate>
                                                            S/N
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%#Container.ItemIndex+1%>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="DimensionType">
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="DimensionTypeCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                DataValueField="Item" DataTextField="Descr" DataSource='<%# PackingDimensionDS%>' Width="140px" DropDownAutoWidth="Enabled" RenderMode="Lightweight" ShowMoreResultsBox="true"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PackingDimensionDS,DataBinder.Eval(Container.DataItem, "DimensionType").ToString())%>'>
                                                            </telerik:RadComboBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Weight" UniqueName="Weight">
                                                        <ItemTemplate>
                                                            <br />
                                                            <telerik:RadTextBox ID="WeightTxt" runat="server" Skin="WebBlue" TextMode="SingleLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "Weight") %>'>
                                                            </telerik:RadTextBox>
                                                            <asp:CompareValidator runat="server" ControlToValidate="WeightTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Length" UniqueName="Length">
                                                        <ItemTemplate>
                                                            <br />
                                                            <telerik:RadTextBox ID="LengthTxt" runat="server" Skin="WebBlue" TextMode="SingleLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "Length") %>'>
                                                            </telerik:RadTextBox>
                                                            <asp:CompareValidator runat="server" ControlToValidate="LengthTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Width" UniqueName="Width">
                                                        <ItemTemplate>
                                                            <br />
                                                            <telerik:RadTextBox ID="WidthTxt" runat="server" Skin="WebBlue" TextMode="SingleLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "Width") %>'>
                                                            </telerik:RadTextBox>
                                                            <asp:CompareValidator runat="server" ControlToValidate="WidthTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Height" UniqueName="Height">
                                                        <ItemTemplate>
                                                            <br />
                                                            <telerik:RadTextBox ID="HeightTxt" runat="server" Skin="WebBlue" TextMode="SingleLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "Height") %>'>
                                                            </telerik:RadTextBox>
                                                            <asp:CompareValidator runat="server" ControlToValidate="HeightTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="AddJBCtnrItemIcon">
                                                        <ItemTemplate>
                                                            <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="AddJBCtnrItem" CausesValidation="false"
                                                                ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="AddJBCtnrItem"
                                                                OnClick="AddJBCtnrItem_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="DeleteJBCtnrItemIcon">
                                                        <ItemTemplate>
                                                            <asp:ImageButton runat="server" ID="DeleteJBCtnrItem" ImageUrl="../../image/deleted.png" CausesValidation="false"
                                                                Width="15" Height="15" AlternateText="DeleteJBCtnrItem" BackColor="Transparent" OnClick="DeleteJBCtnrItem_Click"
                                                                BorderWidth="0"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="PackingUpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <telerik:RadGrid ID="PackingResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                            AllowPaging="false" Skin="Metro" OnNeedDataSource="PackingResultDG_NeedDataSource" Width="50%">
                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                <Selecting AllowRowSelect="true" />
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                            <ItemStyle Wrap="true"></ItemStyle>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
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
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                        <HeaderTemplate>
                                                            S/N
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%#Container.ItemIndex+1%>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="ShipmentType <br/> JobType">
                                                        <ItemTemplate>
                                                            <telerik:RadDropDownList ID="ShipmentTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue" OnSelectedIndexChanged="PackingShipmentTypeDDL_SelectedIndexChanged"
                                                                DataValueField="item" DataTextField="descr" DataSource='<%# PackingShipmentTypeDS%>' Width="100px" DropDownWidth="100px" AutoPostBack="true" CausesValidation="false"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PackingShipmentTypeDS,DataBinder.Eval(Container.DataItem, "ShipmentType").ToString())%>'>
                                                            </telerik:RadDropDownList>
                                                            <br />
                                                            <telerik:RadDropDownList ID="JobTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false"
                                                                DataValueField="item" DataTextField="descr" Width="100px" DropDownWidth="100px" OnLoad="PackingJobTypeDDL_Load">
                                                            </telerik:RadDropDownList>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="TransportType <br/> BillSizeType">
                                                        <ItemTemplate>
                                                            <telerik:RadDropDownList ID="TransportTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false"
                                                                DataValueField="item" DataTextField="descr" Width="100px" DropDownWidth="100px" OnLoad="PackingTransportTypeDDL_Load">
                                                            </telerik:RadDropDownList>
                                                            <br />
                                                            <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false"
                                                                DataValueField="item" DataTextField="descr" Width="100px" DropDownWidth="100px" OnLoad="PackingBillSizeTypeDDL_Load">
                                                            </telerik:RadDropDownList>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="StartDate <br/> EndDate" UniqueName="StartEndDate">
                                                        <ItemTemplate>
                                                            <telerik:RadDateTimePicker ID="StartDateDP" runat="server" Width="170px" Skin="Office2007" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "StartDate") %>'
                                                                DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm">
                                                            </telerik:RadDateTimePicker>
                                                            <br />
                                                            <telerik:RadDateTimePicker ID="EndDateDP" runat="server" Width="170px" Skin="Office2007" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "EndDate") %>'
                                                                DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm">
                                                            </telerik:RadDateTimePicker>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Pick-Up" UniqueName="PickUp">
                                                        <HeaderTemplate>
                                                            Pick-Up
                                                                <br />
                                                            Pick-Up Address
                                                                <br />
                                                            <asp:LinkButton ID="SamePickUpLnkBtn" OnClick="Control_Fill" runat="server" Text="SamePick-Up" ForeColor="Blue" CausesValidation="false"></asp:LinkButton>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="PickUpCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                DataValueField="item" DataTextField="descr" DataSource='<%# PackingServicePtDS%>' Width="170px" DropDownAutoWidth="Enabled" RenderMode="Lightweight" ShowMoreResultsBox="true"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PackingServicePtDS,DataBinder.Eval(Container.DataItem, "PickUp").ToString())%>'
                                                                OnClientSelectedIndexChanged="PickUpCombo_SelectedIndexChanged">
                                                            </telerik:RadComboBox>
                                                            <br />
                                                            <telerik:RadTextBox ID="PickUpAddrTxt" runat="server" Width="170px" Skin="WebBlue" TextMode="MultiLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "PickUpAddr") %>'>
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Drop-Off" UniqueName="DropOff">
                                                        <HeaderTemplate>
                                                            Drop-Off
                                                                <br />
                                                            Drop-Off Address
                                                                <br />
                                                            <asp:LinkButton ID="SameDropOffLnkBtn" OnClick="Control_Fill" runat="server" Text="SameDrop-Off" ForeColor="Blue" CausesValidation="false">
                                                            </asp:LinkButton>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="DropOffCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains" RenderMode="Lightweight" ShowMoreResultsBox="true"
                                                                DataValueField="item" DataTextField="descr" DataSource='<%# PackingServicePtDS%>' Width="170px" DropDownAutoWidth="Enabled"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PackingServicePtDS,DataBinder.Eval(Container.DataItem, "DropOff").ToString())%>'
                                                                OnClientSelectedIndexChanged="DropOffCombo_SelectedIndexChanged">
                                                            </telerik:RadComboBox>
                                                            <br />
                                                            <telerik:RadTextBox ID="DropOffAddrTxt" runat="server" Width="170px" Skin="WebBlue" TextMode="MultiLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "DropOffAddr") %>'>
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="AddPackingImgIcon" AllowFiltering="false">
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="AddPackingImgBtn" CausesValidation="false"
                                                                ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Edit"
                                                                OnClick="AddPackingImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="DeletePackingImgIcon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                                        ItemStyle-Width="10px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton runat="server" Visible="True" ID="DeletePackingImgBtn" ImageUrl="../../image/deleted.png" CausesValidation="false"
                                                                Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeletePackingImgBtn_Click"
                                                                BorderWidth="0"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Panel runat="server" ID="ManPowerPanel" Visible="false">
                    <table>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="ManPowerPanelUpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <telerik:RadGrid ID="ManPowerResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                            AllowPaging="false" Skin="Metro" OnNeedDataSource="ManPowerResultDG_NeedDataSource" Width="50%">
                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                <Selecting AllowRowSelect="true" />
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                            <ItemStyle Wrap="true"></ItemStyle>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
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
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                        <HeaderTemplate>
                                                            S/N
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%#Container.ItemIndex+1%>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="FromDate" HeaderText="FromDate">
                                                        <ItemTemplate>
                                                            <telerik:RadDateTimePicker ID="FromDatePicker" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "FromDate") %>'
                                                                DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007">
                                                                <Calendar runat="server">
                                                                    <SpecialDays>
                                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#66ccff" />
                                                                    </SpecialDays>
                                                                </Calendar>
                                                            </telerik:RadDateTimePicker>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="ToDate" HeaderText="ToDate">
                                                        <ItemTemplate>
                                                            <telerik:RadDateTimePicker ID="ToDatePicker" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "ToDate") %>'
                                                                DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007">
                                                                <Calendar runat="server">
                                                                    <SpecialDays>
                                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#66ccff" />
                                                                    </SpecialDays>
                                                                </Calendar>
                                                            </telerik:RadDateTimePicker>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Activity">
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="ActivityCombo" runat="server" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" Width="140px" Skin="WebBlue" DataValueField="Item" DataTextField="Descr"
                                                                DropDownAutoWidth="Enabled" RenderMode="Lightweight" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Filter="Contains" AllowCustomText="false"
                                                                DataSource='<%# ManPowerActivityDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ManPowerActivityDS,DataBinder.Eval(Container.DataItem, "Activity").ToString())%>'>
                                                            </telerik:RadComboBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="ActivityDesription" UniqueName="ActivityDesription">
                                                        <ItemTemplate>
                                                            <telerik:RadTextBox ID="ActivityDesriptionTxt" runat="server" Skin="WebBlue" TextMode="MultiLine" Rows="3"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "ActivityDesription") %>'>
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Remarks" UniqueName="Remarks">
                                                        <ItemTemplate>
                                                            <telerik:RadTextBox ID="RemarksTxt" runat="server" Skin="WebBlue" TextMode="MultiLine" Rows="3"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "Remarks") %>'>
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="ContactPerson" UniqueName="ContactPerson">
                                                        <ItemTemplate>
                                                            <telerik:RadTextBox ID="ContactPersonTxt" runat="server" Skin="WebBlue" TextMode="SingleLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "ContactPerson") %>'>
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="ContactNo" UniqueName="ContactNo">
                                                        <ItemTemplate>
                                                            <telerik:RadTextBox ID="ContactNoTxt" runat="server" Skin="WebBlue" TextMode="SingleLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "ContactNo") %>'>
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Address" UniqueName="Address">
                                                        <ItemTemplate>
                                                            <telerik:RadTextBox ID="AddressTxt" runat="server" Skin="WebBlue" TextMode="SingleLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "Address") %>'>
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="BillingInstructionRadPageView">
                <iWMS:iForm ID="formCtl_BillingInstruction" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
        </telerik:RadMultiPage>

        <%--Start Region : Selected Index Change for ContainerTrucking and MobileCrane--%>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                function PickUpCombo_SelectedIndexChanged(sender, eventArgs) {
                    var PickUpCombo = eventArgs.get_item();
                    var PickUpAddrTxt = $get(sender.get_id().replace("PickUpCombo", "PickUpAddrTxt"));
                    PickUpAddrTxt.value = PickUpCombo.get_value().split("|")[1];
                }

                function DropOffCombo_SelectedIndexChanged(sender, eventArgs) {
                    var DropOffCombo = eventArgs.get_item();
                    var DropOffAddrTxt = $get(sender.get_id().replace("DropOffCombo", "DropOffAddrTxt"));
                    DropOffAddrTxt.value = DropOffCombo.get_value().split("|")[1];
                }

                function DepotCombo_SelectedIndexChanged(sender, eventArgs) {
                    var DepotCombo = eventArgs.get_item();
                    var DepotAddrTxt = $get(sender.get_id().replace("DepotCombo", "DepotAddrTxt"));
                    DepotAddrTxt.value = DepotCombo.get_value().split("|")[1];
                }

                function WarehouseCombo_SelectedIndexChanged(sender, eventArgs) {
                    var WarehouseCombo = eventArgs.get_item();
                    var WarehouseAddrTxt = $get(sender.get_id().replace("WarehouseCombo", "WarehouseAddrTxt"));
                    WarehouseAddrTxt.value = WarehouseCombo.get_value().split("|")[1];
                }

                function EquipmentNo_ClientDropDownClosed(sender, eventArgs) {
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var EquipmentNo = $telerik.findControl(CurrentRow, "EquipmentNoCombo").get_value();

                    if (EquipmentNo != null && EquipmentNo != "") {
                        var EquipmentNoOperatorPair = EquipmentNo.split("|");
                        var DefaultOperatorName = EquipmentNoOperatorPair[2];

                        if ($telerik.findControl(CurrentRow, "OperatorCombo") && $telerik.findControl(CurrentRow, "OperatorCombo").findItemByText(DefaultOperatorName))
                            $telerik.findControl(CurrentRow, "OperatorCombo").findItemByText(DefaultOperatorName).select();
                        else
                            $telerik.findControl(CurrentRow, "OperatorCombo").set_text(DefaultOperatorName);
                    }
                    else {
                        $telerik.findControl(CurrentRow, "OperatorCombo").set_text("");
                    }
                }
            </script>
        </telerik:RadCodeBlock>
        <%--End Region : Selected Index Change for ContainerTrucking and MobileCrane--%>
        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

            <script type="text/javascript">
                function CheckCtnrNoDigit(sender, eventArgs, index) {
                    var grid = $find("<%=ResultDG_Ctnr.ClientID %>");
                    var MasterTable = grid.get_masterTableView();
                    var dataItems = MasterTable.get_dataItems();
                    var ctnrno = dataItems[index].findControl("ContainerNoTxt").get_textBoxValue();

                    if (ctnrno != "") {
                        var returnstr = ContainerNoCheckDigit(ctnrno);
                        if (returnstr != "Valid") {
                            alert(returnstr + " - [ " + ctnrno + " ]");
                            dataItems[index].findControl("ContainerNoTxt").focus();
                        }
                    }
                }

                function ConvertToUpperCaseOnValueChanging(sender, args) {
                    // Ref: https://www.telerik.com/forums/how-to-make-user-entry-in-radtextbox-as-uppercase-ec842b9bf4c0#rWgre19cqUG4HWdFR_P8mg
                    args.set_newValue(args.get_newValue().toUpperCase());
                }

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
        </telerik:RadScriptBlock>
    </form>
</body>
</html>
