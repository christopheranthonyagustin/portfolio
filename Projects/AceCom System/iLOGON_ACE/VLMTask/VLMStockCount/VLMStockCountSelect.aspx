<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VLMStockCountSelect.aspx.cs" Inherits="iWMS.Web.VLMTask.VLMStockCount.VLMStockCountSelect" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="TitleName">VLMStockCount Select</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" href="../../css/style.css" type="text/css" />
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
            $('#ModalPopup1').modal('show');
        }

        function CheckPalletNoHasCursor() {
            var radTextBox = document.getElementById('PalletNoTxt');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("QuantityCursorHiddenField").value = "true";
            } else {
                document.getElementById("QuantityCursorHiddenField").value = "false";
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
        <asp:HiddenField ID="QuantityCursorHiddenField" runat="server" />
        <table style="margin-left: 25px">
            <tr>
                <td>
                    <asp:Timer ID="Refreshtmr" Interval="4000" runat="server" OnTick="Refreshtmr_Tick"></asp:Timer>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="modal fade" runat="server" id="ModalPopup1" tabindex="-1" role="dialog" aria-labelledby="HeaderLbl" aria-hidden="true">
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
                <table style="margin-left: 25px">
                    <tr>
                        <td>
                            <asp:Label Text="Counted Qty" runat="server"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="PalletNoTxt" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="200" Height="50" onfocus="CheckPalletNoHasCursor()" CausesValidation="false"
                                Font-Size="Large" ReadOnly="false">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="PalletNoCompVal" runat="server"
                                ControlToValidate="PalletNoTxt" EnableClientScript="true" ForeColor="Red" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" />
                        </td>
                    </tr>
                </table>
                <br />
                <table style="margin-left: 25px">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" ToolTip="Save"
                                Text="Refresh" OnClientClick="disableBtn(this.id,false)" CausesValidation="false" UseSubmitBehavior="false" />
                            &nbsp;
                             <asp:Button ID="ConfirmCountBtn" runat="server" Text="Confirm Count" CssClass="LongLabelWhite"
                                 OnClick="ConfirmCountBtn_Click" CausesValidation="true" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="AbortCountBtn" runat="server" Text="Abort Count" CssClass="LongLabelWhite"
                                OnClick="AbortCountBtn_Click" CausesValidation="true" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
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
                <asp:PostBackTrigger ControlID="ConfirmCountBtn" />
                <asp:PostBackTrigger ControlID="AbortCountBtn" />
                <asp:AsyncPostBackTrigger ControlID="Refreshtmr" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
