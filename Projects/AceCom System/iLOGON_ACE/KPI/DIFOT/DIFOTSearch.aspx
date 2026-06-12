<%@ Register TagPrefix="iWMS" TagName="iCalOnDate" Src="../../Control/iCalOnDateCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Page language="c#" Codebehind="DIFOTSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.KPI.DIFOT.DIFOTSearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ReportSearch</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	    <style type="text/css">
            .style1
            {
                height: 17px;
                width: 77px;
            }
            .style2
            {
                width: 77px;
            }
        </style>
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table style="Z-INDEX: 0" border="0" cellSpacing="2" cellPadding="2">
				<tr>
					<td noWrap class="style1">
						<asp:label id="AccountLbl" runat="server">Account</asp:label></td>
					<td style="HEIGHT: 17px">&nbsp;<telerik:RadComboBox ID="AccountList" runat="server" Skin="WebBlue" Filter="Contains">
                </telerik:RadComboBox></td>
				</tr>
				<tr>
					<td noWrap class="style2">&nbsp;
						<asp:label id="FromLbl" runat="server">From</asp:label></td>
					   <td>&nbsp;<telerik:RadDatePicker ID="frDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                    DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="165px" AutoPostBack="true">
                    <Calendar>
                        <SpecialDays>
                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                        </SpecialDays>
                    </Calendar>
                </telerik:RadDatePicker>
            </td>
				</tr>
				<tr>
					<td noWrap class="style2">&nbsp;
						<asp:label id="ToLbl" runat="server">To</asp:label></td>
					<td>&nbsp;<telerik:RadDatePicker ID="toDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                    DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="165px"
                    sel>
                    <Calendar>
                        <SpecialDays>
                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                        </SpecialDays>
                    </Calendar>
                </telerik:RadDatePicker>
				</tr>
				<tr>
					   <td class="style2" colspan="2">
         &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
             <telerik:RadButton ID="CompileBtn" runat="server" CssClass="detailButton"  Skin="WebBlue" Text="Compile"
                OnClick="CompileBtn_Click"></telerik:RadButton>&nbsp;&nbsp;
             <telerik:RadButton ID="ResetBtn" runat="server" CssClass="detailButton" Skin="WebBlue" Text="Reset" OnClick="ResetBtn_Click"></telerik:RadButton>
            <br />
            <asp:Label ID="lblError" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
				</tr>
			</table>
		</form>
	</body>
</html>
