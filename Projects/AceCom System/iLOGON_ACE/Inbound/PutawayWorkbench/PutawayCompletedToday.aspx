<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PutawayCompletedToday.aspx.cs" Inherits="iWMS.Web.Inbound.PutawayWorkbench.PutawayCompletedToday" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>Putaway Pool @ Putaway Workbench</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />      
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="420px" />
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account" HeaderStyle-Width="250px" ItemStyle-Width="250px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GRNumber" UniqueName="GRNumber" SortExpression="GRNumber" HeaderText="GRNumber" HeaderStyle-Width="130px" ItemStyle-Width="130px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReceiveDate" UniqueName="ReceiveDate" SortExpression="ReceiveDate" HeaderText="ReceiveDate" HeaderStyle-Width="130px" ItemStyle-Width="130px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PalletNo" UniqueName="PalletNo" SortExpression="PalletNo" HeaderText="PalletNo" HeaderStyle-Width="130px" ItemStyle-Width="130px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Location" UniqueName="Location" SortExpression="Location" HeaderText="Location" HeaderStyle-Width="130px" ItemStyle-Width="130px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PutawayLocation" UniqueName="PutawayLocation" SortExpression="PutawayLocation" HeaderText="Putaway Location" HeaderStyle-Width="130px" ItemStyle-Width="130px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Zone" UniqueName="Zone" SortExpression="Zone" HeaderText="Zone" HeaderStyle-Width="130px" ItemStyle-Width="130px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RCId" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
