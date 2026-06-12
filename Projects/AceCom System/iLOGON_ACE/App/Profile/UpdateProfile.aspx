<%@ Page Language="c#" CodeBehind="UpdateProfile.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.App.Profile.UpdateProfile" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>UpdateProfile</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style type="text/css">
        #ImagePanel {
            display: inline;
        }

        #BtnPanel {
            display: inline;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <table cellspacing="0" cellpadding="0" width="100%" align="center" bgcolor="#cccccc" border="0">
            <tr>
                <td bgcolor="#ffffff"></td>
                <td>
                    <table cellspacing="1" cellpadding="2" width="100%" border="0">
                        <tr bgcolor="#ffffff">
                            <td class="subtabletitle" bgcolor="#eeeeee" colspan="2">&nbsp;
									<asp:Label ID="UpdatePwdLbl" runat="server">Update Profile</asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td width="30%">&nbsp;
									<asp:Label ID="EmailLbl" runat="server">Email</asp:Label></td>
                            <td width="70%">:&nbsp;
									<asp:TextBox ID="EmailTxt" runat="server" Width="350px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PwdVal" runat="server" ControlToValidate="EmailTxt" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr valign="top" bgcolor="#ffffff">
                            <td>&nbsp;
									<asp:Label ID="UILanguageLbl" runat="server">UI Language</asp:Label></td>
                            <td valign="top">:&nbsp;
									<asp:DropDownList ID="LanguageList" runat="server"></asp:DropDownList></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td>&nbsp;</td>
                            <td>&nbsp;
									<asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="formbtn" OnClick="UpdateBtn_Click"></asp:Button>&nbsp;<input type="reset" value="Reset" runat="server" id="Reset1" name="Reset1" class="formbtn"></td>
                        </tr>
                    </table>

                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td width="400px">Linked to Personnel</td>
                <td>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>

        <table cellspacing="0" cellpadding="0" width="15%" border="0">
            <tr>
                <td  style="padding-top: 10px;">
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
                                    </td>
                                    <td align="right">
                                        <%--<a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="ImageDelete" runat="server">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image" runat="server" /></a>--%>
                                         <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="ImageDelete">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image" runat="server">
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                    </asp:DataList><br>
                    <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><br>
                </td>

                <td>
                    <asp:Panel ID="FileUploadPanel" runat="server">
                        <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        <br />
                        <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                            HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                            <Localization Select="Add A Photo" />
                        </telerik:RadAsyncUpload>
                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                        <br />
                        <br />
                        &nbsp;&nbsp;
                                    <asp:Button ID="UploadBtn" runat="server" CausesValidation="false" Text="UPLOAD" UseSubmitBehavior="false"
                                        CssClass="white" OnClick="UploadBtn_Click" />
                    </asp:Panel>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmYesBtn" Text="" Style="display: none;" OnClick="ConfirmYesBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>

    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmYesBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmYesBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>

</body>
</html>
