<%@ Page Language="c#" CodeBehind="UpdatePassword.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Security.UpdatePassword" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>iWMS.net</title>
    <link href="../css/login.css" type="text/css" rel="stylesheet" />
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
<body onload="document.getElementById('OldPasswordTxt').focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div id="page">
        <div class="wrapper">
            <div class="roundtop">
                <img src="../Image/login/tl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
            </div>
            <div class="innerWrap">
                <div class="innerRoundtop">
                    <img src="../Image/login/innertl.gif" alt="" width="15" height="15" class="corner"
                        style="display: none" />
                </div>
                <div class="center content" style="background-color: #fff; color: #444; margin: auto 15px;
                    border: 1px solid #000; padding: 0 20px;">
                    <div style="text-align: left;">
                        <h3 class="padding5">
                            Welcome to iLOGON,
                            <asp:Label ID="CurrentUserLbl" runat="server"></asp:Label>.</h3>
                        <p>
                            For security reasons, kindly change your password before using iWMS.</p>
                    </div>
                    <div class="padding25">
                    </div>
                    <div class="changePasswordBox">
                        <asp:Label ID="OldPwdLbl" CssClass="label" runat="server">Current Password : </asp:Label>
                        <input id="OldPasswordTxt" type="password" name="PasswordTxt" runat="server" />
                        <asp:RequiredFieldValidator ID="PwdVal" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="OldPasswordTxt">*</asp:RequiredFieldValidator>
                        <asp:Label ID="MessageLbl" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Label ID="NewPwdLbl" CssClass="label" runat="server">New Password : </asp:Label>
                        <input id="NewPasswordTxt" type="password" name="PasswordTxt" runat="server" />
                        <asp:RequiredFieldValidator ID="NewPwdVal" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="NewPasswordTxt">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="ConfirmLbl" CssClass="label" runat="server">Re-Enter New Password : </asp:Label>
                        <input id="NewPassword2Txt" type="password" name="PasswordTxt" runat="server" />&nbsp;
                        <asp:RequiredFieldValidator ID="NewPwd2Val" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="NewPassword2Txt">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match!"
                            ControlToValidate="NewPassword2Txt" ControlToCompare="NewPasswordTxt"></asp:CompareValidator>
                    </div>
                    <div class="padding25">
                    </div>
                    <input id="Reset1" class="button orange medium" value="Reset" type="reset" name="Reset1"
                        runat="server" />
                    <asp:Button ID="UpdateBtn" runat="server" Text="Save and Proceed to iWMS" CssClass="button white medium"
                        OnClick="UpdateBtn_Click"></asp:Button>
                    <div class="padding25">
                    </div>
                </div>
                <div class="innerRoundbottom">
                    <img src="../Image/login/innerbl.gif" alt="" width="15" height="15" class="corner"
                        style="display: none" />
                </div>
            </div>
            <div class="roundbottom">
                <img src="../Image/login/bl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
            </div>
        </div>
    </div>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px; border: 0px solid #780606;font-size: 11pt;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 200px; width: 420px; overflow: hidden; border: 0px solid #780606; ">
            <div style="float: left; width: 380px; margin: 20px;  border: 0px solid #780606;">
                <table style="padding: 0; border-spacing: 0;border-collapse: collapse; border: 0px solid #780606; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%; border: 0px solid #780606;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>                            
                        </td>
                        <td style="width: 2%;  border: 0px solid #780606;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;  border: 0px solid #780606;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;  border: 0px solid #780606; font-size: 11pt;">
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
                            <br />
                            <br />
                            <div style="margin-right: 0px; float: right; width: auto;font-size: 9pt;">
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
