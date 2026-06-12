<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSApproveInvoiceAttc.aspx.cs" Inherits="iWMS.Web.Job.TMSApproveInvoice.TMSApproveInvoiceAttc" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Attc @ TMS Approve Invoice</title>
    <meta content="C#" name="CODE_LANGUAGE">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style type="text/css">
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
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td colspan="2" style="height: 5px;"></td>
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
                                        <asp:LinkButton ID="DeleteLnkBtn" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                            OnClick="DeleteLnkBtn_Click" OnClientClick="return confirm('Confirm to delete ?');">
                                            <img id="DeleteImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                                runat="server">
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                    </asp:DataList><br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="FileUploadPanel" runat="server" Visible="false">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%">
                            <tr>
                                <td>
                                    <asp:Label ID="ImageNameLbl" runat="server">Image Name</asp:Label>
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="ImageNameTxtBox" Width="200px" EmptyMessage="Enter Imagename" />
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                        HideFileInput="true" Skin="Outlook"  DropZones=".DropZone1">
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
                                <asp:Button ID="UploadBtn" CssClass="blue" runat="server" OnClick="UploadBtn_Click" Text="UPLOAD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
    <asp:Panel ID="DropZonePanel" runat="server" Visible="false">
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
    </asp:Panel>
</body>
</html>
