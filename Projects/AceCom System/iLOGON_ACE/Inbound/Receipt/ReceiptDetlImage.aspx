<%@ Page Language="c#" CodeBehind="ReceiptDetlImage.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.Receipt.ReceiptDetlImage" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReceiptDetlImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Pragma" content="no-cache">
    <style type="text/css">
        .style1
        {
            height: 5px;
        }
        .DropZone1
        {
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
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td colspan="2" class="pagetitle"> 
                <br />
                <asp:Label ID="TitleLbl" runat="server"></asp:Label>
            </td>
        </tr>
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
                                        OnClick="ReceiptImageDelete">
                                        <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                            runat="server"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                </asp:DataList><br>
                <br>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="FileUploadPanel" runat="server">
                    <table border="0" cellspacing="2" cellpadding="2" width="100%">
                        <tr>
                            <td colspan="2">
                                <iwms:iForm ID="formCtl" runat="server"></iwms:iForm>
                            </td>
                            <td valign="top">&nbsp;
                            </td>
                            <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                                <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                    HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                                    <Localization Select="Select a File" />
                                </telerik:RadAsyncUpload>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                                &nbsp;
                                <telerik:RadButton ID="UploadBtn" runat="server" OnClick="ImageSubmit_ServerClick"
                                    Text="UPLOAD" Skin="WebBlue">
                                </telerik:RadButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    </form>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td colspan="2">
                <div class="DropZone1">
                    <p>
                        Drop Files Here</p>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
