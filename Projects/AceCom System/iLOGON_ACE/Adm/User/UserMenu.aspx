<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<%@ Page Language="c#" CodeBehind="UserMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.User.UserMenu" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
      <script src="../../js/Script.js" type="text/javascript"></script> 
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="6" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td>
                <input type="hidden" id="tb1" value="1"><iWMS:Tabs ID="MenuTabs" runat="server">
                </iWMS:Tabs>
            </td>
            <td class="NewModuleTitle" align="right">
               <%-- <div class="rounded-box1" style="background-color: #330033; width: 60%">
                    <div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #330033">
                            •</div>
                    </div>--%>
                   <%-- <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #330033">
                            •</div>
                    </div>--%>
                    <%--	<div class="box-contents1" style="PADDING-BOTTOM:5px;PADDING-LEFT:3px;PADDING-RIGHT:5px;FONT-SIZE:10pt;FONT-WEIGHT:bold;PADDING-TOP:3px;LEFT:2px">
								<asp:Label id="UserLbl" runat="server">User</asp:Label></div>
						</div>--%>
                        <asp:Label ID="MenuLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
