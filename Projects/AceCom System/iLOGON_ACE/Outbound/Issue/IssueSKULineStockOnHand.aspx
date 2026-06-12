<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueSKULineStockOnHand.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueSKULineStockOnHand" %>

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

            function CheckKey() {
                if (event.keyCode == 13) {
                    event.preventDefault();
                }
            }

            function BatchEditClosed(sender, args) {
                var RequestQty = "", StockId = "";
                var JsonArr = [];

                var Hidden1 = document.getElementById('<%= Hidden1.ClientID %>');

                StockId = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "BatchStockId").innerText;
                var RequestQtyTxt = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "RequestQty");
                if (RequestQtyTxt != null) {
                    RequestQty = RequestQtyTxt.innerText;
                }

                JsonArr.push({
                    "StockId": StockId,
                    "RequestQty": RequestQty
                });

                Hidden1.value = JSON.stringify(JsonArr);

                var Hidden2 = document.getElementById('<%= Hidden2.ClientID %>');

                if (Hidden2 != null && Hidden2.value != "") {
                    Hidden2.value = Hidden2.value + "^" + Hidden1.value;
                }
                else {
                    Hidden2.value = Hidden1.value;
                }

                console.log(Hidden2.value);
            }
        </script>
    </telerik:RadCodeBlock>
    <style>
    .fixed-button {
        position: fixed;
        right: 10px;
        width: 32px;
        height: 32px;
        color: #000000;
        font-size: 16px;
        font-weight: bold;
        font-family: Arial;
        background: #ffffff;
        border-radius: 70%;
        text-decoration: none;
        border: solid #999999 2px;
        box-shadow: 0px 0px 3px #666666;
        outline: none;
    }

    .fixed-button:hover {
        background: #b3b3b3;
        text-decoration: none;
    }

    .fixed-button:disabled {
        background: #dbdbdb;
        color: #969696;
    }
</style>
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

        <table width="100%">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="SelectStockonHandBtn" runat="server" Text="Select Stock on Hand" OnClientClick="disableBtn(this.id)"
                        UseSubmitBehavior="false" CssClass="LongLabelWhite" OnClick="SelectStockonHandBtn_Click"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="SwapBtn" class="fixed-button" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="Hidden1" runat="server" />
        <asp:HiddenField ID="Hidden2" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true" OnPreRender="ResultDG_PreRender"
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
                    <telerik:GridBoundColumn UniqueName="BatchStockId" DataField="StockId" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
