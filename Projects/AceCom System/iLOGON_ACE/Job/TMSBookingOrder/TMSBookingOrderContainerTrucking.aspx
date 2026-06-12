<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderContainerTrucking.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderContainerTrucking" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ContainerTrucking @ TMSBookingOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>

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
        </script>
    </telerik:RadScriptBlock>
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
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
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
        </script>
    </telerik:RadCodeBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>&nbsp;<asp:Button ID="AddBtn" runat="server" Text="Add" class="white" OnClick="AddBtn_Click"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="False" RenderMode="Lightweight" SelectedIndex="0" Skin="Office2007"
            AutoPostBack="True">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td valign="top" rowspan="2">
                                    <iWMS:iForm ID="formCtl" runat="server" />
                                    <iWMS:iForm ID="formCtl2" runat="server" />
                                    <iWMS:iForm ID="formCtl_JBDESCR" runat="server" />
                                </td>
                            </tr>
                        </table>
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
                                            AllowPaging="false" Skin="Office2007" EnableViewState="false" UseAccessibleHeader="True"
                                            OnNeedDataSource="ResultDG_20BillSizeType_NeedDataSource" OnItemDataBound="ResultDG_20BillSizeType_ItemDataBound" Width="80%">
                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                            <ItemStyle Wrap="true"></ItemStyle>
                                            <HeaderStyle Wrap="false"></HeaderStyle>
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
                                            AllowPaging="false" Skin="Office2007" EnableViewState="false" UseAccessibleHeader="True"
                                            OnNeedDataSource="ResultDG_40BillSizeType_NeedDataSource" OnItemDataBound="ResultDG_40BillSizeType_ItemDataBound" Width="80%">
                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                            <ItemStyle Wrap="true"></ItemStyle>
                                            <HeaderStyle Wrap="false"></HeaderStyle>
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
                                                AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_Ctnr_NeedDataSource" Width="50%">
                                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                    <Selecting AllowRowSelect="true" />
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true" CssClass="DGAlternateItem"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true" CssClass="DGItem"></ItemStyle>
                                                <HeaderStyle Wrap="false"></HeaderStyle>
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
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled"
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
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled"
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
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled"
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
                                                                    DataValueField="item" DataTextField="descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled"
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
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="AddBtn2" />
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>