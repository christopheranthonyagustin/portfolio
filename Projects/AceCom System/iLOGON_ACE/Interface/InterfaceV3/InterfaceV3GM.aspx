<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterfaceV3GM.aspx.cs" Inherits="iWMS.Web.Interface.InterfaceV3.InterfaceV3GM" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GM @ Interface</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" Text="Search"
                        OnClick="SearchBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <br />
                </td>
            </tr>
        </table>

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="420" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="FileName" HeaderText="FileName" SortExpression="FileName" HeaderStyle-Width="250px" ItemStyle-Width="250px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PONumber" HeaderText="PONumber" SortExpression="PONumber" HeaderStyle-Width="130px" ItemStyle-Width="130px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TransactionDate" HeaderText="TransactionDate" SortExpression="TransactionDate" HeaderStyle-Width="140px" ItemStyle-Width="140px" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PostingDate" HeaderText="PostingDate" SortExpression="PostingDate" HeaderStyle-Width="140px" ItemStyle-Width="140px" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeliveryNote" HeaderText="DeliveryNote" SortExpression="DeliveryNote" HeaderStyle-Width="250px" ItemStyle-Width="250px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GRGINumber" HeaderText="GRGINumber" SortExpression="GRGINumber" HeaderStyle-Width="130px" ItemStyle-Width="130px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MovementType" HeaderText="MovementType" SortExpression="MovementType" HeaderStyle-Width="130px" ItemStyle-Width="130px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU" SortExpression="SKU" HeaderStyle-Width="250px" ItemStyle-Width="250px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Quantity" HeaderText="Quantity" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UOM" HeaderText="UOM" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Plant" HeaderText="Plant" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StorageLocation" HeaderText="StorageLocation" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BatchNumber" HeaderText="BatchNumber" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ExpiryDate" HeaderText="ExpiryDate" HeaderStyle-Width="120px" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReceivingPlant" HeaderText="ReceivingPlant" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReceivingStorageLocation" HeaderText="ReceivingStorageLocation" HeaderStyle-Width="170px" ItemStyle-Width="170px" AllowFiltering="false"></telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="GRGISlipNumber" HeaderText="GRGISlipNumber" SortExpression="GRGISlipNumber" HeaderStyle-Width="130px" ItemStyle-Width="130px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NoOfTries" HeaderText="NoOfTries" SortExpression="NoOfTries" HeaderStyle-Width="100px" ItemStyle-Width="100px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="InterfaceStatusDescr" HeaderText="InterfaceStatus" SortExpression="InterfaceStatusDescr" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="InterfaceMessage" HeaderText="InterfaceMessage" SortExpression="InterfaceMessage" HeaderStyle-Width="250px" ItemStyle-Width="250px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SentDate" HeaderText="SentDate" SortExpression="SentDate" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}" HeaderStyle-Width="250px" ItemStyle-Width="250px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="InterfaceStatusColorCode" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
