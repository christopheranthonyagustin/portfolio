<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripSms.aspx.cs" Inherits="iWMS.Web.Job.TripPlanning.JobTripSms" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JobTripSms</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
         function GetRadWindow() {
             var oWindow = null; if (window.radWindow)
                 oWindow = window.radWindow; else if (window.frameElement.radWindow)
                 oWindow = window.frameElement.radWindow; return oWindow;
         }

         function closeWin(url) {
             GetRadWindow().BrowserWindow.location.href = url;
             GetRadWindow().close();
         }

         function close() {
             GetRadWindow().close();
         }
    </script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <style type="text/css">
        #Form2
        {
            height: 332px;
            width: 599px;
        }
    </style>
</head>
<body onload="javascript:window.focus();">
    <form id="Form2" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="400px" runat="server">
        <tr>
            <td width="200px">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td align ="left">
                <asp:Image ID="Personnelimg" runat="server" ImageAlign="left"  ImageUrl="~/Master/Personnel/MakeThumbNail.aspx" />
            </td>
     
        </tr>
    </table>
    <table>
    <tr>
     <td width="300px">
                <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
            </td>
    </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Button ID="sendbtn" Text="Send" runat="server" CssClass="detailButton" Width="100px"
                    OnClick="Sendsms_Click" Visible= "false" />
            </td>
            <td>
                <asp:Button ID="Closebtn" Text="Close" runat="server" CssClass="detailButton" Width="100px"
                    OnClientClick="window.close(); return false;" />
            </td>
        </tr>
    </table>
   
    </form>
</body>
</html>
