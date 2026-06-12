<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundFreightReceiveImage.aspx.cs" Inherits="iWMS.Web.Inbound.InboundFreightReceive.InboundFreightReceiveImage" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InboundFreightReceiveImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Pragma" content="no-cache">
    <style type="text/css">
        .style1 {
            height: 5px;
        }

        .DropZone1 {
            width: 200px;
            height: 90px;
            background-color: #F2F2F2;
            border-color: #CCCCCC;
            color: #767676;
            text-align: center;
            font-size: 16px;
            color: black;
            left: 5px;
            position: relative;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="10" cellpadding="10" border="0">
            <tr>
                <td style="display: inline-block; float: left;">
                    <asp:Panel ID="FileUploadPanel" runat="server">
                        <table border="0" cellspacing="2" cellpadding="2">
                            <tr>
                                <td>
                                    <asp:Label ID="ImgTxtLbl" runat="server">Image Name</asp:Label>
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="ImageName" Width="200px" EmptyMessage="Enter Imagename" />
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                        HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2" MultipleFileSelection="Automatic">
                                        <Localization Select="Select a File" />
                                    </telerik:RadAsyncUpload>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click" Text="Upload" UseSubmitBehavior="false" Style="margin-left: 5px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <div class="DropZone1">
                        <p>
                            Drop Files Here
                        </p>
                    </div>
                </td>
                <td>
                    <div style="display: inline-block; height: 90vh; float: right; position: relative; margin-left: 28px;">
                        <asp:Button ID="DownloadAllBtn" CssClass="white" runat="server" OnClick="DownloadAllBtn_Click" Text="Download All Files" UseSubmitBehavior="false" Style="margin-top: 5px; margin-bottom: 8px" />
                        <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="3" DataKeyField="id"
                            BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                            BorderWidth="1px" RepeatDirection="Vertical" OnItemDataBound="ImageDataList_ItemDataBound">
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
                                        <td style="max-width: 300px; word-wrap: break-word">
                                            <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
                                            <br />
                                            <asp:Label ID="ImageTypeSizeLbl" runat="server"></asp:Label>
                                        </td>
                                        <td align="right">
                                            <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                OnClick="lnkDelete_Click" OnClientClick="return confirm('Confirm to delete ?');">
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
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
