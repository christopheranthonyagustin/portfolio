<%@ Page Language="c#" CodeBehind="Default.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web._Default" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
    <title>iLOGON</title>
    <meta http-equiv="Page-Exit" content="BlendTrans(Duration=0.2)" />
    <meta http-equiv="Page-Enter" content="BlendTrans(Duration=0.2)" />
    <meta http-equiv="x-ua-compatible" content="IE=11" />
    <link rel="icon" sizes="190x130" href="Image/URLLogo.png" />
    <script type="text/javascript">
        function doUnload() {
            if ((window.event.clientX < 0) && (window.event.clientY < 0)) {
                window.open("Security/Logout.aspx");
            }
        }

        var IsValid = '<%= IsValid %>';
        if (IsValid == "TRUE") {
            // Load the frameset creation code
            document.write('</head>');
            document.write('<frameset onunload="doUnload()" frameborder="0" framespacing="0" border="0" cols="*" rows="45,*">');
            document.write('<frame id="HeaderFrame" marginwidth="0" marginheight="0" src="General/Header.aspx" name="heading" noresize scrolling="no">');
            document.write('<frameset id="menu" frameborder="0" framespacing="0" border="0" cols="200,*" rows="*">');
            document.write('<frame marginwidth="0" id="MenuFrame" marginheight="0" src="General/Menu.aspx" name="code" scrolling="auto" frameborder="0">');
            document.write('<frame marginwidth="5" marginheight="5" src="App/Profile/Profile.htm" name="text" >');
            document.write('</frameset>');
            document.write('</frameset>');
            document.write('</html>');
            document.close();
        }
        else {
            alert("Your Support TOTP credentials are invalid.");
            window.location.href = "Security/Logout.aspx";
        }
    </script>
</head>
<body>
    <p>
        Dear user, your browser do not have JavaScript support, or have chosen to turn 
			it off. It's your own responsibility to accept (or not accept) useful content 
			from this web application).
    </p>
</body>
</html>
