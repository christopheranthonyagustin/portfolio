<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptReceivingLine.aspx.cs" Inherits="iWMS.Web.Inbound.Receipt.ReceiptReceivingLine" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
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
                            <asp:Button ID="ReceiptAdviceBtn" runat="server" CssClass="LongLabelGreen" Text="Receipt Advice" CausesValidation="false" OnClick="ReceiptAdviceBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ExportExcelBtn" runat="server" CssClass="LongLabelGreen" Text="Export Excel" CausesValidation="false" OnClick="ExportExcelBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
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
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
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
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true">
                                <ItemTemplate>
                                    <asp:Label ID="EdiSuccessLbl" runat="server" />
                                    <asp:Label ID="EdiFailedLbl" runat="server" />
                                    <asp:Label ID="EDIStatusDoneLbl" runat="server" />
                                    <asp:Label ID="EDIStatusErrorLbl" runat="server" />
                                    <asp:Label ID="EDIStatusSentLbl" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>

            </telerik:RadPageView>

        </telerik:RadMultiPage>

        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="white" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="Okay" class="white" />&nbsp;

                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>

        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmAllBtn" Text="" Style="display: none;" OnClick="OkayImg_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
                <td>
                    <asp:Button ID="ConfirmUpdateBtn" Text="" Style="display: none;" OnClick="ConfirmUpdateBtn_Click" runat="server" />
                </td>
            </tr>
        </table>
    </form>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function Ok(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmAllBtn.UniqueID %>", "");
                }
            }
        </script>
        <script type="text/javascript">
            function ConfirmBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmUpdateBtn.UniqueID %>", "");
                }
            }

        </script>

    </telerik:RadCodeBlock>
</body>
</html>
