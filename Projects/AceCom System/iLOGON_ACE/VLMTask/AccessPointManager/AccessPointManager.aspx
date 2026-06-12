<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessPointManager.aspx.cs" Inherits="iWMS.Web.VLMTask.AccessPointManager.AccessPointManager" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="VLMStoreShelfTitleName"></title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
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
            $('#Modalpopup1').modal('show');
        }
        function CheckAccessPointHasCursor() {
            var radTextBox = document.getElementById('AccessPointTxtBox');
            var isActiveElement = document.activeElement === radTextBox;

            if (isActiveElement) {
                document.getElementById("AccessPointHiddenField").value = "true";
            } else {
                document.getElementById("AccessPointHiddenField").value = "false";
            }
        }
    </script>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ModalPopupClose() {
                var masterTable = $find("<%= ServingShelfResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="AccessPointHiddenField" runat="server" />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label Text="Access Point" runat="server"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="AccessPointTxtBox" runat="server" Skin="WebBlue" Width="155" onfocus="CheckAccessPointHasCursor()" CausesValidation="false" AutoPostBack="True" OnTextChanged="AccessPoint_TextChanged"></telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label Text="VLM" runat="server"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="VLMTxtBox" runat="server" Skin="WebBlue" Width="155" CausesValidation="false" ReadOnly="true"></telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label Text="Shelf No" runat="server"></asp:Label>
                            <br />
                            <telerik:RadComboBox ID="ShelfNoCombo" runat="server" Skin="WebBlue" RenderMode="Lightweight" Width="155" OnSelectedIndexChanged="ShelfNoCombo_SelectedIndexChanged"
                                EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="ShelfNoCombo_ItemsRequested"
                                ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true" OnLoad="ShelfNoCombo_Load">
                            </telerik:RadComboBox>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <div>
            <asp:Button ID="RetrieveShelfBtn" CssClass="LongLabelWhite" runat="server" Text="Retrieve Shelf"
                OnClick="RetrieveShelfBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            <asp:Button ID="StoreShelfBtn" CssClass="white" runat="server" Text="Store Shelf"
                OnClick="StoreShelfBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /><br />
            <br />
            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            <asp:Timer ID="Refreshtmr" Interval="4000" runat="server" OnTick="Refreshtmr_Tick"></asp:Timer>
        </div>
        <table>
            <tr>
                <td>
                    <div class="modal fade" runat="server" id="Modalpopup1" tabindex="-1" role="dialog" aria-labelledby="HeaderLbl" aria-hidden="true">
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
                        <td>
                            <div id="ServingShelfDiv" runat="server">
                                <table>
                                    <tr>
                                        <td style="padding-bottom: 7px">
                                            <asp:Label runat="server" ID="ServingShelfLbl" Text="Serving Shelf" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadGrid ID="ServingShelfResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="true" Skin="Metro" OnNeedDataSource="ServingShelfResultDG_NeedDataSource" OnColumnCreated="ServingShelfResultDG_ColumnCreated">
                                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                    <Selecting AllowRowSelect="true" />
                                                    <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true"></ItemStyle>
                                                <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div id="PendingTasksDiv" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:Label runat="server" ID="PendingTasksLbl" Text="Pending Tasks" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <telerik:RadGrid ID="PendingTasksResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                                AllowPaging="true" Skin="Metro" OnNeedDataSource="PendingTasksResultDG_NeedDataSource" OnColumnCreated="PendingTasksResultDG_ColumnCreated">
                                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                    <Selecting AllowRowSelect="true" />
                                                    <Scrolling AllowScroll="true" ScrollHeight="400" UseStaticHeaders="true" />
                                                    <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                                                </ClientSettings>
                                                <SortingSettings EnableSkinSortStyles="false" />
                                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                <ItemStyle Wrap="true"></ItemStyle>
                                                <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Refreshtmr" EventName="Tick" />
                <asp:PostBackTrigger ControlID="ServingShelfResultDG" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
