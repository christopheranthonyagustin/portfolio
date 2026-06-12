<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderCODJobs.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderCODJobs" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TMSBookingOrderCODJobs</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form defaultbutton="SearchBtn" id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                                OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                             <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel"
                                OnClick="ExcelBtn_Click" UseSubmitBehavior="false" />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="CODAmount" Name="MainGrid" AllowFilteringByColumn="false">
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
                            <telerik:GridBoundColumn DataField="JobNumber" UniqueName="JobNumber" SortExpression="JobNumber" HeaderText="JobNumber">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Entity" UniqueName="Entity" SortExpression="Entity" HeaderText="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustRef" UniqueName="CustRef" SortExpression="CustRef" HeaderText="CustRef">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PIC" UniqueName="PIC" SortExpression="PIC" HeaderText="PIC">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Salesman" UniqueName="Salesman" SortExpression="Salesman" HeaderText="Salesman">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipmentType" UniqueName="ShipmentType" SortExpression="ShipmentType" HeaderText="ShipmentType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TransportType" UniqueName="TransportType" SortExpression="TransportType" HeaderText="TransportType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryDate" UniqueName="DeliveryDate" SortExpression="DeliveryDate" HeaderText="DeliveryDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CODAmount" UniqueName="CODAmount" SortExpression="CODAmount" HeaderText="CODAmount" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CODCollected" UniqueName="CODCollected" SortExpression="CODCollected" HeaderText="CODCollected" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CODPaymentMode" UniqueName="CODPaymentMode" SortExpression="CODPaymentMode" HeaderText="CODPaymentMode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CODRemarks" UniqueName="CODRemarks" SortExpression="CODRemarks" HeaderText="CODRemarks">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView> 
        </telerik:RadMultiPage>
    </form>
</body>
</html>
