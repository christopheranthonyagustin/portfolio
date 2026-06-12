<%@ Page Language="c#" CodeBehind="FreightExportImage.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.FreightExport.FreightExportImage" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightExportImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <meta http-equiv="Pragma" content="no-cache">

    <script language="javascript" type="text/javascript">


        function ImageFile_onclick() {

        }


    </script>

    <style type="text/css">
        .style1 {
            height: 19px;
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

        .style2 {
            height: 28px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td colspan="2">
                    <asp:Label ID="JobIdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-top: 10px;">
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
                                                runat="server">
                                        </asp:LinkButton>
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
                    <asp:Panel ID="FileUploadPanel" runat="server" Style="padding-left: 10px;">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%">
                            <tr>
                                <td width="20%">Image Name
                            <br />
                                    <telerik:RadTextBox runat="server" ID="ImageName" Width="200px" EmptyMessage="Enter Imagename" />
                                    &nbsp;
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%--<asp:Label ID="file" runat="server" Text="File"></asp:Label>--%>
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
                                    &nbsp;&nbsp;
                          <%--      <telerik:RadButton ID="ImageSubmit" runat="server" OnClick="ImageSubmit_ServerClick"
                                    Text="  UPLOAD  " Skin="WebBlue" SingleClick="true" SingleClickText="Uploading...">
                                </telerik:RadButton>--%>
                                    <asp:Button ID="ImageSubmit" runat="server" Text="UPLOAD" OnClick="ImageSubmit_ServerClick"
                                        OnClientClick="disableBtn(this.id,false)" CssClass="white" UseSubmitBehavior="false" />
                                    <%--    <input id="ImageSubmit" class="detailbutton" value="Upload" type="submit" runat="server"
                                    onserverclick="ImageSubmit_ServerClick" onclick="return ImageSubmit_onclick()">--%>
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
                <div class="DropZone1" style="margin-left: 15px; margin-top: 5px;">
                    <p>
                        Drop Files Here
                    </p>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
