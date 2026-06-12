<%@ Page language="c#" Codebehind="ISGraphDisplay.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.App.Profile.ISGraphDisplay" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>IssueGraphDisplay</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Pragma" content="no-cache">
		<script language="javascript">AC_FL_RunContent = 0;</script>
		<script language="javascript"> DetectFlashVer = 0; </script>
		<script language="javascript" src="AC_RunActiveContent.js"></script>
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<script language="javascript">
function noLeftClick() {
if (event.button==1) {
alert('Left click is disabled. Right Click to Print!')
}
}
document.onmousedown=noLeftClick
		</script>
	</head>
	<BODY>
		<SCRIPT language="JavaScript" type="text/javascript">
<!--
var requiredMajorVersion = 9;
var requiredMinorVersion = 0;
var requiredRevision = 45;
-->
		</SCRIPT>
		<SCRIPT language="JavaScript" type="text/javascript">
<!--
if (AC_FL_RunContent == 0 || DetectFlashVer == 0) {
	alert("This page requires AC_RunActiveContent.js.");
} else {
	var hasRightVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
	
	var currentdate = new Date();
	var time = currentdate.getTime();
	var seconds = currentdate.getSeconds();
	var date = currentdate.getDate();
	var flashVars = 'library_path=charts_library&xml_source=../../File/chart.xml?uniqueid='+date+time+seconds;
	
	if(hasRightVersion) { 
		AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,45,0',
			'width', '800',
			'height', '600',
			'scale', 'exactFit',
			'salign', '',
			'bgcolor', '#FFFFFF',
			'wmode', 'transparent',
			'movie', 'charts',
			'src', 'charts',
			'FlashVars', flashVars, 
			'id', 'my_chart',
			'name', 'my_chart',
			'menu', 'true',
			'allowFullScreen', 'false',
			'allowScriptAccess','sameDomain',
			'quality', 'high',
			'align', 'middle',
			'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
			'play', 'true',
			'devicefont', 'false'
			); 
	} else { 
		var alternateContent = 'This content requires the Adobe Flash Player. '
		+ '<u><a href=http://www.macromedia.com/go/getflash/>Get Flash</a></u>.';
		document.write(alternateContent); 
	}
}
// -->
		</SCRIPT>
		<NOSCRIPT>
			<P>This content requires JavaScript.</P>
		</NOSCRIPT>
	</BODY>
</html>
