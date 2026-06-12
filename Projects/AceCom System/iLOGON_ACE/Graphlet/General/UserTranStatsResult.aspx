<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTranStatsResult.aspx.cs" Inherits="iWMS.Web.Graphlet.General.UserTranStatsResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title>UserTransactionSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <%--<link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />--%>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <style type="text/css">
        .blackBoldText
        {
            color: #000000; 
            FONT-SIZE: 18px; 
            FONT-FAMILY: Arial,Verdana,Helvetica;
            font-weight: bold;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
		    <tr class="graytitle">
				<td colspan="3"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
				<td width="70%" align="right">
				    <a id="a1" runat="server" onserverclick="ExportExcel">
				        <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif" height="20" runat="server" />
				    </a>
				</td>
			</tr>
			<tr class="graytitle">
				<td><asp:label ID="ReportLbl" Runat="server">Report</asp:label></td>
				<td>:</td>
				<td colSpan="2">
					<asp:label id="TitleLbl" runat="server" CssClass="Graytitle">Transactions Statistics Per User</asp:label><asp:Label id="FromDateLbl" runat="server"></asp:Label><asp:Label id="ToDateLbl" runat="server"></asp:Label>
				</td>
			</tr>	
			<tr class="graytitle">
				<td><asp:label ID="AccLbl" Runat="server">Account</asp:label></td>
				<td>:</td>
				<td colSpan="2">
					<asp:Label id="AccountLbl" runat="server"></asp:Label>
				</td>
			</tr>				
		</table>
		<br />
        <asp:PlaceHolder ID="PH1" runat="server" />
    </form>
</body>
</html>
