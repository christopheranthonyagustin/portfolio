<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationVImage.aspx.cs"
    Inherits="iWMS.Web.Sales.Quotation_V.QuotationVImage" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VendorQuotationImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Pragma" content="no-cache">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .style1 {
            width: 294px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td>
                    <br />
                    &nbsp;
                  <%--  <telerik:RadButton ID="ImageSubmit" Style="z-index: 0" runat="server" Visible="True" Skin="WebBlue" Text="Add"
                        OnClick="ImageSubmit_ServerClick" />--%>
                     <asp:Button ID="ImageSubmit" runat="server" Text="Add" CssClass="white"
                        OnClick="ImageSubmit_ServerClick" OnClientClick="disableBtn(this.id,true)" ToolTip="Add" UseSubmitBehavior="false"></asp:Button>
                    &nbsp;
                    &nbsp;
                     <asp:Button ID="BackButton" runat="server" Text="AllItems" CssClass="white"
                        OnClick="BackButton_Click" CausesValidation="false" ></asp:Button>
                    &nbsp;
                    <br>
                </td>
                <tr>
                    <td colspan="2">
                        <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                            BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                            BorderWidth="1px" RepeatDirection="Horizontal">
                            <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                            <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                            <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="ImageLbl" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
                                            <br />
                                            <asp:Label ID="ImageTypeSizeLbl" runat="server"></asp:Label>
                                        </td>
                                        <td align="right">
                                            <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                OnClick="VQuotationImageDelete">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                                    runat="server">
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                            <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                        </asp:DataList>
                        <br>
                        <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><br>
                    </td>
                </tr>
            <tr>
                <td colspan="2">
                    <%--<td colSpan="2"><asp:panel id="FileUploadPanel" runat="server">
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
						</asp:panel></td>--%>
                    <asp:Panel ID="FileUploadPanel" runat="server">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%">
                            <tr>
                                <td class="style1">Type<br />
                                    <telerik:RadDropDownList ID="Type" runat="server" Enabled="True" DataTextField="Descr" DataValueField="item"
                                        Width="138px">
                                    </telerik:RadDropDownList>
                                    <asp:RequiredFieldValidator ID="TypeReq" runat="server" ControlToValidate="Type"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>

                                </td>
                                <td>Status<br />
                                    <telerik:RadDropDownList ID="ImageStatus" runat="server" Enabled="true" DataTextField="Descr" DataValueField="item" Width="138px"></telerik:RadDropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td class="style1">AttachmentName<br />
                                    <telerik:RadTextBox ID="ImageName" runat="server"></telerik:RadTextBox>
                                    &nbsp;
                                <%--<asp:RequiredFieldValidator ID="ImagenameReqVal" runat="server" 
                                                ControlToValidate="ImageName" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                    <telerik:RadLabel ID="MessageLbl" runat="server" CssClass="errorLabel"></telerik:RadLabel>


                                </td>
                                <td>
                                    <telerik:RadLabel ID="FileLbl" runat="server" Text="File"></telerik:RadLabel>
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic" />

                                </td>
                            </tr>
                            <input id="ImageNameNA" runat="server" name="ImageName" visible="false" />

                        </table>
                    </asp:Panel>

                </td>
            </tr>
        </table>
    </form>
</body>
</html>
