<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingOrderForm.aspx.cs" Inherits="iWMS.Web.Job.BookingOrder.BookingOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingOrderForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />

    <style type="text/css">
        .hide {
            display: none;
        }

        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .wrap {
            white-space: normal;
            width: 90px;
            height: auto;
            text-align: center;
            font-size: 100%;
        }
        /*We need this CSS because When Click the New Container Button , default CSS of Batch grid for CommandItem is not working*/
        .RadGrid_Metro .rgSave {
            position: absolute;
            margin-left: 0% !important;
            width: auto !important;
            height: auto !important;
        }

        .RadGrid_Metro .rgCancel {
            position: absolute;
            margin-left: 10.5% !important;
            width: auto !important;
            height: auto !important;
        }

        .RadGrid_Metro .rgRefresh {
            margin-right: 70% !important;
            width: 100% !important;
            height: 3.7% !important;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">
        <script type="text/javascript">
            function DepotServicePtCombo_SelectedIndexChanged(sender, eventArgs) {
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var DepotServicePt = $telerik.findControl(CurrentRow, "DepotCombo").get_value();
                if (DepotServicePt != null && DepotServicePt != "") {
                    var DepotServicePtAddrPair = DepotServicePt.split("|");
                    $telerik.findControl(CurrentRow, "DepotAddTxt").set_value(DepotServicePtAddrPair[1]);
                }
            }

            function WarehouseServicePtCombo_SelectedIndexChanged(sender, eventArgs) {
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var WarehouseServicePt = $telerik.findControl(CurrentRow, "WarehouseCombo").get_value();
                if (WarehouseServicePt != null && WarehouseServicePt != "") {
                    var WarehouseServicePtAddrPair = WarehouseServicePt.split("|");
                    $telerik.findControl(CurrentRow, "WarehouseAddTxt").set_value(WarehouseServicePtAddrPair[1]);
                }
            }

            function PickUpServicePtCombo_SelectedIndexChanged(sender, eventArgs) {
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var PickUpServicePt = $telerik.findControl(CurrentRow, "PickUpCombo").get_value();
                if (PickUpServicePt != null && PickUpServicePt != "") {
                    var PickUpServicePtAddrPair = PickUpServicePt.split("|");
                    $telerik.findControl(CurrentRow, "PickUpAddTxt").set_value(PickUpServicePtAddrPair[1]);
                }
            }

            function DropOffServicePtCombo_SelectedIndexChanged(sender, eventArgs) {
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var DropOffServicePt = $telerik.findControl(CurrentRow, "DropOffCombo").get_value();
                if (DropOffServicePt != null && DropOffServicePt != "") {
                    var DropOffServicePtAddrPair = DropOffServicePt.split("|");
                    $telerik.findControl(CurrentRow, "DropOffAddTxt").set_value(DropOffServicePtAddrPair[1]);
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <%--Show Loading When Click The CommandItem--%>
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="Office2007" Modal="true" EnableSkinTransparency="true" EnableEmbeddedSkins="true" MinDisplayTime="500"></telerik:RadAjaxLoadingPanel>
        <%--We want to show the Loading Panel onto the Result Grid So we need to control with ResultGrid Id in Ajax--%>
        <telerik:RadAjaxManager runat="server" SkinID="Office2007" ID="RadAjaxManager">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="ResultDG">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ResultDG" LoadingPanelID="LoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadWindowManager" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="MassUpdateBtn">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadWindowManager" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <telerik:RadWindowManager runat="server" ID="RadWindowManager" Visible="false" EnableViewState="false">
        </telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <%-- *** to check in code side for Tab SelectedIndex if we will add more Tabs *** --%>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Party" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="ContainerTab" Text="Container" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="TripTab" Text="Trip" Value="750" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Billable" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Payable" Value="650" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="P&L" Value="700" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attachment" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="QRCode" Value="800" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="JobsheetBtn" CssClass="Blue" runat="server" OnClick="JobsheetBtn_Click"
                                Text="Job Sheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="formCtl_BKO" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="formCtl_JBDESCR" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PartyRadPageView">
                <br />
                <table width="100%">
                    <tr>
                        <td>&nbsp;
                            <asp:Button ID="UpdatePartyBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl_Party" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView">
                <br />
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true" OnTabClick="RadTabStrip2_TabClick"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
                    <Tabs>
                        <telerik:RadTab Id="GeneralTab" Text="General" Value="10" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="CargoTab" Text="Form" Value="20" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="LogDetlTab" Text="Log" Value="30" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="700px" ID="GeneralRadPageView">
                        <br />
                        <asp:Panel ID="NewBtnPanel" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="NewCtnrBtn" runat="server" CssClass="LongLabelWhite" CausesValidation="false" Text="New Container"
                                            OnClick="NewCtnrBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;
                                        <asp:Button ID="DeleteCtnrBtn" runat="server" CssClass="LongLabelWhite" Text="Delete Container" OnClientClick="disableBtn(this.id)"
                                            OnClick="DeleteCtnrBtn_Click" UseSubmitBehavior="false" />
                                        &nbsp;
                                         <asp:Button ID="GenTripBtn" runat="server" CssClass="LongLabelWhite" Text="Generate Trip"
                                             OnClick="GenTripBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;
                                        <asp:Button ID="MassUpdateBtn" runat="server" Text="Mass Update" CausesValidation="false"
                                            ToolTip="MassUpdate" CssClass="LongLabelWhite" OnClick="MassUpdateBtn_Click" />
                                        &nbsp;
                                        <asp:Button ID="CrossDockRequiredBtn" runat="server" Text="CrossDock Required" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                            ToolTip="CrossDock Required" CssClass="LongLabelWhite" OnClick="CrossDockRequiredBtn_Click" Enabled="false" />
                                        &nbsp;
                                        <asp:Button ID="CrossDockContainerBtn" runat="server" Text="CrossDock Container" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                            ToolTip="CrossDock Container" CssClass="LongLabelWhite" OnClick="CrossDockContainerBtn_Click" Enabled="false" />
                                        &nbsp;
                                        <asp:Button ID="ChangeJobTypeBtn" runat="server" Text="Change JobType" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                            ToolTip="ChangeJobType" CssClass="LongLabelWhite" OnClick="ChangeJobTypeBtn_Click" />
                                                         
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />      
                                    </td>
                                    <td>
                                        <asp:Label ID="PrintChargeLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="NewCtnrPanel" runat="server">
                            <asp:Button ID="AddNewCtnrBtn" runat="server" CssClass="white" Text="Add"
                                OnClick="AddNewCtnrBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CancelNewCtnrBtn" runat="server" CssClass="white" Text="Cancel"
                                OnClick="CancelNewCtnrBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                            <br />
                            <iWMS:iForm ID="formCtl_Ctnr" runat="server" Visible="true"></iWMS:iForm>
                            <asp:UpdatePanel ID="UpdatePanel_AddCtn" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td valign="top">
                                                <br />
                                                <telerik:RadGrid ID="ResultDGAddCtnr" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                    AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDGAddCtnr_NeedDataSource" OnItemDataBound="ResultDGAddCtnr_ItemDataBound">
                                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                        <Selecting AllowRowSelect="true" />
                                                    </ClientSettings>
                                                    <SortingSettings EnableSkinSortStyles="false" />
                                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                    <ItemStyle Wrap="true"></ItemStyle>
                                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="CtnrNoGrid" Width="100%">
                                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                        <Columns>
                                                            <telerik:GridTemplateColumn HeaderText="ContainerNo" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="ContainerNoTxt" runat="server" Width="100" Skin="WebBlue"
                                                                        ClientEvents-OnValueChanged='<%# "function (s,a){CheckCtnrNoDigit(s,a," + Container.ItemIndex + ");}" %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="SealNo" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="SealNoTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="VGM(KG)" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="VGMTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="BookingRef" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="BookingRefTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="PermitNo" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="PermitNoTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="CarrierName" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="CarrierNameTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="PortnetNo" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="PortnetNoTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Depot" HeaderStyle-HorizontalAlign="Center" UniqueName="Depot"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="DepotCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="Item" DataTextField="Descr" DataSource='<%# ServiceDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServiceDS,DataBinder.Eval(Container.DataItem, "Deppot").ToString())%>'
                                                                        OnClientSelectedIndexChanged="DepotServicePtCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="DepotAddTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "DepotAdd") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Warehouse" HeaderStyle-HorizontalAlign="Center" UniqueName="Warehouse"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="WarehouseCombo" runat="server" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="Item" DataTextField="Descr" DataSource='<%# ServiceDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServiceDS,DataBinder.Eval(Container.DataItem, "Warehouse").ToString())%>'
                                                                        OnClientSelectedIndexChanged="WarehouseServicePtCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="WarehouseAddTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "WarehouseAdd") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="PickUp" HeaderStyle-HorizontalAlign="Center" UniqueName="PickUp"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="PickUpCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="Item" DataTextField="Descr" DataSource='<%# ServiceDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServiceDS,DataBinder.Eval(Container.DataItem, "PickUp").ToString())%>'
                                                                        OnClientSelectedIndexChanged="PickUpServicePtCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="PickUpAddTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "PickUpAdd") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="DropOff" HeaderStyle-HorizontalAlign="Center" UniqueName="DropOff"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadComboBox ID="DropOffCombo" runat="server" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="Item" DataTextField="Descr" DataSource='<%# ServiceDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServiceDS,DataBinder.Eval(Container.DataItem, "DropOff").ToString())%>'
                                                                        OnClientSelectedIndexChanged="DropOffServicePtCombo_SelectedIndexChanged">
                                                                    </telerik:RadComboBox>
                                                                    <br />
                                                                    <telerik:RadTextBox ID="DropOffAddTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "DropOffAdd") %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="AddCtnr" ValidationGroup="NA"
                                                                        ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Edit"
                                                                        OnClick="AddCtnrImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DeleteCtnr" ValidationGroup="NA"
                                                                        ImageUrl="../../image/Deleted.png" Width="15" Height="15" AlternateText="Delete"
                                                                        OnClick="DeleteCtnrImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <asp:Panel ID="NewTripPanel" runat="server">
                            <asp:Button ID="AddNewTripBtn" runat="server" CssClass="white" Text="Add"
                                OnClick="AddNewTripBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="CancelNewTrip" runat="server" CssClass="white" Text="Cancel"
                                OnClick="CancelNewTripBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel_Trip" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl_Trip" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <br />
                        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                                    AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" OnPreRender="ResultDG_PreRender" AllowFilteringByColumn="false"
                                    OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand" AllowPaging="true"
                                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                    <ItemStyle Wrap="true"></ItemStyle>
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                        <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                            OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBCId" Name="ParentGrid" PageSize="50" ItemStyle-HorizontalAlign="Left" Width="100%"
                                        EditMode="Batch" CommandItemDisplay="TopAndBottom">
                                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                <HeaderTemplate>
                                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="editicon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" ID="EditCtnr" ImageUrl="../../image/pencil.gif" BorderWidth="0" BackColor="Transparent"
                                                        Width="15" Height="15" AlternateText="Edit" OnClick="EditCtnr_Click"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="SNO" HeaderText="S/N" ItemStyle-Width="50px" HeaderStyle-Width="50px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:}",Eval("SNO")) %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadLabel runat="server" ID="SNOLbl" Width="50px"></telerik:RadLabel>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="ShipmentTypeContainerSize" HeaderText="JobType <br> TransportType <br>  ShipmentType <br/> ContainerSize" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="JobTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "jobtype")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="TransportTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "tpttype")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="ShipmentTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ShipmentTypeDescr")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="ContainerSizeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillSizeTypeDescr")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="TransportTypeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "tpttype")%>'
                                                        TextMode="SingleLine" Width="140px" Enabled="false">
                                                    </telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadDropDownList ID="ShipmentTypeDDL" runat="server" Skin="WebBlue" Width="140px" DropDownWidth="140px" OnLoad="ShipmentTypeDDL_Load"></telerik:RadDropDownList>
                                                    <br />
                                                    <br />
                                                    <telerik:RadDropDownList ID="ContainerSizeDDL" runat="server" Skin="WebBlue" Width="140px" DropDownWidth="140px" OnLoad="ContainerSizeDDL_Load"></telerik:RadDropDownList>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="ContainerNoSealNoVGM" AllowFiltering="false" HeaderStyle-Width="170px" ItemStyle-Width="170px">
                                                <HeaderTemplate>
                                                    ContainerNo
                                                    <br />
                                                    SealNo
                                                    <br />
                                                    VerifiedGrossMass(VGM)
                                                   <br />
                                                    <asp:LinkButton ID="SameCtnrLnkBtn" OnClick="Control_Fill" runat="server" Text="SameContainer" ForeColor="Blue" CausesValidation="false"></asp:LinkButton>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="ContainerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrno")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="SealNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrsealno")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="VGMLbl" Text='<%# string.Format("{0:0.#}",Eval("VerifiedGrossMass")) %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="ContainerNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="SealNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="VerifiedGrossMassTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                                    <asp:CompareValidator ID="VerifiedGrossMassCompVal" runat="server" ControlToValidate="VerifiedGrossMassTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="PermitNoBkRef" HeaderText="PermitNo <br/> BookingRef" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="PermitNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PermitNo")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="BkRefLbl" Text='<%# DataBinder.Eval(Container.DataItem, "bkref")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="PermitNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="BkRefTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="CarrierNamePortnetNo" HeaderText="CarrierName <br/> PortnetNo" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="CarrierNameLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerOperator")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="PortnetNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PortnetNo")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="CarrierNameTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="PortnetNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="RequiredDateAndTime" HeaderText="RequiredDate <br/> RequiredTime" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="RequiredDateLbl" Text='<%# Eval("expdate", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="RequiredTimeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "eqpremarks")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDateTimePicker ID="RequiredDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true" TimeView-Interval="00:30:00" TimeView-TimeFormat="HH:mm">
                                                    </telerik:RadDateTimePicker>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="RequiredTimeTxt" TextMode="SingleLine" Width="140px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="DepotServicePtAndAddress" HeaderText="Depot <br/> Depot Address " Display="false" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="DepotServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "DepotServicePtDescr")%>' Style="display: none;"></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="DepotAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "DepotAddr")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="DepotServicePtCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="DepotServicePt_DropDownClosed"
                                                        RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtCombo_ItemsRequested"
                                                        HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true">
                                                    </telerik:RadComboBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="DepotAddrTxt" TextMode="MultiLine" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "DepotAddr")%>'>
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="WarehouseServicePtAndAddress" HeaderText="Warehouse <br/> Warehouse Address " Display="false" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="WarehouseServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "WarehouseServicePtDescr")%>' Style="display: none;"></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="WarehouseAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "WarehouseAddr")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="WarehouseServicePtCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="WarehouseServicePt_DropDownClosed"
                                                        RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtCombo_ItemsRequested"
                                                        HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true">
                                                    </telerik:RadComboBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="WarehouseAddrTxt" TextMode="MultiLine" Width="140px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="PickUpServicePtAndAddress" HeaderText="PickUp <br/> PickUp Address" AllowFiltering="false" Display="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="PickUpServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "FrServicePtDescr")%>' Style="display: none;"></asp:Label>
                                                    <asp:Label runat="server" ID="PickUpAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="PickUpServicePtCombo" runat="server" DataTextField="descr" DataValueField="item"
                                                        Skin="WebBlue" Width="120px" OnClientDropDownClosed="PickUpServicePt_DropDownClosed"
                                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                        EnableLoadOnDemand="true" OnItemsRequested="ServicePtCombo_ItemsRequested">
                                                    </telerik:RadComboBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="PickUpAddrTxt" TextMode="MultiLine" Rows="3" Width="120px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="DropOffServicePtAndAddress" HeaderText="DropOff <br/> DropOff Address " Display="false" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="DropOffServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "ToServicePtDescr")%>' Style="display: none;"></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="DropOffAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ToAddr")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="DropOffServicePtCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="DropOffServicePt_DropDownClosed"
                                                        RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtCombo_ItemsRequested" CausesValidation="false"
                                                        HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true">
                                                    </telerik:RadComboBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="DropOffAddrTxt" TextMode="MultiLine" Width="140px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="BillOption1And2" HeaderText="BillOption1 <br/> BillOption2" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BillOption1Lbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillOption1Descr")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="BillOption2Lbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillOption2Descr")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDropDownList ID="BillOption1DDL" runat="server" DataTextField="descr"
                                                        DataValueField="Item" Skin="WebBlue" Width="140px" DropDownWidth="140px" OnLoad="BillOption1DDL_Load">
                                                    </telerik:RadDropDownList>
                                                    <br />
                                                    <br />
                                                    <telerik:RadDropDownList ID="BillOption2DDL" runat="server" DataTextField="descr" DropDownWidth="140px"
                                                        DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="BillOption2DDL_Load">
                                                    </telerik:RadDropDownList>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn HeaderText="ReadyDate <br/> FreeStorageExpiry <br/> DetentionExpiry" HeaderStyle-Width="160px" ItemStyle-Width="160px" AllowFiltering="false" UniqueName="ReadyFreeStorageDentionExpiry">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="ReadyDateLbl" Text='<%# Eval("readydate", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="FreeStorageExpiryLabel" Text='<%# Eval("StoreRentExpiryDate", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="DetentionExpiryLabel" Text='<%# Eval("DetentionExpiryDate", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDateTimePicker ID="ReadyDateTimePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true">
                                                    </telerik:RadDateTimePicker>
                                                    <br />
                                                    <br />
                                                    <telerik:RadDateTimePicker ID="FreeStoreRentExpiryDateTimePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true">
                                                    </telerik:RadDateTimePicker>
                                                    <br />
                                                    <br />
                                                    <telerik:RadDateTimePicker ID="DetentionExpiryDateTimePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true">
                                                    </telerik:RadDateTimePicker>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn HeaderText="ElectricityExpiry <br/> DemurrageExpiry <br/> SFAInspection" HeaderStyle-Width="160px" ItemStyle-Width="160px" AllowFiltering="false"
                                                UniqueName="ElectricityDemurrageSFAinspection">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="ElectricityExpiryLbl" Text='<%# Eval("ElectricityExpiryDate", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="DemurrageExpiryLbl" Text='<%# Eval("DemurrageExpiryDate", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="SFAInspectionLbl" Text='<%# Eval("SFAInspectionDescr", "{0:}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDateTimePicker ID="ElectricityExpiryDateTimePicker" runat="server" Skin="WebBlue" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true">
                                                    </telerik:RadDateTimePicker>
                                                    <br />
                                                    <br />
                                                    <telerik:RadDateTimePicker ID="DemurrageExpiryDateTimePicker" runat="server" Skin="WebBlue" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true">
                                                    </telerik:RadDateTimePicker>
                                                    <br />
                                                    <br />
                                                    <telerik:RadDropDownList ID="SFAInspectionDDL" runat="server" DataTextField="descr"
                                                        DataValueField="Item" Skin="WebBlue" Width="140px" DropDownWidth="140px" OnLoad="SFAInspectionDDL_Load">
                                                    </telerik:RadDropDownList>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn HeaderText="PlugInStartDate <br/> PlugInEndDate <br/> UnstuffingDate" HeaderStyle-Width="160px" ItemStyle-Width="160px" AllowFiltering="false" UniqueName="PlugInStartEndDateExpiry">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="PlugInStartDateLbl" Text='<%# Eval("ReeferPointPlugInStartDate ", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="PlugInEndDateLabel" Text='<%# Eval("ReeferPointPlugInEndDate", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                     <br />
                                                    <asp:Label runat="server" ID="UnstuffingDateLabel" Text='<%# Eval("UnstuffingDate", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDateTimePicker ID="PlugInStartDateTimePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true">
                                                    </telerik:RadDateTimePicker>
                                                    <br />
                                                    <br />
                                                    <telerik:RadDateTimePicker ID="PlugInEndDateTimePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true">
                                                    </telerik:RadDateTimePicker>
                                                    <br />
                                                    <br />
                                                    <telerik:RadDateTimePicker ID="UnstuffingDateTimePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true">
                                                    </telerik:RadDateTimePicker>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn HeaderText="SKU <br/> Quantity <br/>Size" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                                AllowFiltering="false" UniqueName="EqpGoodsCargoPackingCtnrSize">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SKULbl" Text='<%# DataBinder.Eval(Container.DataItem, "EqpGoodsDescr")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="QuantityLbl" Text='<%# DataBinder.Eval(Container.DataItem, "CargoPackingType")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label runat="server" ID="SizeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "CtnrCapacity")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="SKUTxt" TextMode="SingleLine" Width="140px">
                                                    </telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="QuantityTxt" TextMode="SingleLine" Width="140px">
                                                    </telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="SizeTxt" TextMode="SingleLine" Width="140px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="Temperature" HeaderText="Temperature" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:}",Eval("Temperature")) %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="TemperatureTxt" TextMode="SingleLine" Width="140px" Height="100px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn DataField="CrossDockStatus" UniqueName="CrossDockStatus" HeaderText="CrossDock Required"
                                                HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:}",Eval("CrossDockStatus")) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn DataField="CrossDockCtnrNo" UniqueName="CrossDockCtnrNo" HeaderText="CrossDock ContainerNo"
                                                HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:}",Eval("CrossDockCtnrNo")) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="CtnrDescr" HeaderText="ContainerDescription" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:}",Eval("Descr")) %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="CtnrDescrTxt" TextMode="MultiLine" Width="140px" Height="100px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                              <telerik:GridTemplateColumn UniqueName="ctnrwt" HeaderText="ContainerWt(KG)" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:}",Eval("ctnrwt")) %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="ctnrwtTxt" TextMode="SingleLine" Width="140px" Height="100px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="ContainerRemarks" HeaderText="ContainerRemarks" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:}",Eval("Remarks")) %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="ContainerRemarksTxt" TextMode="MultiLine" Width="140px" Height="100px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="jbcid" UniqueName="jbcid" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CtnrNo" UniqueName="CtnrNo" Display="False" />
                                            <telerik:GridBoundColumn DataField="jbId" UniqueName="jbId" Display="False" />
                                            <telerik:GridBoundColumn DataField="tpttype" UniqueName="tpttype" Display="False">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="700px" ID="CargoRadPageView">
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="700px" ID="LogDetlRadPageView">
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TripRadPageView">
                <asp:Panel ID="TripNewBtnPanel" runat="server">
                    <br />
                    <asp:Button ID="TripOpenBtn" runat="server" CssClass="white" OnClick="TripOpenBtn_Click"
                        Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripCancelBtn" runat="server" CssClass="white" OnClick="TripCancelBtn_Click"
                            Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripReadyBtn" runat="server" CssClass="white" OnClick="TripReadyBtn_Click"
                            Text="Ready" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripAssignedBtn" runat="server" CssClass="white" OnClick="TripAssignBtn_Click"
                            Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripCompletedBtn" runat="server" CssClass="white" OnClick="TripCompletedBtn_Click"
                            Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripPODBtn" runat="server" CssClass="white" OnClick="TripPODBtn_Click"
                            Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripDeleteBtn" runat="server" CssClass="white" Text="Delete" OnClientClick="disableBtn(this.id)"
                            OnClick="TripDeleteBtn_Click" UseSubmitBehavior="false" />
                    &nbsp;
                        <asp:Button ID="TripDOBtn" CssClass="Blue" runat="server" OnClick="TripDOBtn_Click"
                            Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                        <asp:Button ID="TripMassUpdateBtn" runat="server" Text="Mass Update" CausesValidation="false"
                            ToolTip="MassUpdate" CssClass="LongLabelWhite" OnClick="TripMassUpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                        <asp:Button ID="DetourBtn" runat="server" Text="Detour" CausesValidation="false"
                            ToolTip="Detour" CssClass="LongLabelWhite" OnClick="DetourBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <br />
                    <br />
                    &nbsp;
                        <asp:Button ID="InternalShiftingBtn" runat="server" Text="Internal Shifting" CausesValidation="false"
                            ToolTip="InternalShifting" CssClass="LongLabelWhite" OnClick="InternalShiftingBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                        <asp:Button ID="CopyBtn" runat="server" Text="Copy" CausesValidation="false"
                            CssClass="white" OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <br />
                </asp:Panel>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel1" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDGTrip" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            AllowMultiRowSelection="true" OnNeedDataSource="ResultDGTrip_NeedDataSource"
                            OnItemDataBound="ResultDGTrip_ItemDataBound" OnBatchEditCommand="ResultDGTrip_BatchEditCommand" AllowSorting="true"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True" AllowFilteringByColumn="true">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                    OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                            </ClientSettings>
                            <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White" />
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" PageSize="50"
                                EditMode="Batch" CommandItemDisplay="TopAndBottom">
                                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripContainerNo/SealNo" AutoPostBackOnFilter="true" DataField="ContainerNo" HeaderStyle-Width="150px"
                                        ItemStyle-Width="150px" HeaderText="ContainerNo <br/> SealNo" SortExpression="ContainerNo" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="TripContainerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="TripSealNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripContainerNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="TripSealNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDateTime" HeaderText="Trip Date Time" HeaderStyle-Width="130px" ItemStyle-Width="130px" AllowFiltering="false"
                                        SortExpression="TripDateTime" AllowSorting="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TripDateTime")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDatePicker ID="TripDatePicker" runat="server" DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true"
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Office2007" Width="120">
                                            </telerik:RadDatePicker>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="RequestedDetourDate" HeaderText="RequestedDetourDate" HeaderStyle-Width="170px" ItemStyle-Width="170px" AllowFiltering="false" SortExpression="bookingtime" AllowSorting="true">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="RequestedDetourDateLbl" Text='<%# string.Format("{0:dd/MMM/yyyy HH:mm}",Eval("bookingtime")) %>' CssClass='<%# ((Eval("TripDetour").ToString()).Equals("shifting", StringComparison.OrdinalIgnoreCase) || (Eval("TripDetour").ToString()).Equals("detour", StringComparison.OrdinalIgnoreCase))? "" : "hide" %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%--<telerik:RadDatePicker ID="RequestedDetourDatePicker" runat="server" DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true"
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Office2007" Width="120">
                                            </telerik:RadDatePicker>--%>
                                            <telerik:RadDateTimePicker runat="server" ID="RequestedDetourDatePicker" Skin="Office2007" Width="160px"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                TimeView-TimeFormat="HH:mm" TimeView-Interval="00:30:00">
                                            </telerik:RadDateTimePicker>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripType/TripOption/BillOption/BillSizeType" HeaderText="TripType <br/> TripOption <br/> BillOption <br/> BillSizeType" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="TripTypeLbl" Text='<%# string.Format("{0:}",Eval("TripTypeDescr")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="TripOptionLbl" Text=' <%# string.Format("{0:}",Eval("TripOptionDescr")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="BillOptionLbl" Text=' <%# string.Format("{0:}",Eval("BillOption1Descr")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="BillSizeTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillSizeTypeDescr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="TripTypeDDL" runat="server"
                                                Skin="WebBlue" Width="140px"
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnLoad="TripTypeDDL_Load">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="TripOptionDDL" runat="server" Skin="WebBlue" Width="140px"
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnLoad="TripOptionDDL_Load">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="TripBillOptionDDL" runat="server"
                                                Skin="WebBlue" Width="140px" DropDownWidth="140px" OnLoad="BillOption1DDL_Load">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" Skin="WebBlue"
                                                RenderMode="Lightweight" Width="140px" OnLoad="ContainerSizeDDL_Load">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Vehicle/Driver/TrailerNo" HeaderText="Vehicle <br> Driver <br/> Trailer" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="VehicleLbl" Text='<%# string.Format("{0:}",Eval("VehNo")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="DriverLbl" Text=' <%# string.Format("{0:}",Eval("Name")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="TrailerNoLbl" Text=' <%# string.Format("{0:}",Eval("TrailerNo")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="VehicleCombo" runat="server" DataTextField="descr" DataValueField="item"
                                                Skin="WebBlue" Width="140px" OnClientDropDownClosed="VehicleList_DropDownClosed"
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnItemsRequested="VehicleCombo_ItemsRequested">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="DriverCombo" runat="server" Skin="WebBlue" Width="140px"
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnItemsRequested="DriverCombo_ItemsRequested">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="TrailerNoCombo" runat="server" Skin="WebBlue" Width="140px"
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnItemsRequested="TrailerNoCombo_ItemsRequested">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Double/Status" HeaderText="Double <br/> Status" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="DoubleMountLbl" Text='<%# DataBinder.Eval(Container.DataItem, "DoubleMountCode")%>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="StatusLbl" Text='<%# DataBinder.Eval(Container.DataItem, "StatusDescr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="DoubleMountTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="StatusTxt" Text='<%# DataBinder.Eval(Container.DataItem, "statusdescr") %>'
                                                TextMode="SingleLine" Width="140px" Enabled="false">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUpServicePtAndAddress" HeaderText="PickUp <br/> PickUp Address" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="PickUpServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "FrServicePtDescr")%>' Style="display: none;"></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="PickUpAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="PickUpServicePtCombo" runat="server" DataTextField="descr" DataValueField="item"
                                                Skin="WebBlue" Width="140px" OnClientDropDownClosed="PickUpServicePt_DropDownClosed"
                                                DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnItemsRequested="ServicePtCombo_ItemsRequested">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="PickUpAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOffServicePtAndAddress" HeaderText="DropOff <br/> DropOff Address" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="DropOffServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "ToServicePtDescr")%>' Style="display: none;"></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="DropOffAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="DropOffServicePtCombo" runat="server" DataTextField="descr" DataValueField="item"
                                                Skin="WebBlue" Width="140px" OnClientDropDownClosed="DropOffServicePt_DropDownClosed"
                                                DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnItemsRequested="ServicePtCombo_ItemsRequested">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="DropOffAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DetourReason" HeaderText="DetourReason"
                                        HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="DetourReasonLbl" Text='<%# string.Format("{0:}",Eval("DetourReason")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="DetourReasonDDL" runat="server"
                                                Skin="WebBlue" Width="140px"
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnLoad="DetourReasonDDL_Load">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="BookingRef" HeaderText="BookingRef" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="BookingRefLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BookingNo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="BookingRefTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="TripDescrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripDescr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripDescrTxt" TextMode="MultiLine" Rows="3" Width="140px"></telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="SpecialInstruction" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="TripSpecialInstructionLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" TextMode="MultiLine" Rows="3" Width="140px"></telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="JBCTNRId" UniqueName="JBCTNRId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                    <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                                    <telerik:GridBoundColumn DataField="sector" UniqueName="sector" Display="False" />
                                    <telerik:GridBoundColumn DataField="type" UniqueName="type" Display="False" />
                                    <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="ChargeRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="PayableRadPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="PAndLRadPadeView" />
            <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView2">
                <br />
                <table width="100%">
                    <tr>
                        <td valign="top" align="left">
                            <asp:PlaceHolder ID="JbId_QRCode" runat="server" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                function CheckCtnrNoDigit(sender, eventArgs, index) {
                    var grid = $find("<%=ResultDGAddCtnr.ClientID %>");
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

                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDGTrip.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }

                function ContainerOnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
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
        </telerik:RadCodeBlock>

        <%--Start Region : Migrate Two ItemTemplate into One Column --%>
        <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
            <script type="text/javascript">
                // originally taken from https://vanillajstoolkit.com/polyfills/stringreplaceall/
                /**
                 * String.prototype.replaceAll() polyfill
                 * https://gomakethings.com/how-to-replace-a-section-of-a-string-with-another-one-with-vanilla-js/
                 * @author Chris Ferdinandi
                 * @license MIT
                 */
                if (!String.prototype.replaceAll) {
                    String.prototype.replaceAll = function (str, newStr) {

                        // If a regex pattern
                        if (Object.prototype.toString.call(str).toLowerCase() === '[object regexp]') {
                            return this.replace(str, newStr);
                        }

                        // If a string
                        return this.replace(new RegExp(str, 'g'), newStr);

                    };
                }

                var RequestedDetourDate = function (RequestedDetourDate, isHidden) {
                    this.RequestedDetourDate = RequestedDetourDate;
                    this.isHidden = isHidden;
                }

                var ShipmentTypeContainerSize = function (Tpttype, ShipmentType, ContainerSize, ShipmentTypeValue, ContainerSizeValue) {
                    this.Tpttype = Tpttype;
                    this.ShipmentType = ShipmentType;
                    this.ShipmentTypeValue = ShipmentTypeValue;
                    this.ContainerSize = ContainerSize;
                    this.ContainerSizeValue = ContainerSizeValue;
                }

                var ContainerNoSealNoVGM = function (ContainerNo, SealNo, VGM) {
                    this.ContainerNo = ContainerNo;
                    this.SealNo = SealNo;
                    this.VGM = VGM;
                }

                var PermitNoBkRef = function (PermitNo, BookingRef) {
                    this.PermitNo = PermitNo;
                    this.BookingRef = BookingRef;

                }

                var CarrierNamePortnetNo = function (CarrierName, PortnetNo) {
                    this.CarrierName = CarrierName;
                    this.PortnetNo = PortnetNo;
                }

                var ServicePtDescrAndAddr = function (ServicePtDescr, Addr, ServicePtCode) {
                    this.ServicePtDescr = ServicePtDescr;
                    this.Addr = Addr;
                    this.ServicePtCode = ServicePtCode;
                }

                var BillOption = function (BillOption1, BillOption2, BillOption1Value, BillOption2Value) {
                    this.BillOption1 = BillOption1;
                    this.BillOption2 = BillOption2;
                    this.BillOption1Value = BillOption1Value;
                    this.BillOption2Value = BillOption2Value;
                }

                var RequiredDateAndTime = function (ExpDate, EqpRemarks) {
                    this.ExpDate = ExpDate;
                    this.EqpRemarks = EqpRemarks;
                }

                var ReadyFreeStorageDentionExpiry = function (ReadyDate, FreeStorageExpiryDate, DetentionExpiryDate) {
                    this.ReadyDate = ReadyDate;
                    this.FreeStorageExpiryDate = FreeStorageExpiryDate;
                    this.DetentionExpiryDate = DetentionExpiryDate;
                }
                var PlugInStartEndDateExpiry = function (PlugInStartDate, PlugInEndDate, UnstuffingDate) {
                    this.PlugInStartDate = PlugInStartDate;
                    this.PlugInEndDate = PlugInEndDate;
                    this.UnstuffingDate = UnstuffingDate;
                }
                var ElectricityDemurrageSFAinspection = function (ElectricityExpiryDate, DemurrageExpiryDate, SFAInspection, SFAInspectionValue) {
                    this.ElectricityExpiryDate = ElectricityExpiryDate;
                    this.DemurrageExpiryDate = DemurrageExpiryDate;
                    this.SFAInspection = SFAInspection;
                    this.SFAInspectionValue = SFAInspectionValue;
                }
                var EqpGoodsCargoPackingCtnrSize = function (EqpGoodsDescr, CargoPackingType, ctnrsize) {
                    this.EqpGoodsDescr = EqpGoodsDescr;
                    this.CargoPackingType = CargoPackingType;
                    this.ctnrsize = ctnrsize;
                }

                var TripContainerNoSealNo = function (ContainerNo, SealNo) {
                    this.ContainerNo = ContainerNo;
                    this.SealNo = SealNo;
                }

                RequestedDetourDate.prototype.equals = function (requestedDetourDate) {
                    return ((!this.RequestedDetourDate && !requestedDetourDate.RequestedDetourDate) || moment(this.RequestedDetourDate).isSame(moment(requestedDetourDate.RequestedDetourDate)));
                }

                ShipmentTypeContainerSize.prototype.equals = function (ShipmenttypeContainersize) {
                    if (this.ShipmentType === ShipmenttypeContainersize.ShipmentType && this.ContainerSize === ShipmenttypeContainersize.ContainerSize) {
                        return true;
                    }
                    return false;
                }

                ContainerNoSealNoVGM.prototype.equals = function (CSV) {
                    if (this.ContainerNo === CSV.ContainerNo && this.SealNo === CSV.SealNo && this.VGM === CSV.VGM) {
                        return true;
                    }
                    return false;
                }

                TripContainerNoSealNo.prototype.equals = function (TripContainerSealNo) {
                    if (this.ContainerNo === TripContainerSealNo.ContainerNo && this.SealNo === TripContainerSealNo.SealNo) {
                        return true;
                    }
                    return false;
                }

                PermitNoBkRef.prototype.equals = function (PBC) {
                    if (this.PermitNo === PBC.PermitNo && this.BookingRef === PBC.BookingRef) {
                        return true;
                    }
                    return false;
                }

                CarrierNamePortnetNo.prototype.equals = function (CarriernamePortnetno) {
                    if (this.CarrierName === CarriernamePortnetno.CarrierName && this.PortnetNo === CarriernamePortnetno.PortnetNo) {
                        return true;
                    }
                    return false;
                }

                ServicePtDescrAndAddr.prototype.equals = function (ServicePtDescrAddrTxt) {
                    if (this.ServicePtDescr === ServicePtDescrAddrTxt.ServicePtDescr && this.Addr === ServicePtDescrAddrTxt.Addr) {
                        return true;
                    }
                    return false;
                }

                BillOption.prototype.equals = function (Billoption) {
                    if (this.BillOption1 === Billoption.BillOption1 && this.BillOption2 === Billoption.BillOption2) {
                        return true;
                    }
                    return false;
                }

                RequiredDateAndTime.prototype.equals = function (RequiredDateTime) {
                    if (this.ExpDate === RequiredDateTime.ExpDate && this.EqpRemarks === RequiredDateTime.EqpRemarks) {
                        return true;
                    }
                    return false;
                }

                ReadyFreeStorageDentionExpiry.prototype.equals = function (ReadyFreeStorageDentionExpiryDate) {
                    if (this.ReadyDate === ReadyFreeStorageDentionExpiryDate.ReadyDate && this.FreeStorageExpiryDate === ReadyFreeStorageDentionExpiryDate.FreeStorageExpiryDate && this.DetentionExpiryDate === ReadyFreeStorageDentionExpiryDate.DetentionExpiryDate) {
                        return true;
                    }
                    return false;
                }

                PlugInStartEndDateExpiry.prototype.equals = function (PlugInStartEndDateExpiry) {
                    if (this.PlugInStartDate === PlugInStartEndDateExpiry.PlugInStartDate && this.PlugInEndDate === PlugInStartEndDateExpiry.PlugInEndDate && this.UnstuffingDate === PlugInStartEndDateExpiry.UnstuffingDate) {
                        return true;
                    }
                    return false;
                }

                ElectricityDemurrageSFAinspection.prototype.equals = function (ElectricityDemurrageSFAinspectionDate) {
                    if (this.ElectricityExpiryDate === ElectricityDemurrageSFAinspectionDate.ElectricityExpiryDate && this.DemurrageExpiryDate === ElectricityDemurrageSFAinspectionDate.DemurrageExpiryDate && this.SFAInspection === ElectricityDemurrageSFAinspectionDate.SFAInspection) {
                        return true;
                    }
                    return false;
                }
                EqpGoodsCargoPackingCtnrSize.prototype.equals = function (EqpGoodsCargoPackingCtnrSizeText) {
                    if (this.EqpGoodsDescr === EqpGoodsCargoPackingCtnrSizeText.EqpGoodsDescr && this.CargoPackingType === EqpGoodsCargoPackingCtnrSizeText.CargoPackingType && this.ctnrsize === EqpGoodsCargoPackingCtnrSizeText.ctnrsize) {
                        return true;
                    }
                    return false;
                }
                RequestedDetourDate.prototype.toString = function () {
                    if (this.RequestedDetourDate)
                        return moment(this.RequestedDetourDate).format("DD/MMM/YYYY HH:mm");
                    else
                        return '';
                }

                ShipmentTypeContainerSize.prototype.toString = function () {
                    return JSON.stringify({
                        ShipmentType: this.ShipmentTypeValue, ShipmentTypeDescr: this.ShipmentType,
                        ContainerSize: this.ContainerSizeValue, ContainerSizeDescr: this.ContainerSize
                    }).replaceAll("'", "\\'");
                }

                ContainerNoSealNoVGM.prototype.toString = function () {
                    return JSON.stringify({
                        ContainerNo: this.ContainerNo, SealNo: this.SealNo, VGM: this.VGM,
                        ContainerSize: this.ContainerSizeValue, ContainerSizeDescr: this.ContainerSize
                    }).replaceAll("'", "\\'");
                }

                TripContainerNoSealNo.prototype.toString = function () {
                    return JSON.stringify({
                        ContainerNo: this.ContainerNo, SealNo: this.SealNo, VGM: this.VGM
                    }).replaceAll("'", "\\'");
                }

                PermitNoBkRef.prototype.toString = function () {
                    return JSON.stringify({
                        PermitNo: this.PermitNo, BookingRef: this.BookingRef
                    }).replaceAll("'", "\\'");
                }

                CarrierNamePortnetNo.prototype.toString = function () {
                    return JSON.stringify({
                        CarrierName: this.CarrierName, PortnetNo: this.PortnetNo
                    }).replaceAll("'", "\\'");
                }

                ServicePtDescrAndAddr.prototype.toString = function () {
                    return JSON.stringify({
                        Addr: this.Addr, ServicePtCode: this.ServicePtCode,
                        ServicePtDescr: this.ServicePtDescr
                    }).replaceAll("'", "\\'");
                }

                BillOption.prototype.toString = function () {
                    return JSON.stringify({
                        BillOption1: this.BillOption1Value, BillOption2: this.BillOption2Value,
                        BillOption1Descr: this.BillOption1, BillOption2Descr: this.BillOption2
                    }).replaceAll("'", "\\'");
                }

                RequiredDateAndTime.prototype.toString = function () {
                    return JSON.stringify({
                        ExpDate: this.ExpDate.toString("dd/MMM/yyyy"), EqpRemarks: this.EqpRemarks
                    });
                }

                ReadyFreeStorageDentionExpiry.prototype.toString = function () {
                    return JSON.stringify({
                        ReadyDate: this.ReadyDate.toString("dd/MMM/yyyy hh:mm"), FreeStorageExpiryDate: this.FreeStorageExpiryDate.toString("dd/MMM/yyyy hh:mm"), DetentionExpiryDate: this.DetentionExpiryDate.toString("dd/MMM/yyyy hh:mm")
                    });
                }

                PlugInStartEndDateExpiry.prototype.toString = function () {
                    return JSON.stringify({
                        PlugInStartDate: this.PlugInStartDate.toString("dd/MMM/yyyy hh:mm"), PlugInEndDate: this.PlugInEndDate.toString("dd/MMM/yyyy hh:mm"), UnstuffingDate: this.UnstuffingDate.toString("dd/MMM/yyyy hh:mm")
                    });
                }

                ElectricityDemurrageSFAinspection.prototype.toString = function () {
                    return JSON.stringify({
                        ElectricityExpiryDate: this.ElectricityExpiryDate.toString("dd/MMM/yyyy hh:mm"), DemurrageExpiryDate: this.DemurrageExpiryDate.toString("dd/MMM/yyyy hh:mm"), SFAInspection: this.SFAInspectionValue, SFAInspectionDescr: this.SFAInspection
                    });
                }
                EqpGoodsCargoPackingCtnrSize.prototype.toString = function () {
                    return JSON.stringify({
                        EqpGoodsDescr: this.EqpGoodsDescr, CargoPackingType: this.CargoPackingType, ctnrsize: this.ctnrsize
                    }).replaceAll("'", "\\'");
                }

                var TripOption_BillOption = function (TripOption, TripType, BillOption, BillSizeType, TripOptionValue, TripTypeValue, BillOptionValue, BillSizeTypeValue) {
                    this.TripOption = TripOption;
                    this.TripType = TripType;
                    this.BillOption = BillOption;
                    this.BillSizeType = BillSizeType;
                    this.TripOptionValue = TripOptionValue;
                    this.TripTypeValue = TripTypeValue;
                    this.BillOptionValue = BillOptionValue;
                    this.BillSizeTypeValue = BillSizeTypeValue;
                }
                TripOption_BillOption.prototype.equals = function (tripOption_BillOption) {
                    if (this.TripOption === tripOption_BillOption.TripOption &&
                        this.TripType === tripOption_BillOption.TripType &&
                        this.BillOption === tripOption_BillOption.BillOption &&
                        this.BillSizeType === tripOption_BillOption.BillSizeType) {
                        return true;
                    }
                    return false;
                }
                TripOption_BillOption.prototype.toString = function () {
                    return JSON.stringify({
                        TripOption: this.TripOptionValue,
                        TripType: this.TripTypeValue,
                        BillOption: this.BillOptionValue,
                        BillSizeType: this.BillSizeTypeValue,
                        TripOptionText: this.TripOption,
                        TripTypeText: this.TripType,
                        BillOptionText: this.BillOption,
                        BillSizeTypeText: this.BillSizeType
                    }).replaceAll("'", "\\'");
                }
                var Detourreason = function (detourreason, detourreasonValue) {
                    this.detourreason = detourreason;
                    this.detourreasonValue = detourreasonValue;
                }
                Detourreason.prototype.equals = function (detourReason) {
                    if (this.detourreason === detourReason.detourreason) {
                        return true;
                    }
                    return false;
                }
                Detourreason.prototype.toString = function () {
                    return JSON.stringify({
                        detourreason: this.detourreasonValue,
                        detourreasonText: this.detourreason
                    }).replaceAll("'", "\\'");
                }
                var VehicleDriverTrailer = function (VehNo, Driver, TrailerNo, VehNoValue, DriverValue, TrailerNoValue) {
                    this.VehNo = VehNo;
                    this.Driver = Driver;
                    this.TrailerNo = TrailerNo;
                    this.VehNoText = VehNoValue;
                    this.DriverText = DriverValue;
                    this.TrailerNoText = TrailerNoValue;
                }
                VehicleDriverTrailer.prototype.equals = function (vehicleDriverTrailer) {
                    if (this.VehNo === vehicleDriverTrailer.VehNo &&
                        this.Driver === vehicleDriverTrailer.Driver &&
                        this.TrailerNo === vehicleDriverTrailer.TrailerNo) {
                        return true;
                    }
                    return false;
                }
                VehicleDriverTrailer.prototype.toString = function () {
                    return JSON.stringify({
                        VehNo: this.VehNoText, Driver: this.DriverText, TrailerNo: this.TrailerNoText,
                        VehNoText: this.VehNo, DriverText: this.Driver, TrailerNoText: this.TrailerNo
                    }).replaceAll("'", "\\'");
                }

                var DoubleStatus = function (Double, Status) {
                    this.Double = Double;
                    this.Status = Status;
                }
                DoubleStatus.prototype.equals = function (Double_Status) {
                    if (this.Double === Double_Status.Double) {
                        return true;
                    }
                    return false;
                }
                DoubleStatus.prototype.toString = function () {
                    return JSON.stringify({
                        Double: this.Double
                    });
                }

                function GetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === 'RequestedDetourDate') {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var requestedDetourDateElement = $telerik.findElement(Container, "RequestedDetourDateLbl");
                        var requestedDetourDate = null;
                        if (requestedDetourDateElement.innerText)
                            requestedDetourDate = moment(requestedDetourDateElement.innerText, "DD/MMM/YYYY HH:mm").toDate();
                        var isHidden = requestedDetourDateElement.classList.contains('hide');
                        args.set_value(new RequestedDetourDate(requestedDetourDate, isHidden));
                    }
                    if (args.get_columnUniqueName() === "Double/Status") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Double = $telerik.findElement(Container, "DoubleMountLbl").innerHTML;
                        var Status = $telerik.findElement(Container, "StatusLbl").innerHTML;
                        args.set_value(new DoubleStatus(Double, Status));
                    }
                    if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var TripType = $telerik.findElement(Container, "TripTypeLbl").innerHTML;
                        var TripOption = $telerik.findElement(Container, "TripOptionLbl").innerHTML;
                        var Billoption = $telerik.findElement(Container, "BillOptionLbl").innerHTML;
                        var BillSizeType = $telerik.findElement(Container, "BillSizeTypeLbl").innerHTML;
                        args.set_value(new TripOption_BillOption(TripOption, TripType, Billoption, BillSizeType));
                    }
                    if (args.get_columnUniqueName() === "DetourReason") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var detourreason = $telerik.findElement(Container, "DetourReasonLbl").innerHTML;
                        args.set_value(new Detourreason(detourreason));
                    }

                    if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerNo") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var VehNo = $telerik.findElement(Container, "VehicleLbl").innerHTML;
                        var Driver = $telerik.findElement(Container, "DriverLbl").innerHTML;
                        var TrailerNo = $telerik.findElement(Container, "TrailerNoLbl").innerHTML;
                        args.set_value(new VehicleDriverTrailer(VehNo, Driver, TrailerNo));
                    }
                    if (args.get_columnUniqueName() === "ShipmentTypeContainerSize") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Tpttype = $telerik.findElement(Container, "TransportTypeLbl").innerHTML;
                        var ShipmentType = $telerik.findElement(Container, "ShipmentTypeLbl").innerHTML;
                        var ContainerSize = $telerik.findElement(Container, "ContainerSizeLbl").innerHTML;
                        args.set_value(new ShipmentTypeContainerSize(Tpttype, ShipmentType, ContainerSize));
                    }
                    if (args.get_columnUniqueName() === "ContainerNoSealNoVGM") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ContainerNo = $telerik.findElement(Container, "ContainerNoLbl").innerHTML;
                        var SealNo = $telerik.findElement(Container, "SealNoLbl").innerHTML;
                        var VGM = $telerik.findElement(Container, "VGMLbl").innerHTML;
                        args.set_value(new ContainerNoSealNoVGM(ContainerNo, SealNo, VGM));
                    }
                    if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ContainerNo = $telerik.findElement(Container, "TripContainerNoLbl").innerHTML;
                        var SealNo = $telerik.findElement(Container, "TripSealNoLbl").innerHTML;
                        args.set_value(new TripContainerNoSealNo(ContainerNo, SealNo));
                    }
                    if (args.get_columnUniqueName() === "PermitNoBkRef") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var PermitNo = $telerik.findElement(Container, "PermitNoLbl").innerHTML;
                        var BookingRef = $telerik.findElement(Container, "BkRefLbl").innerHTML;
                        args.set_value(new PermitNoBkRef(PermitNo, BookingRef));
                    }
                    if (args.get_columnUniqueName() === "CarrierNamePortnetNo") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var CarrierName = $telerik.findElement(Container, "CarrierNameLbl").innerHTML;
                        var PortnetNo = $telerik.findElement(Container, "PortnetNoLbl").innerHTML;
                        args.set_value(new CarrierNamePortnetNo(CarrierName, PortnetNo));
                    }
                    if (args.get_columnUniqueName() === "WarehouseServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Addr = $telerik.findElement(Container, "WarehouseAddrLbl").innerHTML;
                        if (Addr.includes("&nbsp;")) {
                            Addr = $telerik.findElement(Container, "WarehouseAddrLbl").innerText;
                        }
                        var ServicePtDescr = $telerik.findElement(Container, "WarehouseServiceptDescr").innerHTML;
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                    }
                    if (args.get_columnUniqueName() === "DepotServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Addr = $telerik.findElement(Container, "DepotAddrLbl").innerHTML;
                        if (Addr.includes("&nbsp;")) {
                            Addr = $telerik.findElement(Container, "DepotAddrLbl").innerText;
                        }
                        var ServicePtDescr = $telerik.findElement(Container, "DepotServiceptDescr").innerHTML;
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                    }
                    if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Addr = $telerik.findElement(Container, "PickUpAddrLbl").innerHTML;
                        if (Addr.includes("&nbsp;")) {
                            Addr = $telerik.findElement(Container, "PickUpAddrLbl").innerText;
                        }
                        var ServicePtDescr = $telerik.findElement(Container, "PickUpServiceptDescr").innerHTML;
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                    }
                    if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Addr = $telerik.findElement(Container, "DropOffAddrLbl").innerHTML;
                        if (Addr.includes("&nbsp;")) {
                            Addr = $telerik.findElement(Container, "DropOffAddrLbl").innerText;
                        }
                        var ServicePtDescr = $telerik.findElement(Container, "DropOffServiceptDescr").innerHTML;
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                    }
                    if (args.get_columnUniqueName() === "BillOption1And2") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var BillOption1 = $telerik.findElement(Container, "BillOption1Lbl").innerHTML;
                        var BillOption2 = $telerik.findElement(Container, "BillOption2Lbl").innerHTML;
                        args.set_value(new BillOption(BillOption1, BillOption2));
                    }
                    if (args.get_columnUniqueName() === "RequiredDateAndTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ExpDate = $telerik.findElement(Container, "RequiredDateLbl").innerText;
                        var EqpRemarks = $telerik.findElement(Container, "RequiredTimeLbl").innerText;
                        args.set_value(new RequiredDateAndTime(ExpDate, EqpRemarks));
                    }
                    if (args.get_columnUniqueName() === "ReadyFreeStorageDentionExpiry") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ReadyDate = $telerik.findElement(Container, "ReadyDateLbl").innerText;
                        var FreeStorageExpiryDate = $telerik.findElement(Container, "FreeStorageExpiryLabel").innerText;
                        var DetentionExpiryDate = $telerik.findElement(Container, "DetentionExpiryLabel").innerText;
                        args.set_value(new ReadyFreeStorageDentionExpiry(ReadyDate, FreeStorageExpiryDate, DetentionExpiryDate));
                    }
                    if (args.get_columnUniqueName() === "PlugInStartEndDateExpiry") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var PlugInStartDate = $telerik.findElement(Container, "PlugInStartDateLbl").innerText;
                        var PlugInEndDate = $telerik.findElement(Container, "PlugInEndDateLabel").innerText;
                        var UnstuffingDate = $telerik.findElement(Container, "UnstuffingDateLabel").innerText;
                        args.set_value(new PlugInStartEndDateExpiry(PlugInStartDate, PlugInEndDate, UnstuffingDate));
                    }
                    if (args.get_columnUniqueName() === "ElectricityDemurrageSFAinspection") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ElectricityExpiryDate = $telerik.findElement(Container, "ElectricityExpiryLbl").innerText;
                        var DemurrageExpiryDate = $telerik.findElement(Container, "DemurrageExpiryLbl").innerText;
                        var SFAInspection = $telerik.findElement(Container, "SFAInspectionLbl").innerText;
                        args.set_value(new ElectricityDemurrageSFAinspection(ElectricityExpiryDate, DemurrageExpiryDate, SFAInspection));
                    }
                    if (args.get_columnUniqueName() === "EqpGoodsCargoPackingCtnrSize") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var EqpGoodsDescr = $telerik.findElement(Container, "SKULbl").innerText;
                        var CargoPackingType = $telerik.findElement(Container, "QuantityLbl").innerText;
                        var ctnrsize = $telerik.findElement(Container, "SizeLbl").innerText;
                        args.set_value(new EqpGoodsCargoPackingCtnrSize(EqpGoodsDescr, CargoPackingType, ctnrsize));
                    }
                }

                function SetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === 'RequestedDetourDate') {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        if (Value.RequestedDetourDate)
                            $telerik.findElement(Container, "RequestedDetourDateLbl").innerText = moment(Value.RequestedDetourDate).format("DD/MMM/YYYY HH:mm");
                        else
                            $telerik.findElement(Container, "RequestedDetourDateLbl").innerText = '';
                    }
                    if (args.get_columnUniqueName() === "Double/Status") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "DoubleMountLbl").innerHTML = Value.Double;
                    }
                    if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "TripTypeLbl").innerHTML = Value.TripType;
                        $telerik.findElement(Container, "TripOptionLbl").innerHTML = Value.TripOption;
                        $telerik.findElement(Container, "BillOptionLbl").innerHTML = Value.BillOption;
                        $telerik.findElement(Container, "BillSizeTypeLbl").innerHTML = Value.BillSizeType;
                    }
                    if (args.get_columnUniqueName() === "DetourReason") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "DetourReasonLbl").innerHTML = Value.detourreason;
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "VehicleLbl").innerHTML = Value.VehNo;
                        $telerik.findElement(Container, "DriverLbl").innerHTML = Value.Driver;
                        $telerik.findElement(Container, "TrailerNoLbl").innerHTML = Value.TrailerNo;
                    }
                    if (args.get_columnUniqueName() === "ShipmentTypeContainerSize") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "ShipmentTypeLbl").innerHTML = Value.ShipmentType;
                        $telerik.findElement(Container, "ContainerSizeLbl").innerHTML = Value.ContainerSize;
                    }
                    if (args.get_columnUniqueName() === "ContainerNoSealNoVGM") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "ContainerNoLbl").innerHTML = Value.ContainerNo;
                        $telerik.findElement(Container, "SealNoLbl").innerHTML = Value.SealNo;
                        $telerik.findElement(Container, "VGMLbl").innerHTML = Value.VGM;
                    }
                    if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "TripContainerNoLbl").innerHTML = Value.ContainerNo;
                        $telerik.findElement(Container, "TripSealNoLbl").innerHTML = Value.SealNo;
                    }
                    if (args.get_columnUniqueName() === "PermitNoBkRef") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "PermitNoLbl").innerHTML = Value.PermitNo;
                        $telerik.findElement(Container, "BkRefLbl").innerHTML = Value.BookingRef;
                    }
                    if (args.get_columnUniqueName() === "CarrierNamePortnetNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "CarrierNameLbl").innerHTML = Value.CarrierName;
                        $telerik.findElement(Container, "PortnetNoLbl").innerHTML = Value.PortnetNo;
                    }
                    if (args.get_columnUniqueName() === "WarehouseServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "WarehouseServiceptDescr").innerHTML = Value.ServicePtDescr;
                        $telerik.findElement(Container, "WarehouseAddrLbl").innerHTML = Value.Addr;
                    }
                    if (args.get_columnUniqueName() === "DepotServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "DepotServiceptDescr").innerHTML = Value.ServicePtDescr;
                        $telerik.findElement(Container, "DepotAddrLbl").innerHTML = Value.Addr;
                    }
                    if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "PickUpServiceptDescr").innerHTML = Value.ServicePtDescr;
                        $telerik.findElement(Container, "PickUpAddrLbl").innerHTML = Value.Addr;
                    }
                    if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "DropOffServiceptDescr").innerHTML = Value.ServicePtDescr;
                        $telerik.findElement(Container, "DropOffAddrLbl").innerHTML = Value.Addr;
                    }
                    if (args.get_columnUniqueName() === "BillOption1And2") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "BillOption1Lbl").innerHTML = Value.BillOption1;
                        $telerik.findElement(Container, "BillOption2Lbl").innerHTML = Value.BillOption2;
                    }
                    if (args.get_columnUniqueName() === "RequiredDateAndTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Value = args.get_value();
                        $telerik.findElement(Container, "RequiredDateLbl").innerHTML = Value.ExpDate;
                        $telerik.findElement(Container, "RequiredTimeLbl").innerHTML = Value.EqpRemarks;
                    }
                    if (args.get_columnUniqueName() === "ReadyFreeStorageDentionExpiry") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Value = args.get_value();
                        $telerik.findElement(Container, "ReadyDateLbl").innerHTML = Value.ReadyDate;
                        $telerik.findElement(Container, "FreeStorageExpiryLabel").innerHTML = Value.FreeStorageExpiryDate;
                        $telerik.findElement(Container, "DetentionExpiryLabel").innerHTML = Value.DetentionExpiryDate;
                    }
                    if (args.get_columnUniqueName() === "PlugInStartEndDateExpiry") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Value = args.get_value();
                        $telerik.findElement(Container, "PlugInStartDateLbl").innerHTML = Value.PlugInStartDate;
                        $telerik.findElement(Container, "PlugInEndDateLabel").innerHTML = Value.PlugInEndDate;
                        $telerik.findElement(Container, "UnstuffingDateLabel").innerHTML = Value.UnstuffingDate;
                    }
                    if (args.get_columnUniqueName() === "ElectricityDemurrageSFAinspection") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Value = args.get_value();
                        $telerik.findElement(Container, "ElectricityExpiryLbl").innerHTML = Value.ElectricityExpiryDate;
                        $telerik.findElement(Container, "DemurrageExpiryLbl").innerHTML = Value.DemurrageExpiryDate;
                        $telerik.findElement(Container, "SFAInspectionLbl").innerHTML = Value.SFAInspection;
                    }
                    if (args.get_columnUniqueName() === "EqpGoodsCargoPackingCtnrSize") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "SKULbl").innerHTML = Value.EqpGoodsDescr;
                        $telerik.findElement(Container, "QuantityLbl").innerHTML = Value.CargoPackingType;
                        $telerik.findElement(Container, "SizeLbl").innerHTML = Value.ctnrsize;
                    }
                }

                function GetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === 'RequestedDetourDate') {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            RequestedDetourDatePickerElement = $telerik.findControl(Container, "RequestedDetourDatePicker");
                        var requestedDetourDate = RequestedDetourDatePickerElement.get_selectedDate();
                        args.set_value(new RequestedDetourDate(requestedDetourDate, !RequestedDetourDatePickerElement.get_enabled()));
                    }
                    if (args.get_columnUniqueName() === "Double/Status") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Double = $telerik.findControl(Container, "DoubleMountTxt").get_value();
                        args.set_value(new DoubleStatus(Double, null));
                    }
                    if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            TripType = $telerik.findControl(Container, "TripTypeDDL").get_selectedItem().get_text(),
                            TripTypeValue = $telerik.findControl(Container, "TripTypeDDL").get_selectedItem().get_value(),
                            TripOption = $telerik.findControl(Container, "TripOptionDDL").get_selectedItem().get_text(),
                            TripOptionValue = $telerik.findControl(Container, "TripOptionDDL").get_selectedItem().get_value(),
                            Billoption = $telerik.findControl(Container, "TripBillOptionDDL").get_selectedItem().get_text(),
                            BillOptionValue = $telerik.findControl(Container, "TripBillOptionDDL").get_selectedItem().get_value(),
                            BillSizeType = $telerik.findControl(Container, "BillSizeTypeDDL").get_selectedItem().get_text(),
                            BillSizeTypeValue = $telerik.findControl(Container, "BillSizeTypeDDL").get_selectedItem().get_value();
                        args.set_value(new TripOption_BillOption(TripOption, TripType, Billoption, BillSizeType, TripOptionValue, TripTypeValue, BillOptionValue, BillSizeTypeValue));
                    }
                    if (args.get_columnUniqueName() === "DetourReason") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            detourreason = $telerik.findControl(Container, "DetourReasonDDL").get_selectedItem().get_text(),
                            detourreasonValue = $telerik.findControl(Container, "DetourReasonDDL").get_selectedItem().get_value();
                        args.set_value(new Detourreason(detourreason, detourreasonValue));
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            VehNo = $telerik.findControl(Container, "VehicleCombo").get_text(),
                            VehNoValue = ($telerik.findControl(Container, "VehicleCombo").get_value().split("|"))[0],
                            Driver = $telerik.findControl(Container, "DriverCombo").get_text(),
                            DriverValue = $telerik.findControl(Container, "DriverCombo").get_value(),
                            TrailerNo = $telerik.findControl(Container, "TrailerNoCombo").get_text(),
                            TrailerNoValue = $telerik.findControl(Container, "TrailerNoCombo").get_value();
                        args.set_value(new VehicleDriverTrailer(VehNo, Driver, TrailerNo, VehNoValue, DriverValue, TrailerNoValue));
                    }
                    if (args.get_columnUniqueName() === "ShipmentTypeContainerSize") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            ShipmentType = $telerik.findControl(Container, "ShipmentTypeDDL").get_selectedItem().get_text(),
                            ShipmentTypeValue = $telerik.findControl(Container, "ShipmentTypeDDL").get_selectedItem().get_value(),
                            ContainerSize = $telerik.findControl(Container, "ContainerSizeDDL").get_selectedItem().get_text(),
                            ContainerSizeValue = $telerik.findControl(Container, "ContainerSizeDDL").get_selectedItem().get_value();
                        args.set_value(new ShipmentTypeContainerSize(null, ShipmentType, ContainerSize, ShipmentTypeValue, ContainerSizeValue));
                    }
                    if (args.get_columnUniqueName() === "ContainerNoSealNoVGM") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            ContainerNo = $telerik.findControl(Container, "ContainerNoTxt").get_value(),
                            SealNo = $telerik.findControl(Container, "SealNoTxt").get_value(),
                            VGM = $telerik.findControl(Container, "VerifiedGrossMassTxt").get_value();
                        args.set_value(new ContainerNoSealNoVGM(ContainerNo, SealNo, VGM));
                    }
                    if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            ContainerNo = $telerik.findControl(Container, "TripContainerNoTxt").get_value(),
                            SealNo = $telerik.findControl(Container, "TripSealNoTxt").get_value();
                        args.set_value(new TripContainerNoSealNo(ContainerNo, SealNo));
                    }
                    if (args.get_columnUniqueName() === "PermitNoBkRef") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            PermitNo = $telerik.findControl(Container, "PermitNoTxt").get_value(),
                            BookingRef = $telerik.findControl(Container, "BkRefTxt").get_value();
                        args.set_value(new PermitNoBkRef(PermitNo, BookingRef));
                    }
                    if (args.get_columnUniqueName() === "CarrierNamePortnetNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            CarrierName = $telerik.findControl(Container, "CarrierNameTxt").get_value(),
                            PortnetNo = $telerik.findControl(Container, "PortnetNoTxt").get_value();
                        args.set_value(new CarrierNamePortnetNo(CarrierName, PortnetNo));
                    }
                    if (args.get_columnUniqueName() === "DepotServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "DepotAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "DepotServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "DepotServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }
                    if (args.get_columnUniqueName() === "WarehouseServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "WarehouseAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "WarehouseServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "WarehouseServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }
                    if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "PickUpAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "PickUpServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "PickUpServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }
                    if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "DropOffAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "DropOffServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "DropOffServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }
                    if (args.get_columnUniqueName() === "BillOption1And2") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            BillOption1 = $telerik.findControl(Container, "BillOption1DDL").get_selectedItem().get_text(),
                            BillOption1Value = $telerik.findControl(Container, "BillOption1DDL").get_selectedItem().get_value(),
                            BillOption2 = $telerik.findControl(Container, "BillOption2DDL").get_selectedItem().get_text(),
                            BillOption2Value = $telerik.findControl(Container, "BillOption2DDL").get_selectedItem().get_value();
                        args.set_value(new BillOption(BillOption1, BillOption2, BillOption1Value, BillOption2Value));
                    }
                    if (args.get_columnUniqueName() === "RequiredDateAndTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var RequiredDatePicker = $telerik.findControl(Container, "RequiredDatePicker");
                        var ExpDate = RequiredDatePicker.get_dateInput().get_value();
                        var EqpRemarks = $telerik.findControl(Container, "RequiredTimeTxt").get_value();
                        args.set_value(new RequiredDateAndTime(ExpDate, EqpRemarks));
                    }
                    if (args.get_columnUniqueName() === "ReadyFreeStorageDentionExpiry") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ReadyDateTimePicker = $telerik.findControl(Container, "ReadyDateTimePicker");
                        var ReadyDate = ReadyDateTimePicker.get_dateInput().get_value();
                        var FreeStoreRentExpiryDateTimePicker = $telerik.findControl(Container, "FreeStoreRentExpiryDateTimePicker");
                        var FreeStorageExpiryDate = FreeStoreRentExpiryDateTimePicker.get_dateInput().get_value();
                        var DetentionExpiryDateTimePicker = $telerik.findControl(Container, "DetentionExpiryDateTimePicker");
                        var DetentionExpiryDate = DetentionExpiryDateTimePicker.get_dateInput().get_value();
                        args.set_value(new ReadyFreeStorageDentionExpiry(ReadyDate, FreeStorageExpiryDate, DetentionExpiryDate));
                    }
                    if (args.get_columnUniqueName() === "PlugInStartEndDateExpiry") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var PlugInStartDateTimePicker = $telerik.findControl(Container, "PlugInStartDateTimePicker");
                        var PlugInStartDate = PlugInStartDateTimePicker.get_dateInput().get_value();
                        var PlugInEndDateTimePicker = $telerik.findControl(Container, "PlugInEndDateTimePicker");
                        var PlugInEndDate = PlugInEndDateTimePicker.get_dateInput().get_value();
                        var UnstuffingDateTimePicker = $telerik.findControl(Container, "UnstuffingDateTimePicker");
                        var UnstuffingDate = UnstuffingDateTimePicker.get_dateInput().get_value();
                        args.set_value(new PlugInStartEndDateExpiry(PlugInStartDate, PlugInEndDate, UnstuffingDate));
                    }
                    if (args.get_columnUniqueName() === "ElectricityDemurrageSFAinspection") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ElectricityExpiryDateTimePicker = $telerik.findControl(Container, "ElectricityExpiryDateTimePicker");
                        var ElectricityExpiryDate = ElectricityExpiryDateTimePicker.get_dateInput().get_value();
                        var DemurrageExpiryDateTimePicker = $telerik.findControl(Container, "DemurrageExpiryDateTimePicker");
                        var DemurrageExpiryDate = DemurrageExpiryDateTimePicker.get_dateInput().get_value();
                        SFAInspection = $telerik.findControl(Container, "SFAInspectionDDL").get_selectedItem().get_text(),
                            SFAInspectionValue = $telerik.findControl(Container, "SFAInspectionDDL").get_selectedItem().get_value(),
                            args.set_value(new ElectricityDemurrageSFAinspection(ElectricityExpiryDate, DemurrageExpiryDate, SFAInspection, SFAInspectionValue));
                    }
                    if (args.get_columnUniqueName() === "EqpGoodsCargoPackingCtnrSize") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            EqpGoodsDescr = $telerik.findControl(Container, "SKUTxt").get_value(),
                            CargoPackingType = $telerik.findControl(Container, "QuantityTxt").get_value();
                        ctnrsize = $telerik.findControl(Container, "SizeTxt").get_value();
                        args.set_value(new EqpGoodsCargoPackingCtnrSize(EqpGoodsDescr, CargoPackingType, ctnrsize));
                    }
                }

                function SetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === 'RequestedDetourDate') {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        var RequestedDetourDatePickerElement = $telerik.findControl(Container, "RequestedDetourDatePicker");
                        RequestedDetourDatePickerElement.set_selectedDate(Value.RequestedDetourDate);
                        RequestedDetourDatePickerElement.set_enabled(!Value.isHidden);
                    }
                    if (args.get_columnUniqueName() === "Double/Status") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "StatusTxt").set_value(Value.Status);
                        $telerik.findControl(Container, "DoubleMountTxt").set_value(Value.Double);
                    }
                    if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "TripTypeDDL").findItemByText(Value.TripType).select();
                        $telerik.findControl(Container, "TripOptionDDL").findItemByText(Value.TripOption).select();
                        $telerik.findControl(Container, "TripBillOptionDDL").findItemByText(Value.BillOption).select();
                        $telerik.findControl(Container, "BillSizeTypeDDL").findItemByText(Value.BillSizeType).select();
                    }
                    if (args.get_columnUniqueName() === "DetourReason") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "DetourReasonDDL").findItemByText(Value.detourreason).select();
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        if ($telerik.findControl(Container, "VehicleCombo") && $telerik.findControl(Container, "VehicleCombo").findItemByText(Value.VehNo))
                            $telerik.findControl(Container, "VehicleCombo").findItemByText(Value.VehNo).select();
                        else
                            $telerik.findControl(Container, "VehicleCombo").set_text(Value.VehNo);

                        if ($telerik.findControl(Container, "DriverCombo") && $telerik.findControl(Container, "DriverCombo").findItemByText(Value.Driver))
                            $telerik.findControl(Container, "DriverCombo").findItemByText(Value.Driver).select();
                        else
                            $telerik.findControl(Container, "DriverCombo").set_text(Value.Driver);

                        if ($telerik.findControl(Container, "TrailerNoCombo") && $telerik.findControl(Container, "TrailerNoCombo").findItemByText(Value.TrailerNo))
                            $telerik.findControl(Container, "TrailerNoCombo").findItemByText(Value.TrailerNo).select();
                        else
                            $telerik.findControl(Container, "TrailerNoCombo").set_text(Value.TrailerNo);
                    }
                    if (args.get_columnUniqueName() === "ShipmentTypeContainerSize") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findControl(Container, "TransportTypeTxt").set_value(Value.Tpttype);
                        $telerik.findControl(Container, "ShipmentTypeDDL").findItemByText(Value.ShipmentType).select();
                        $telerik.findControl(Container, "ContainerSizeDDL").findItemByText(Value.ContainerSize).select();
                    }
                    if (args.get_columnUniqueName() === "ContainerNoSealNoVGM") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "ContainerNoTxt").set_value(Value.ContainerNo);
                        $telerik.findControl(Container, "SealNoTxt").set_value(Value.SealNo);
                        $telerik.findControl(Container, "VerifiedGrossMassTxt").set_value(Value.VGM);
                    }
                    if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "TripContainerNoTxt").set_value(Value.ContainerNo);
                        $telerik.findControl(Container, "TripSealNoTxt").set_value(Value.SealNo);
                    }
                    if (args.get_columnUniqueName() === "PermitNoBkRef") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "PermitNoTxt").set_value(Value.PermitNo);
                        $telerik.findControl(Container, "BkRefTxt").set_value(Value.BookingRef);
                    }
                    if (args.get_columnUniqueName() === "CarrierNamePortnetNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "CarrierNameTxt").set_value(Value.CarrierName);
                        $telerik.findControl(Container, "PortnetNoTxt").set_value(Value.PortnetNo);
                    }
                    if (args.get_columnUniqueName() === "DepotServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "DepotAddrTxt").set_value(Value.Addr);

                        if ($telerik.findControl(Container, "DepotServicePtCombo") && $telerik.findControl(Container, "DepotServicePtCombo").findItemByText(Value.ServicePtDescr))
                            $telerik.findControl(Container, "DepotServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                        else
                            $telerik.findControl(Container, "DepotServicePtCombo").set_text(Value.ServicePtDescr);
                    }
                    if (args.get_columnUniqueName() === "WarehouseServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "WarehouseAddrTxt").set_value(Value.Addr);

                        if ($telerik.findControl(Container, "WarehouseServicePtCombo") && $telerik.findControl(Container, "WarehouseServicePtCombo").findItemByText(Value.ServicePtDescr))
                            $telerik.findControl(Container, "WarehouseServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                        else
                            $telerik.findControl(Container, "WarehouseServicePtCombo").set_text(Value.ServicePtDescr);
                    }
                    if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "PickUpAddrTxt").set_value(Value.Addr);

                        if ($telerik.findControl(Container, "PickUpServicePtCombo") && $telerik.findControl(Container, "PickUpServicePtCombo").findItemByText(Value.ServicePtDescr))
                            $telerik.findControl(Container, "PickUpServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                        else
                            $telerik.findControl(Container, "PickUpServicePtCombo").set_text(Value.ServicePtDescr);
                    }
                    if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "DropOffAddrTxt").set_value(Value.Addr);

                        if ($telerik.findControl(Container, "DropOffServicePtCombo") && $telerik.findControl(Container, "DropOffServicePtCombo").findItemByText(Value.ServicePtDescr))
                            $telerik.findControl(Container, "DropOffServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                        else
                            $telerik.findControl(Container, "DropOffServicePtCombo").set_text(Value.ServicePtDescr);
                    }

                    if (args.get_columnUniqueName() === "BillOption1And2") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "BillOption1DDL").findItemByText(Value.BillOption1).select();
                        $telerik.findControl(Container, "BillOption2DDL").findItemByText(Value.BillOption2).select();
                    }
                    if (args.get_columnUniqueName() === "RequiredDateAndTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Value = args.get_value();
                        var RequiredDatePicker = $telerik.findControl(Container, "RequiredDatePicker");
                        RequiredDatePicker.get_dateInput().set_value(Value.ExpDate);
                        $telerik.findControl(Container, "RequiredTimeTxt").set_value(Value.EqpRemarks);
                    }
                    if (args.get_columnUniqueName() === "ReadyFreeStorageDentionExpiry") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Value = args.get_value();
                        var ReadyDateTimePicker = $telerik.findControl(Container, "ReadyDateTimePicker");
                        ReadyDateTimePicker.get_dateInput().set_value(Value.ReadyDate);
                        var FreeStoreRentExpiryDateTimePicker = $telerik.findControl(Container, "FreeStoreRentExpiryDateTimePicker");
                        FreeStoreRentExpiryDateTimePicker.get_dateInput().set_value(Value.FreeStorageExpiryDate);
                        var DetentionExpiryDateTimePicker = $telerik.findControl(Container, "DetentionExpiryDateTimePicker");
                        DetentionExpiryDateTimePicker.get_dateInput().set_value(Value.DetentionExpiryDate);
                    }
                    if (args.get_columnUniqueName() === "PlugInStartEndDateExpiry") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Value = args.get_value();
                        var PlugInStartDateTimePicker = $telerik.findControl(Container, "PlugInStartDateTimePicker");
                        PlugInStartDateTimePicker.get_dateInput().set_value(Value.PlugInStartDate);
                        var PlugInEndDateTimePicker = $telerik.findControl(Container, "PlugInEndDateTimePicker");
                        PlugInEndDateTimePicker.get_dateInput().set_value(Value.PlugInEndDate);
                        var UnstuffingDateTimePicker = $telerik.findControl(Container, "UnstuffingDateTimePicker");
                        UnstuffingDateTimePicker.get_dateInput().set_value(Value.UnstuffingDate);
                    }
                    if (args.get_columnUniqueName() === "ElectricityDemurrageSFAinspection") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Value = args.get_value();
                        var ElectricityExpiryDateTimePicker = $telerik.findControl(Container, "ElectricityExpiryDateTimePicker");
                        ElectricityExpiryDateTimePicker.get_dateInput().set_value(Value.ElectricityExpiryDate);
                        var DemurrageExpiryDateTimePicker = $telerik.findControl(Container, "DemurrageExpiryDateTimePicker");
                        DemurrageExpiryDateTimePicker.get_dateInput().set_value(Value.DemurrageExpiryDate);
                        $telerik.findControl(Container, "SFAInspectionDDL").findItemByText(Value.SFAInspection).select();
                    }
                    if (args.get_columnUniqueName() === "EqpGoodsCargoPackingCtnrSize") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "SKUTxt").set_value(Value.EqpGoodsDescr);
                        $telerik.findControl(Container, "QuantityTxt").set_value(Value.CargoPackingType);
                        $telerik.findControl(Container, "SizeTxt").set_value(Value.ctnrsize);
                    }
                }
                <%--End Region : Migrate Two ItemTemplate into One Column --%>
                <%--Start Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
                function DepotServicePt_DropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var DepotServicePt = $telerik.findControl(currentRow, "DepotServicePtCombo").get_value();
                    if (DepotServicePt != null && DepotServicePt != "") {
                        var DepotServicePtAddrPair = DepotServicePt.split("|");
                        $telerik.findControl(currentRow, "DepotAddrTxt").set_value(DepotServicePtAddrPair[1]);
                    }
                }

                function WarehouseServicePt_DropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var WarehouseServicePt = $telerik.findControl(currentRow, "WarehouseServicePtCombo").get_value();
                    if (WarehouseServicePt != null && WarehouseServicePt != "") {
                        var WarehouseServicePtAddrPair = WarehouseServicePt.split("|");
                        $telerik.findControl(currentRow, "WarehouseAddrTxt").set_value(WarehouseServicePtAddrPair[1]);
                    }
                }

                function PickUpServicePt_DropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var PickUpServicePt = $telerik.findControl(currentRow, "PickUpServicePtCombo").get_value();
                    if (PickUpServicePt != null && PickUpServicePt != "") {
                        var PickUpServicePtAddrPair = PickUpServicePt.split("|");
                        $telerik.findControl(currentRow, "PickUpAddrTxt").set_value(PickUpServicePtAddrPair[1]);
                    }
                }

                function DropOffServicePt_DropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var DropOffServicePt = $telerik.findControl(currentRow, "DropOffServicePtCombo").get_value();

                    if (DropOffServicePt != null && DropOffServicePt != "") {
                        var DropOffServicePtAddrPair = DropOffServicePt.split("|");
                        $telerik.findControl(currentRow, "DropOffAddrTxt").set_value(DropOffServicePtAddrPair[1]);
                    }
                }

                function VehicleList_DropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var VehicleList = $telerik.findControl(currentRow, "VehicleCombo").get_value();

                    if (VehicleList != null && VehicleList != "") {
                        var VehNoDriverPair = VehicleList.split("|");
                        var DefaultDriverId = VehNoDriverPair[1];
                        var DefaultDriverName = VehNoDriverPair[2];

                        if ($telerik.findControl(currentRow, "DriverCombo") && $telerik.findControl(currentRow, "DriverCombo").findItemByText(DefaultDriverName))
                            $telerik.findControl(currentRow, "DriverCombo").findItemByText(DefaultDriverName).select();
                        else
                            $telerik.findControl(currentRow, "DriverCombo").set_text(DefaultDriverName);
                    }
                    else {
                        $telerik.findControl(currentRow, "DriverCombo").set_text("");
                    }
                }
                <%--End Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
