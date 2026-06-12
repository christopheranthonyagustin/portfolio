<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutgoingShipmentCtnrPickCheck.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.OutgoingShipmentCtnrPickCheck" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
</head>
<body>
    <table>
        <tr>
            <td>
                <asp:Label ID="NumberLbl" runat="server" CssClass="CtnrTitle" Font-Bold="true" Font-Size="Large"></asp:Label>
            </td>
        </tr>
    </table>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <h3>Full Pick</h3>
        <table>
            <tr>
                <asp:Button ID="excelImgBtn" class="LongLabelGreen" runat="server" OnClick="excelImgBtn_Click" Text="Excel" UseSubmitBehavior="true" />
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true"
            Skin="Metro">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNO1"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUCode" SortExpression="SKUCode" HeaderText="SKUCode"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LotNo" SortExpression="LotNo" HeaderText="LotNo"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FULLLOOSE" SortExpression="FULLLOOSE" HeaderText="FULLLOOSE"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ScannedQty" SortExpression="ScannedQty" HeaderText="ScannedQty"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <br />
        <h3>Loose Pick</h3>
        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG2_NeedDataSource" AllowSorting="true"
            Skin="Metro">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="Serialno" SortExpression="Serialno" HeaderText="Serialno"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNO1"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUCode" SortExpression="SKUCode" HeaderText="SKUCode"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LotNo" SortExpression="LotNo" HeaderText="LotNo"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FULLLOOSE" SortExpression="FULLLOOSE" HeaderText="FULLLOOSE"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ScannedQty" SortExpression="ScannedQty" HeaderText="ScannedQty"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
