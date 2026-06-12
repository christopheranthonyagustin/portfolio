<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesBookPrintShippingLbl.aspx.cs" Inherits="iWMS.Web.LocalCourierServices.LocalCourierServicesBook.LocalCourierServicesBookPrintShippingLbl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PrintShippingLbl @ LocalCourierServices</title>
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

        <table style="margin: 40px 0px 0px 15%;">
            <tr>
                <td style="font-family: Helvetica; font-weight: bold;">
                    <asp:Label ID="OrderNoLbl" runat="server" Text="Order Number"></asp:Label>
                </td>
                <td>
                    <telerik:RadTextBox ID="OrderNOTxtBox" runat="server" CausesValidation="false" Skin="WebBlue" Rows="3" TextMode="MultiLine" Resize="Both" Width="250"></telerik:RadTextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="PrintShippingLabel" CssClass="blue" runat="server" OnClick="PrintShippingLabel_Click"
                        Text="Print" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
