<%@ Page language="c#" Codebehind="TranslateDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Translate.TranslateDetl" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>TranslateDetl</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<SCRIPT src="../../js/sub_global.js" type="text/javascript"></SCRIPT>
		<SCRIPT src="../../js/sub_menu.js" type="text/javascript"></SCRIPT>
	    <%--<script>
            location.href = "#AddDetailBtn";
		</script>--%>
	    <style type="text/css">
            .style1
            {
                width: 129px;
            }
        </style>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" border="0" width="100%">
				<tr>
					<td>
						<div class="pagetitle">
							<asp:label id="TranslateIdLbl" runat="server"></asp:label>
						&nbsp;</div>
					</td>
					<td align="right">					    <asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="False" Text="Search Results"
							Width="120px" CausesValidation="False" onclick="BackButton_Click"></asp:button>&nbsp;<asp:button id="AddDetailBtn" runat="server" Visible="False" Text="+ Detail" CssClass="detailButton" onclick="AddDetailBtn_Click"></asp:button>&nbsp;&nbsp;</td>
				</tr>
				<br />  
				<tr>
					<td colspan="2">
						<asp:panel id="AddPanel" runat="server" Visible="False">
							<A name="#AddDetailBtn"></A>
							<TABLE border="0" cellSpacing="1" cellPadding="1" width="100%">
								<TR>
									<td class="style1"><asp:Label 
                                            ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
									<TD align =right>
										<asp:Button id="SaveNextBtn" runat="server" CssClass="detailButton" Text="Save &amp; Next" onclick="SaveNextBtn_Click"></asp:Button>&nbsp;
										<asp:Button id="SaveBtn" runat="server" CssClass="detailButton" Text="Save" onclick="SaveBtn_Click"></asp:Button>&nbsp;
										<asp:Button id="ClosePanelBtn" runat="server" CssClass="detailButton" Text="- Hide" CausesValidation="False" onclick="ClosePanelBtn_Click"></asp:Button>&nbsp;&nbsp;</TD>
								
								</TR>
								<TR>
									
									<TD noWrap class="style1">
										<asp:label id="CodeLbl" runat="server">Code</asp:label>
										<asp:RequiredFieldValidator id="CodeVal" runat="server" ErrorMessage="*" ControlToValidate="CodeTxt"></asp:RequiredFieldValidator><BR>
										<asp:TextBox id="CodeTxt" runat="server"></asp:TextBox></TD>
                                    <TD noWrap>
										<asp:label id="LabelLbl" runat="server">Label</asp:label>
										<asp:RequiredFieldValidator id="LabelVal" runat="server" ErrorMessage="*" ControlToValidate="LabelTxt"></asp:RequiredFieldValidator><BR>
										<asp:TextBox id="LabelTxt" runat="server"></asp:TextBox></TD>

								</TR>
								
							</TABLE>
						</asp:panel></td>
						<br />
				</tr>
			</table>

			<%--<div id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" AllowSorting="True" AllowPaging="True" PageSize="8" CellPadding="2" GridLines="Both"
					BorderStyle="None" AutoGenerateColumns="False" UseAccessibleHeader="True">
<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
<ItemStyle CssClass="DGItem"></ItemStyle>--%>
                <div id="div-datagrid" style="height:92%">
				<asp:datagrid id="ResultDG" runat="server" DataKeyField="code"
                    AutoGenerateColumns="False" BorderStyle="None"
					GridLines="Both" CellPadding="2" PageSize="16" AllowSorting="True" UseAccessibleHeader="True"
					AllowPaging="True">					
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
						<%--<asp:TemplateColumn>
							<ItemStyle Wrap="False"></ItemStyle>
							<ItemTemplate>
								<iwms:iSubMenu id="subMenuCtl" runat="server"></iwms:iSubMenu>
							</ItemTemplate>
						</asp:TemplateColumn>--%>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:Label id="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
								
							</ItemTemplate>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="type" SortExpression="type" HeaderText="Type">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="code" SortExpression="code" HeaderText="Code">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="label" SortExpression="label" HeaderText="Label">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
				</asp:datagrid></div>
		</form>
	</body>
</html>
