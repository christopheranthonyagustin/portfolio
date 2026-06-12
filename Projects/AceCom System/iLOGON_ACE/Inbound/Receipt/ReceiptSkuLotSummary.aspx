<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptSkuLotSummary.aspx.cs" Inherits="iWMS.Web.Inbound.Receipt.ReceiptSkuLotSummary" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error Response</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
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

            let JsonArr = [];
            function BatchEditClosed(sender, args) {
                var CartonCount = "", ReceiptId = "", SKUCode = "", PiecePerCarton = "", StartingCartonNo = "";

                var Hidden1 = document.getElementById('<%= Hidden1.ClientID %>');
                Hidden1.value = "";

                ReceiptId = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "BatchReceiptId").innerText;
                SKUCode = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "BatchSKUCode").innerText;
                RCSDTIDArray = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "RCSDTIDArray").innerText;

                var StartingCartonNoTxt = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "StartingCartonNo");
                if (StartingCartonNoTxt != null) {
                    StartingCartonNo = StartingCartonNoTxt.innerText;
                }

                var CartonCountTxt = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "CartonCount");
                if (CartonCountTxt != null) {
                    CartonCount = CartonCountTxt.innerText;
                }

                var PiecePerCartonTxt = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "PCS/CTN");
                if (PiecePerCartonTxt != null) {
                    PiecePerCarton = PiecePerCartonTxt.innerText;
                }

                JsonArr.push({
                    "ReceiptId": ReceiptId,
                    "SKUCode": SKUCode,
                    "RCSDTIDArray": RCSDTIDArray,
                    "StartingCartonNo": StartingCartonNo,
                    "PiecePerCarton": PiecePerCarton,
                    "CartonCount": CartonCount
                });

                let LastElement = JsonArr.slice(-1);

                Hidden1.value = JSON.stringify(LastElement);

                var Hidden2 = document.getElementById('<%= Hidden2.ClientID %>');

                if (Hidden2 != null && Hidden2.value != "") {
                    Hidden2.value = Hidden2.value + "^" + Hidden1.value;
                }
                else {
                    Hidden2.value = Hidden1.value;
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">

            <telerik:RadPageView runat="server" Height="580px" ID="CartonSummaryRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh" CausesValidation="false" OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CartonBtn" runat="server" CssClass="blue" Text="Carton Label" CausesValidation="false" OnClick="CartonBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" CssClass="Pagetitle"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:HiddenField ID="Hidden1" runat="server" />
                <asp:HiddenField ID="Hidden2" runat="server" />
                <asp:HiddenField ID="Hidden3" runat="server" />
                <asp:HiddenField ID="JSONHiddenValue" runat="server" />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        <ClientEvents OnBatchEditClosed="BatchEditClosed" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="ReceiptId"
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
                            <telerik:GridBoundColumn UniqueName="BatchReceiptId" DataField="ReceiptId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="BatchSKUCode" DataField="SKUCode" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>

            </telerik:RadPageView>

        </telerik:RadMultiPage>
    </form>
</body>
</html>
