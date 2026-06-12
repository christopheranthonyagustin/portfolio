<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutboundDeliveryAvailableStocks.aspx.cs" Inherits="iWMS.Web.Outbound.OutboundDelivery.OutboundDeliveryAvailableStocks" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Available Stocks</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
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
                var PickQty = "", SlltId = "";
                var JsonArr = [];

                var Hidden1 = document.getElementById('<%= Hidden1.ClientID %>');

                SLLTId = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "BatchSlltId").innerText;
                var PickQtyTxt = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "PickQty");
                if (PickQtyTxt != null) {
                    PickQty = PickQtyTxt.innerText;
                }

                JsonArr.push({
                    "SlltId": SLLTId,
                    "PickQty": PickQty
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

        <asp:Button ID="AddtoPickBtn" runat="server" CssClass="white" Text="Add to Pick" OnClick="AddtoPickBtn_Click"
            OnClientClick="disableBtn(this.id, false);" UseSubmitBehavior="false" />
        <br />
        <br />
        <asp:HiddenField ID="Hidden1" runat="server" />
        <asp:HiddenField ID="Hidden2" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                <ClientEvents OnBatchEditClosed="BatchEditClosed" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="slltid"
                EditMode="Batch" CommandItemDisplay="None">
                <BatchEditingSettings EditType="Row" />
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" AutoPostBack="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="BatchSlltId" DataField="slltid" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
