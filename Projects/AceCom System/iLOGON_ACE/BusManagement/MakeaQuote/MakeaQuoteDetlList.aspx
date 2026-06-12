<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeaQuoteDetlList.aspx.cs" Inherits="iWMS.Web.BusManagement.MakeaQuote.MakeaQuoteDetlList" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookaBusForm</title>
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
                <td>
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
                <asp:Panel ID="NewBtnPanel" runat="server">
                    <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New" CausesValidation="false"
                        OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text="Save" ValidationGroup="reqvalgrp"
                        OnClick="SaveBtn_Click" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="DiscardBtn" class="white" runat="server" OnClick="DiscardBtn_Click"
                        Text="Discard" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <br />
                </asp:Panel>
                
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                <asp:Panel ID="DetlPanel" runat="server" Visible="false">
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                        OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                        OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </asp:Panel>
                <br />
                
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" PageSize="50" HeaderStyle-HorizontalAlign="Center" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <ItemTemplate>
                                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                onserverclick="MakeaQuote_Delete" runat="server">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                    runat="server"></a>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="SeqNo" HeaderText="SeqNo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("seqno")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="BillMethod <br/> Quantity" UniqueName="BillMethod" ItemStyle-Width="160px">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="BillMethodDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillMethodDS%>' Skin="Sunset" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillMethodDS,DataBinder.Eval(Container.DataItem, "billingmethod").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="BillMethodDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillMethodDDL" ErrorMessage="*" />
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="QuantityTxt" Text='<%# DataBinder.Eval(Container.DataItem, "defaultqty") %>'
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="UnitRate <br/> UOM" UniqueName="UnitRate" ItemStyle-Width="160px">
                                        <ItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="UnitRateTxt" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>'
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="UOMDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# UOMDS%>' Skin="Sunset" Width="70px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UOMDS,DataBinder.Eval(Container.DataItem, "unitrateuom").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="UOMDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="UOMDDL" ErrorMessage="*" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Bill" HeaderText="BillSizeType <br/> BillOption1" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillSizeTypeDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "billsizetype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="BillOption1DDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillOption1DS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption1DS,DataBinder.Eval(Container.DataItem, "billoption1").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="ChargeCode" HeaderText="ChargeCode <br/> Description" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px">
                                        <ItemTemplate>
                                            <telerik:RadComboBox ID="ChargeCodeList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# ChargeCodeDS%>' Skin="Sunset" Width="150px"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChargeCodeDS,DataBinder.Eval(Container.DataItem, "chargeid").ToString())%>'
                                                OnSelectedIndexChanged="ChargeCodeSelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <asp:RequiredFieldValidator ID="ChargeCodeListReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="ChargeCodeList" ErrorMessage="*" />
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="DescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="AutoGen" HeaderText="AutoGen" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="AutoGenDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# AutoGenDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(AutoGenDS,DataBinder.Eval(Container.DataItem, "autogen").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="TaxType" HeaderText="TaxType <br/> Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="TaxTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# TaxTypeDS%>' Skin="Sunset" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TaxTypeDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TaxTypeDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="TaxTypeDDL" ErrorMessage="*" />
                                            <br />
                                            <br />
                                                <%# string.Format("{0:}",Eval("statusdescr")) %>                       
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                   <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="AddDate <br/> AddUser" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("adddate")) %>   
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("adduser")) %> 
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Edit" HeaderText="EditDate <br/> EditUser" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px">
                                        <ItemTemplate>
                                             <%# string.Format("{0:dd/MMM/yyyy}",Eval("editdate")) %> 
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("edituser")) %> 
                                        </ItemTemplate>
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
        </telerik:RadMultiPage>
    </form>
</body>
</html>
