<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackToteStationOrderAndPackQty.aspx.cs" Inherits="iWMS.Web.Outbound.PackToteStation.PackToteStationOrderAndPackQty" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pack Tote Station</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args)
        {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" Text="SKU" Font-Size="Small"></asp:Label>
                    <br />
                    <telerik:RadTextBox runat="server" ID="SKUTxtBox" Skin="WebBlue" Width="155px" AutoPostBack="true" OnTextChanged="SKUTxtBox_TextChanged" LabelWidth="62px" Resize="None"></telerik:RadTextBox>
                </td>
                <td style="padding-left:15px"></td>
                <td>
                    <br />
                    <asp:Button ID="CloseAndSealBtn" CssClass="LongLabelWhite" runat="server" Text="Close & Seal" Enabled="false"
                        OnClick="CloseAndSealBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td style="padding-left:15px"></td>
                <td>
                    <br />
                    <asp:Button ID="SelectPrinterBtn" CssClass="LongLabelWhite" runat="server" Text="Select Printer"
                        OnClick="SelectPrinterBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Label ID="ActivePrinterLbl" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </td>
            </tr>
        </table>

        <br />

        <telerik:RadGrid ID="OrderSummaryResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="OrderSummaryResultDG_NeedDataSource" OnColumnCreated="OrderSummaryResultDG_ColumnCreated">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>

        <br />

        <telerik:RadGrid ID="OrderSKUResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnColumnCreated="OrderSKUResultDG_ColumnCreated"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="OrderSKUResultDG_NeedDataSource" OnItemDataBound="OrderSKUResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="S/N" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderText="S/No">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

    </form>
</body>
</html>
