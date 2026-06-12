<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterfaceV3PO.aspx.cs" Inherits="iWMS.Web.Interface.InterfaceV3.InterfaceV3PO" %>

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
                <td>
                    <br />
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
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
                    <telerik:GridBoundColumn DataField="Processid" HeaderText="ProcessId" SortExpression="Processid" HeaderStyle-Width="180px" ItemStyle-Width="180px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FileName" HeaderText="FileName" SortExpression="FileName" HeaderStyle-Width="250px" ItemStyle-Width="250px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PONumber" HeaderText="PONumber" SortExpression="PONumber" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="POStatus" HeaderText="POStatus" SortExpression="POStatus" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Plant" HeaderText="Plant" SortExpression="Plant" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SLOC" HeaderText="SLOC" SortExpression="SLOC" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="POItem" HeaderText="POLine" SortExpression="POItem" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ScheduleLine" HeaderText="ScheduleLine" SortExpression="ScheduleLine" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeletionIndicator" HeaderText="DeletionIndicator" SortExpression="DeletionIndicator" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Vendor" HeaderText="Vendor" SortExpression="Vendor" HeaderStyle-Width="180px" ItemStyle-Width="180px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PODate" HeaderText="PODate" SortExpression="PODate" HeaderStyle-Width="140px" ItemStyle-Width="140px" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU" SortExpression="SKU" HeaderStyle-Width="180px" ItemStyle-Width="180px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUDescription" HeaderText="SKUDescription" SortExpression="SKUDescription" HeaderStyle-Width="220px" ItemStyle-Width="220px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Quantity" HeaderText="Quantity" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UOM" HeaderText="UOM" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddDate" HeaderText="AddDate" SortExpression="AddDate" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="130px" ItemStyle-Width="130px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UploadDate" HeaderText="UploadDate" SortExpression="UploadDate" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UploadStatusDescr" HeaderText="UploadStatus" SortExpression="UploadStatusDescr" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UploadRemarks" HeaderText="UploadRemarks" SortExpression="UploadRemarks" HeaderStyle-Width="250px" ItemStyle-Width="250px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UploadStatusColorCode" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
