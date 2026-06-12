<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LicenseActivate.aspx.cs" Inherits="iWMS.Web.Security.LicenseActivate" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>iWMS.net</title>
		<link href="../css/login.css" type="text/css" rel="stylesheet" />
        <link rel="icon" sizes="190x130" href="../Image/URLLogo.png" />
        <style type="text/css">
            .activatebutton
            {
                width: 87px;
                height: 27px;
                color: #000000;
                font-size: 12px;
                font-weight: bold;
                font-family: Arial;
                background: #ffffff;
                border-radius: 10px;
                text-decoration: none;
                border: solid #999999 2px;
                box-shadow: 0px 0px 3px #666666;
                outline:none;
            }
        </style>

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
    					
    					<div class="center" style="background-color: #fff; color:#444; margin: auto 15px; border: 1px solid #000; padding: 0 20px;">
    					    <h3 style="color: Red;">iLOGON</h3>
                            <h4>
                                Your iLOGON Serial Number
                                <br />
                                <br />
                                <asp:TextBox ID="SerialNumberTxt" runat="server" Width="500px" Font-Size="Large" BackColor="#d6eaf8" BorderColor="Black"></asp:TextBox>
							</h4>
							<h4>
                                Your iLOGON Activation Key
                                <br />
                                <br />
                                <asp:TextBox ID="ActivationKeyTxt" runat="server" Width="500px" Font-Size="Large" BackColor="Yellow" BorderColor="Black"></asp:TextBox>
							</h4>
							<div class="padding25"></div>
                            <br />
                            <br />
							<asp:button id="ActivateBtn" runat="server" Width="500px" Height="50px" Font-Bold="true" Font-Size="X-Large" ForeColor="Red"
                                CssClass="activatebutton" Text="Activate" OnClick="ActivateBtn_Click"></asp:button>
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
