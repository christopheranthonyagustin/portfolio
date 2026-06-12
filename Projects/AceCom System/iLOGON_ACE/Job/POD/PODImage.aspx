<%@ Page Language="c#" CodeBehind="PODImage.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.POD.PODImage" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PODImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Pragma" content="no-cache">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td colspan="2">
                <asp:Label ID="JobIdLbl" runat="server" CssClass="pagetitle"></asp:Label>
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
                                            OnClick="JobImageDelete">
                                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                                runat="server"></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                        <%--<SeparatorTemplate>
								|
							</SeparatorTemplate>--%>
                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                    </asp:DataList><br>
                    <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><br>
                </td>
            </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="FileUploadPanel" runat="server">
                    <table border="0" cellspacing="2" cellpadding="2" width="100%">
                        <tr>
                            <td width="20%">
                                Image Name
                            </td>
                            <td>
                                <input id="ImageName" name="ImageName" runat="server">&nbsp;
                                <asp:RequiredFieldValidator ID="ImagenameReqVal" runat="server" ControlToValidate="ImageName"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                File
                            </td>
                            <td>
                                <input id="ImageFile" type="file" name="ImageFile" runat="server">
                                <asp:RequiredFieldValidator ID="ImageFileReqVal" runat="server" ControlToValidate="ImageFile"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input id="ImageSubmit" class="detailbutton" value="Upload" type="submit" runat="server"
                                    onserverclick="ImageSubmit_ServerClick">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
