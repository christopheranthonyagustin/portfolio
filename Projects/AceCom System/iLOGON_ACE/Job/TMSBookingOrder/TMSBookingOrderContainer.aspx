<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderContainer.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderContainer" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TMSBookingOrderForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    <style type="text/css">
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
</head>
<body>
    <form id="form1" runat="server">
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

        <telerik:RadWindowManager runat="server" ID="RadWindowManager" EnableViewState="false">
        </telerik:RadWindowManager>

        <telerik:RadTabStrip runat="server" ID="RadTabStrip" MultiPageID="RadMultiPage" AutoPostBack="true" OnTabClick="RadTabStrip_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Id="GeneralTab" Text="General" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogDetlTab" Text="Log" Value="30" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
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
                                <asp:Button ID="ChangeJobTypeBtn" runat="server" Text="Change JobType" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                    ToolTip="ChangeJobType" CssClass="LongLabelWhite" OnClick="ChangeJobTypeBtn_Click" />
                                &nbsp;
                                <asp:Button ID="ReuseBtn" runat="server" Text="Reuse" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                    CssClass="white" OnClick="ReuseBtn_Click" />
                                &nbsp;
                                 <asp:Button ID="TransferBtn" runat="server" Text="Transfer to Job" CausesValidation="false"
                                     CssClass="LongLabelWhite" OnClick="TransferBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                  <asp:Button ID="PopToGR" runat="server" Text="Populate GR" CausesValidation="false"
                                      CssClass="LongLabelGreen" OnClick="PopToGR_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                  <asp:Button ID="PopToGI" runat="server" Text="Populate GI" CausesValidation="false"
                                      CssClass="LongLabelGreen" OnClick="PopToGI_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
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
                    <asp:UpdatePanel ID="FormCtnrUpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl_Ctnr" runat="server" Visible="true"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel_AddCtn" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <telerik:RadGrid ID="ResultDGAddCtnr" runat="server" AutoGenerateColumns="false" GridLines="None"
                                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                            AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDGAddCtnr_NeedDataSource">
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
                                                            <telerik:RadTextBox ID="PortnetNoTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PortnetNo") %>' Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Depot" HeaderStyle-HorizontalAlign="Center" UniqueName="Depot"
                                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="DepotCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                DataValueField="Item" DataTextField="Descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "Deppot").ToString())%>'
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
                                                                DataValueField="Item" DataTextField="Descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "Warehouse").ToString())%>'
                                                                OnClientSelectedIndexChanged="WarehouseServicePtCombo_SelectedIndexChanged">
                                                            </telerik:RadComboBox>
                                                            <br />
                                                            <telerik:RadTextBox ID="WarehouseAddTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "WarehouseAdd") %>'>
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Port" HeaderStyle-HorizontalAlign="Center" UniqueName="Port"
                                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="PortCombo" runat="server" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                DataValueField="Item" DataTextField="Descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "Port").ToString())%>'
                                                                OnClientSelectedIndexChanged="PortServicePtCombo_SelectedIndexChanged">
                                                            </telerik:RadComboBox>
                                                            <br />
                                                            <telerik:RadTextBox ID="PortAddTxt" runat="server" Width="140px" Skin="WebBlue" TextMode="MultiLine"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "PortAdd") %>'>
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="PickUp" HeaderStyle-HorizontalAlign="Center" UniqueName="PickUp"
                                                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <telerik:RadComboBox ID="PickUpCombo" runat="server" ExpandDirection="Up" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                DataValueField="Item" DataTextField="Descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "PickUp").ToString())%>'
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
                                                                DataValueField="Item" DataTextField="Descr" DataSource='<%# ServicePtDS%>' Width="140px" DropDownAutoWidth="Enabled"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "DropOff").ToString())%>'
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
                            AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true"
                            OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand" AllowPaging="true" CssClass="RadGrid_Office2007"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                    OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" OnBatchEditOpened="BatchEditOpened" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBCId" Name="ParentGrid" PageSize="50" ItemStyle-HorizontalAlign="Left" Width="100%"
                                EditMode="Batch" CommandItemDisplay="TopAndBottom">
                                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="editicon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
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
                                    <telerik:GridBoundColumn DataField="TripCount" UniqueName="TripCount" HeaderText="TripCount" ItemStyle-Width="145px" HeaderStyle-Width="145px" AllowFiltering="true" AutoPostBackOnFilter="true" ReadOnly="true"></telerik:GridBoundColumn>
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
                                            <telerik:RadDropDownList ID="ContainerSizeDDL" runat="server" Skin="Sunset" Width="140px" DropDownWidth="140px" OnLoad="ContainerSizeDDL_Load"></telerik:RadDropDownList>
                                            &nbsp;
                                            <asp:RequiredFieldValidator ID="ContainerSizeReqVal" runat="server" ControlToValidate="ContainerSizeDDL" ErrorMessage="*" ForeColor="Red" Font-Size="Larger" Font-Bold="true" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ContainerNoSealNoVGM" AllowFiltering="true" HeaderStyle-Width="170px" ItemStyle-Width="170px" DataField="ctnrno" SortExpression="ctnrno" AutoPostBackOnFilter="true">
                                        <HeaderTemplate>
                                            ContainerNo
                                                    <br />
                                            SealNo
                                                    <br />
                                            VerifiedGrossMass(VGM)
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
                                    <telerik:GridTemplateColumn UniqueName="DepotServicePtAndAddress" HeaderText="Depot <br/> Depot Address " HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="DepotServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre")  ?  DataBinder.Eval(Container.DataItem, "DepotServicePtDescr") : "" %>' Style="display: none;" ></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="DepotAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre") ? DataBinder.Eval(Container.DataItem, "DepotAddr") : "" %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="DepotServicePtCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="DepotServicePt_DropDownClosed"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtCombo_ItemsRequested"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="DepotAddrTxt" TextMode="MultiLine" Rows="3" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "DepotAddr")%>'>
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="WarehouseServicePtAndAddress" HeaderText="Warehouse <br/> Warehouse Address " HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="WarehouseServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre") ? DataBinder.Eval(Container.DataItem, "WarehouseServicePtDescr") : "" %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="WarehouseAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre") ? DataBinder.Eval(Container.DataItem, "WarehouseAddr") : "" %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="WarehouseServicePtCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="WarehouseServicePt_DropDownClosed"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtCombo_ItemsRequested"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="WarehouseAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PortServicePtAndAddress" HeaderText="Port <br/> Port Address " HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="PortServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre") ? DataBinder.Eval(Container.DataItem, "PortServicePtDescr") : "" %>' Style="display: none;"></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="PortAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") || DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre") ? DataBinder.Eval(Container.DataItem, "PortAddr") : "" %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="PortServicePtCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="PortServicePt_DropDownClosed"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtCombo_ItemsRequested"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="PortAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUpServicePtAndAddress" HeaderText="PickUp <br/> PickUp Address" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="PickUpServiceptDescr" Text='<%# ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre") ? DataBinder.Eval(Container.DataItem, "FrServicePtDescr") : ""%>' Style="display: none;"></asp:Label>
                                            <asp:Label runat="server" ID="PickUpAddrLbl" Text='<%# ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre") ? DataBinder.Eval(Container.DataItem, "fraddr") : ""%>'></asp:Label>
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
                                    <telerik:GridTemplateColumn UniqueName="DropOffServicePtAndAddress" HeaderText="DropOff <br/> DropOff Address " AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="DropOffServiceptDescr" Text='<%# ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre") ? DataBinder.Eval(Container.DataItem, "ToServicePtDescr") : "" %>' Style="display: none;"></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="DropOffAddrLbl" Text='<%# ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Contains("round") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("ce-escort-direct") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("direct-escort-re") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("cedirect") && ! DataBinder.Eval(Container.DataItem, "TptType").ToString().ToLower().Equals("directre") ? DataBinder.Eval(Container.DataItem, "ToAddr") : "" %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="DropOffServicePtCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="DropOffServicePt_DropDownClosed"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtCombo_ItemsRequested" CausesValidation="false"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="DropOffAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
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
                                            <asp:Label runat="server" ID="ReadyDateLbl" Text='<%# Eval("readydate", "{0:dd/MMM/yyyy hh:mm}") %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="FreeStorageExpiryLabel" Text='<%# Eval("StoreRentExpiryDate", "{0:dd/MMM/yyyy hh:mm}") %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="DetentionExpiryLabel" Text='<%# Eval("DetentionExpiryDate", "{0:dd/MMM/yyyy hh:mm}") %>'></asp:Label>
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
                                    <telerik:GridTemplateColumn UniqueName="CtnrDescr" HeaderText="ContainerDescription" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:}",Eval("Descr")) %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="CtnrDescrTxt" TextMode="MultiLine" Width="140px" Height="100px">
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
                                    <telerik:GridTemplateColumn UniqueName="ImportAndReturnDate" HeaderText="Import Date <br/> Return Date" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("ImportDate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("ReturnDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CollectionAndExportDate" HeaderText="Collection Date <br/> Export Date" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("CollectionDate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("ExportDate")) %>
                                        </ItemTemplate>
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
            <%--<telerik:RadPageView runat="server" Height="700px" ID="CargoRadPageView">
            </telerik:RadPageView>--%>
            <telerik:RadPageView runat="server" Height="700px" ID="LogDetlRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
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
            document.location.href = document.location.href;
        }
    </script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            //ShipmentTypeContainerSize
            var ShipmentTypeContainerSize = function (Tpttype, ShipmentType, ContainerSize, ShipmentTypeValue, ContainerSizeValue) {
                this.Tpttype = Tpttype;
                this.ShipmentType = ShipmentType;
                this.ShipmentTypeValue = ShipmentTypeValue;
                this.ContainerSize = ContainerSize;
                this.ContainerSizeValue = ContainerSizeValue;
            }
            ShipmentTypeContainerSize.prototype.equals = function (ShipmenttypeContainersize) {
                if (this.ShipmentType === ShipmenttypeContainersize.ShipmentType && this.ContainerSize === ShipmenttypeContainersize.ContainerSize) {
                    return true;
                }
                return false;
            }
            ShipmentTypeContainerSize.prototype.toString = function () {
                return JSON.stringify({
                    ShipmentType: this.ShipmentTypeValue, ShipmentTypeDescr: this.ShipmentType,
                    ContainerSize: this.ContainerSizeValue, ContainerSizeDescr: this.ContainerSize
                });
            }

            //ContainerNoSealNoVGM
            var ContainerNoSealNoVGM = function (ContainerNo, SealNo, VGM) {
                this.ContainerNo = ContainerNo;
                this.SealNo = SealNo;
                this.VGM = VGM;
            }
            ContainerNoSealNoVGM.prototype.equals = function (CSV) {
                if (this.ContainerNo === CSV.ContainerNo && this.SealNo === CSV.SealNo && this.VGM === CSV.VGM) {
                    return true;
                }
                return false;
            }
            ContainerNoSealNoVGM.prototype.toString = function () {
                return JSON.stringify({
                    ContainerNo: this.ContainerNo, SealNo: this.SealNo, VGM: this.VGM,
                    ContainerSize: this.ContainerSizeValue, ContainerSizeDescr: this.ContainerSize
                });
            }

            //PermitNoBkRef
            var PermitNoBkRef = function (PermitNo, BookingRef) {
                this.PermitNo = PermitNo;
                this.BookingRef = BookingRef;
            }
            PermitNoBkRef.prototype.equals = function (PBC) {
                if (this.PermitNo === PBC.PermitNo && this.BookingRef === PBC.BookingRef) {
                    return true;
                }
                return false;
            }
            PermitNoBkRef.prototype.toString = function () {
                return JSON.stringify({
                    PermitNo: this.PermitNo, BookingRef: this.BookingRef
                });
            }

            //CarrierNamePortnetNo
            var CarrierNamePortnetNo = function (CarrierName, PortnetNo) {
                this.CarrierName = CarrierName;
                this.PortnetNo = PortnetNo;
            }
            CarrierNamePortnetNo.prototype.equals = function (CarriernamePortnetno) {
                if (this.CarrierName === CarriernamePortnetno.CarrierName && this.PortnetNo === CarriernamePortnetno.PortnetNo) {
                    return true;
                }
                return false;
            }
            CarrierNamePortnetNo.prototype.toString = function () {
                return JSON.stringify({
                    CarrierName: this.CarrierName, PortnetNo: this.PortnetNo
                });
            }

            //ServicePtDescrAndAddr
            var ServicePtDescrAndAddr = function (ServicePtDescr, Addr, ServicePtCode) {
                this.ServicePtDescr = ServicePtDescr;
                this.Addr = Addr;
                this.ServicePtCode = ServicePtCode;
            }
            ServicePtDescrAndAddr.prototype.equals = function (ServicePtDescrAddrTxt) {
                if (this.ServicePtDescr === ServicePtDescrAddrTxt.ServicePtDescr && this.Addr === ServicePtDescrAddrTxt.Addr) {
                    return true;
                }
                return false;
            }
            ServicePtDescrAndAddr.prototype.toString = function () {
                return JSON.stringify({
                    Addr: this.Addr, ServicePtCode: this.ServicePtCode,
                    ServicePtDescr: this.ServicePtDescr
                });
            }

            //BillOption1And2
            var BillOption = function (BillOption1, BillOption2, BillOption1Value, BillOption2Value) {
                this.BillOption1 = BillOption1;
                this.BillOption2 = BillOption2;
                this.BillOption1Value = BillOption1Value;
                this.BillOption2Value = BillOption2Value;
            }
            BillOption.prototype.equals = function (Billoption) {
                if (this.BillOption1 === Billoption.BillOption1 && this.BillOption2 === Billoption.BillOption2) {
                    return true;
                }
                return false;
            }
            BillOption.prototype.toString = function () {
                return JSON.stringify({
                    BillOption1: this.BillOption1Value, BillOption2: this.BillOption2Value,
                    BillOption1Descr: this.BillOption1, BillOption2Descr: this.BillOption2
                });
            }

            //RequiredDateAndTime
            var RequiredDateAndTime = function (ExpDate, EqpRemarks) {
                this.ExpDate = ExpDate;
                this.EqpRemarks = EqpRemarks;
            }
            RequiredDateAndTime.prototype.equals = function (RequiredDateTime) {
                if (this.ExpDate === RequiredDateTime.ExpDate && this.EqpRemarks === RequiredDateTime.EqpRemarks) {
                    return true;
                }
                return false;
            }
            RequiredDateAndTime.prototype.toString = function () {
                return JSON.stringify({
                    ExpDate: this.ExpDate.toString("dd/MMM/yyyy"), EqpRemarks: this.EqpRemarks
                });
            }

            //ReadyFreeStorageDentionExpiry
            var ReadyFreeStorageDentionExpiry = function (ReadyDate, FreeStorageExpiryDate, DetentionExpiryDate) {
                this.ReadyDate = ReadyDate;
                this.FreeStorageExpiryDate = FreeStorageExpiryDate;
                this.DetentionExpiryDate = DetentionExpiryDate;
            }
            ReadyFreeStorageDentionExpiry.prototype.equals = function (ReadyFreeStorageDentionExpiryDate) {
                if (this.ReadyDate === ReadyFreeStorageDentionExpiryDate.ReadyDate && this.FreeStorageExpiryDate === ReadyFreeStorageDentionExpiryDate.FreeStorageExpiryDate && this.DetentionExpiryDate === ReadyFreeStorageDentionExpiryDate.DetentionExpiryDate) {
                    return true;
                }
                return false;
            }
            ReadyFreeStorageDentionExpiry.prototype.toString = function () {
                return JSON.stringify({
                    ReadyDate: this.ReadyDate.toString("dd/MMM/yyyy hh:mm"), FreeStorageExpiryDate: this.FreeStorageExpiryDate.toString("dd/MMM/yyyy hh:mm"), DetentionExpiryDate: this.DetentionExpiryDate.toString("dd/MMM/yyyy hh:mm")
                });
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
        <script type="text/javascript">
            function GetCellValue(sender, args) {
                //ShipmentTypeContainerSize
                if (args.get_columnUniqueName() === "ShipmentTypeContainerSize") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Tpttype = $telerik.findElement(Container, "TransportTypeLbl").innerText;
                    var ShipmentType = $telerik.findElement(Container, "ShipmentTypeLbl").innerText;
                    var ContainerSize = $telerik.findElement(Container, "ContainerSizeLbl").innerText;
                    args.set_value(new ShipmentTypeContainerSize(Tpttype, ShipmentType, ContainerSize));
                }

                //ContainerNoSealNoVGM
                if (args.get_columnUniqueName() === "ContainerNoSealNoVGM") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var ContainerNo = $telerik.findElement(Container, "ContainerNoLbl").innerText;
                    var SealNo = $telerik.findElement(Container, "SealNoLbl").innerText;
                    var VGM = $telerik.findElement(Container, "VGMLbl").innerText;
                    args.set_value(new ContainerNoSealNoVGM(ContainerNo, SealNo, VGM));
                }

                //PermitNoBkRef
                if (args.get_columnUniqueName() === "PermitNoBkRef") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var PermitNo = $telerik.findElement(Container, "PermitNoLbl").innerText;
                    var BookingRef = $telerik.findElement(Container, "BkRefLbl").innerText;
                    args.set_value(new PermitNoBkRef(PermitNo, BookingRef));
                }

                //CarrierNamePortnetNo
                if (args.get_columnUniqueName() === "CarrierNamePortnetNo") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var CarrierName = $telerik.findElement(Container, "CarrierNameLbl").innerText;
                    var PortnetNo = $telerik.findElement(Container, "PortnetNoLbl").innerText;
                    args.set_value(new CarrierNamePortnetNo(CarrierName, PortnetNo));
                }

                //WarehouseServicePtAndAddress
                if (args.get_columnUniqueName() === "WarehouseServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Addr = $telerik.findElement(Container, "WarehouseAddrLbl").innerText;
                    var ServicePtDescr = $telerik.findElement(Container, "WarehouseServiceptDescr").innerText;
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                }

                //DepotServicePtAndAddress
                if (args.get_columnUniqueName() === "DepotServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Addr = $telerik.findElement(Container, "DepotAddrLbl").innerText;
                    var ServicePtDescr = $telerik.findElement(Container, "DepotServiceptDescr").innerText;
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                }

                //PickUpServicePtAndAddress
                if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Addr = $telerik.findElement(Container, "PickUpAddrLbl").innerText;
                    var ServicePtDescr = $telerik.findElement(Container, "PickUpServiceptDescr").innerText;
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                }

                //DropOffServicePtAndAddress
                if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Addr = $telerik.findElement(Container, "DropOffAddrLbl").innerText;
                    var ServicePtDescr = $telerik.findElement(Container, "DropOffServiceptDescr").innerText;
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                }

                //BillOption1And2
                if (args.get_columnUniqueName() === "BillOption1And2") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var BillOption1 = $telerik.findElement(Container, "BillOption1Lbl").innerText;
                    var BillOption2 = $telerik.findElement(Container, "BillOption2Lbl").innerText;
                    args.set_value(new BillOption(BillOption1, BillOption2));
                }

                //RequiredDateAndTime
                if (args.get_columnUniqueName() === "RequiredDateAndTime") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var ExpDate = $telerik.findElement(Container, "RequiredDateLbl").innerText;
                    var EqpRemarks = $telerik.findElement(Container, "RequiredTimeLbl").innerText;
                    args.set_value(new RequiredDateAndTime(ExpDate, EqpRemarks));
                }

                //ReadyFreeStorageDentionExpiry
                if (args.get_columnUniqueName() === "ReadyFreeStorageDentionExpiry") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var ReadyDate = $telerik.findElement(Container, "ReadyDateLbl").innerText;
                    var FreeStorageExpiryDate = $telerik.findElement(Container, "FreeStorageExpiryLabel").innerText;
                    var DetentionExpiryDate = $telerik.findElement(Container, "DetentionExpiryLabel").innerText;
                    args.set_value(new ReadyFreeStorageDentionExpiry(ReadyDate, FreeStorageExpiryDate, DetentionExpiryDate));
                }

                //PortServicePtAndAddress
                if (args.get_columnUniqueName() === "PortServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Addr = $telerik.findElement(Container, "PortAddrLbl").innerText;
                    var ServicePtDescr = $telerik.findElement(Container, "PortServiceptDescr").innerText;
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">
        <script type="text/javascript">
            function SetCellValue(sender, args) {
                //ShipmentTypeContainerSize
                if (args.get_columnUniqueName() === "ShipmentTypeContainerSize") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "ShipmentTypeLbl").innerText = Value.ShipmentType;
                    $telerik.findElement(Container, "ContainerSizeLbl").innerText = Value.ContainerSize;
                }

                //ContainerNoSealNoVGM
                if (args.get_columnUniqueName() === "ContainerNoSealNoVGM") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "ContainerNoLbl").innerText = Value.ContainerNo;
                    $telerik.findElement(Container, "SealNoLbl").innerText = Value.SealNo;
                    $telerik.findElement(Container, "VGMLbl").innerText = Value.VGM;
                }

                //PermitNoBkRef
                if (args.get_columnUniqueName() === "PermitNoBkRef") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "PermitNoLbl").innerText = Value.PermitNo;
                    $telerik.findElement(Container, "BkRefLbl").innerText = Value.BookingRef;
                }

                //CarrierNamePortnetNo
                if (args.get_columnUniqueName() === "CarrierNamePortnetNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "CarrierNameLbl").innerText = Value.CarrierName;
                    $telerik.findElement(Container, "PortnetNoLbl").innerText = Value.PortnetNo;
                }

                //WarehouseServicePtAndAddress
                if (args.get_columnUniqueName() === "WarehouseServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "WarehouseServiceptDescr").innerText = Value.ServicePtDescr;
                    $telerik.findElement(Container, "WarehouseAddrLbl").innerText = Value.Addr;
                }

                //DepotServicePtAndAddress
                if (args.get_columnUniqueName() === "DepotServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "DepotServiceptDescr").innerText = Value.ServicePtDescr;
                    $telerik.findElement(Container, "DepotAddrLbl").innerText = Value.Addr;
                }

                //PickUpServicePtAndAddress
                if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "PickUpServiceptDescr").innerText = Value.ServicePtDescr;
                    $telerik.findElement(Container, "PickUpAddrLbl").innerText = Value.Addr;
                }

                //DropOffServicePtAndAddress
                if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "DropOffServiceptDescr").innerHTML = Value.ServicePtDescr;
                    $telerik.findElement(Container, "DropOffAddrLbl").innerHTML = Value.Addr;
                }

                //BillOption1And2
                if (args.get_columnUniqueName() === "BillOption1And2") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "BillOption1Lbl").innerText = Value.BillOption1;
                    $telerik.findElement(Container, "BillOption2Lbl").innerText = Value.BillOption2;
                }

                //RequiredDateAndTime
                if (args.get_columnUniqueName() === "RequiredDateAndTime") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Value = args.get_value();
                    $telerik.findElement(Container, "RequiredDateLbl").innerText = Value.ExpDate;
                    $telerik.findElement(Container, "RequiredTimeLbl").innerText = Value.EqpRemarks;
                }

                //ReadyFreeStorageDentionExpiry
                if (args.get_columnUniqueName() === "ReadyFreeStorageDentionExpiry") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Value = args.get_value();
                    $telerik.findElement(Container, "ReadyDateLbl").innerText = Value.ReadyDate;
                    $telerik.findElement(Container, "FreeStorageExpiryLabel").innerText = Value.FreeStorageExpiryDate;
                    $telerik.findElement(Container, "DetentionExpiryLabel").innerText = Value.DetentionExpiryDate;
                }

                //PortServicePtAndAddress
                if (args.get_columnUniqueName() === "PortServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "PortServiceptDescr").innerText = Value.ServicePtDescr;
                    $telerik.findElement(Container, "PortAddrLbl").innerText = Value.Addr;
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock4" runat="server">
        <script type="text/javascript">
            function GetEditorValue(sender, args) {
                //ShipmentTypeContainerSize
                if (args.get_columnUniqueName() === "ShipmentTypeContainerSize") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        ShipmentType = $telerik.findControl(Container, "ShipmentTypeDDL").get_selectedItem().get_text(),
                        ShipmentTypeValue = $telerik.findControl(Container, "ShipmentTypeDDL").get_selectedItem().get_value(),
                        ContainerSize = $telerik.findControl(Container, "ContainerSizeDDL").get_selectedItem().get_text(),
                        ContainerSizeValue = $telerik.findControl(Container, "ContainerSizeDDL").get_selectedItem().get_value();
                    args.set_value(new ShipmentTypeContainerSize(null, ShipmentType, ContainerSize, ShipmentTypeValue, ContainerSizeValue));
                }

                //ContainerNoSealNoVGM
                if (args.get_columnUniqueName() === "ContainerNoSealNoVGM") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        ContainerNo = $telerik.findControl(Container, "ContainerNoTxt").get_value(),
                        SealNo = $telerik.findControl(Container, "SealNoTxt").get_value(),
                        VGM = $telerik.findControl(Container, "VerifiedGrossMassTxt").get_value();
                    args.set_value(new ContainerNoSealNoVGM(ContainerNo, SealNo, VGM));
                }

                //PermitNoBkRef
                if (args.get_columnUniqueName() === "PermitNoBkRef") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                    PermitNo = $telerik.findControl(Container, "PermitNoTxt").get_value(),
                    BookingRef = $telerik.findControl(Container, "BkRefTxt").get_value();
                    args.set_value(new PermitNoBkRef(PermitNo, BookingRef));
                }

                //CarrierNamePortnetNo
                if (args.get_columnUniqueName() === "CarrierNamePortnetNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                    CarrierName = $telerik.findControl(Container, "CarrierNameTxt").get_value(),
                    PortnetNo = $telerik.findControl(Container, "PortnetNoTxt").get_value();
                    args.set_value(new CarrierNamePortnetNo(CarrierName, PortnetNo));
                }

                //DepotServicePtAndAddress
                if (args.get_columnUniqueName() === "DepotServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Addr = $telerik.findControl(Container, "DepotAddrTxt").get_value(),
                        ServicePtCode = ($telerik.findControl(Container, "DepotServicePtCombo").get_value().split("|"))[0],
                        ServicePtDescr = $telerik.findControl(Container, "DepotServicePtCombo").get_text();
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                }

                //WarehouseServicePtAndAddress
                if (args.get_columnUniqueName() === "WarehouseServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Addr = $telerik.findControl(Container, "WarehouseAddrTxt").get_value(),
                        ServicePtCode = ($telerik.findControl(Container, "WarehouseServicePtCombo").get_value().split("|"))[0],
                        ServicePtDescr = $telerik.findControl(Container, "WarehouseServicePtCombo").get_text();
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                }

                //PickUpServicePtAndAddress
                if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Addr = $telerik.findControl(Container, "PickUpAddrTxt").get_value(),
                        ServicePtCode = ($telerik.findControl(Container, "PickUpServicePtCombo").get_value().split("|"))[0],
                        ServicePtDescr = $telerik.findControl(Container, "PickUpServicePtCombo").get_text();
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                }

                //DropOffServicePtAndAddress
                if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Addr = $telerik.findControl(Container, "DropOffAddrTxt").get_value(),
                        ServicePtCode = ($telerik.findControl(Container, "DropOffServicePtCombo").get_value().split("|"))[0],
                        ServicePtDescr = $telerik.findControl(Container, "DropOffServicePtCombo").get_text();
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                }

                //BillOption1And2
                if (args.get_columnUniqueName() === "BillOption1And2") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        BillOption1 = $telerik.findControl(Container, "BillOption1DDL").get_selectedItem().get_text(),
                        BillOption1Value = $telerik.findControl(Container, "BillOption1DDL").get_selectedItem().get_value(),
                        BillOption2 = $telerik.findControl(Container, "BillOption2DDL").get_selectedItem().get_text(),
                        BillOption2Value = $telerik.findControl(Container, "BillOption2DDL").get_selectedItem().get_value();
                    args.set_value(new BillOption(BillOption1, BillOption2, BillOption1Value, BillOption2Value));
                }

                //RequiredDateAndTime
                if (args.get_columnUniqueName() === "RequiredDateAndTime") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var RequiredDatePicker = $telerik.findControl(Container, "RequiredDatePicker");
                    var ExpDate = RequiredDatePicker.get_dateInput().get_value();
                    var EqpRemarks = $telerik.findControl(Container, "RequiredTimeTxt").get_value();
                    args.set_value(new RequiredDateAndTime(ExpDate, EqpRemarks));
                }

                //ReadyFreeStorageDentionExpiry
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

                //PortServicePtAndAddress
                if (args.get_columnUniqueName() === "PortServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Addr = $telerik.findControl(Container, "PortAddrTxt").get_value(),
                        ServicePtCode = ($telerik.findControl(Container, "PortServicePtCombo").get_value().split("|"))[0],
                        ServicePtDescr = $telerik.findControl(Container, "PortServicePtCombo").get_text();
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock5" runat="server">
        <script type="text/javascript">
            function SetEditorValue(sender, args) {
                //ShipmentTypeContainerSize
                if (args.get_columnUniqueName() === "ShipmentTypeContainerSize") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findControl(Container, "TransportTypeTxt").set_value(Value.Tpttype);
                    $telerik.findControl(Container, "ShipmentTypeDDL").findItemByText(Value.ShipmentType).select();
                    $telerik.findControl(Container, "ContainerSizeDDL").findItemByText(Value.ContainerSize).select();
                }

                //ContainerNoSealNoVGM
                if (args.get_columnUniqueName() === "ContainerNoSealNoVGM") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "ContainerNoTxt").set_value(Value.ContainerNo);
                    $telerik.findControl(Container, "SealNoTxt").set_value(Value.SealNo);
                    $telerik.findControl(Container, "VerifiedGrossMassTxt").set_value(Value.VGM);
                }

                //PermitNoBkRef
                if (args.get_columnUniqueName() === "PermitNoBkRef") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "PermitNoTxt").set_value(Value.PermitNo);
                    $telerik.findControl(Container, "BkRefTxt").set_value(Value.BookingRef);
                }

                //CarrierNamePortnetNo
                if (args.get_columnUniqueName() === "CarrierNamePortnetNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "CarrierNameTxt").set_value(Value.CarrierName);
                    $telerik.findControl(Container, "PortnetNoTxt").set_value(Value.PortnetNo);
                }

                //DepotServicePtAndAddress
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

                //WarehouseServicePtAndAddress
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

                //PickUpServicePtAndAddress
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

                //DropOffServicePtAndAddress
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

                //BillOption1And2
                if (args.get_columnUniqueName() === "BillOption1And2") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "BillOption1DDL").findItemByText(Value.BillOption1).select();
                    $telerik.findControl(Container, "BillOption2DDL").findItemByText(Value.BillOption2).select();
                }

                //RequiredDateAndTime
                if (args.get_columnUniqueName() === "RequiredDateAndTime") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Value = args.get_value();
                    var RequiredDatePicker = $telerik.findControl(Container, "RequiredDatePicker");
                    RequiredDatePicker.get_dateInput().set_value(Value.ExpDate);
                    $telerik.findControl(Container, "RequiredTimeTxt").set_value(Value.EqpRemarks);
                }

                //ReadyFreeStorageDentionExpiry
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

                //PortServicePtAndAddress
                if (args.get_columnUniqueName() === "PortServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "PortAddrTxt").set_value(Value.Addr);

                    if ($telerik.findControl(Container, "PortServicePtCombo") && $telerik.findControl(Container, "PortServicePtCombo").findItemByText(Value.ServicePtDescr))
                        $telerik.findControl(Container, "PortServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                    else
                        $telerik.findControl(Container, "PortServicePtCombo").set_text(Value.ServicePtDescr);
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock6" runat="server">
        <script type="text/javascript">
            <%--Start Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
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

            function PortServicePtCombo_SelectedIndexChanged(sender, eventArgs) {
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var PortServicePt = $telerik.findControl(CurrentRow, "PortCombo").get_value();
                if (PortServicePt != null && PortServicePt != "") {
                    var PortServicePtAddrPair = PortServicePt.split("|");
                    $telerik.findControl(CurrentRow, "PortAddTxt").set_value(PortServicePtAddrPair[1]);
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

            function PortServicePt_DropDownClosed(sender, args) {
                var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var PortServicePt = $telerik.findControl(currentRow, "PortServicePtCombo").get_value();
                if (PortServicePt != null && PortServicePt != "") {
                    var PortServicePtAddrPair = PortServicePt.split("|");
                    $telerik.findControl(currentRow, "PortAddrTxt").set_value(PortServicePtAddrPair[1]);
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

            function BatchEditOpened(sender, args) {
                var DataItems = args.get_tableView().get_dataItems();
                var BatchManager = sender.get_batchEditingManager();
                var Grid = sender;
                var MasterTable = Grid.get_masterTableView();

                for (var i = 0 ; i < DataItems.length; i++) {
                    var TptType = BatchManager.getCellValue(DataItems[i].get_cell('tpttype'));

                    // PickUp
                    var PickUpServicePtCombo = MasterTable.get_dataItems()[i].findElement("PickUpServicePtCombo")
                    var PickUpAddrTxt = MasterTable.get_dataItems()[i].findElement("PickUpAddrTxt");

                    // DropOff
                    var DropOffServicePtCombo = MasterTable.get_dataItems()[i].findElement("DropOffServicePtCombo")
                    var DropOffAddrTxt = MasterTable.get_dataItems()[i].findElement("DropOffAddrTxt");

                    // Depot
                    var DepotServicePtCombo = MasterTable.get_dataItems()[i].findElement("DepotServicePtCombo")
                    var DepotAddrTxt = MasterTable.get_dataItems()[i].findElement("DepotAddrTxt");

                    // Warehouse
                    var WarehouseServicePtCombo = MasterTable.get_dataItems()[i].findElement("WarehouseServicePtCombo")
                    var WarehouseAddrTxt = MasterTable.get_dataItems()[i].findElement("WarehouseAddrTxt");

                    // Depot
                    var PortServicePtCombo = MasterTable.get_dataItems()[i].findElement("PortServicePtCombo")
                    var PortAddrTxt = MasterTable.get_dataItems()[i].findElement("PortAddrTxt");

                    if (TptType.toLowerCase().includes("round") || TptType.toLowerCase() == "ce-escort-direct" || TptType.toLowerCase() == "direct-escort-re" || TptType.toLowerCase() == "cedirect" || TptType.toLowerCase() == "directre") {

                        // PickUp
                        if (PickUpAddrTxt != null) {
                            PickUpAddrTxt.disabled = true;
                        }

                        if (PickUpServicePtCombo != null) {
                            var PickUpServicePtComboId = PickUpServicePtCombo.id;

                            $('#' + PickUpServicePtComboId).css("pointer-events", "none"); // To prevent DropDownArrow btn event
                            $('#' + PickUpServicePtComboId).find('span.rcbInner').addClass('rcbDisabled'); // Get Disable Combobox feature like grey color etc..
                            $('#' + PickUpServicePtComboId).find('span > input').attr('disabled', 'disabled'); // Disable Input Text and cursor
                        }

                        // DropOff
                        if (DropOffAddrTxt != null) {
                            DropOffAddrTxt.disabled = true;
                        }

                        if (DropOffServicePtCombo != null) {
                            var DropOffServicePtComboId = DropOffServicePtCombo.id;

                            $('#' + DropOffServicePtComboId).css("pointer-events", "none");
                            $('#' + DropOffServicePtComboId).find('span.rcbInner').addClass('rcbDisabled');
                            $('#' + DropOffServicePtComboId).find('span > input').attr('disabled', 'disabled');
                        }

                        // Depot
                        if (DepotAddrTxt != null) {
                            DepotAddrTxt.disabled = false;
                        }

                        if (DepotServicePtCombo != null) {
                            var DepotServicePtComboId = DepotServicePtCombo.id;

                            $('#' + DepotServicePtComboId).css("pointer-events", "auto");
                            $('#' + DepotServicePtComboId).find('span.rcbInner').removeClass('rcbDisabled');
                            $('#' + DepotServicePtComboId).find('span > input').removeAttr('disabled', 'disabled');
                        }

                        // Warehouse
                        if (WarehouseAddrTxt != null) {
                            WarehouseAddrTxt.disabled = false;
                        }

                        if (WarehouseServicePtCombo != null) {
                            var WarehouseServicePtComboId = WarehouseServicePtCombo.id;

                            $('#' + WarehouseServicePtComboId).css("pointer-events", "auto");
                            $('#' + WarehouseServicePtComboId).find('span.rcbInner').removeClass('rcbDisabled');
                            $('#' + WarehouseServicePtComboId).find('span > input').removeAttr('disabled', 'disabled');
                        }

                        // Port
                        if (PortAddrTxt != null) {
                            PortAddrTxt.disabled = false;
                        }

                        if (PortServicePtCombo != null) {
                            var PortServicePtComboId = PortServicePtCombo.id;

                            $('#' + PortServicePtComboId).css("pointer-events", "auto");
                            $('#' + PortServicePtComboId).find('span.rcbInner').removeClass('rcbDisabled');
                            $('#' + PortServicePtComboId).find('span > input').removeAttr('disabled', 'disabled');
                        }
                    }
                    else {
                        // PickUp
                        if (PickUpAddrTxt != null) {
                            PickUpAddrTxt.disabled = false;
                        }

                        if (PickUpServicePtCombo != null) {

                            var PickUpServicePtComboId = PickUpServicePtCombo.id;
                            $('#' + PickUpServicePtComboId).css("pointer-events", "auto");
                            $('#' + PickUpServicePtComboId).find('span.rcbInner').removeClass('rcbDisabled');
                            $('#' + PickUpServicePtComboId).find('span > input').removeAttr('disabled', 'disabled');
                        }

                        // DropOff
                        if (DropOffAddrTxt != null) {
                            DropOffAddrTxt.disabled = false;
                        }

                        if (DropOffServicePtCombo != null) {
                            var DropOffServicePtComboId = DropOffServicePtCombo.id;

                            $('#' + DropOffServicePtComboId).css("pointer-events", "auto");
                            $('#' + DropOffServicePtComboId).find('span.rcbInner').removeClass('rcbDisabled');
                            $('#' + DropOffServicePtComboId).find('span > input').removeAttr('disabled', 'disabled');
                        }

                        // Depot
                        if (DepotAddrTxt != null) {
                            DepotAddrTxt.disabled = true;
                        }

                        if (DepotServicePtCombo != null) {
                            var DepotServicePtComboId = DepotServicePtCombo.id;

                            $('#' + DepotServicePtComboId).css("pointer-events", "none");
                            $('#' + DepotServicePtComboId).find('span.rcbInner').addClass('rcbDisabled');
                            $('#' + DepotServicePtComboId).find('span > input').attr('disabled', 'disabled');
                        }

                        // Warehouse
                        if (WarehouseAddrTxt != null) {
                            WarehouseAddrTxt.disabled = true;
                        }

                        if (WarehouseServicePtCombo != null) {
                            var WarehouseServicePtComboId = WarehouseServicePtCombo.id;

                            $('#' + WarehouseServicePtComboId).css("pointer-events", "none");
                            $('#' + WarehouseServicePtComboId).find('span.rcbInner').addClass('rcbDisabled');
                            $('#' + WarehouseServicePtComboId).find('span > input').attr('disabled', 'disabled');
                        }

                        // Port
                        if (PortAddrTxt != null) {
                            PortAddrTxt.disabled = true;
                        }

                        if (PortServicePtCombo != null) {
                            var PortServicePtComboId = PortServicePtCombo.id;

                            $('#' + PortServicePtComboId).css("pointer-events", "none");
                            $('#' + PortServicePtComboId).find('span.rcbInner').addClass('rcbDisabled');
                            $('#' + PortServicePtComboId).find('span > input').attr('disabled', 'disabled');
                        }
                    }
                }
            }
            <%--End Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
        </script>
    </telerik:RadCodeBlock>
</body>
</html>
