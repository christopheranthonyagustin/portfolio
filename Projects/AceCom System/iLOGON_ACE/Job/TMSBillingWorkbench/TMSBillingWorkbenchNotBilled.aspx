<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBillingWorkbenchNotBilled.aspx.cs" Inherits="iWMS.Web.Job.TMSBillingWorkbench.TMSBillingWorkbenchNotBilled" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TMS Billing Workbench Not Billed</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
    </script>
    <style type="text/css">
        .style1 {
            width: 85px;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="JobNotBillTab" Text="Job Not Billed" Value="50" runat="server"></telerik:RadTab>
                <telerik:RadTab Id="ContainerNotBilledTab" Text="Container Not Billed" Value="70" runat="server"></telerik:RadTab>
                <telerik:RadTab Id="BillableItemsTab" Text="BillableItems" Value="100" runat="server"></telerik:RadTab>
                <telerik:RadTab Id="ShippingRelatedChargesTab" Text="Shipping Related Charges" Value="150" runat="server"></telerik:RadTab>
                <telerik:RadTab Id="TruckingRelatedChargesTab" Text="Trucking Related Charges" Value="170" runat="server"></telerik:RadTab>
                <telerik:RadTab Id="DepotShippingLineChargesTab" Text="Depot Shipping Line Charges" Value="200" runat="server"></telerik:RadTab>
                <telerik:RadTab Id="DailyCompletedTripsTab" Text="DailyCompletedTrips" Value="250" runat="server"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="NotBilledRadPageView">
                <table cellspacing="2" cellpadding="2" width="30%">
                    <br />
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <asp:Button ID="SearchBtn" CausesValidation="false" runat="server" Text="Search" CssClass="white"
                                OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                        </td>
                        <td>
                            <asp:Button ID="excelBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />
                        </td>
                        <td>
                            <asp:Button ID="SingleBillBtn" CausesValidation="false" runat="server" Text="Single" CssClass="white"
                                OnClick="SingleBillBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                        </td>
                        <td>
                            <asp:Button ID="ConsolidatedBillBtn" CausesValidation="false" runat="server" Text="Consolidated" CssClass="white"
                                OnClick="ConsolidatedBillBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None" AllowFilteringByColumn="true" Visible="false"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG2_NeedDataSource" OnItemDataBound="ResultDG2_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBId" Name="NotBilledGrid">
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
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDateFormat" UniqueName="JobCreationDate" SortExpression="AddDate" HeaderText="JobCreationDate" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CompleteDateFormat" UniqueName="completedate" SortExpression="completedate" HeaderText="CompleteDate" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="XMLContainerNo" UniqueName="XMLContainerNo" SortExpression="XMLContainerNo" HeaderText="ContainerNo" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderBy" UniqueName="OrderBy" SortExpression="OrderBy" HeaderText="OrderBy" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QUNO" UniqueName="QUNO" SortExpression="QUNO" HeaderText="QuotationNo" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobDescr" UniqueName="JobDescr" SortExpression="JobDescr" HeaderText="JobDesription" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobSpecialInstruction" UniqueName="JobSpecialInstruction" SortExpression="JobSpecialInstruction" HeaderText="SpecialInstruction" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ACId" UniqueName="ACId" Display="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="93%" ID="ContainerNotBilledRadPageView" ContentUrl="TMSBillingWorkbenchContainerNotBilled.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="92%" ID="BillableItemsRadPageView"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ShippingRelatedChargesRadPageView" ContentUrl="TMSBillingWorkbenchPVSearch.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="95%" ID="TruckingRelatedChargesRadPageView" ContentUrl="TMSBillingWorkbenchTruckingRelatedCharges.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="93%" ID="DepotShippingLineChargesRadPageView" ContentUrl="TMSBillingWorkbenchBillByCharge.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="95%" ID="DailyCompletedTripsRadPageView" ContentUrl="TMSBillingWorkbenchDailyCompletedTrips.aspx"></telerik:RadPageView>
        </telerik:RadMultiPage>

        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="800px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
