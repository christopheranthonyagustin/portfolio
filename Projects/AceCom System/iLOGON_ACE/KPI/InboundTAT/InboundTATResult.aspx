<%@ Page language="c#" Codebehind="InboundTATResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.KPI.InboundTAT.InboundTATResult" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="Head1" runat="server">
		<title>ReportResult</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table border="0" cellSpacing="1" cellPadding="1" width="100%">
				<tr>
					<td class="boldtext"><asp:label id="AccountLbl" runat="server" CssClass="Graytitle">Account : </asp:label><BR>
						<asp:label id="FromDateLbl" runat="server" CssClass="Graytitle">From Date : </asp:label><BR>
						<asp:label id="ToDateLbl" runat="server" CssClass="Graytitle"> To Date : </asp:label><BR>
						<asp:label id="TargetDayLbl" runat="server" CssClass="Graytitle">Target Days : </asp:label><P>
							<asp:label id="PassLbl" runat="server" CssClass="Graytitle">Pass : </asp:label><BR>
							<asp:label id="FailLbl" runat="server" CssClass="Graytitle">Fail : </asp:label><BR>
							<asp:label id="PassPctLbl" runat="server" CssClass="Graytitle">Pass % : </asp:label><BR>
							<BR>
						</P>
					</td>
				</tr>
				<tr>
					<td><telerik:RadGrid id="ResultDG" runat="server" CellPadding="2" GridLines="Both" BorderStyle="None"
							AutoGenerateColumns="True" Skin="Office2007" UseAccessibleHeader="True" OnItemDataBound="ResultDG_ItemDataBound">
							<AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
							<ItemStyle Wrap="false"></ItemStyle>
							<HeaderStyle Wrap="false"></HeaderStyle>
							<ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <ExportSettings ExportOnlyData="true" IgnorePaging="true">
                            </ExportSettings>                            
						</telerik:RadGrid>
						<asp:Label id="ErrorLbl" runat="server" CssClass="Graytext" Visible="False"></asp:Label></td>
				</tr>
			</table>
		</form>
	</body>
</html>
