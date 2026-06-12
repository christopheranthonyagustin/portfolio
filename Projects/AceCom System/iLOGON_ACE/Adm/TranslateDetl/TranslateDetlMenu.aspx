<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Page language="c#" Codebehind="TranslateDetlMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.TranslateDetl.TranslateDetlMenu" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Translate Detail</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	    <style type="text/css">
            .style1
            {
                width: 817px;
            }
        </style>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="5" style="BORDER-BOTTOM: #d5d5d5 1px solid">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr>
					<td class="style1"><input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iwms:tabs id="MenuTabs" runat="server"></iwms:tabs></a></td>
					<td class="ModuleTitle" align="right">
						<div class="rounded-box1" style="BACKGROUND-COLOR:#336600;WIDTH:60%">
							<div class="top-right-corner1">
								<div class="top-right-inside1" style="BACKGROUND-COLOR: #ffffff;COLOR: #336600">•</div>
							</div>
							<div class="top-left-corner1">
								<div class="top-left-inside1" style="BACKGROUND-COLOR: #ffffff;COLOR: #336600">•</div>
							</div>
							<div class="box-contents1" 
                                style="PADDING-BOTTOM:5px;PADDING-LEFT:3px;PADDING-RIGHT:5px;FONT-SIZE:10pt;FONT-WEIGHT:bold;PADDING-TOP:3px;LEFT:-37px; top: 0px; width: 316px;">
								<asp:Label id="MenuLbl" runat="server">Translate Detail</asp:Label>
							    </div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
