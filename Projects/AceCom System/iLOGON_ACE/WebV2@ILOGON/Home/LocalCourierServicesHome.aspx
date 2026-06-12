<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesHome.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.Home.LocalCourierServicesHome" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Home @ LocalCourierServices</title>
    <link rel="stylesheet" href="../Style/LocalCourierServices.css" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server" method="get">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:WebV2Menu ID="WebV2Menu" runat="server"></iWMS:WebV2Menu>
    </form>
</body>
</html>
