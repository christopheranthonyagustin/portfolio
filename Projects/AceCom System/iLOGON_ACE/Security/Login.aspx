<%@ Page Language="c#" CodeBehind="Login.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Security.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Welcome to iLogon</title>
	<meta http-equiv="x-ua-compatible" content="IE=10,9,8,7,EDGE" />
	<link rel="icon" sizes="190x130" href="../Image/URLLogo.png">
	<!-- Start Firebase services CDN -->
	<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js" type="text/javascript"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js" type="text/javascript"></script>
	<!-- End Firebase services CDN -->

	<script type="text/javascript">
		var recommend = "Only can use IE5 or above to work with this Web App!!";
		var browser_type = navigator.appName
		var browser_version = parseInt(navigator.appVersion);
		if (window != top)
			top.location.href = location.href

		function onStart() {
			document.getElementById('idTxt').focus();
		}
	</script>
	<link href="../css/newlogin.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.error {
			border: 1px solid;
			background-repeat: no-repeat;
			color: #D8000C;
			background-color: #BDE5F8;
		}

		.companyLogo {
			width: auto;
			height: 110px;
			padding: 7px 0px 22px 7px;
			background-color: transparent;
		}

		.customerLogo {
			background: white;
			width: 100%;
			opacity: 0.93; /*85*/
			border-radius: 13px 13px 0px 0px;
		}

		.contentOverall {
			width: 100%;
			height: 100%;
			min-width: 600px;
			min-height: 569px;
		}

		.tableOverall {
			width: 100%;
			height: 100%;
			min-width: 600px;
			/*min-height:700px;*/
			float: right;
			border: none;
			position: relative;
			padding: 0px;
			margin: 0px;
		}

		.loginPanelOverall {
			width: 350px;
			max-height: 600px;
			align: center;
			position: relative;
		}

		.loginPanelContainer {
			/*width: 550px;*/
			/*height: 570px;*/
		}

		.loginPanelContent {
			height: 80%;
			width: 100%;
			border-radius: 0px 0px 10px 10px;
			background: white;
			opacity: 0.85; /*8*/
			padding: 15px 0px 15px 0px;
		}

		.loginPanelContentHasError {
			height: 80%;
			width: 100%;
			border-radius: 0px;
			background: white;
			opacity: 0.9;
			padding: 15px 0px 15px 0px;
		}

		.loginTextField {
			width: 320px;
			height: 35px;
			margin: 5px 30px 10px 30px;
			font-size: 18px;
			border-radius: 5px;
			border: 1px solid #bec4ce;
		}

			.loginTextField:focus {
				outline: none;
				border: 1px solid #9bc1ff;
				background-color: #c6c7c9;
			}

		.loginPanelUpDownBuffer {
			width: 30%;
			min-width: 30%;
			height: 50px;
			float: right;
		}

		.loginPanelLeftBuffer {
			width: 50%;
			height: auto;
		}

		.loginPanelRightBuffer {
			width: 50%;
			min-width: 10%;
			height: auto;
		}

		.loginTextLabel {
			font-family: Helvetica;
			font-size: 17px;
			color: #4d4d4d;
			margin: 30px;
			/*float: left;*/
		}

		.Warning {
			font-family: Helvetica;
			font-size: 13px;
			color: #4d4d4d;
			margin: 30px;
		}

		.loginNoError {
			visibility: hidden;
		}

		.loginHasError {
			visibility: visible;
			height: auto;
			width: 100%;
			opacity: 0.9;
		}

		.loginErrorMessage {
			font-family: Helvetica;
			font-size: 14px;
			font-weight: bold;
			color: White;
			padding: 0px 5px 0px 5px;
			height: auto;
			display: inline-block;
		}

		.loginFooter {
			position: fixed;
			min-width: 360px;
			width: 100%;
			height: auto; /* Height of the footer */
			background-color: Black;
			color: White;
			font-family: Helvetica;
			text-align: center;
			opacity: 0.7;
			bottom: 0px;
		}

		.loginHyperLink {
			color: #70a6ff;
			text-decoration: none;
		}

		@media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
			.loginPanelContent {
				height: 100%;
				border-radius: 0px 0px 10px 10px;
				background: white;
				opacity: 0.9;
				margin-top: 20px;
				padding: 20px 10px 0px 10px;
			}

			.loginPanelContentHasError {
				height: 100%;
				border-radius: 0px 0px 0px 0px;
				background: white;
				opacity: 0.9;
				padding: 40px 10px 12px 10px;
			}

			.loginHasError {
				visibility: visible;
				height: 20px;
				width: 100%;
				opacity: 1;
				text-align: center;
				padding-top: 13px;
			}
		}
	</style>

	<script type="text/javascript">
		function GetFCMToken() {

			// Get Config Key from Fire Base Project
			const config = {
				apiKey: "AIzaSyBUeXJ6jW-h-1H6JGuYUHK7gjQwtgVknkU",
				authDomain: "grand-boulder-202209.firebaseapp.com",
				databaseURL: "https://grand-boulder-202209.firebaseio.com",
				projectId: "grand-boulder-202209",
				storageBucket: "grand-boulder-202209.appspot.com",
				messagingSenderId: "953079188383",
				appId: "1:953079188383:web:bf3a6b8a0dac7fa72a0baa",
				measurementId: "G-47PWNW532V"
			}

			// Insert Config to App
			var DefaultApp = firebase.initializeApp(config);

			if (firebase.messaging.isSupported()) {
				var Messaging = firebase.messaging();

				// Let's check Permission
				Messaging.requestPermission()
					.then(function () {
						console.log('Notification permission granted.'); // We've grant for Permission
						GetToken();
						GetBrowserName();
					}).catch(function (err) {
						console.log('Unable to get firebase messaging permission: ' + err);
						var GUId = CreateGuid();
						console.log("GUID is:" + GUId);
						GetBrowserName();
						document.getElementById("TokenValueHiddenField").value = GUId;
					});

				// Let's refresh Token
				Messaging.onTokenRefresh(function (arg) {
					console.log("OnTokenRefresh called. " + arg);
					GetToken();
					GetBrowserName();
				});

				// GetToken
				function GetToken() {

					console.log('Have GetToken() promise.  Executing.');
					var GUId = CreateGuid();
					console.log("GUID is:" + GUId);

					// We need to work with serviceWorker coz 
					if ("serviceWorker" in navigator) {
						navigator.serviceWorker
							.register("../firebase-messaging-sw.js")
							.then(function (registration) {
								Messaging.getToken({ vapidKey: 'BB_H-fOk-aE1n-y35Qq_y9tCqAzWm_putJ_rzMJohZjSVRAbFwYPukrSWhIpC_NyovmmiuxZB79_OAS2bM2mY6U', serviceWorkerRegistration: registration })
									.then((CurrentToken) => {
										if (CurrentToken) {
											console.log("Current Token is : " + CurrentToken);

											document.getElementById("TokenValueHiddenField").value = CurrentToken;

										} else {
											console.log('No registration token available. Request permission to generate one.');
										}
									}).catch((err) => {
										console.log('An error occurred while retrieving token. ', err);
										document.getElementById("TokenValueHiddenField").value = GUId;
									});
							})
							.catch(function (err) {
								console.log("Service worker registration failed, error:", err);
								document.getElementById("TokenValueHiddenField").value = GUId;
							});
					}
				}
			}
			else {
				var GUId = CreateGuid();
				console.log("GUID is:" + GUId);
				GetBrowserName();
				document.getElementById("TokenValueHiddenField").value = GUId;
				console.log(document.getElementById("TokenValueHiddenField").value);
			}

			// Get DeviceType
			function GetBrowserName() {

				var BrowserName = (function (agent) {
					switch (true) {
						case agent.indexOf("edge") > -1: return "MS Edge";
						case agent.indexOf("edg/") > -1: return "Edge (Chromium Based)";
						case agent.indexOf("opr") > -1 && !!window.opr: return "Opera";
						case agent.indexOf("chrome") > -1 && !!window.chrome: return "Chrome";
						case agent.indexOf("trident") > -1: return "MS IE";
						case agent.indexOf("firefox") > -1: return "Mozilla Firefox";
						case agent.indexOf("safari") > -1: return "Safari";
						default: return "other";
					}
				})(window.navigator.userAgent.toLowerCase());

				document.getElementById("DeviceTypeHiddenValue").value = BrowserName;
			}

			function CreateGuid() {
				function _p8(s) {
					var p = (Math.random().toString(16) + "000000000").substr(2, 8);
					return s ? "-" + p.substr(0, 4) + "-" + p.substr(4, 4) : p;
				}
				return _p8() + _p8(true) + _p8(true) + _p8();
			}
		}
	</script>
</head>
<body onload="GetFCMToken(); onStart();" style="min-width: 900px; min-height: 640px;">
	<form id="Login" method="post" runat="server">
		<div class="contentOverall">
			<table cellspacing="0px" cellpadding="0px" class="tableOverall">
				<tbody>
					<tr style="border-collapse: separate; page-break-inside: avoid;">
						<td>
							<img title="Keyfields" src="../File/LogIn/Logo.png" class="companyLogo">
						</td>
					</tr>
					<tr style="border-collapse: separate; page-break-inside: avoid;">
						<td class="loginPanelLeftBuffer"></td>
						<td class="loginPanelOverall">
							<asp:Panel ID="pnlLogin" runat="server">
								<table cellspacing="0px" cellpadding="0px" class="loginPanelContainer">
									<tbody>
										<tr>
											<td style="width: 100%;">
												<div class="customerLogo">
													<img alt="Customer" src="../File/LogIn/CustLogo.png"
														style="height: auto; width: 55%; margin: 0px 30px 0px 85px;">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<asp:Panel ID="LoginContent" CssClass="loginPanelContent" runat="server">
													<asp:Label ID="LoginLbl" runat="server" CssClass="loginTextLabel">Username</asp:Label>
													<asp:TextBox ID="idTxt" runat="server" CssClass="loginTextField"></asp:TextBox>

													<asp:Label ID="PasswordLbl" runat="server" CssClass="loginTextLabel">Password</asp:Label>
													<input id="password" type="password"
														name="password" runat="server" class="loginTextField" />

													<asp:HiddenField ID="TokenValueHiddenField" runat="server" />
													<asp:HiddenField ID="DeviceTypeHiddenValue" runat="server" />
													<asp:ImageButton title="Login"
														ID="ImageButton1" onmouseover="this.src='../Image/login/loginBtnDark.png'"
														OnClick="LoginBtn_Click" onmouseout="this.src='../Image/login/loginBtn.png'"
														runat="server" src="../Image/login/loginBtn.png" Style="width: 350px; height: 50px; margin: 10px 20px 10px 20px;" />
													<text class="loginTextLabel" style="font-size: 16px; bottom: 0; position: relative;">iLOGON:c24.01.152MH</text>												
													<div class="Warning">
														<asp:Label ID="LoginBoxFooterHeaderLbl" runat="server"></asp:Label>
														<asp:Label ID="LoginBoxFooterFooterLbl" runat="server"></asp:Label>
													</div>
												</asp:Panel>
											</td>
										</tr>
										<tr>
											<td style="vertical-align: top;">
												<asp:Panel ID="ErrorDisplay" CssClass="loginNoError" runat="server">
													<div style="padding: 5px 0px 5px 0px; border-radius: 0px 0px 10px 10px; width: 100%; height: auto; opacity: 0.9; background-color: #f75d6d;">
														<asp:Label CssClass="loginErrorMessage" ID="InvalidLogin" runat="server">&nbsp;</asp:Label>
													</div>
												</asp:Panel>
											</td>
										</tr>
									</tbody>
								</table>
							</asp:Panel>
						</td>
						<td class="loginPanelRightBuffer"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="footer">
			<p>
				<!-- 1 Irving Place #09-13 The COMMERZE@IRVING Singapore 369546 | Phone: +65 6842 7886
                | Fax: +65 6842 7086 | Email: 
                 -->
				<asp:Label ID="FooterLbl" runat="server"></asp:Label><a href="mailto:helpdesk@keyfields.com" target="_blank"><asp:Label ID="EmailHyperLinkLbl" runat="server">helpdesk@keyfields.com</asp:Label></a>
				<a href="http://www.keyfields.com" target="_blank" style="text-decoration: none">
					<asp:Label ID="Footer2Lbl" runat="server" Font-Bold="true" ForeColor="White"></asp:Label>
				</a>
			</p>
		</div>
	</form>
</body>
</html>
