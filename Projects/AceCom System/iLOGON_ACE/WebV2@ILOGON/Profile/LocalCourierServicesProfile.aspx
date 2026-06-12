<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesProfile.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.Profile.LocalCourierServicesProfile" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile @ LocalCourierServices</title>
    <link rel="stylesheet" href="../Style/LocalCourierServices.css" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
    //When Click button show spinning Icon
    $(function () {
        $('a, button').click(function () {
            $(this).toggleClass('active');
        });
    });

    $(function () {
        $('#eye1').click(function () {

            if ($(this).hasClass('fa-eye-slash')) {

                $(this).removeClass('fa-eye-slash');

                $(this).addClass('fa-eye');

                $('#CurrentPwdTxt').attr('type', 'text');

            } else {

                $(this).removeClass('fa-eye');

                $(this).addClass('fa-eye-slash');

                $('#CurrentPwdTxt').attr('type', 'password');
            }
        });
    });

    $(function () {
        $('#eye2').click(function () {

            if ($(this).hasClass('fa-eye-slash')) {

                $(this).removeClass('fa-eye-slash');

                $(this).addClass('fa-eye');

                $('#NewPwdTxt').attr('type', 'text');

            } else {

                $(this).removeClass('fa-eye');

                $(this).addClass('fa-eye-slash');

                $('#NewPwdTxt').attr('type', 'password');
            }
        });
    });


    $(function () {
        $('#eye3').click(function () {

            if ($(this).hasClass('fa-eye-slash')) {

                $(this).removeClass('fa-eye-slash');

                $(this).addClass('fa-eye');

                $('#ReTypeNewPwdTxt').attr('type', 'text');

            } else {

                $(this).removeClass('fa-eye');

                $(this).addClass('fa-eye-slash');

                $('#ReTypeNewPwdTxt').attr('type', 'password');
            }
        });
    });
</script>
<body border="0" cellspacing="0" cellpadding="0" width="100%">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:WebV2Menu ID="WebV2Menu" runat="server"></iWMS:WebV2Menu>

        <div class="btn-group">
            <button id="EditProfileDivId" runat="server" onserverclick="EditProfileDivId_ServerClick" causesvalidation="false">Edit Profile</button>
            <button id="ChangePwdDivId" runat="server" onserverclick="ChangePwdDivId_ServerClick" causesvalidation="false">Change Password</button>
        </div>

        <div>
            <asp:Panel runat="server" ID="EditProfilePanelId" CssClass="EditProfilePanel" Visible="false">
                <div id="EditProfileDiv" runat="server">
                    <table>
                        <tr>
                            <td>
                                <i class="fa fa-language" style="font-size: 24px" />&nbsp;&nbsp;
                                <asp:Label ID="LanguageLbl" runat="server" Text="Language" Style="font-size: 17px; font-family: Arial;">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="LanguageDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Item" DataValueField="Descr" CausesValidation="false" Style="width: 220px; height: 35px; margin-left: 50px; border-radius: 5px;">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                                <i class="fa fa-address-card-o" style="font-size: 24px" />&nbsp;&nbsp;
                                <asp:Label ID="NameLbl" runat="server" Text="Name" Style="font-size: 17px; font-family: Arial;">
                                </asp:Label>
                            </td>
                            <td>
                                <br />
                                <br />
                                <asp:TextBox ID="NameTxtBox" runat="server" placeholder="Enter Name" CssClass="form-control input-box" Width="220px" Height="35px" Font-Size="15px" Style="width: 220px; height: 35px; margin-left: 50px; border-radius: 5px;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTxtBox" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <i class="far fa-envelope-open" style="font-size: 24px" />&nbsp;&nbsp;
                                <asp:Label ID="EmailLbl" runat="server" Text="Email" Style="font-size: 17px; font-family: Arial;">
                                </asp:Label>
                            </td>
                            <td>
                                <br />
                                <asp:TextBox ID="EmailTxtBox" runat="server" placeholder="Enter Email" CssClass="form-control input-box" Width="220px" Height="35px" Font-Size="15px" Style="width: 220px; height: 35px; margin-left: 50px; border-radius: 5px;"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <br />
                                <br />
                                <i class="fas fa-phone-square-alt" style="font-size: 24px;" />&nbsp;&nbsp;
                                <asp:Label ID="PHNoLbl" runat="server" Text="Phone No." Style="font-size: 17px; font-family: Arial; font-weight: normal">
                                </asp:Label>
                            </td>
                            <td>
                                <br />
                                <br />
                                <asp:DropDownList ID="CountryCodeDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Item" DataValueField="Descr" CausesValidation="false" Style="width: 80px; height: 35px; margin-left: 50px; border-radius: 5px;">
                                    <asp:ListItem Text="+65" Value="+65" Selected="True">
                                    </asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <br />
                                <br />
                                <asp:TextBox ID="MobileNumTxt" runat="server" placeholder="Enter MobileNo" CssClass="form-control input-box" Width="220px" Height="35px" Font-Size="15px" Style="width: 220px; height: 35px; border-radius: 5px;"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <br />
                                <br />
                                <br />
                                <a class="btn btn-primary has-spinner" id="Save" runat="server" onserverclick="SaveBtn_Click">
                                    <span class="spinner"><i class="fa fa-spinner fa-spin"></i></span>&nbsp;&nbsp;<i class="fa fa-check-square-o"></i>
                                    Save Changes
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="ChangePwdPanelId" CssClass="ChangePwdPanel" Visible="false">
                <div id="ChangePwdDiv" runat="server">
                    <table>
                        <tr>
                            <td>
                                <br />
                                <asp:Label ID="CurrentPwdLbl" runat="server" Text="Current Password" ForeColor="Black" Style="font-family: Arial;">
                                </asp:Label>
                            </td>
                            <td></td>
                            <td style="font-family: Arial;">
                                <br />
                                <input type="password" id="CurrentPwdTxt" runat="server" placeholder="Enter Current Password" class="form-control input-box" width="300px" height="35px" font-size="15px" style="border-radius: 8px; margin-left: 10px; width: 300px;" required />
                            </td>
                            <td>
                                <br />
                                &nbsp;&nbsp;
                                <i class="fas fa-eye-slash" id="eye1"></i>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Label ID="NewPwdLbl" runat="server" Text="New Password" ForeColor="Black" Style="font-family: Arial;">
                                </asp:Label>
                            </td>
                            <td></td>
                            <td style="font-family: Arial;">
                                <br />
                                <input type="password" id="NewPwdTxt" runat="server" placeholder="Enter New Password" class="form-control input-box" width="300px" height="35px" font-size="15px" style="border-radius: 8px; margin-left: 10px; width: 300px;" required />
                            </td>
                            <td>
                                <br />
                                &nbsp;&nbsp;
                                <i class="fas fa-eye-slash" id="eye2"></i>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Label ID="ReTypeNewPwdLbl" runat="server" Text="Retype New <br/> Password" ForeColor="Black" Style="font-family: Arial;">
                                </asp:Label>
                            </td>
                            <td></td>
                            <td style="font-family: Arial;">
                                <br />
                                <input type="password" id="ReTypeNewPwdTxt" runat="server" placeholder="Retype New Password" class="form-control input-box" width="300px" height="35px" font-size="15px" style="border-radius: 8px; margin-left: 10px; width: 300px;" required />
                            </td>
                            <td>
                                <br />
                                &nbsp;&nbsp;
                                <i class="fas fa-eye-slash" id="eye3"></i>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Button runat="server" ID="SaveChangePwdBtn" OnClick="SaveChangePwdBtn_Click" Text="Save" CssClass="blue" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
