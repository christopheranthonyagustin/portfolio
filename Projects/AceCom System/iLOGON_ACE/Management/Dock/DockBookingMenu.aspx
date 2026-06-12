<%@ Page Language="c#" CodeBehind="DockBookingMenu.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Management.Dock.DockBookingMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingSchedule</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" bgcolor="#e2e3e3" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <table width="100%">
        <tr>
            <td>
                <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                    ID="MenuTabs" runat="server"></iWMS:Tabs>
                </a>
            </td>
            <td class="ModuleTitle" align="right">
                <div class="rounded-box1" style="width: 40%; background-color: #336600;">
                    <div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #336600">
                            •</div>
                    </div>
                    <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #336600">
                            •</div>
                    </div>
                    <div class="box-contents1" style="font-size: 10pt; font-weight: bold; left: 2px;
                        padding: 3px 5px 5px 3px;">
                        <asp:Label ID="ReceiptDocLbl" runat="server">Booking Schedule</asp:Label>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
