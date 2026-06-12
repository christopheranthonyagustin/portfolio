<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipPlanCollection.aspx.cs" Inherits="iWMS.Web.Outbound.ShipPlan.ShipPlanCollection" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipPlanCollection</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br>
        <asp:Panel ID="btnPanel" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="CreateBtn" runat="server" Text="Create" CssClass="white" OnClick="CreateBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                        &nbsp;
                        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CssClass="white" OnClick="DeleteBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                        &nbsp;
                                <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                        &nbsp;
                     <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <label id="completelbl">
                                </label>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="spid" SortExpression="spid" HeaderText="SPId" Visible="false"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RcNumber" SortExpression="RcNumber" HeaderText="GRNo"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Type" SortExpression="Type" HeaderText="Type"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DropSeq" SortExpression="DropSeq" HeaderText="DropSeq"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TotalTU" SortExpression="TotalTU" HeaderText="TotalTU"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TUType" SortExpression="TUType" HeaderText="TUType"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfPKG" SortExpression="NoOfPKG" HeaderText="NoOfPKG"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfPLT" SortExpression="NoOfPLT" HeaderText="NoOfPLT"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PODStatus" SortExpression="PODStatus" HeaderText="PODStatus"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PODDate" SortExpression="PODDate" HeaderText="PODDate"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PODRemarks" SortExpression="PODRemarks" HeaderText="PODRemarks"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PODUser" SortExpression="PODUser" HeaderText="PODUser"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
