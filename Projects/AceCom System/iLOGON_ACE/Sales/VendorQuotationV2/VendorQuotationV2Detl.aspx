<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorQuotationV2Detl.aspx.cs" Inherits="iWMS.Web.Sales.VendorQuotationV2.VendorQuotationV2Detl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>VendorQuotationV2Detl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>

                <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
                    CausesValidation="false" SelectedIndex="0" Skin="Office2007" OnTabClick="RadTabStrip1_TabClick">
                    <Tabs>
                        <telerik:RadTab ID="ResultTap" Text="RatesGrid" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab ID="LogTap" Text="Log" Value="50" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Panel ID="NewBtnPanel" runat="server">
                    <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New" CausesValidation="false"
                        OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" />
                    <br />
                </asp:Panel>

                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                <asp:Panel ID="DetlPanel" runat="server" Visible="false">
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                        OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                        OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" ItemStyle-Wrap="true" HeaderStyle-Wrap="true"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand"
                            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" Width="1500px">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ClientSettings>
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="450px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" PageSize="50" ItemStyle-Wrap="true" HeaderStyle-Wrap="true"
                                HeaderStyle-HorizontalAlign="Center" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true" CommandItemDisplay="None" EditMode="InPlace">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" ItemStyle-Wrap="true" HeaderStyle-Wrap="true">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="80px" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="False" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                onserverclick="MakeaQuote_Delete" runat="server" visible="false">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                    runat="server"></a>

                                            <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Copy?')"
                                                onserverclick="MakeaQuote_Copy" runat="server" visible="false">
                                                <img id="cpyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                                    runat="server"></a>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif" ValidationGroup="reqvalgrp"
                                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent" CausesValidation="true"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ShipmentType" HeaderText="ShipmentType <br/> JobType" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px" ItemStyle-Width="180px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("shipmentTypedescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("jobtypedescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="ShipmentTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# ShipmentTypeDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ShipmentTypeDS,DataBinder.Eval(Container.DataItem, "shtype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="JobTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# JobTypeDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(JobTypeDS,DataBinder.Eval(Container.DataItem, "jobtype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>


                                    <telerik:GridTemplateColumn HeaderText="BillMethod <br/> UOM" UniqueName="BillMethod" HeaderStyle-Width="150px" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("billingmethoddescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("unitrateuomdescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="BillMethodDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillMethodDS%>' Skin="Sunset" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillMethodDS,DataBinder.Eval(Container.DataItem, "billingmethod").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="BillMethodDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillMethodDDL" ErrorMessage="*" ForeColor="Red" />
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="UOMDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# UOMDS%>' Skin="Sunset" Width="70px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UOMDS,DataBinder.Eval(Container.DataItem, "unitrateuom").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="UOMDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="UOMDDL" ErrorMessage="*" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn HeaderText="UnitRate <br/> Currency<br/>TaxType" UniqueName="UnitRate" HeaderStyle-Width="150px" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("unitrate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("CurrCode")) %>
                                             <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TaxTypeDescr")) %>
                                        </ItemTemplate>

                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="UnitRateTxt" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>'
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="CurrencyDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# CurrencyDS%>' Skin="Sunset" Width="70px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CurrencyDS,DataBinder.Eval(Container.DataItem, "CurrCode").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="CurrencyDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="CurrencyDDL" ErrorMessage="*" ForeColor="Red" />
                                            <br />
                                            <br />

                                             <telerik:RadDropDownList ID="TaxTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Down"
                                                DataValueField="Item" DataSource='<%# TaxTypeDS%>' Skin="Sunset" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TaxTypeDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TaxTypeDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="TaxTypeDDL" ErrorMessage="*" ForeColor="Red" />
                                         </EditItemTemplate>



                                       
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="Transport" HeaderText="TransportType <br/> BillSizeType <br/> TripType" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Transporttypedescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("billsizetypedescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripTypeDescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="TptTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# TptTypeDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TptTypeDS,DataBinder.Eval(Container.DataItem, "tpttype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillSizeTypeDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "billsizetype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="TripTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up" Enabled="true"
                                                DataValueField="Item" DataSource='<%# TripTypeDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripTypeDS,DataBinder.Eval(Container.DataItem, "triptype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="BillOption1" HeaderText="BillOption1 <br/> BillOption2" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("billoption1descr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("billoption2descr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="BillOption1DDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillOption1DS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption1DS,DataBinder.Eval(Container.DataItem, "billoption1").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="BillOption2DDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillOption2DS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption2DS,DataBinder.Eval(Container.DataItem, "billoption2").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    
                                    <telerik:GridTemplateColumn UniqueName="BillingCalcMethod" HeaderText="Calc Method <br/> Calc Factor" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("billingcalcmethod")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("billingcalcmethodfactor")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="BillingCalcMethodDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# CalcMethodDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CalcMethodDS,DataBinder.Eval(Container.DataItem, "billingcalcmethod").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="BillingCalcMethodFactorTXT" Text='<%# DataBinder.Eval(Container.DataItem, "billingcalcmethodfactor") %>'
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="POL" HeaderText="POL <br/> POD" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("POLDescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("PODDescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="POLCBB" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# POLDS%>' Skin="Sunset" Width="150px"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(POLDS,DataBinder.Eval(Container.DataItem, "POL").ToString())%>'
                                                AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="PODCBB" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# PODDS%>' Skin="Sunset" Width="150px"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PODDS,DataBinder.Eval(Container.DataItem, "POD").ToString())%>'
                                                AutoPostBack="true">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="FrCity" HeaderText="FrCity <br/> ToCity" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("frCityCode")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("toCityCode")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="FrCityCBB" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# FrCityDS%>' Skin="Sunset" Width="150px"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(FrCityDS,DataBinder.Eval(Container.DataItem, "frCityCode").ToString())%>'
                                                AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="ToCityCBB" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# ToCityDS%>' Skin="Sunset" Width="150px"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ToCityDS,DataBinder.Eval(Container.DataItem, "toCityCode").ToString())%>'
                                                AutoPostBack="true">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="ChargeCode" HeaderText="ChargeCode <br/> Description" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Chargeid")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("chargedescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="ChargeCodeList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# ChargeCodeDS%>' Skin="Sunset" Width="150px"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChargeCodeDS,DataBinder.Eval(Container.DataItem, "chargeid").ToString())%>'
                                                OnSelectedIndexChanged="ChargeCodeSelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <asp:RequiredFieldValidator ID="ChargeCodeListReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="ChargeCodeList" ErrorMessage="*" ForeColor="Red" />
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="DescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="AddDate <br/> AddUser" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("adddate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("adduser")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("adddate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("adduser")) %>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Edit" HeaderText="EditDate <br/> EditUser" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("editdate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("edituser")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("editdate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("edituser")) %>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="LogTabView" Height="700px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
