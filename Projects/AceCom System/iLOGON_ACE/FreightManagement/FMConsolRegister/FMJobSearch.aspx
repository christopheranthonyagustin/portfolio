<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobSearch.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsolRegister.FMJobSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip" MultiPageID="RadMultiPage2" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip_TabClick">
            <Tabs>
                <telerik:RadTab Text="JobSearch" ID="SearchTab" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="ConsolSearch" ID="ConsolSearchTab" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="ContainerSearch" ID="ContainerSearchTab" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="GenInvoice" ID="GenInvoiceTab" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Dashboard" ID="DashboardTab" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="SearchBtn" runat="server" CssClass="searchbtn" Text="Search"
                                OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Text="Excel"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To Excel" />
                        </td>
                        <td>
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ConsolSearchRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="Button1" runat="server" CssClass="white" Text="Search"
                                OnClick="SearchBtn_Click1" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                         <asp:Button ID="Button2" class="green" runat="server" OnClick="ExportExcel1" Text="Excel"
                             OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To Excel" />

                            <asp:Label Style="z-index: 0" ID="Label1" runat="server" Visible="False" CssClass="errorLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="9" colspan="9" valign="top">
                            <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1" AutoPostBack="true"
                                CausesValidation="false" SelectedIndex="0" Skin="Office2007">
                            </telerik:RadTabStrip>
                            <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                                <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <iWMS:iForm ID="IForm1" runat="server"></iWMS:iForm>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </telerik:RadPageView>
                            </telerik:RadMultiPage>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerSearchRadPageView">
                <div class="pagetitle">
                    <br />
                    <asp:Button ID="Button3" runat="server" CssClass="white" Text="Search"
                        OnClick="SearchBtn2_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                         <asp:Button ID="Button4" class="green" runat="server" OnClick="ExportExcel2" Text="Excel"
                             OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To Excel" />

                    &nbsp;<asp:Label Style="z-index: 0" ID="Label2" runat="server" Visible="False" CssClass="errorLabel" />
                </div>
                <br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td rowspan="9" colspan="9" valign="top">
                                    <iWMS:iForm ID="IForm2" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TransshipmentInvoiceRadPageView">
                <div class="pagetitle">
                    <br />
                    &nbsp;
                <asp:Button ID="SearchBtn_TransshipmentInvoice" runat="server" CssClass="white" Text="Search" CausesValidation="false"
                    OnClick="SearchBtn_TransshipmentInvoice_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                </div>
                <br />

                <table width="100%">
                    <tr>
                        <td valign="top">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl_TransshipmentInvoice" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadTabStrip runat="server" ID="RadTabStrip3" MultiPageID="RadMultiPage3" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Office2007" OnTabClick="RadTabStrip3_TabClick">
                    <Tabs>
                        <telerik:RadTab Id="JobTab" Text="Job" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="SalesInvoiceTab" Text="SalesInvoice" Value="100" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage3" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="90%" ID="JobPageView">
                        <br />
                        <asp:Button ID="GenInvBtn" runat="server" CssClass="LongLabelWhite" Text="Generate Invoice" CausesValidation="false"
                            OnClick="GenerateInvBtn_Click" Visible="true" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;&nbsp;
                                     <br />
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" PagerStyle-AlwaysVisible="true"
                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource">
                            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="20" DataKeyNames="entid" Width="100%" Name="ParentGrid">
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
                                    <telerik:GridBoundColumn DataField="FMJOBNo" UniqueName="FMJOBNo" SortExpression="FMJOBNo"
                                        HeaderText="Job">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EntCode" UniqueName="EntCode" SortExpression="EntCode"
                                        HeaderText="Entity">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AccName" UniqueName="AccName" SortExpression="AccName"
                                        HeaderText="Account">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ChargeCurrCode" UniqueName="ChargeCurrCode" SortExpression="ChargeCurrCode"
                                        HeaderText="Currency">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="branchcode" UniqueName="branchcode" SortExpression="branchcode"
                                        HeaderText="Branch">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="departmentcode" UniqueName="departmentcode" SortExpression="departmentcode"
                                        HeaderText="Department">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ShipperName" UniqueName="ShipperName" SortExpression="ShipperName"
                                        HeaderText="Shipper">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ConsigneeName" UniqueName="ConsigneeName" SortExpression="ConsigneeName"
                                        HeaderText="Consignee">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="POL" UniqueName="POL" SortExpression="POL" HeaderText="POL">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="POD" UniqueName="POD" SortExpression="POD" HeaderText="POD">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ShipperRef" UniqueName="ShipperRef" SortExpression="ShipperRef"
                                        HeaderText="ShipperRef">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FMJobId" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="SalesInvoiceRadPageView" Visible="true">
                        <table>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Button ID="AmendInvBtn" runat="server" CssClass="LongLabelWhite" Text="Amend Invoice" CausesValidation="false"
                                        OnClick="AmendInvBtn_Click" OnClientClick="return confirm('Confirm to Amend Invoice?');" />
                                    &nbsp;
                                <asp:Button ID="CancelInvBtn" class="LongLabelWhite" runat="server" OnClick="CancelBtn_Click"
                                    Text="Cancel &nbsp; Invoice" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    &nbsp;                  
                                <asp:Button ID="ReOpenInvBtn" runat="server" CssClass="LongLabelWhite" Text="&nbsp; ReOpen &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="ReOpenInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                    &nbsp;
                                <asp:Button ID="PostInvBtn" runat="server" CssClass="LongLabelWhite" Text="&nbsp; Post &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="PostInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Enabled="false" />
                                    &nbsp;
                                <asp:Button ID="PrintInvBtn" runat="server" CssClass="LongLabelBlue" Text="&nbsp; Print &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="PrintInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <telerik:RadGrid ID="ResultDG2" runat="server" EnableLinqExpressions="false"
                            AutoGenerateColumns="false" Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource" GridLines="None"
                            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
                                <CommandItemSettings ShowRefreshButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="cbicon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="InvNo" HeaderText="InvNo <br/> Date <br/> Status">
                                        <ItemTemplate>
                                            <%# string.Format("<b>{0:}</b>",Eval("invno")) %>
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("invdate")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Salesman <br/> DeliveryMethod" UniqueName="Salesman">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("smancode")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("InvoiceDeliveryMethod")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="BillTo <br/> Address" UniqueName="BillTo">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("billname")) %>
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("billaddr1")) %>
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("billaddr2")) %>
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("billaddr3")) %>
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("billaddr4")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PaymentInfo" HeaderText="PaymentInfo <br/> Payterm">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("InvoicePaymentInfo")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("payterms")) %>
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
                                    <telerik:GridTemplateColumn UniqueName="Edit" HeaderText="ModeifiedOn <br/> ModeifiedBy">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("editdate")) %>
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
                                    <telerik:GridBoundColumn DataField="TotInvamt" UniqueName="TotInvamt" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>


            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="FMConsolRegisterDashboardRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
