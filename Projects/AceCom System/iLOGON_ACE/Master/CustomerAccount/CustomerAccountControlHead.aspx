<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerAccountControlHead.aspx.cs" Inherits="iWMS.Web.Master.CustomerAccount.CustomerAccountControlHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>CustomerAccountControlHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ResultDG_RowDblClick(sender, args) {
            var index = args.get_itemIndexHierarchical();
            var tableView = args.get_tableView();
            var rows = tableView.get_dataItems();
            var selectedrow = rows[index];
            var acid = selectedrow.getDataKeyValue('acid');
            window.location = '../CustomerAccount/CustomerAccountDetl.aspx?acId=' + acid + '&tab=Control';
        }
    </script>
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ControlSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <ClientEvents OnRowDblClick="ResultDG_RowDblClick" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ClientDataKeyNames="acid">

                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="accode" ItemStyle-Wrap="false" SortExpression="accode"
                        HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" ItemStyle-Wrap="false" SortExpression="typedescr"
                        HeaderText="Type">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="datevalue" SortExpression="datevalue" HeaderText="DateFormat"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="numvalue" SortExpression="numvalue" HeaderText="CurrentId"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="numdigit" SortExpression="numdigit" HeaderText="LengthOfId"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="prefix" SortExpression="prefix" HeaderText="Prefix"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suffix" ItemStyle-Wrap="false" SortExpression="suffix"
                        HeaderText="Suffix">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef01" ItemStyle-Wrap="false" SortExpression="usrdef01"
                        HeaderText="UsrDef01">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef02" ItemStyle-Wrap="false" SortExpression="usrdef02"
                        HeaderText="UsrDef02">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef03" SortExpression="usrdef03" HeaderText="UsrDef03"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef04" ItemStyle-Wrap="false" SortExpression="usrdef04"
                        HeaderText="UsrDef04">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef05" ItemStyle-Wrap="false" SortExpression="usrdef05"
                        HeaderText="UsrDef05">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" ItemStyle-Wrap="false" SortExpression="adduser"
                        HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" ItemStyle-Wrap="false" SortExpression="adddate"
                        HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" ItemStyle-Wrap="false" SortExpression="edituser"
                        HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
