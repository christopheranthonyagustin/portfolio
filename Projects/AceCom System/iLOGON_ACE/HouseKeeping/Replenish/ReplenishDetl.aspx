<%@ Page Language="c#" CodeBehind="ReplenishDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.HouseKeeping.Replenish.ReplenishDetl" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReplenishDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
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
        <table>
            <tr>
                <td>
                    <asp:Button ID="FinalizeBtn" CssClass="White" runat="server" OnClick="FinalizeBtn_Click"
                        Text="Finalize" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="GenerateBtn" CssClass="White" runat="server" OnClick="GenerateBtn_Click"
                        Text="Generate" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="RemoveBtn" CssClass="White" runat="server" OnClick="RemoveBtn_Click"
                        Text="Remove" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
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
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false">
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="pfloccode" SortExpression="pfloccode" HeaderText="PickFace" />
                    <telerik:GridBoundColumn DataField="replenishqty" SortExpression="replenishqty" HeaderText="ReplenishQty"
                        ItemStyle-HorizontalAlign="Center" />
                    <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM" />
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU" />
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description" />
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" />
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" />
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" />
                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IRId" Display="False">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
