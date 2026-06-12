<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenImage.aspx.cs" Inherits="iWMS.Web.Master.GeneralAttached.GeneralAttached" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>SkuImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Pragma" content="no-cache">

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
            left: 228px;
            position: relative;
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td style="width: 50%;">
                    <br />
                    &nbsp;
                <telerik:RadButton ID="ImageSubmit" runat="server" OnClick="ImageSubmit_ServerClick" Text="Add"
                    Skin="WebBlue">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton Style="z-index: 0" ID="BackButton" runat="server" Visible="True" Text="All Item(s)"
                    CausesValidation="False" Skin="WebBlue" OnClick="BackButton_Click">
                </telerik:RadButton>

                    <br />
                </td>
            </tr>
            <tr>
                <td>
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
                                            OnClick="GenImageDelete">
                                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Image"
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
                        <table border="0" cellspacing="2" cellpadding="2" width="100%">
                            <tr>

                                <td width="20%">Type
                                </td>
                                <td>
                                    <telerik:RadDropDownList ID="Type" runat="server"></telerik:RadDropDownList>
                                    <br />
                                    <br />
                                </td>
                            </tr>

                            <tr>
                                <td width="20%">Image Name
                                </td>
                                <td>

                                    <telerik:RadTextBox runat="server" ID="ImageName" Width="200px" EmptyMessage="Enter Imagename" />
                                    <br />
                                    <br />
                                    <%-- <i
                               nput id="ImageName" name="ImageName" runat="server">&nbsp;  --%>
                                    <%--<asp:RequiredFieldValidator ID="ImagenameReqVal" runat="server" ControlToValidate="ImageName"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                    <%--<asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>--%>
                                    <telerik:RadLabel ID="MessageLbl" runat="server" CssClass="errorLabel"></telerik:RadLabel>
                                    <asp:CheckBox ID="ReAttachedChkBox" runat="server" Checked="False" Style="z-index: 0"
                                        Text="Re-Attach" AutoPostBack="true" OnCheckedChanged="ReAttachedChkBox_CheckedChanged"></asp:CheckBox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <telerik:RadLabel ID="FileLbl" runat="server" Text="File"></telerik:RadLabel>
                                </td>
                                <td>

                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic"
                                        DropZones=".DropZone1,#DropZone2" />

                                </td>
                            </tr>
                            <input id="ImageNameNA" runat="server" name="ImageName" visible="false" />
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
