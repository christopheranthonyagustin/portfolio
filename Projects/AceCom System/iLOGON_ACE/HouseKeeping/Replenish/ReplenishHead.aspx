<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="ReplenishHead.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.HouseKeeping.Replenish.ReplenishHead" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReplenishHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <div id="div-datagrid" style="height: 98%">
            <table cellspacing="2">
                <tr>
                    <td>
                        <asp:Button ID="FinalizeBtn" CssClass="White" runat="server" OnClick="FinalizeBtn_Click"
                            Text="Finalize" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="PrintIRBtn" runat="server" Text="Replenishment Ticket" OnClick="PrintIRBtn_Click"
                            CssClass="LongLabelBlue" ToolTip="Print Replenishment Ticket" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                PageSize="16" AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
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
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                            <ItemTemplate>
                                <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Cancel?')"
                                    onserverclick="Delete" runat="server" visible="false">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                        title="Cancel" runat="server" />
                                </a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="Number" SortExpression="Number" HeaderText="ReplenishNo" />
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account" />
                        <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site" />
                        <telerik:GridBoundColumn DataField="status" SortExpression="status" Display="false" />
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" />
                        <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks" />
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" />
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" />
                        <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="acid" Display="False" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
