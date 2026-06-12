<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VLMPutawaySelect.aspx.cs" Inherits="iWMS.Web.VLMTask.VLMPutaway.VLMPutawaySelect" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="TitleName"></title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ChangeModalHeaderText(HeaderText) {
            $('#HeaderLbl').text(HeaderText);
        }

        function ChangeModalFrameHeight(Height) {
            document.getElementById("BodyFrame").height = Height;
        }

        function ChangeModalFrameSrc(SourcePage) {
            document.getElementById("BodyFrame").src = SourcePage;
        }

        function ShowModalPopup() {
            $('#Modalpopup').modal('show');
        }

        function CheckPalletNoHasCursor() {
            var radTextBox = document.getElementById('PalletNoTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("PalletCursorHiddenField").value = "true";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("PutawayLocationHiddenField").value = "false";
                document.getElementById("NoOfTuCursorHiddenField").value = "false";
            } else {
                document.getElementById("PalletCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("PutawayLocationHiddenField").value = "false";
                document.getElementById("NoOfTuCursorHiddenField").value = "false";
            }
        }

        function CheckSKUCodeHasCursor() {
            var radTextBox = document.getElementById('SKUCodeTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("SKUCodeCursorHiddenField").value = "true";
                document.getElementById("PalletCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("PutawayLocationHiddenField").value = "false";
                document.getElementById("NoOfTuCursorHiddenField").value = "false";
            } else {
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("PalletCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("PutawayLocationHiddenField").value = "false";
                document.getElementById("NoOfTuCursorHiddenField").value = "false";
            }
        }

        function CheckQtyHasCursor() {
            var radTextBox = document.getElementById('QtyTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("QtyCursorHiddenField").value = "true";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("PalletCursorHiddenField").value = "false";
                document.getElementById("PutawayLocationHiddenField").value = "false";
                document.getElementById("NoOfTuCursorHiddenField").value = "false";
            } else {
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("PalletCursorHiddenField").value = "false";
                document.getElementById("PutawayLocationHiddenField").value = "false";
                document.getElementById("NoOfTuCursorHiddenField").value = "false";
            }
        }

        function CheckPutawayLocationHasCursor() {
            var radTextBox = document.getElementById('PutawayLocationTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("PutawayLocationHiddenField").value = "true";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("PalletCursorHiddenField").value = "false";
                document.getElementById("NoOfTuCursorHiddenField").value = "false";
            } else {
                document.getElementById("PutawayLocationHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("PalletCursorHiddenField").value = "false";
                document.getElementById("NoOfTuCursorHiddenField").value = "false";
            }
        }

        function CheckNoOfTuHasCursor() {
            var radTextBox = document.getElementById('NumberOfTuTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("NoOfTuCursorHiddenField").value = "true";
                document.getElementById("PutawayLocationHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("PalletCursorHiddenField").value = "false";
            } else {
                document.getElementById("NoOfTuCursorHiddenField").value = "false";
                document.getElementById("PutawayLocationHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("PalletCursorHiddenField").value = "false";
            }
        }

    </script>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ModalPopupClose() {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form2" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="PalletCursorHiddenField" runat="server" />
        <asp:HiddenField ID="SKUCodeCursorHiddenField" runat="server" />
        <asp:HiddenField ID="QtyCursorHiddenField" runat="server" />
        <asp:HiddenField ID="PutawayLocationHiddenField" runat="server" />
        <asp:HiddenField ID="NoOfTuCursorHiddenField" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Timer ID="Refreshtmr" runat="server" OnTick="Refreshtmr_Tick" Interval="4000"></asp:Timer>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="modal fade" runat="server" id="Modalpopup" tabindex="-1" role="dialog" aria-labelledby="HeaderLbl" aria-hidden="true">
                        <div class="modal-dialog modal-lg" id="PopupSizeDiv" runat="server">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:Label ID="HeaderLbl" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                    <button type="button" class="close" data-dismiss="modal" onclick="ModalPopupClose()">&times;</button>
                                </div>
                                <div class="modal-body" id="content">
                                    <iframe id="BodyFrame" runat="server" width="100%" frameborder="0"></iframe>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="white" data-dismiss="modal" onclick="ModalPopupClose()">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="margin-left: 25px">
                    <tr>
                        <td>&nbsp;&nbsp;
                            <asp:Label Text="TUNO" runat="server"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="PalletNoReqVal" ControlToValidate="PalletNoTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox ID="PalletNoTxt" runat="server" Skin="WebBlue" Width="200" Height="50" onfocus="CheckPalletNoHasCursor()" CausesValidation="false" Font-Size="Large" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                        <td>&nbsp;&nbsp;
                            <asp:Label Text="SKU Code" runat="server"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="SKUCodeReqVal" ControlToValidate="SKUCodeTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox ID="SKUCodeTxt" runat="server" Skin="WebBlue" Width="200" Height="50" onfocus="CheckSKUCodeHasCursor()" CausesValidation="false" Font-Size="Large" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                        <td>&nbsp;&nbsp;
                            <asp:Label Text="Qty" runat="server"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="QtyTxtReqVal" ControlToValidate="QtyTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox ID="QtyTxt" runat="server" Skin="WebBlue" Width="200" Height="50" onfocus="CheckQtyHasCursor()" CausesValidation="false" Font-Size="Large" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                        <td>&nbsp;&nbsp;
                            <asp:Label Text="Putaway Location" runat="server"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="PutawayLocationReqVal" ControlToValidate="PutawayLocationTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox ID="PutawayLocationTxt" runat="server" Skin="WebBlue" Width="200" Height="50" onfocus="CheckPutawayLocationHasCursor()" CausesValidation="false" Font-Size="Large" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                        <td>&nbsp;&nbsp;
                            <asp:Label Text="Number of TU" runat="server"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="NumberOfTuReqVal" ControlToValidate="NumberOfTuTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox ID="NumberOfTuTxt" runat="server" Skin="WebBlue" Width="200" Height="50" onfocus="CheckNoOfTuHasCursor()" CausesValidation="false" Font-Size="Large" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="margin-left: 25px">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" CausesValidation="false"
                                Text="Refresh" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ConfirmPutawayBtn" runat="server" Text="Confirm Putaway" CssClass="LongLabelWhite"
                                OnClick="ConfirmPutawayBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="AbortPutawayBtn" runat="server" Text="Abort Putaway" CssClass="LongLabelWhite"
                                OnClick="AbortPutawayBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" Style="margin-left: 25px"
                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" Visible="true"
                                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                    <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" Name="ParentGrid">
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="RefreshBtn" />
                <asp:PostBackTrigger ControlID="ResultDG" />
                <asp:PostBackTrigger ControlID="ConfirmPutawayBtn" />
                <asp:PostBackTrigger ControlID="AbortPutawayBtn" />
                <asp:AsyncPostBackTrigger ControlID="Refreshtmr" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
