<%@ Page Language="c#" CodeBehind="LicenseAlert.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Security.LicenseAlert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>iWMS.net</title>
    <link href="../css/login.css" type="text/css" rel="stylesheet" />
</head>
<body onload="document.getElementById('ContinueBtn').focus();">
    <form id="Login" method="post" runat="server">

        <div id="page">
            <div class="wrapper">
                <div class="roundtop">
                    <img src="../Image/login/tl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
                </div>

                <div class="innerWrap">
                    <div class="innerRoundtop">
                        <img src="../Image/login/innertl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
                    </div>

                    <div class="center" style="background-color: #fff; color: #444; margin: auto 15px; border: 1px solid #000; padding: 0 20px;">
                        <h3 style="color: Red;">[NOTICE]</h3>
                        <h4>
                            <asp:Label ID="ExpireTitleLbl" runat="server"></asp:Label>
                        </h4>
                        <h3>
                            <asp:Label ID="expDaysLbl" runat="server"></asp:Label>
                        </h3>
                        <h4>
                            <asp:Label ID="oneDayExpLbl" runat="server" ForeColor="Red" Font-Size="1.3em"></asp:Label>
                        </h4>
                        <h4>Please renew your license before
                        </h4>
                        <h3>
                            <asp:Label ID="expDateLbl" runat="server"></asp:Label>
                        </h3>
                        <h4>
                            <asp:Label ID="ExpiryFooterLbl" runat="server"></asp:Label>
                        </h4>
                        <div class="padding25"></div>
                        <asp:Button ID="ContinueBtn" runat="server" Text="Proceed to iLOGON" CssClass="button white medium" OnClick="ContinueBtn_Click"></asp:Button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="ActivateBtn" runat="server" Text="I have the New License Renewal Key" CssClass="button white medium" OnClick="ActivateBtn_Click"></asp:Button>
                        <div class="padding25"></div>
                    </div>

                    <div class="innerRoundbottom">
                        <img src="../Image/login/innerbl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
                    </div>
                </div>

                <div class="roundbottom">
                    <img src="../Image/login/bl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
                </div>
            </div>
        </div>

    </form>
</body>
</html>
