<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3GRQuotation.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3GRQuotation" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>GRV3GRQuotation</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <div id="grid" style="width: 1500px;">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
                AllowPaging="True" AllowSorting="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                OnEditCommand="ResultDG_EditCommand" OnItemCommand="ResultDG_ItemCommand" OnUpdateCommand="ResultDG_UpdateCommand"
                GroupPanelPosition="Top" OnItemCreated="ResultDG_ItemCreated">
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace"
                    CommandItemDisplay="Top">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False"></ItemStyle>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                                <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                    Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                    CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="lnkDelete_ServerClick" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                        title="Delete Detail" runat="server" /></a>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                            HeaderText="S/N">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False"></ItemStyle>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn UniqueName="ChargeCode" HeaderText="Charge Code">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "ChargeCodeDescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="ChargeCodeList" runat="server" DataTextField="descr" DataValueField="id"
                                    Skin="WebBlue" Width="150px" DropDownWidth="150px" DataSource='<%# ChargeCodeDS%>'
                                    RenderMode="Lightweight" CausesValidation="false" Filter="Contains" AutoPostBack="true"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "ChargeId") %>' OnSelectedIndexChanged="ChargeCode_SelectedIndexChanged">
                                </telerik:RadComboBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn UniqueName="ChargeDescription">
                            <HeaderTemplate>
                                <asp:Label ID="lblName" runat="server" Text="Charge Description"></asp:Label>
                            </HeaderTemplate>
                            <HeaderStyle Wrap="false" Width="200px" />
                            <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "ChargeDescription")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="txtChargeDescription" Text='<%# DataBinder.Eval(Container.DataItem, "ChargeDescription") %>'
                                    TextMode="MultiLine" Rows="2" Width="90%">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn UniqueName="BillingType" HeaderText="BillingType">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "BillingTypeDescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="ddlBillingType" DataSource='<%# BillingTypeDS%>' Width="120px" DropDownHeight="150px" Skin="WebBlue" DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillingTypeDS,DataBinder.Eval(Container.DataItem, "BillingTypeDescr").ToString())%>'>
                                </telerik:RadDropDownList>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn UniqueName="BillingPeriod" HeaderText="BillingPeriod">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "BillingPeriodDescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="ddlBillingPeriod" DataSource='<%# BillingPeriodDS%>' Width="120px" DropDownHeight="150px" Skin="WebBlue" DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillingPeriodDS,DataBinder.Eval(Container.DataItem, "BillingPeriod").ToString())%>'>
                                </telerik:RadDropDownList>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn UniqueName="FreeDays" HeaderText="FreeDays">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" HorizontalAlign="Left" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "Freedays","{0:0.00}")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadNumericTextBox ID="txtFreedays" runat="server" DataType="System.Decimal"
                                    Type="Number" NumberFormat-DecimalDigits="2" Text='<%# DataBinder.Eval(Container.DataItem, "Freedays") %>' />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>


                        <telerik:GridTemplateColumn UniqueName="BillingMethod" HeaderText="BillingMethod">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "BillingMethodDescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="ddlBillingMethod" DataSource='<%# BillingMethodDS%>' Width="120px" DropDownHeight="150px" Skin="WebBlue" DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillingMethodDS,DataBinder.Eval(Container.DataItem, "BillingMethodDescr").ToString())%>'>
                                </telerik:RadDropDownList>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn UniqueName="UnitRate" HeaderText="UnitRate">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" HorizontalAlign="Left" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "UnitRate","{0:0.00}")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadNumericTextBox ID="txtUnitRate" runat="server" DataType="System.Decimal"
                                    Type="Number" NumberFormat-DecimalDigits="2" Text='<%# DataBinder.Eval(Container.DataItem, "UnitRate") %>' />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="UnitRateUOM" HeaderText="UnitRateUOM">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "UnitRateUOMDescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="ddlUnitRateUOM" DataSource='<%# UnitRateUOMDS%>' Width="120px" DropDownHeight="150px" Skin="WebBlue" DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UnitRateUOMDS,DataBinder.Eval(Container.DataItem, "UnitRateUOMDescr").ToString())%>'>
                                </telerik:RadDropDownList>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn UniqueName="TaxType" HeaderText="TaxType">
                            <HeaderStyle Wrap="false" Width="60px" />
                            <ItemStyle Wrap="False" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "TaxTypeDescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList runat="server" ID="ddlTaxType" DataSource='<%# TaxTypeDS%>' Width="120px" DropDownHeight="150px" Skin="WebBlue" DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TaxTypeDS,DataBinder.Eval(Container.DataItem, "TaxType").ToString())%>'>
                                </telerik:RadDropDownList>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
