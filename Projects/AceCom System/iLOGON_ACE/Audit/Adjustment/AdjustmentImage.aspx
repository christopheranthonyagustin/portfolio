<%@ Page language="c#" Codebehind="AdjustmentImage.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.Adjustment.AdjustmentImage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>AdjustmentImage</title>
		<META http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" encType="multipart/form-data" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td colSpan="2">
						<asp:label id="AdjustmentLbl" runat="server" cssclass="pagetitle" 
                            Visible="False">Adjustment #</asp:label>
						<asp:label id="AdjustmentIdLbl" runat="server" cssclass="pagetitle" Visible="False"></asp:label>
						<asp:label id="DetailDescrLbl" runat="server" cssclass="pagetitle" Visible="False">Image(s)</asp:label></td>
				</tr>
				<tr>
					<td colSpan="2"><asp:datalist id="ImageDataList" Runat="server" RepeatColumns="0" DataKeyField="id" BorderColor="#999999"
							BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical" BorderWidth="1px" RepeatDirection="Horizontal">
							<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
							<AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
							<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<ItemTemplate>
								<table>
									<tr>
										<td colspan="2">
											<asp:Label ID="ImageLbl" Runat="server"></asp:Label></td>
									</tr>
									<tr>
										<td>
											<asp:Label ID="ImageDescrLbl" Runat="server"></asp:Label>
										</td>
										<td align="right"><asp:LinkButton ID="lnkDelete" Runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="AdjustmentImageDelete">
										<img id="delImg" src="../../image/bin.gif" Width="15" Height="15" border="0" alt="Delete Image"	runat="server"></asp:LinkButton>
										</td>
									</tr>
								</table>
							</ItemTemplate>
							<FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
							<%--<SeparatorTemplate>
								|
							</SeparatorTemplate>--%>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
						</asp:datalist><BR>
						<asp:Label id="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><BR>
					</td>
				</tr>
				<tr>
					<td colSpan="2" style="padding-left:10px"><asp:panel id="FileUploadPanel" runat="server">
							<TABLE border="0" cellSpacing="2" cellPadding="2" width="100%">
								<TR>
									<TD width="20%">Image Name</TD>
									<TD><INPUT id="ImageName" name="ImageName" runat="server">&nbsp;
										<asp:RequiredFieldValidator id="ImagenameReqVal" runat="server" ErrorMessage="*" ControlToValidate="ImageName"></asp:RequiredFieldValidator>
										<asp:Label id="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label></TD>
								</TR>
								<TR>
									<TD>File</TD>
									<TD><INPUT id="ImageFile" type="file" name="ImageFile" runat="server">
										<asp:RequiredFieldValidator id="ImageFileReqVal" runat="server" ErrorMessage="*" ControlToValidate="ImageFile"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD><INPUT id="ImageSubmit" class="detailbutton" value="Upload" type="submit" runat="server" onserverclick="ImageSubmit_ServerClick">
									</TD>
								</TR>
							</TABLE>
						</asp:panel></td>
				</tr>
			</table>
		</form>
	</body>
</html>
