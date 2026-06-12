<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VLMRedressingSelect.aspx.cs" Inherits="iWMS.Web.VLMTask.VLMRedressing.VLMRedressingSelect" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="TitleName">VLMRedressing Select</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" href="../../css/mobile.css" type="text/css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
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
    </script>
</head>
<body>
    <form id="form2" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <table style="margin-left: 25px">
            <tr>
                <td>
                    <asp:Timer ID="Refreshtmr" Interval="4000" runat="server" OnTick="Refreshtmr_Tick"></asp:Timer>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="modal fade" runat="server" id="Modalpopup1" tabindex="-1" role="dialog" aria-labelledby="HeaderLbl" aria-hidden="true">
                        <div class="modal-dialog modal-lg" id="PopupSizeDiv" runat="server">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:Label ID="HeaderLbl" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body" id="content">
                                    <iframe id="BodyFrame" runat="server" width="100%" frameborder="0"></iframe>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="white" data-dismiss="modal">Close</button>
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
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" ToolTip="Save"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                             <asp:Button ID="ConfirmRedressingBtn" runat="server" Text="Confirm Redress" CssClass="LongLabelWhite"
                                 OnClick="ConfirmRedressingBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="AbortRedressingBtn" runat="server" Text="Abort Redress" CssClass="LongLabelWhite"
                                OnClick="AbortRedressingBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
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
                <asp:PostBackTrigger ControlID="ConfirmRedressingBtn" />
                <asp:PostBackTrigger ControlID="AbortRedressingBtn" />
                <asp:AsyncPostBackTrigger ControlID="Refreshtmr" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
