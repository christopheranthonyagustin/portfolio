<%@ Page Language="c#" CodeBehind="UpdatePassword.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.App.Profile.UpdatePassword" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>UpdatePassword</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
</head>
<body style="margin: 25px 0px 0px 40px;">
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%" border="0">
        <tr>
            <td class="NewModuleTitle" align="left">
                <asp:Label ID="UpdatePwdLbl" runat="server">Change Password</asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <table width="100%" align="center" border="0">
        <tr>
            <td>
                <asp:Label ID="OldPwdLbl" runat="server">Old Password</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadTextBox ID="OldPasswordTxt" runat="server" TextMode="Password">
                </telerik:RadTextBox>
                <asp:RequiredFieldValidator ID="PwdVal" runat="server" ControlToValidate="OldPasswordTxt"
                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator><asp:Label ID="MessageLbl"
                        runat="server" ForeColor="Red"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="NewPwdLbl" runat="server">New Password</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadTextBox ID="NewPasswordTxt" TextMode="Password" runat="server">
                </telerik:RadTextBox>
                <asp:RequiredFieldValidator ID="NewPwdVal" runat="server" ControlToValidate="NewPasswordTxt"
                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
            </td>
            <br />
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="ConfirmLbl" runat="server">Confirm New Password</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadTextBox id="NewPassword2Txt" runat="server" TextMode="Password">
                </telerik:RadTextBox>
                <asp:RequiredFieldValidator ID="NewPwd2Val" runat="server" ControlToValidate="NewPassword2Txt"
                    ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator><asp:CompareValidator
                        ID="CompareValidator1" runat="server" ControlToValidate="NewPassword2Txt" ErrorMessage="Password does not match"
                        ControlToCompare="NewPasswordTxt"></asp:CompareValidator>
            </td>
        </tr>
    </table>
    <br />
    <br />
    &nbsp;
    <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" 
         Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />&nbsp;
    <asp:Button ID="RadButton1" CssClass="white" runat="server" OnClick="RadButton1_Click" 
         Text="Reset" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
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
                                <br />
                                 <asp:Label runat="server" ID="lblMessagePopupText1"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="lblMessagePopupText2"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="lblMessagePopupText3"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="lblMessagePopupText4"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="lblMessagePopupText5"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
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
