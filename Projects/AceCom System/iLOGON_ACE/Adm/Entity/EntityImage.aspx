<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntityImage.aspx.cs" Inherits="iWMS.Web.Adm.Entity.EntityImage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="Head1" runat="server">
		<title>EntityImage</title>
		<META http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script src="../../js/Script.js" type="text/javascript"></script>
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<script language="javascript" type="text/javascript">
// <!CDATA[

function ImageSubmit_onclick() {

}
// ]]>
</script>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" encType="multipart/form-data" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td colSpan="2">
                        <br />
                        <asp:datalist id="ImageDataList" Runat="server" RepeatColumns="0" DataKeyField="id" BorderColor="#999999"
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
										<td align="right"><asp:LinkButton ID="lnkDelete" Runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="EntImageDelete">
										<img id="delImg" src="../../image/bin.gif" Width="15" Height="15" border="0" alt="Delete Image"	runat="server"></asp:LinkButton>
										</td>
									</tr>
								</table>
							</ItemTemplate>
							<FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
						</asp:datalist><BR>
						<asp:Label id="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><BR>
					</td>
				</tr>
				<tr>
					<td colSpan="2"><asp:panel id="FileUploadPanel" runat="server">
					
							<TABLE border="0" cellSpacing="2" cellPadding="2" width="100%">
								<TR>
									<TD style="HEIGHT: 24px; font-size: 13px" width="15%">Image Name</TD>
									<TD style="HEIGHT: 24px">
									 <telerik:RadTextBox runat="server" ID="ImageName" Width="200px" EmptyMessage="Enter Imagename"/>
									<%--<INPUT id="ImageName" name="ImageName" runat="server">&nbsp;
										<asp:RequiredFieldValidator id="ImagenameReqVal" runat="server" ErrorMessage="*" ControlToValidate="ImageName"></asp:RequiredFieldValidator>--%>
										<asp:Label id="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label></TD>
								</TR>
								<TR>
									<TD style="font-size:13px">File</TD>
									<TD>
									<telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic"
                                    DropZones=".DropZone1,#DropZone2" />
									<%--<INPUT id="ImageFile" type="file" name="ImageFile" runat="server">	<asp:RequiredFieldValidator id="ImageFileReqVal" runat="server" ErrorMessage="*" ControlToValidate="ImageFile"></asp:RequiredFieldValidator>--%>
										</TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>							
                                       <asp:Button ID="ImageSubmit" class="white" runat="server" OnClick="ImageSubmit_ServerClick" Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
									</TD>
								</TR>
							</TABLE>
						</asp:panel></td>
				</tr>
			</table>
		</form>
	</body>
</html>

