<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueTUNO1StockonHand.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueTUNO1StockonHand" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <telerik:RadCodeBlock runat="server">
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
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClientClick="disableBtn(this.id)"
                        UseSubmitBehavior="false" CssClass="white" OnClick="SearchBtn_Click"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="SelectTUNO1Btn" runat="server" Text="Select TUNO1" OnClientClick="disableBtn(this.id)"
                        UseSubmitBehavior="false" CssClass="LongLabelWhite" OnClick="SelectTUNO1Btn_Click"></asp:Button>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" Width="180%"
            OnColumnCreated="ResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowKeyboardNavigation="true">
                <Selecting AllowRowSelect="true" />
                <ClientEvents OnBatchEditClosed="BatchEditClosed" OnKeyPress="CheckKey" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="StockId"
                EditMode="Batch" CommandItemDisplay="None">
                <BatchEditingSettings EditType="Row" />
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" AutoPostBack="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
