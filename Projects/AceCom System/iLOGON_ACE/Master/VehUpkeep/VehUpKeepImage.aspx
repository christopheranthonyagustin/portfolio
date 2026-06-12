<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehUpKeepImage.aspx.cs" Inherits="iWMS.Web.Master.VehUpkeep.VehUpKeepImage" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VehUpKeepImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Pragma" content="no-cache">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .style1 {
            height: 19px;
        }

        .DropZone1 {
            width: 400px;
            height: 120px;
            background-color: #F2F2F2;
            border-color: #CCCCCC;
            color: #767676;
            text-align: center;
            font-size: 16px;
            color: black;
            position: relative;
            margin-left: 15px;
            margin-top: 20px;
        }
    </style>

    <script language="javascript" type="text/javascript">
        // <!CDATA[

        function ImageSubmit_onclick() {

        }

        // ]]>
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td>
                    <br />
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
                                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                            OnClick="VehUpKeepImageDelete">
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
                <td>
                    <asp:Panel ID="FileUploadPanel" runat="server">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%" style="margin-left: 13px">
                            <tr>
                                <td width="15%" style="font-size: 13px">Image Name</td>
                                <td>
                                    <telerik:RadTextBox runat="server" ID="ImageName" Width="200px" EmptyMessage="Enter Imagename" Style="margin-top: 13px" />
                                    <br />
                                    <br />
                                    <%-- <i
                               nput id="ImageName" name="ImageName" runat="server">&nbsp;  --%>
                                    <%--<asp:RequiredFieldValidator ID="ImagenameReqVal" runat="server" ControlToValidate="ImageName"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>

                                <td width="15%" style="font-size: 13px">Type</td>
                                <td>
                                    <telerik:RadDropDownList ID="Type" runat="server" Style="margin-top: 13px"></telerik:RadDropDownList>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size: 13px">File</td>
                                <td>
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic" Style="margin-top: 13px"
                                        DropZones=".DropZone1,#DropZone2" />

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="ImageSubmit" class="white" runat="server" OnClick="ImageSubmit_ServerClick" Text="Upload" Style="margin-top: 25px; margin-left:105%"
                                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />

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
                        Drop Files Here
                    </p>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
