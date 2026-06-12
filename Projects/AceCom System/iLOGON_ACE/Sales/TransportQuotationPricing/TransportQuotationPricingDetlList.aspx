<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportQuotationPricingDetlList.aspx.cs" Inherits="iWMS.Web.Sales.TransportQuotationPricing.TransportQuotationPricingDetlList" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DetlList @ TransportQuotationPricing</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        /*We need this CSS because When Click the New Button , default CSS of Batch grid for CommandItem is not working when use two grid*/
        .RadGrid_Metro .rgAdd {
            position: absolute;
            margin-left: 0% !important;
            width: auto !important;
            height: auto !important;
        }

        .RadGrid_Metro .rgSave {
            position: absolute;
            margin-left: 7.5% !important;
            width: auto !important;
            height: auto !important;
        }

        .RadGrid_Metro .rgCancel {
            position: absolute;
            margin-left: 14.5% !important;
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
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView ID="MainRadPageView" runat="server">
                <br />
                <asp:Panel runat="server" ID="NewBtnPanel">
                    <asp:Button runat="server" ID="NewBtn" Text="New" CausesValidation="false" UseSubmitBehavior="false" CssClass="white" OnClientClick="disableBtn(this.id)" OnClick="NewBtn_Click" />
                    &nbsp;
                    <asp:Button runat="server" ID="QuotationBtn" Text="Quotation" CausesValidation="false" UseSubmitBehavior="false" CssClass="blue" OnClientClick="disableBtn(this.id)" OnClick="QuotationBtn_Click" />
                </asp:Panel>
                <asp:Panel runat="server" ID="NewFormPanel">
                    <table>
                        <tr>
                            <td>
                                <asp:Button runat="server" ID="AddBtn" Text="Add" CausesValidation="false" UseSubmitBehavior="false" CssClass="white" OnClientClick="disableBtn(this.id, false)" OnClick="AddBtn_Click" />
                                &nbsp;
                                    <asp:Button runat="server" ID="CancelBtn" Text="Cancel" CausesValidation="false" UseSubmitBehavior="false" CssClass="white" OnClientClick="disableBtn(this.id)" OnClick="CancelBtn_Click" />
                                &nbsp;
                                    <asp:Label runat="server" Text="Quotation"></asp:Label>&nbsp;
                                    <telerik:RadComboBox ID="QuotationCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                        RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="QuotationCombo_ItemsRequested"
                                        HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                    </telerik:RadComboBox>
                                &nbsp;
                                    <asp:Button runat="server" ID="RunBtn" Text="Run" CausesValidation="false" UseSubmitBehavior="false" CssClass="white" OnClientClick="disableBtn(this.id)" OnClick="RunBtn_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Panel ID="Panel_ContainerTrucking_New" runat="server" Visible="false">
                                    <asp:Label runat="server" Text="ContainerTrucking" Font-Bold="true" Font-Size="Large"></asp:Label>
                                    <br />
                                    <asp:UpdatePanel ID="ContainerTruckingUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <telerik:RadGrid ID="ResultDG_New_ContainerTrucking" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_New_ContainerTrucking_NeedDataSource">
                                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                    <Selecting AllowRowSelect="true" />
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true"></ItemStyle>
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                    <Columns>
                                                        <telerik:GridTemplateColumn HeaderText="Capacity">
                                                            <ItemTemplate>
                                                                <telerik:RadTextBox ID="CapacityTxt" runat="server" Width="400px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Description">
                                                            <ItemTemplate>
                                                                <telerik:RadTextBox ID="DescriptionTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="DeleteShipmentIcon" AllowFiltering="false"
                                                            ItemStyle-Width="10px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="DeleteContainerTrucking" ImageUrl="../../image/deleted.png"
                                                                    Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteContainerTrucking_Click"
                                                                    BorderWidth="0"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>

                                <asp:Panel ID="Panel_LooseCargo_New" runat="server" Visible="false">
                                    <br />
                                    <asp:Label runat="server" Text="LooseCargo" Font-Bold="true" Font-Size="Large"></asp:Label>
                                    <br />
                                    <asp:UpdatePanel ID="LooseCargoUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <telerik:RadGrid ID="ResultDG_New_LooseCargo" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_New_LooseCargo_NeedDataSource">
                                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                    <Selecting AllowRowSelect="true" />
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true"></ItemStyle>
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                    <Columns>
                                                        <telerik:GridTemplateColumn HeaderText="Capacity">
                                                            <ItemTemplate>
                                                                <telerik:RadTextBox ID="CapacityTxt" runat="server" Width="400px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Per Trip Of 4 Hours" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <asp:CompareValidator ControlToValidate="PerTripOfFourHoursTxt" runat="server" Type="Double" ErrorMessage="#" Font-Bold="true" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                                                                <telerik:RadTextBox ID="PerTripOfFourHoursTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfFourHours") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Over-Time(Per Hours)" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <asp:CompareValidator ControlToValidate="OverTimePerHoursTxt" runat="server" Type="Double" ErrorMessage="#" Font-Bold="true" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                                                                <telerik:RadTextBox ID="OverTimePerHoursTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "OverTimePerHours") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="DeleteShipmentIcon" AllowFiltering="false"
                                                            ItemStyle-Width="10px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="DeleteLooseCargo" ImageUrl="../../image/deleted.png"
                                                                    Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteLooseCargo_Click"
                                                                    BorderWidth="0"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>

                                <asp:Panel ID="Panel_Lorry_New" runat="server" Visible="false">
                                    <br />
                                    <asp:Label runat="server" Text="Lorry" Font-Bold="true" Font-Size="Large"></asp:Label>
                                    <br />
                                    <asp:UpdatePanel ID="LorryUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <telerik:RadGrid ID="ResultDG_New_Lorry" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_New_Lorry_NeedDataSource">
                                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                    <Selecting AllowRowSelect="true" />
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true"></ItemStyle>
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                    <Columns>
                                                        <telerik:GridTemplateColumn HeaderText="Capacity">
                                                            <ItemTemplate>
                                                                <telerik:RadTextBox ID="CapacityTxt" runat="server" Skin="WebBlue" Width="400px" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Per Trip Of 3 Hours" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <asp:CompareValidator ControlToValidate="PerTripOfThreeHoursTxt" runat="server" Type="Double" ErrorMessage="#" Font-Bold="true" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                                                                <telerik:RadTextBox ID="PerTripOfThreeHoursTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfThreeHours") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Over-Time(Per Hours)" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <asp:CompareValidator ControlToValidate="OverTimePerHoursTxt" runat="server" Type="Double" ErrorMessage="#" Font-Bold="true" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                                                                <telerik:RadTextBox ID="OverTimePerHoursTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "OverTimePerHours") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="DeleteShipmentIcon" AllowFiltering="false"
                                                            ItemStyle-Width="10px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="DeleteLorry" ImageUrl="../../image/deleted.png"
                                                                    Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteLorry_Click"
                                                                    BorderWidth="0"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>

                                <asp:Panel ID="Panel_LorryCrane_New" runat="server" Visible="false">
                                    <br />
                                    <asp:Label runat="server" Text="LorryCrane" Font-Bold="true" Font-Size="Large"></asp:Label>
                                    <br />
                                    <asp:UpdatePanel ID="LorryCraneUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <telerik:RadGrid ID="ResultDG_New_LorryCrane" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_New_LorryCrane_NeedDataSource">
                                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                    <Selecting AllowRowSelect="true" />
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true"></ItemStyle>
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                    <Columns>
                                                        <telerik:GridTemplateColumn HeaderText="Capacity">
                                                            <ItemTemplate>
                                                                <telerik:RadTextBox ID="CapacityTxt" runat="server" Width="400px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Per Trip Of 3 Hours" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <asp:CompareValidator ControlToValidate="PerTripOfThreeHoursTxt" runat="server" Type="Double" ErrorMessage="#" Font-Bold="true" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                                                                <telerik:RadTextBox ID="PerTripOfThreeHoursTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfThreeHours") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Over-Time(Per Hours)" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <asp:CompareValidator ControlToValidate="OverTimePerHoursTxt" runat="server" Type="Double" ErrorMessage="#" Font-Bold="true" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                                                                <telerik:RadTextBox ID="OverTimePerHoursTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "OverTimePerHours") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="DeleteShipmentIcon" AllowFiltering="false"
                                                            ItemStyle-Width="10px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="DeleteLorryCrane" ImageUrl="../../image/deleted.png"
                                                                    Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteLorryCrane_Click"
                                                                    BorderWidth="0"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>

                                <asp:Panel ID="Panel_MobileCrane_New" runat="server" Visible="false">
                                    <br />
                                    <asp:Label runat="server" Text="MobileCrane" Font-Bold="true" Font-Size="Large"></asp:Label>
                                    <br />
                                    <asp:UpdatePanel ID="MobileCraneUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <telerik:RadGrid ID="ResultDG_New_MobileCrane" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_New_MobileCrane_NeedDataSource">
                                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                    <Selecting AllowRowSelect="true" />
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true"></ItemStyle>
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                    <Columns>
                                                        <telerik:GridTemplateColumn HeaderText="Capacity">
                                                            <ItemTemplate>
                                                                <telerik:RadTextBox ID="CapacityTxt" runat="server" Width="400px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Per Trip Of 4 Hours" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <asp:CompareValidator ControlToValidate="PerTripOfFourHoursTxt" runat="server" Type="Double" ErrorMessage="#" Font-Bold="true" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                                                                <telerik:RadTextBox ID="PerTripOfFourHoursTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfFourHours") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Per Trip Of 8 Hours" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <asp:CompareValidator ControlToValidate="PerTripOfEightHoursTxt" runat="server" Type="Double" ErrorMessage="#" Font-Bold="true" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                                                                <telerik:RadTextBox ID="PerTripOfEightHoursTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfEightHours") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="Over-Time(Per Hours)" AllowFiltering="false">
                                                            <ItemTemplate>
                                                                <asp:CompareValidator ControlToValidate="OverTimePerHoursTxt" runat="server" Type="Double" ErrorMessage="#" Font-Bold="true" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                                                                <telerik:RadTextBox ID="OverTimePerHoursTxt" runat="server" Width="120px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "OverTimePerHours") %>'>
                                                                </telerik:RadTextBox>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="DeleteShipmentIcon" AllowFiltering="false"
                                                            ItemStyle-Width="10px">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="DeleteMobileCrane" ImageUrl="../../image/deleted.png"
                                                                    Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteMobileCrane_Click"
                                                                    BorderWidth="0"></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />

                <asp:Panel ID="Panel_ContainerTrucking" runat="server" Visible="false">
                    <asp:Label runat="server" ID="ContruckingLbl" Text="ContainerTrucking" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <telerik:RadGrid ID="ResultDG_ContainerTrucking" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_ContainerTrucking_NeedDataSource" AllowSorting="true" OnBatchEditCommand="ResultDG_ContainerTrucking_BatchEditCommand"
                        AllowFilteringByColumn="true" Skin="Metro" RenderMode="Lightweight">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true"></Selecting>
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="380" />
                        </ClientSettings>
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="QUDTId" PageSize="50" EditMode="Batch" CommandItemDisplay="TopAndBottom" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" ItemStyle-Width="20px" HeaderStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="DeleteContainerTruckingImgBtn" ImageUrl="../../image/deleted.png"
                                            Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteContainerTruckingImgBtn_Click"
                                            BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Capacity" HeaderText="Capacity" DataField="Capacity" AutoPostBackOnFilter="true" AllowFiltering="true" HeaderStyle-Width="400px" ItemStyle-Width="400px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="CapacityLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="CapacityTxt" runat="server" Width="400px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Description" HeaderText="Description" DataField="Description" AutoPostBackOnFilter="true" AllowFiltering="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="DescriptionLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Description")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="DescriptionTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>

                <asp:Panel ID="Panel_LooseCargo" runat="server" Visible="false">
                    <br />
                    <asp:Label runat="server" ID="LooseCargoLbl" Text="LooseCargo" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <telerik:RadGrid ID="ResultDG_LooseCargo" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_LooseCargo_NeedDataSource" AllowSorting="true" OnBatchEditCommand="ResultDG_LooseCargo_BatchEditCommand"
                        AllowFilteringByColumn="true" Skin="Metro" RenderMode="Lightweight">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true"></Selecting>
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="380" />
                        </ClientSettings>
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="QUDTId" PageSize="50" EditMode="Batch" CommandItemDisplay="TopAndBottom" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" ItemStyle-Width="20px" HeaderStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="DeleteLooseCargoImgBtn" ImageUrl="../../image/deleted.png"
                                            Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteLooseCargoImgBtn_Click"
                                            BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Capacity" HeaderText="Capacity" DataField="Capacity" AutoPostBackOnFilter="true" AllowFiltering="true" HeaderStyle-Width="400px" ItemStyle-Width="400px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="CapacityLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="CapacityTxt" runat="server" Width="400px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="PerTripOfFourHours" HeaderText="Per Trip of 4 Hours" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="PerTripOfFourHoursLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfFourHours")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CompareValidator ID="PerTripOfFourHoursCompVal" runat="server" Font-Bold="true" ControlToValidate="PerTripOfFourHoursTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        <telerik:RadTextBox ID="PerTripOfFourHoursTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="OverTimePerHour" HeaderText="Over-Time(Per Hour)" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="OverTimePerHourLbl" Text='<%# DataBinder.Eval(Container.DataItem, "OverTimePerHour")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CompareValidator ID="OverTimePerHourCompVal" runat="server" Font-Bold="true" ControlToValidate="OverTimePerHourTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        <telerik:RadTextBox ID="OverTimePerHourTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>

                <asp:Panel ID="Panel_Lorry" runat="server" Visible="false">
                    <br />
                    <asp:Label runat="server" ID="LorryLbl" Text="Lorry" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <telerik:RadGrid ID="ResultDG_Lorry" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_Lorry_NeedDataSource" AllowSorting="true" OnBatchEditCommand="ResultDG_Lorry_BatchEditCommand"
                        AllowFilteringByColumn="true" Skin="Metro" RenderMode="Lightweight">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true"></Selecting>
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="380" />
                        </ClientSettings>
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="QUDTId" PageSize="50" EditMode="Batch" CommandItemDisplay="TopAndBottom" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" ItemStyle-Width="20px" HeaderStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="DeleteLorryImgBtn" ImageUrl="../../image/deleted.png"
                                            Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteLorryImgBtn_Click"
                                            BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Capacity" HeaderText="Capacity" DataField="Capacity" AutoPostBackOnFilter="true" AllowFiltering="true" HeaderStyle-Width="400px" ItemStyle-Width="400px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="CapacityLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="CapacityTxt" runat="server" Width="400px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="PerTripOfThreeHours" HeaderText="Per Trip of 3 Hours" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="PerTripOfThreeHoursLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfThreeHours")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CompareValidator ID="PerTripOfThreeHoursCompVal" runat="server" Font-Bold="true" ControlToValidate="PerTripOfThreeHoursTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        <telerik:RadTextBox ID="PerTripOfThreeHoursTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="OverTimePerHour" HeaderText="Over-Time(Per Hour)" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="OverTimePerHourLbl" Text='<%# DataBinder.Eval(Container.DataItem, "OverTimePerHour")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CompareValidator ID="OverTimePerHourCompVal" runat="server" Font-Bold="true" ControlToValidate="OverTimePerHourTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        <telerik:RadTextBox ID="OverTimePerHourTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>

                <asp:Panel ID="Panel_LorryCrane" runat="server" Visible="false">
                    <br />
                    <asp:Label runat="server" ID="LorryCraneLbl" Text="LorryCrane" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <telerik:RadGrid ID="ResultDG_LorryCrane" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_LorryCrane_NeedDataSource" AllowSorting="true" OnBatchEditCommand="ResultDG_LorryCrane_BatchEditCommand"
                        AllowFilteringByColumn="true" Skin="Metro" RenderMode="Lightweight">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true"></Selecting>
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="380" />
                        </ClientSettings>
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="QUDTId" PageSize="50" EditMode="Batch" CommandItemDisplay="TopAndBottom" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" ItemStyle-Width="20px" HeaderStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="DeleteLorryCraneImgBtn" ImageUrl="../../image/deleted.png"
                                            Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteLorryCraneImgBtn_Click"
                                            BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Capacity" HeaderText="Capacity" DataField="Capacity" AutoPostBackOnFilter="true" AllowFiltering="true" HeaderStyle-Width="400px" ItemStyle-Width="400px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="CapacityLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="CapacityTxt" runat="server" Width="400px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="PerTripOfThreeHours" HeaderText="Per Trip of 3 Hours" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="PerTripOfThreeHoursLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfThreeHours")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CompareValidator ID="PerTripOfThreeHoursCompVal" runat="server" Font-Bold="true" ControlToValidate="PerTripOfThreeHoursTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        <telerik:RadTextBox ID="PerTripOfThreeHoursTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="OverTimePerHour" HeaderText="Over-Time(Per Hour)" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="OverTimePerHourLbl" Text='<%# DataBinder.Eval(Container.DataItem, "OverTimePerHour")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CompareValidator ID="OverTimePerHourCompVal" runat="server" Font-Bold="true" ControlToValidate="OverTimePerHourTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        <telerik:RadTextBox ID="OverTimePerHourTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>

                <asp:Panel ID="Panel_MobileCrane" runat="server" Visible="false">
                    <br />
                    <asp:Label runat="server" ID="MobileCraneLbl" Text="MobileCrane" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <telerik:RadGrid ID="ResultDG_MobileCrane" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_MobileCrane_NeedDataSource" AllowSorting="true" OnBatchEditCommand="ResultDG_MobileCrane_BatchEditCommand"
                        AllowFilteringByColumn="true" Skin="Metro" RenderMode="Lightweight">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true"></Selecting>
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="380" />
                        </ClientSettings>
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="QUDTId" PageSize="50" EditMode="Batch" CommandItemDisplay="TopAndBottom" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" ItemStyle-Width="20px" HeaderStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="DeleteMobileCraneImgBtn" ImageUrl="../../image/deleted.png"
                                            Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteMobileCraneImgBtn_Click"
                                            BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Capacity" HeaderText="Capacity" DataField="Capacity" AutoPostBackOnFilter="true" AllowFiltering="true" HeaderStyle-Width="400px" ItemStyle-Width="400px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="CapacityLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Capacity")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="CapacityTxt" runat="server" Width="400px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="PerTripOfFourHours" HeaderText="Per Trip of 4 Hours" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="PerTripOfFourHoursLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfFourHours")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CompareValidator ID="PerTripOfFourHoursCompVal" runat="server" Font-Bold="true" ControlToValidate="PerTripOfFourHoursTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        <telerik:RadTextBox ID="PerTripOfFourHoursTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="PerTripOfEightHours" HeaderText="Per Trip of 8 Hours" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="PerTripOfEightHoursLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PerTripOfEightHours")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CompareValidator ID="PerTripOfEightHoursCompVal" runat="server" Font-Bold="true" ControlToValidate="PerTripOfEightHoursTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        <telerik:RadTextBox ID="PerTripOfEightHoursTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="OverTimePerHour" HeaderText="Over-Time(Per Hour)" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="OverTimePerHourLbl" Text='<%# DataBinder.Eval(Container.DataItem, "OverTimePerHour")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CompareValidator ID="OverTimePerHourCompVal" runat="server" Font-Bold="true" ControlToValidate="OverTimePerHourTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        <telerik:RadTextBox ID="OverTimePerHourTxt" runat="server" Width="120px" Skin="WebBlue"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
