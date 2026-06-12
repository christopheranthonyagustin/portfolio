<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesBookProfile.aspx.cs" Inherits="iWMS.Web.LocalCourierServices.LocalCourierServicesBook.LocalCourierServicesBookProfile" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile @ LocalCourierServices</title>
    <link rel="stylesheet" href="../../LocalCourierServices/Style/LocalCourierServices.css" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    <script type="text/javascript" src="../Script/LocalCourierServices.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
    $(document).on('click', '.toggle-password1', function () {
        $(this).toggleClass("fa-eye fa-eye-slash");
        var CurrentPwd = $("#CurrentPwdTxt");
        CurrentPwd.attr('type') === 'password' ? CurrentPwd.attr('type', 'text') : CurrentPwd.attr('type', 'password')
    });

    $(document).on('click', '.toggle-password2', function () {
        $(this).toggleClass("fa-eye fa-eye-slash");
        var NewPwd = $("#NewPwdTxt");
        NewPwd.attr('type') === 'password' ? NewPwd.attr('type', 'text') : NewPwd.attr('type', 'password')
    });

    $(document).on('click', '.toggle-password3', function () {
        $(this).toggleClass("fa-eye fa-eye-slash");
        var ReTypeNewPwd = $("#ReTypeNewPwdTxt");
        ReTypeNewPwd.attr('type') === 'password' ? ReTypeNewPwd.attr('type', 'text') : ReTypeNewPwd.attr('type', 'password')
    });

</script>
<body border="0" cellspacing="0" cellpadding="0" width="100%">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <img src="../../Image/URLLogo.png" width="110" height="110" alt="Logo" class="logoposition" />

                    <asp:Label runat="server" ID="LicenseLbl" CssClass="License"></asp:Label>
                </td>
            </tr>

        </table>


        <ul id="menu" runat="server">
            <div class="icons" style="float: right; padding-right: 10px;">
                <a href="../../LocalCourierServices/LocalCourierServicesBook/LocalCourierServicesBookHome.aspx">
                    <img src="../../Image/HomeIcon.png" width="45" height="45" alt="Home" /></a>

                <div class="dropdown">
                    <button class="dropbtn">
                        <img src="../../Image/Profile Head Icon LightBlue.png" width="40" height="40" alt="Profile" /></button>
                    <div class="dropdown-content">
                        <a href="../../LocalCourierServices/LocalCourierServicesBook/LocalCourierServicesBookProfile.aspx">Profile</a>
                        <a href="#">Setting</a>
                        <a href="#">Payment</a>
                        <a href="../../Security/Login.aspx">LogOut</a>
                    </div>
                </div>
            </div>
        </ul>

        <div class="btn-group">
            <button id="EditProfileDivId" runat="server" onserverclick="EditProfileDivId_ServerClick" causesvalidation="false">Edit Profile</button>
            <button id="ChangePwdDivId" runat="server" onserverclick="ChangePwdDivId_ServerClick" causesvalidation="false">Change Password</button>
        </div>
        <div>
            <asp:Panel runat="server" ID="EditProfilePanelId" CssClass="EditProfilePanel" Visible="false">
                <div id="EditProfileDiv" runat="server">
                    <table>
                        <tr>
                            <td style="font-family: Helvetica;">
                                <asp:Label ID="LanguageLbl" runat="server" Text="Language">
                                </asp:Label>
                            </td>
                            <td>
                                <telerik:RadDropDownList ID="LanguageListDDL" runat="server" AutoPostBack="false">
                                </telerik:RadDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Helvetica;">
                                <br />
                                <asp:Label ID="NameLbl" runat="server" Text="Name">
                                </asp:Label>
                            </td>
                            <td>
                                <br />
                                <telerik:RadTextBox ID="NameTxt" runat="server" Width="155" CausesValidation="false"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTxt" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Helvetica;">
                                <br />
                                <asp:Label ID="PHNoLbl" runat="server" Text="Phone No.">
                                </asp:Label>
                            </td>
                            <td>
                                <br />
                                <asp:DropDownList ID="CountryCodeDDL" runat="server" AutoPostBack="false">
                                    <asp:ListItem Text="+65" Value="+65" Selected="True">
                                    </asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox runat="server" ID="MobileNumTxt" type="text" name="" autocomplete="off"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Helvetica;">
                                <br />
                                <asp:Label ID="EmailLbl" runat="server" Text="Email">
                                </asp:Label>
                            </td>
                            <td>
                                <br />
                                <telerik:RadTextBox ID="EmailTxt" runat="server" Width="155" CausesValidation="false"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ControlToValidate="EmailTxt" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Button runat="server" ID="SaveBtn" OnClick="SaveBtn_Click" Text="Save" CausesValidation="false" CssClass="blue" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="ChangePwdPanelId" CssClass="ChangePwdPanel" Visible="false">
                <div id="ChangePwdDiv" runat="server">
                    <table>
                        <tr>
                            <td style="font-family: Helvetica;">
                                <br />
                                <asp:Label ID="CurrentPwdLbl" runat="server" Text="Current Password" ForeColor="Black">
                                </asp:Label>
                            </td>
                            <td></td>
                            <td style="font-family: Helvetica;">
                                <br />
                                <input id="CurrentPwdTxt" type="password" runat="server">
                                <span toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password1"></span>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Helvetica;">
                                <br />
                                <asp:Label ID="NewPwdLbl" runat="server" Text="New Password" ForeColor="Black">
                                </asp:Label>
                            </td>
                            <td></td>
                            <td style="font-family: Helvetica;">
                                <br />
                                <input id="NewPwdTxt" type="password" runat="server">
                                <span toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password2"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Label ID="ReTypeNewPwdLbl" runat="server" Text="Retype New <br/> Password" ForeColor="Black">
                                </asp:Label>
                            </td>
                            <td></td>
                            <td>
                                <br />
                                <input id="ReTypeNewPwdTxt" type="password" runat="server">
                                <span toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password3"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Button runat="server" ID="SaveChangePwdBtn" OnClick="SaveChangePwdBtn_Click" Text="Save" CausesValidation="false" CssClass="blue" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
