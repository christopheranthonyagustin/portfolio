<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserMsgModalPopup.ascx.cs" Inherits="iWMS.Web.Control.UserMsgModalPopup" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%--Message popup area start--%>
<asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
<ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
    TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
    BackgroundCssClass="MessageBoxPopupBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Button runat="server" ID="btnMsgConfirm" Style="display: none;" />
<ajaxToolkit:ModalPopupExtender ID="mpeMsgConfirmPopup" runat="server" PopupControlID="pnlMsgConfirmBox"
    TargetControlID="btnMsgConfirm" CancelControlID="btnMsgConfirmCancel" BackgroundCssClass="MessageBoxPopupBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="Panel1" runat="server" Width="100%" Height="100%" Style="background-color: transparent;">
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="white" Width="420" Style="display: none; border: 2px solid  #859DD4;">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" runat="server" Style="size: 15px"></asp:Label>
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
                                <asp:Button ID="btnOk" runat="server" Text="Ok" OnClientClick="disableBtn(this.id)"
                                    UseSubmitBehavior="false" class="white" CausesValidation="false" />&nbsp;
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    <asp:Panel runat="server" ID="pnlMsgConfirmBox" BackColor="LAVENDER" Width="320px" Style="display: none; border: 2px solid #859DD4;">
        <div class="popupHeader" style="width: 320px;">
            <asp:Label ID="Label1" Text="Confirm Message" runat="server" Style="size: 15px; margin-left: 115px;"></asp:Label>
            <asp:LinkButton ID="btnMsgConfirmCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="height: 120px; width: 320px;">
            <table style="margin-top: 10px; margin-left: 7px;">
                <tr>
                    <td id="MsgConfirmlbltd" runat="server">
                        <asp:Label ID="MsgConfirmLbl" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 40px; padding-left: 70px;">&nbsp; &nbsp; &nbsp;
                        <asp:Button ID="OkayImg" class="white" runat="server"
                            Text="Okay" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" ToolTip="Okay" />
                        &nbsp;
                        <asp:Button ID="CancelImg" class="white" runat="server" Text="Cancel"
                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Panel>
<asp:Button runat="server" ID="btnIframepopup" Style="display: none;" />
<ajaxToolkit:ModalPopupExtender ID="mpeIframe" runat="server" PopupControlID="PanelIframe"
    TargetControlID="btnIframepopup" CancelControlID="linkbtnIframe" BackgroundCssClass="MessageBoxPopupBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel runat="server" ID="PanelIframe" BackColor="LAVENDER" Style="display: none; border: 2px solid #859DD4;">
    <div class="popupHeader" runat="server" id="IframeTitleDiv">
        <asp:Label ID="lbleIframeTitle" Text="Confirm Message" runat="server" Style="size: 15px; margin-left: 115px;"></asp:Label>
        <asp:LinkButton ID="linkbtnIframe" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
    </div>
    <div runat="server" id="IframeBodyDiv">
        <iframe id="IFrame" runat="server" width="345px" height="280px"></iframe>
    </div>
</asp:Panel>
<style type="text/css">
    .popupHeader {
        padding: 5px 0px 0px 0px;
        font-family: tahoma;
        font-weight: bold;
        height: 25px;
        text-decoration: none;
        background: #859DD4;
    }

    .MessageBoxPopupBackground {
        background-color: black;
        opacity: 0.001;
    }

    .popupHeader span {
        color: #fff;
        text-decoration: none;
        line-height: 15px;
        text-decoration: none;
        float: left;
        margin-left: 10px;
    }

    .popupHeader a {
        color: #fff !important;
        text-decoration: none !important;
        line-height: 15px;
        text-decoration: none;
        float: right;
        margin-right: 10px;
    }
</style>
