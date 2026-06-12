<%@ Page language="c#" Codebehind="InvCountLineByUser.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Graphlet.General.InvCountLineByUser" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
  <head runat="server">
		<title>LocStatus</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
  </head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" align="center" bgColor="#cccccc" border="0">
				<TBODY>
					<tr>
						<td bgColor="#ffffff"></td>
						<td>
							<table cellSpacing="1" cellPadding="1" width="100%" border="0">
								<tr bgColor="#ffffff">
									<td width="20%">&nbsp;
										<asp:Label id="InvCountLbl" runat="server">Inv.Count#</asp:Label></td>
									<td>:
										<asp:TextBox id="InvCountTxt" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator id="IcReq" runat="server" ErrorMessage="*" ControlToValidate="InvCountTxt"></asp:RequiredFieldValidator></td>
								</tr>
								<tr bgColor="#ffffff">
									<td>&nbsp;
										<asp:Label id="SelectLbl" runat="server">Select View</asp:Label></td>
									<td>:
										<asp:dropdownlist id="drpChartType" runat="server">
											<asp:ListItem Value="Pie">Pie Chart</asp:ListItem>
											<asp:ListItem Value="Bar">Bar Graph</asp:ListItem>
											<asp:ListItem Value="Table">Table</asp:ListItem>
										</asp:dropdownlist>
									</td>
								</tr>
								<tr bgColor="#ffffff">
									<td></td>
									<td>&nbsp;
										<asp:button id="GetGraphletBtn" runat="server" Text="Get Graphlet" onclick="GetGraphletBtn_Click"></asp:button></td>
								</tr>
								<tr bgColor="#ffffff">
									<td vAlign="top" colSpan="2"><asp:datagrid id="StatusDG" runat="server" cssclass="Content" borderwidth="1px" showfooter="True"
											autogeneratecolumns="False" width="300px" cellpadding="4" BorderColor="#3366CC" BorderStyle="None" BackColor="White">
											<SelectedItemStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999"></SelectedItemStyle>
											<ItemStyle ForeColor="#003399" BackColor="White"></ItemStyle>
											<HeaderStyle ForeColor="#CCCCFF" BackColor="#003399"></HeaderStyle>
											<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
											<Columns>
												<asp:BoundColumn DataField="XValue" HeaderText="Inv.Count Line By User">
													<HeaderStyle CssClass="HeaderStyle"></HeaderStyle>
													<ItemStyle CssClass="ItemStyle"></ItemStyle>
													<FooterStyle CssClass="FooterStyle"></FooterStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="YValue" HeaderText="Total">
													<HeaderStyle CssClass="HeaderStyleRight"></HeaderStyle>
													<ItemStyle CssClass="ItemStyleRight"></ItemStyle>
													<FooterStyle CssClass="FooterStyleRight"></FooterStyle>
												</asp:BoundColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages"></PagerStyle>
										</asp:datagrid><asp:image id="ChartImage" runat="server" visible="False" borderwidth="0"></asp:image></td>
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</html>
