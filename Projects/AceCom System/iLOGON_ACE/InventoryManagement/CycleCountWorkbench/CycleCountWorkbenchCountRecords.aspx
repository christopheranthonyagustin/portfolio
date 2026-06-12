<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CycleCountWorkbenchCountRecords.aspx.cs" Inherits="iWMS.Web.InventoryManagement.CycleCountWorkbench.CycleCountWorkbenchCountRecords" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Count Records</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<script type="text/javascript">
    function OnClientClose_Edit(sender, args) {
        document.location.href = document.location.href;
    }
</script>
<script type="text/javascript">
    function showDataOnClick(image) {
        var LocCodeArr = image.getAttribute("LocCodeArr");
        alert(LocCodeArr);
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
        } function BatchEditClosed(sender, args) {
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="CountSheetSummaryTab" Text="Count Sheet Summary" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CountSheetItemsTab" Text="Count Sheet Items" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="CountSheetSummaryRadPageView">
                <iWMS:iForm ID="formCtl" runat="server" Visible="true"></iWMS:iForm>
                <br />
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="SendCandidatesBtn" CssClass="LongLabelGreen" runat="server" OnClick="SendCandidatesBtn_Click"
                                Text="Send Candidates" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="SendResultsBtn" CssClass="LongLabelGreen" runat="server" OnClick="SendResultsBtn_Click"
                                Text="&nbsp;&nbsp;&nbsp;&nbsp;Send  &nbsp;&nbsp;&nbsp;&nbsp; Results" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="SendAdjustmentBtn" CssClass="LongLabelGreen" runat="server" OnClick="SendAdjustmentBtn_Click"
                                Text="Send Adjustment" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CountSheetBtn" CssClass="blue" runat="server" OnClick="CountSheetBtn_Click"
                                Text="Count Sheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="VarianceReportBtn" CssClass="LongLabelBlue" runat="server" OnClick="VarianceReportBtn_Click" Text="Variance Report"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CancelCountSheetBtn" CssClass="LongLabelOrange" runat="server" OnClick="CancelCountSheetBtn_Click" Text="&nbsp;&nbsp;&nbsp;&nbsp;Cancel &nbsp;&nbsp; Count Sheet"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="SendCancellationBtn" CssClass="LongLabelOrange" runat="server" OnClick="SendCancellationBtn_Click"
                                Text="&nbsp;&nbsp;&nbsp;&nbsp;Resend  &nbsp;&nbsp;&nbsp;&nbsp; Cancellation" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CloseCountSheetBtn" CssClass="LongLabelWhite" runat="server" OnClick="CloseCountSheetBtn_Click" Text="&nbsp;&nbsp;&nbsp;&nbsp;Close &nbsp;&nbsp;&nbsp; Count Sheet"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <asp:HiddenField ID="Hidden1" runat="server" />
                <asp:HiddenField ID="Hidden2" runat="server" />
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
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="ICID"
                        EditMode="Batch" CommandItemDisplay="None">
                        <BatchEditingSettings EditType="Row" />
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true" Display="true" HeaderStyle-Wrap="true"
                                ItemStyle-Wrap="true">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" AutoPostBack="false" />
                                    <asp:Label ID="TotalQtyLbl" runat="server" />
                                    <asp:Label ID="SendCandidatesDoneLbl" runat="server" />
                                    <asp:Label ID="SendCandidatesErrorLbl" runat="server" />
                                    <asp:Label ID="SendCandidatesSentLbl" runat="server" />

                                    <asp:Label ID="SendResultsDoneLbl" runat="server" />
                                    <asp:Label ID="SendResultsErrorLbl" runat="server" />
                                    <asp:Label ID="SendResultsSentLbl" runat="server" />

                                    <asp:Label ID="SendAdjustmentDoneLbl" runat="server" />
                                    <asp:Label ID="SendAdjustmentErrorLbl" runat="server" />
                                    <asp:Label ID="SendAdjustmentSentLbl" runat="server" />

                                    <asp:Label ID="SendCancellationDoneLbl" runat="server" />
                                    <asp:Label ID="SendCancellationErrorLbl" runat="server" />
                                    <asp:Label ID="SendCancellationSentLbl" runat="server" />
                                    <asp:Label ID="MoreLocationFlagLbl" runat="server" />

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>

                <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="400px" Height="400px"
                    Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose_Edit" Visible="false" Behaviors="Move, Close">
                </telerik:RadWindow>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="CountSheetItemsRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmApproveBtn" Text="Send" Style="display: none;" OnClick="ConfirmApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
                <td>
                    <asp:Button ID="ConfirmNoneApproveBtn" Text="Cancel" Style="display: none;" OnClick="ConfirmNoneApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
        <telerik:RadCodeBlock runat="server">
            <script type="text/javascript">
                function ConfirmApproveCallbackFn(arg) {
                    if (arg) // User clicked OK Button in RadConfirm
                    {
                        __doPostBack("<%=ConfirmApproveBtn.UniqueID %>", "");
                    }
                }
                function ConfirmNoneBtnCallbackFn(arg) {
                    if (arg) // User clicked OK Button in RadConfirm
                    {
                        __doPostBack("<%=ConfirmNoneApproveBtn.UniqueID %>", "");
                    }
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
