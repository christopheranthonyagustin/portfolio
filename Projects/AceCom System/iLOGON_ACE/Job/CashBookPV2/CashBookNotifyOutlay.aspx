<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookNotifyOutlay.aspx.cs" Inherits="iWMS.Web.Job.CashBookPV2.CashBookNotifyOutlay" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CashBook NotifyOutlay</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="NotifyOutlay" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
                <br />
        <asp:Button ID="NotifyOutlayBtn" runat="server" Text="Notify" Visible="true" UseSubmitBehavior="false" CssClass="white"
            OnClick="NotifyOutlayBtn_Click" OnClientClick="disableBtn(this.id)"></asp:Button>
        <br /><br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" AllowPaging="true"
            GroupPanelPosition="Top" AllowSorting="true">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>

            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="100" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="ReferenceNo" DataField="ReferenceNo "
                        ColumnGroupName="ReferenceNo" SortExpression="ReferenceNo" UniqueName="ReferenceNo">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="Customer" DataField="Customer " AllowFiltering="false"
                        ColumnGroupName="Customer" SortExpression="Customer" UniqueName="Customer" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="Date" DataField="Date" AllowFiltering="false"
                        ColumnGroupName="Date" SortExpression="Date" UniqueName="Date"
                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="ChargeDescription" DataField="ChargeDescription" AllowFiltering="false"
                        ColumnGroupName="ChargeDescription" SortExpression="ChargeDescription" UniqueName="ChargeDescription"
                        Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="Amount" DataField="Amount" AllowFiltering="false"
                        ColumnGroupName="Amount" SortExpression="Amount" UniqueName="Amount" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="JobNumber" DataField="JobNumber" AllowFiltering="false"
                        ColumnGroupName="JobNumber" SortExpression="JobNumber" UniqueName="JobNumber" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="ContainerNo" AllowFiltering="false"
                        ColumnGroupName="ContainerNo" SortExpression="ContainerNo" UniqueName="ContainerNo"
                        Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="Vendor" DataField="Vendor" AllowFiltering="false"
                        ColumnGroupName="Vendor" SortExpression="Vendor" UniqueName="Vendor"
                        Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="Vehicle" DataField="Vehicle" AllowFiltering="false"
                        ColumnGroupName="Vehicle" SortExpression="Vehicle" UniqueName="Vehicle"
                        Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="Driver" DataField="Driver" AllowFiltering="false"
                        ColumnGroupName="Driver" SortExpression="Driver" UniqueName="Driver"
                        Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                    <telerik:GridBoundColumn Display="False" DataField="cbid" SortExpression="cbid" />
                    <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status" />

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

    </form>
</body>
</html>
