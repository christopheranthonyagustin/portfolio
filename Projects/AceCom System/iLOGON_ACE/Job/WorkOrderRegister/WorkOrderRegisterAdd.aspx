<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderRegisterAdd.aspx.cs" Inherits="iWMS.Web.Job.WorkOrderRegister.WorkOrderRegisterAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>WorkOrderRegisterAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add"
                                OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel runat="server" ID="MsgPanel">
                    <ContentTemplate>
                        <%--Message popup area start--%>
                        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                            BackgroundCssClass="MessageBoxPopupBackground">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
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
                                                    <asp:Button ID="btnOk" runat="server" CssClass="white" Text="OK" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                        <%--Message popup area end--%>
                        <%--Warning Message popup area Start--%>
                        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
                        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
                            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
                            Style="display: none; border: 2px solid #780606;" DefaultButton="btnOk">
                            <div class="popupHeader" style="width: 420px;">
                                <asp:Label ID="ConfrimMsg" runat="server" Style="size: 15px"></asp:Label>
                            </div>
                            <div id="Div1" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                                <div style="float: left; width: 380px; margin: 20px;">
                                    <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                                        <tr>
                                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                                <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                                            </td>
                                            <td style="width: 2%;"></td>
                                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                                    <asp:Label ID="popupConfrimMsgType" runat="server" Text=""></asp:Label>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                                <div style="margin-right: 0px; float: right; width: auto;">
                                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn" runat="server" Text="OK" CssClass="white" OnClick="ConfirmYesBtn_Click" CausesValidation="false" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                        <%--Warning Message popup area End--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
