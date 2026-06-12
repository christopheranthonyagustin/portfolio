<%@ Page Language="c#" CodeBehind="ControlImage.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Control.ControlImage" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>LicenseImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .DropZone1 {
            width: 200px;
            height: 90px;
            background-color: #F2F2F2;
            color: #767676;
            text-align: center;
            font-size: 16px;
            color: black;
            left: 5px;
            position: relative;
            border: 2px solid LIGHTSTEELBLUE;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server" defaultbutton="ImageSubmit">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <%--   <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td colspan="2">
                    <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="0" DataKeyField="id" BorderColor="#999999"
                        BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical" BorderWidth="1px" RepeatDirection="Horizontal">
                        <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                        <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                        <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="ImageLbl" runat="server"></asp:Label></td>
                                </tr>
                                <tr>

                                    <td>
                                        <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="LicenseImageDelete">
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
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="FileUploadPanel" runat="server">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%">
                            <tr>
                                <td style="height: 24px" width="20%">Image Name</td>
                                <td style="height: 24px">
                                    <telerik:RadTextBox runat="server" ID="ImageName" Width="200px" EmptyMessage="Enter Imagename" />
                                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>File</td>
                                <td>
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic"
                                        DropZones=".DropZone1,#DropZone2" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                      <asp:Button ID="ImageSubmit" runat="server" Text="Upload" OnClick="ImageSubmit_ServerClick"  
                           OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" class="white"  />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>--%>
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td><br />
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
                                     <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="LicenseImageDelete">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image" runat="server">
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                    </asp:DataList>
                    <br>
                    &nbsp;
                <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><br>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="FileUploadPanel" runat="server">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%">
                            <tr>
                                <td colspan="2">
                                    <iwms:iform id="formCtl" runat="server"></iwms:iform>
                                </td>
                                <td valign="top">&nbsp;
                                </td>
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                        HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                                        <Localization Select="Select" />
                                    </telerik:RadAsyncUpload>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    &nbsp;
                                    <asp:Button ID="ImageSubmit" runat="server" Text=" Upload  " OnClick="ImageSubmit_ServerClick"
                                        CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td>
                    <div class="DropZone1">
                        <p>
                            Drop Files Here
                        </p>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
