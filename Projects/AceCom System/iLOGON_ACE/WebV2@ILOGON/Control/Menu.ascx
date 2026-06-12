<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="iWMS.Web.WebV2_ILOGON.Control.Menu" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<link href="../Style/LocalCourierServices.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />

<table width="100%" style="background: #05538c; height: 9%">
    <tr>
        <td>
            <asp:Label runat="server" ID="LicenseLbl" CssClass="License"></asp:Label>
            <div class="icons" style="float: right; padding-right: 20px; padding-top: 7px;">
                <asp:Label runat="server" ID="LoginLbl" CssClass="Login"></asp:Label>
                <a href="../Home/LocalCourierServicesHome.aspx">
                    <img src="../../Image/HomeIcon.png" width="28" height="28" alt="Home" style="margin-bottom: 4px;" /></a>

                <div class="dropdown">
                    <button class="dropbtn">
                        <img src="../../Image/Profile Head Icon LightBlue.png" width="33" height="33" alt="Profile" style="margin-bottom: 4px;" />
                    </button>
                    <div class="dropdown-content">
                        <a href="../Profile/LocalCourierServicesProfile.aspx">Profile</a>
                        <a href="#">Setting</a>
                        <a href="#">Payment</a>
                    </div>
                </div>
                <a href="../../Security/Login.aspx" class="logoutbtn">Logout &nbsp;<span class="glyphicon glyphicon-log-out"></span>
                </a>
            </div>
        </td>
    </tr>
</table>

<table style="display: block; width: 100%; height: 8px; background-color: #ececec;"></table>

<ul id="menu" runat="server" class="menu">
</ul>
