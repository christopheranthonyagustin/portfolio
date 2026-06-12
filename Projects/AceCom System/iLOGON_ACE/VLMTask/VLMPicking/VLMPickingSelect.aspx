<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VLMPickingSelect.aspx.cs" Inherits="iWMS.Web.VLMTask.VLMPicking.VLMPickingSelect" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

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
        function CheckPickingLocationHasCursor() {
            var radTextBox = document.getElementById('PickingLocationTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("PickingLocationCursorHiddenField").value = "true";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("FromTUNOHiddenField").value = "false"
            } else {
                document.getElementById("PickingLocationCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("FromTUNOHiddenField").value = "false";
            }
        }

        function CheckSKUCodeHasCursor() {
            var radTextBox = document.getElementById('SKUTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("SKUCodeCursorHiddenField").value = "true";
                document.getElementById("PickingLocationCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("FromTUNOHiddenField").value = "false";
            } else {
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("PickingLocationCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("FromTUNOHiddenField").value = "false";
            }
        }

        function CheckQtyHasCursor() {
            var radTextBox = document.getElementById('QtyTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("QtyCursorHiddenField").value = "true";
                document.getElementById("PickingLocationCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("FromTUNOHiddenField").value = "false";
            } else {
                document.getElementById("QtyCursorHiddenField").value = "false";
                document.getElementById("PickingLocationCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("FromTUNOHiddenField").value = "false";
            }
        }

        function CheckFromTUNOHasCursor() {
            var radTextBox = document.getElementById('FromTUNOTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("FromTUNOHiddenField").value = "true";
                document.getElementById("PickingLocationCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
            } else {
                document.getElementById("FromTUNOHiddenField").value = "false";
                document.getElementById("PickingLocationCursorHiddenField").value = "false";
                document.getElementById("SKUCodeCursorHiddenField").value = "false";
                document.getElementById("QtyCursorHiddenField").value = "false";
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
        <asp:HiddenField ID="PickingLocationCursorHiddenField" runat="server" />
        <asp:HiddenField ID="SKUCodeCursorHiddenField" runat="server" />
        <asp:HiddenField ID="QtyCursorHiddenField" runat="server" />
        <asp:HiddenField ID="FromTUNOHiddenField" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Timer ID="Refreshtmr" Interval="4000" runat="server" OnTick="Refreshtmr_Tick"></asp:Timer>
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
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>&nbsp;
                            <asp:Label Text="Picking Location" runat="server" ID="PickingLocationLbl"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="PickingLocationReqVal" runat="server" ControlToValidate="PickingLocationTxt" Font-Bold="true" ForeColor="Red" ErrorMessage="*" Enabled="false"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox ID="PickingLocationTxt" runat="server" Skin="WebBlue" Width="200" Height="50" onfocus="CheckPickingLocationHasCursor()" CausesValidation="false" Font-Size="Large" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                        <td>&nbsp;
                            <asp:Label Text="SKU" runat="server"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="SKUReqVal" runat="server" ControlToValidate="SKUTxt" Font-Bold="true" ForeColor="Red" ErrorMessage="*" Enabled="false"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox ID="SKUTxt" runat="server" Skin="WebBlue" Width="200" Height="50" onfocus="CheckSKUCodeHasCursor()" CausesValidation="false" Font-Size="Large" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                        <td>&nbsp;
                            <asp:Label Text="Qty" runat="server"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="QtyReqVal" runat="server" ControlToValidate="QtyTxt" Font-Bold="true" ForeColor="Red" ErrorMessage="*" Enabled="false"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox ID="QtyTxt" runat="server" Skin="WebBlue" Width="200" Height="50" onfocus="CheckQtyHasCursor()" CausesValidation="false" Font-Size="Large" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                        <td>&nbsp;
                            <asp:Label Text="TUNO" runat="server"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="FromTUNOReqVal" runat="server" ControlToValidate="FromTUNOTxt" Font-Bold="true" ForeColor="Red" ErrorMessage="*" Enabled="false"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox ID="FromTUNOTxt" runat="server" Skin="WebBlue" Width="200" Height="50" onfocus="CheckFromTUNOHasCursor()" CausesValidation="false" Font-Size="Large" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" ToolTip="Save"
                                Text="Refresh" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                         <asp:Button ID="ConfirmPickingBtn" runat="server" Text="Confirm Pick" CssClass="LongLabelWhite"
                             OnClick="ConfirmPickingBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="AbortPickingBtn" runat="server" Text="Abort Pick" CssClass="LongLabelWhite"
                            OnClick="AbortPickingBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
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
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                                    Name="ParentGrid">
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
                <asp:PostBackTrigger ControlID="ConfirmPickingBtn" />
                <asp:PostBackTrigger ControlID="AbortPickingBtn" />
                <asp:AsyncPostBackTrigger ControlID="Refreshtmr" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
