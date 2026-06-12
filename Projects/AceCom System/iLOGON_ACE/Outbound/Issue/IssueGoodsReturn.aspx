<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueGoodsReturn.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueGoodsReturn" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Goods Return @ Goods Issue</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmBtn" CssClass="white" runat="server" Text="Confirm"
                        OnClick="ConfirmBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" AllowFilteringByColumn="true">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="PTDTId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GINumber" HeaderText="GINumber">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUDescription" HeaderText="SKU Description">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UOM" HeaderText="UOM" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShippedQty" HeaderText="ShippedQty" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Lot1" DataField="Lot1" HeaderText="Lot1" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Lot4" DataField="Lot4" HeaderText="Lot4" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Lot5" DataField="Lot5" HeaderText="Lot5" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Lot6" DataField="Lot6" HeaderText="Lot6" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="Return Qty" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="ReturnQtyTxtBox" Text="0" TextMode="SingleLine" Width="140px" Skin="Sunset" BackColor="#ded7c6">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
