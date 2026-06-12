<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPackingBuildHandlingUnit.aspx.cs" Inherits="iWMS.Web.Outbound.OrderPacking.OrderPackingBuildHandlingUnit" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Build Handing Unit</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm"
                        OnClick="ConfirmBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
            AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true"
            AllowPaging="true" AutoGenerateColumns="false" GridLines="None">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="PKCtnId" TableLayout="Fixed" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input id="CBSelectAll" name="CBSelectAll" type="checkbox" onclick="CBResultDGSelectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CHKObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="PackageNumber" UniqueName="PackageNumber" HeaderText="PackageNumber" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                        SortExpression="PackageNumber" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PackageType" UniqueName="PackageType" HeaderText="PackageType" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                        SortExpression="PackageType" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HUNumber" UniqueName="HUNumber" HeaderText="HUNumber" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                        SortExpression="HUNumber" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HUType" UniqueName="HUType" HeaderText="HUType" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                        SortExpression="HUType" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HUId" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                function CBResultDGSelectAll(id) {
                    var MasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    var row = MasterTable.get_dataItems();
                    if (id.checked == true) {
                        for (var i = 0; i < row.length; i++) {
                            MasterTable.get_dataItems()[i].findElement("CHKObjective").checked = true;
                        }
                    }
                    else {
                        for (var i = 0; i < row.length; i++) {
                            MasterTable.get_dataItems()[i].findElement("CHKObjective").checked = false;
                        }
                    }
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
