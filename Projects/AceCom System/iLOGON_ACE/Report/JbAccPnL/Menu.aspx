<%@ Page language="c#" Codebehind="Menu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.JbAccPnL.Menu" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<html>
	<head runat="server">
		<title>JbAccPnL</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="15" style="BORDER-BOTTOM: #D5D5D5 1px solid;">
		<form id="Form1" method="post" runat="server">
			<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <table width="100%">
                <tr>
                    <td>
                        <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                            ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </td>
                    <td class="NewModuleTitle" align="left" valign="bottom">
                      <%--  <div style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px; padding-top: 3px;
                                left: -37px; top: 0px; width: 316px;">--%>
                                <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server">P&ampL By Account By Job</asp:Label>
                              </div>
                    </td>
                </tr>
            </table>
		</form>
	</body>
</html>
