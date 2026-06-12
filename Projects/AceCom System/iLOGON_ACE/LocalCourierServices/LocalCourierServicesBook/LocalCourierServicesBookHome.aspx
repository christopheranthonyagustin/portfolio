<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesBookHome.aspx.cs" Inherits="iWMS.Web.LocalCourierServices.LocalCourierServicesBook.LocalCourierServicesBookHome" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home @ LocalCourierServices</title>
    <link rel="stylesheet" href="../../LocalCourierServices/Style/LocalCourierServices.css" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="../Script/LocalCourierServices.js"></script>
</head>
<body>
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
    </form>
</body>
</html>
