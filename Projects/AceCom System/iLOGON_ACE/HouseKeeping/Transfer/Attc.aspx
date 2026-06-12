<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attc.aspx.cs" Inherits="iWMS.Web.HouseKeeping.Transfer.Attc" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>TransferImage</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>

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
<body>
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td style="display: inline-block; float: left;">
                                <table>
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
                                                HideFileInput="true" Skin="WebBlue" DropZones=".DropZone1,#DropZone2" MultipleFileSelection="Automatic">
                                                <Localization Select="Select a File" />
                                            </telerik:RadAsyncUpload>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>&nbsp;
                                            <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="ImageSubmit_ServerClick" Text="Upload" UseSubmitBehavior="false" Style="margin-left: 5px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <div style="margin-top: -100px; padding-right: 500px;">
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
                                        <td style="max-width: 300px; word-wrap: break-word">
                                            <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
                                        </td>
                                        <td align="right">
                                            <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                OnClick="TransferImageDelete" OnClientClick="return confirm('Confirm to delete ?');">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                                    runat="server" />
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
