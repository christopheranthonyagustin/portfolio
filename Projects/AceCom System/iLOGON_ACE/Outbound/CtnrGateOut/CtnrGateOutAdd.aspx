<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrGateOutAdd.aspx.cs" Inherits="iWMS.Web.Outbound.CtnrGateOut.CtnrGateOutAdd" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>CtnrGateOutForm</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%" border="0">
        <tr>
            <td>
                &nbsp;<%--<telerik:RadButton ID="addBtn" runat="server" OnClick="AddBtn_Click" Text="Add & Confirm" Skin="WebBlue"
                    SingleClick="true" SingleClickText="Processing..." Visible="false">
                </telerik:RadButton>--%>
                <asp:Button ID="addBtn" CssClass="white" runat="server" OnClick="AddBtn_Click" Visible="false"  
                    Text="Add Confirm" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                &nbsp;<%--<telerik:RadButton ID="EIRBtn" runat="server" OnClick="EIRBtn_Click" Text="  EIR  " Skin="WebBlue"
                    SingleClick="true" SingleClickText="Processing..." Visible="true" CausesValidation="false">
                </telerik:RadButton>--%>
                <asp:Button ID="EIRBtn" CssClass="blue" runat="server" OnClick="EIRBtn_Click" Visible="true"  
                    Text="EIR" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                &nbsp;<%--<telerik:RadButton ID="NextCtnrBtn" runat="server" OnClick="NextCtnrBtn_Click" Text=" NextCtnr  " Skin="WebBlue"
                    SingleClick="true" SingleClickText="Processing..." Visible="false">
                </telerik:RadButton>--%>
                <asp:Button ID="NextCtnrBtn" CssClass="white" runat="server" OnClick="NextCtnrBtn_Click" Visible="false"  
                    Text="NextCtnr" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl2" runat="server" Visible="false"></iWMS:iForm>
                <iWMS:iForm ID="formCtl" runat="server" Visible="false"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground" Y="200">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
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
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="btnOk" runat="server" Style="text-decoration: none;" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>

