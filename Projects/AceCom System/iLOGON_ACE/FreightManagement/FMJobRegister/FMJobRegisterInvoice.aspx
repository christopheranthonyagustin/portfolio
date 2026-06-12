<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterInvoice.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterInvoice" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMJobRegisterInvoice</title>
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

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
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

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }

        function ClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager><br />
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
                    <table>
                        <tr>
                            <td>&nbsp;
                                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text="Save" ValidationGroup="reqvalgrp"
                                    OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                                &nbsp;
                                <asp:Button ID="AmendInvBtn" runat="server" CssClass="LongLabelWhite" Text="Amend Invoice" CausesValidation="false"
                                    OnClick="UndoInvBtn_Click" OnClientClick="return confirm('Confirm to Amend Invoice?');" />
                                &nbsp;
                                <asp:Button ID="CancelBtn" CssClass="LongLabelWhite" runat="server" OnClick="CancelBtn_Click" CausesValidation="false"
                                    Text="Cancel &nbsp; Invoice" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;                  
                                <asp:Button ID="ReOpenInvBtn" runat="server" CssClass="LongLabelWhite" Text="&nbsp; ReOpen &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="ReOpenInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="PostInvBtn" runat="server" CssClass="LongLabelWhite" Text="&nbsp; Post &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="PostInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="PrintInvBtn" runat="server" CssClass="LongLabelBlue" Text="&nbsp; Print &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="PrintInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="AssociatedBtn" runat="server" CssClass="LongLabelWhite" Text="Associated BL" CausesValidation="false"
                                    OnClick="AssociatedBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            </td>
                            <td>&nbsp;
                            <telerik:RadMenu ID="EmailRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true" CssClass="mainMenu"
                                OnItemClick="EmailRadMenu_ItemClick" Width="115px" OnClientItemClicked="ClientOnClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp; Email &nbsp;&nbsp;&nbsp;" PostBack="false" BackColor="#88fd64"
                                        Value="Print" CssClass="WrappingItem" Font-Bold="true">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PrintInvoice" Text="Print Invoice"
                                                BackColor="White" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
                <br />

                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="False" OnItemCommand="ResultDG_ItemCommand"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnPreRender="ResultDG_PreRender">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" PageSize="50" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" OnCheckedChanged="SalesInvChk_CheckedChanged" AutoPostBack="true" />
                                            &nbsp;
                                            <asp:ImageButton runat="server" Visible="True" ID="ParentUpdate" ImageUrl="../../image/floppy.gif"
                                                Width="15" Height="15" AlternateText="Update" CommandName="ParentUpdate" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            &nbsp;
                                           <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TemplateEdit" CommandName="TemplateEdit"
                                               ImageUrl="../../image/poptodec.png" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                               OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>

                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="CopyTemplate" CommandName="CopyTemplate"
                                                ImageUrl="../../image/Populate.png" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                                OnClick="Copy_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="entcode" UniqueName="entcode" HeaderText="Entity">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="InvNumber" HeaderText="InvNo <br/> Date <br/> Status">
                                        <ItemTemplate>
                                            <%# string.Format("<b>{0:}</b>",Eval("invno")) %>
                                            <br />
                                            <br />
                                            <telerik:RadDatePicker ID="InvDate" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "invdate") %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight" ValidateRequestMode="Enabled"
                                                OnSelectedDateChanged="InvDate_SelectedDateChanged" AutoPostBack="true">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <telerik:RadLabel runat="server" ID="InvDateLbl" Text='<%# string.Format("{0:dd/MMM/yyyy}",Eval("invdate")) %>' Visible="false" />
                                            <asp:RequiredFieldValidator ID="InvDateReqVal" runat="server" ControlToValidate="InvDate" ForeColor="Red" ErrorMessage="*" />
                                            <br />
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("statusdescr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ARNo" HeaderText="ARNo <br/> Date  <br/> Status">
                                        <ItemTemplate>
                                            <%# string.Format("<b>{0:}</b>",Eval("ARNo")) %>
                                            <br />
                                            <br />
                                             <%# string.Format("{0:dd/MMM/yyyy}",Eval("ARDate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("ARStatusDescr")) %>                                            
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="CustomerReference <br/> Salesman <br/> DeliveryMethod" UniqueName="Salesman">
                                        <ItemTemplate>
                                             <telerik:RadTextBox runat="server" ID="CustomerReferenceTxt" Text='<%# DataBinder.Eval(Container.DataItem, "custrefno") %>'
                                                TextMode="SingleLine" Enabled="true" ToolTip="CustomerReference">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="SalesmanList" runat="server" DataTextField="descr"
                                                DataValueField="Item" DataSource='<%# SalesmanDS%>' Skin="WebBlue" Width="140px" RenderMode="Lightweight" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SalesmanDS,DataBinder.Eval(Container.DataItem, "smancode").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="InvoiceDeliveryMethodList" runat="server" DataTextField="descr"
                                                DataValueField="Item" DataSource='<%# InvoiceDeliveryMethodDS%>' Skin="WebBlue" Width="140px" RenderMode="Lightweight" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(InvoiceDeliveryMethodDS,DataBinder.Eval(Container.DataItem, "InvoiceDeliveryMethod").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadComboBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="BillTo <br/> Address" UniqueName="BillTo">
                                        <ItemTemplate>
                                            <telerik:RadComboBox ID="BillingAccountList" runat="server" DataTextField="Code" DataValueField="Acid" RenderMode="Lightweight" Skin="WebBlue" Width="170px"
                                                OnSelectedIndexChanged="BillingAccountSelectedIndex_Changed" AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "billname") %>'
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" OnItemsRequested="BillingAccountList_ItemsRequested" Visible="false">
                                            </telerik:RadComboBox>
                                            <telerik:RadTextBox runat="server" ID="BillingAccountName" Text='<%# DataBinder.Eval(Container.DataItem, "billname") %>'
                                                TextMode="MultiLine" Enabled="true" ToolTip="BillingAccountName">
                                            </telerik:RadTextBox>
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="AddressTxt" Text='<%# DataBinder.Eval(Container.DataItem, "billaddr1") %>'
                                                TextMode="SingleLine" Enabled="true" ToolTip="Address1">
                                            </telerik:RadTextBox>

                                            <telerik:RadTextBox runat="server" ID="AddressTxt2" Text='<%# DataBinder.Eval(Container.DataItem, "billaddr2") %>'
                                                TextMode="SingleLine" Enabled="true" ToolTip="Address2">
                                            </telerik:RadTextBox>
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="AddressTxt3" Text='<%# DataBinder.Eval(Container.DataItem, "billaddr3") %>'
                                                TextMode="SingleLine" Enabled="true" ToolTip="Address3">
                                            </telerik:RadTextBox>

                                            <telerik:RadTextBox runat="server" ID="AddressTxt4" 
                                                Text='<%# DataBinder.Eval(Container.DataItem, "billaddr4") %>'
                                                TextMode="SingleLine" Enabled="true" ToolTip="Address4">
                                            </telerik:RadTextBox>

                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PaymentInfo" HeaderText="PaymentInfo <br/> Payterm">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="PaymentInfoDDL" runat="server" DataTextField="descr"
                                                DataValueField="Item" DataSource='<%# PaymentInfoDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PaymentInfoDS,DataBinder.Eval(Container.DataItem, "InvoicePaymentInfo").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="PaytermsDDL" runat="server" DataTextField="descr"
                                                DataValueField="Item" DataSource='<%# PaytermsDS%>' Skin="WebBlue" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PaytermsDS,DataBinder.Eval(Container.DataItem, "payterms").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ChargeAmt" HeaderText="Amt">
                                        <ItemTemplate>
                                            <%# Eval("Billingamt", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ChargeTaxAmt" HeaderText="TaxAmt">
                                        <ItemTemplate>
                                            <%# Eval("taxamt", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="Currency" HeaderText="TotalAmount <br/> Currency">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TotalBillingamt")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("currcode")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ChargeLocalAmt" HeaderText="LocalAmt">
                                        <ItemTemplate>
                                            <%# Eval("BillingLocalamt", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CostLocalTaxAmt" HeaderText="Local </br> TaxAmt">
                                        <ItemTemplate>
                                            <%# Eval("BillingTaxLocalamt", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="LocalCurrency" HeaderText="TotalLocalAmount <br/> Currency">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TotalBillingLocalamt")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("Basecurrcode")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ARAmountOS" HeaderText="Oustsanding Amt <br/> Base Oustsanding Amt">
                                        <ItemTemplate>
                                            <%# string.Format("<b>{0:}</b>",Eval("ARAmountOS")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("ARBaseAmountOS")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Remarks" UniqueName="Remarks">
                                        <ItemTemplate>

                                            <telerik:RadTextBox runat="server" ID="RemarksTxt" Text='<%# DataBinder.Eval(Container.DataItem, "Remarks") %>'
                                                TextMode="MultiLine" Rows="4" Wrap="true" Enabled="true" ToolTip="Remarks">
                                            </telerik:RadTextBox>

                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Edit" HeaderText="ModeifiedOn <br/> ModeifiedBy">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("editdate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("edituser")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="status" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ARHId" UniqueName="ARHId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DRId" UniqueName="DRId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="fmjobid" UniqueName="fmjobid" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="InvNo" UniqueName="InvNo" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="billacid" UniqueName="billacid" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="billname" UniqueName="billname" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotAmt" UniqueName="TotAmt" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>

                        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="600px"
                            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
                        </telerik:RadWindow>

                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmApproveBtn" Text="" Style="display: none;" OnClick="ConfirmApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
                <td>
                    <asp:Button ID="ConfirmNoneApproveBtn" Text="" Style="display: none;" OnClick="ConfirmNoneApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmApproveCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmApproveBtn.UniqueID %>", "");
                }
            }
            function ConfirmNoneBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmNoneApproveBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>
