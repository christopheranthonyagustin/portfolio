<%@ Page language="c#" Codebehind="CalFromTo.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Control.CalFromTo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>CalFromTo</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../css/iWMS.css">
		<base target="_self">
	</head>
	<body topmargin="0" leftmargin="0">
		<form id="Form1" action="CalFromTo.aspx" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table>
				<tr>
					<td align="center">
						<asp:Label id="FromLbl" runat="server">From</asp:Label></td>
					<td align="center">
						<asp:Label id="ToLbl" runat="server">To</asp:Label></td>
				</tr>
				<tr>
					<td><asp:Calendar id="FromCal" runat="server" BackColor="White" Width="136px" DayNameFormat="FirstLetter"
							ForeColor="Black" Height="160px" Font-Size="8pt" Font-Names="Verdana" BorderColor="#999999"
							CellPadding="4" onselectionchanged="FromCal_SelectionChanged">
							<TodayDayStyle ForeColor="Black" BackColor="#CCCCCC"></TodayDayStyle>
							<SelectorStyle BackColor="#CCCCCC"></SelectorStyle>
							<NextPrevStyle VerticalAlign="Bottom"></NextPrevStyle>
							<DayHeaderStyle Font-Size="7pt" Font-Bold="True" BackColor="#CCCCCC"></DayHeaderStyle>
							<SelectedDayStyle Font-Bold="True" ForeColor="White" BackColor="#666666"></SelectedDayStyle>
							<TitleStyle Font-Bold="True" BorderColor="Black" BackColor="#999999"></TitleStyle>
							<WeekendDayStyle BackColor="#FFFFCC"></WeekendDayStyle>
							<OtherMonthDayStyle ForeColor="#808080"></OtherMonthDayStyle>
						</asp:Calendar></td>
					<td>
						<asp:Calendar id="ToCal" runat="server" BackColor="White" Width="136px" DayNameFormat="FirstLetter"
							ForeColor="Black" Height="164px" Font-Size="8pt" Font-Names="Verdana" BorderColor="#999999"
							CellPadding="4" onselectionchanged="ToCal_SelectionChanged">
							<TodayDayStyle ForeColor="Black" BackColor="#CCCCCC"></TodayDayStyle>
							<SelectorStyle BackColor="#CCCCCC"></SelectorStyle>
							<NextPrevStyle VerticalAlign="Bottom"></NextPrevStyle>
							<DayHeaderStyle Font-Size="7pt" Font-Bold="True" BackColor="#CCCCCC"></DayHeaderStyle>
							<SelectedDayStyle Font-Bold="True" ForeColor="White" BackColor="#666666"></SelectedDayStyle>
							<TitleStyle Font-Bold="True" BorderColor="Black" BackColor="#999999"></TitleStyle>
							<WeekendDayStyle BackColor="#FFFFCC"></WeekendDayStyle>
							<OtherMonthDayStyle ForeColor="Gray"></OtherMonthDayStyle>
						</asp:Calendar></td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:TextBox id="ReturnTxt" runat="server" Width="310px"></asp:TextBox></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<asp:Button id="OkBtn" runat="server" Text="   OK   " CssClass="formbtn"></asp:Button>&nbsp;
						<asp:Button id="CancelBtn" runat="server" Text="Cancel" CssClass="formbtn"></asp:Button></td>
				</tr>
			</table>
		</form>
	</body>
</html>
