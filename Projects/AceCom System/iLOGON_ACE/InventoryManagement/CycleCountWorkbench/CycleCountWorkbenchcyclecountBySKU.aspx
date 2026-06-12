<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CycleCountWorkbenchcyclecountBySKU.aspx.cs" Inherits="iWMS.Web.InventoryManagement.CycleCountWorkbench.CycleCountWorkbenchcyclecountBySKU" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Outbound Delivery Stock onhand</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />

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

            function BatchEditClosed(sender, args) {
                var RequestQty = "", SlltId = "";
                var JsonArr = [];

                var Hidden1 = document.getElementById('<%= Hidden1.ClientID %>');

                SLLTId = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "BatchSlltId").innerText;
                var RequestQtyTxt = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "RequestQty");
                if (RequestQtyTxt != null) {
                    RequestQty = RequestQtyTxt.innerText;
                }

                JsonArr.push({
                    "SlltId": SLLTId,
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
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="580px" ID="PlannedRadPageView">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_CycleCountSchedule" runat="server" />
                        </td>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="RequestSKUCountBtn" CssClass="LongLabelWhite" runat="server" OnClick="RequestSKUCountBtn_Click"
                    Text="&nbsp;&nbsp;Request &nbsp;&nbsp;SKU Count" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                <br />
                <asp:HiddenField ID="Hidden1" runat="server" />
                <asp:HiddenField ID="Hidden2" runat="server" />
                <asp:HiddenField ID="JSONHiddenValue" runat="server" />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                    OnColumnCreated="ResultDG_ColumnCreated">
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="300" HeaderStyle-CssClass="RGridHeader_CUSTOM"
                        HeaderStyle-ForeColor="White" DataKeyNames="SKUID"
                        EditMode="Batch" CommandItemDisplay="None">
                        <BatchEditingSettings EditType="Row" />
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true" Display="true"
                                HeaderStyle-Wrap="true" ItemStyle-Wrap="true">
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
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
