<%@ Page Language="c#" CodeBehind="AddRoDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.ReleaseOrder.AddRoDetl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AddOrderItem</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
     <script type="text/javascript">

         function CloseAndRebind(args) {
             GetRadWindow().BrowserWindow.refreshGrid(args);
             GetRadWindow().close();
         }

         function GetRadWindow() {
             var oWindow = null;
             if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
             else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)
             return oWindow;
         }

         function CancelEdit() {
             GetRadWindow().close();
         }

        </script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    </form>
</body>
</html>
