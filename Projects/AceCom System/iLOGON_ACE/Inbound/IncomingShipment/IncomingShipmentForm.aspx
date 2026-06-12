<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncomingShipmentForm.aspx.cs" Inherits="iWMS.Web.Inbound.IncomingShipment.IncomingShipmentForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Form @ IncomingShipment </title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .DropZone1 {
            width: 200px;
            height: 100px;
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
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <asp:Label ID="FormLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click"
                                Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server" ID="FormCtlUpdatePanel">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td>
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>
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
                                                <asp:LinkButton ID="RCImageDeleteBtn" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                    OnClick="RCImageDeleteBtn_Click" OnClientClick="return confirm('Confirm to delete ?');">
                                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image"
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
                            <asp:Panel ID="Panel1" runat="server">
                                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <iWMS:iForm ID="formCtlRCImage" runat="server"></iWMS:iForm>
                                        </td>
                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload" RenderMode="Lightweight"
                                                HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                                                <Localization Select="Select a File" />
                                            </telerik:RadAsyncUpload>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;
                                            <asp:Button ID="UploadBtn" CssClass="blue" runat="server" Text="Upload" UseSubmitBehavior="false" OnClick="UploadBtn_Click" OnClientClick="disableBtn(this.id)" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
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
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
