<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTransportPlanningAttc.aspx.cs" Inherits="iWMS.Web.Job.DailyTransportPlanning.DailyTransportPlanningAttc" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyTransportPlanning Attc</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="PickupTab" Text="Pickup" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DeliveryTab" Text="Delivery" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="OthersTab" Text="Others" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="PickupRadPageView" Height="700px">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top: 10px;">
                            <asp:DataList ID="PickUpImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                                BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                                BorderWidth="1px" RepeatDirection="Horizontal">
                                <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                                <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                                <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="PickUpImageLbl" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="PickUpImageDescrLbl" runat="server"></asp:Label>
                                                <br />
                                                <asp:Label ID="PickUpImageTypeSizeLbl" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="PickUpFileUploadPanel" runat="server" Style="padding-left: 10px;">
                                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                    <tr>
                                        <td>
                                            <br />
                                            <telerik:RadAsyncUpload runat="server" ID="PickUpRadAsyncUpload" RenderMode="Lightweight"
                                                HideFileInput="true" Skin="Outlook">
                                                <Localization Select="Select" />
                                            </telerik:RadAsyncUpload>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <iwms:iform ID="PickUpFormCtrl" runat="server"></iwms:iform>
                                        </td>
                                        <td valign="top"></td>
                                        <asp:Label ID="PickUpMessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            &nbsp;                               
                                            <asp:Button ID="PickUpUploadBtn" runat="server" OnClick="PickUpUploadBtn_Click" Text="Upload"
                                                CssClass="blue" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="DeliveryRadPageView" Height="700px">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top: 10px;">
                            <asp:DataList ID="DeliveryImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                                BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                                BorderWidth="1px" RepeatDirection="Horizontal">
                                <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                                <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                                <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="DeliveryImageLbl" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="DeliveryImageDescrLbl" runat="server"></asp:Label>
                                                <br />
                                                <asp:Label ID="DeliveryImageTypeSizeLbl" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="DeliveryFileUploadPanel" runat="server" Style="padding-left: 10px;">
                                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                    <tr>
                                        <td>
                                            <br />
                                            <telerik:RadAsyncUpload runat="server" ID="DeliveryRadAsyncUpload" RenderMode="Lightweight"
                                                HideFileInput="true" Skin="Outlook">
                                                <Localization Select="Select" />
                                            </telerik:RadAsyncUpload>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <iwms:iform ID="DeliveryFormCtrl" runat="server"></iwms:iform>
                                        </td>
                                        <td valign="top"></td>
                                        <asp:Label ID="DeliveryMessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            &nbsp;                               
                                            <asp:Button ID="DeliveryUploadBtn" runat="server" OnClick="DeliveryUploadBtn_Click" Text="Upload"
                                                CssClass="blue" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="OthersRadPageView" Height="700px">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top: 10px;">
                            <asp:DataList ID="OthersImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                                BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                                BorderWidth="1px" RepeatDirection="Horizontal">
                                <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                                <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                                <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="OthersImageLbl" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="OthersImageDescrLbl" runat="server"></asp:Label>
                                                <br />
                                                <asp:Label ID="OthersImageTypeSizeLbl" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="OthersFileUploadPanel" runat="server" Style="padding-left: 10px;">
                                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                    <tr>
                                        <td>
                                            <br />
                                            <telerik:RadAsyncUpload runat="server" ID="OthersRadAsyncUpload" RenderMode="Lightweight"
                                                HideFileInput="true" Skin="Outlook">
                                                <Localization Select="Select" />
                                            </telerik:RadAsyncUpload>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <iwms:iform ID="OthersFormCtrl" runat="server"></iwms:iform>
                                        </td>
                                        <td valign="top"></td>
                                        <asp:Label ID="OthersMessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            &nbsp;                               
                                            <asp:Button ID="OthersUploadBtn" runat="server" OnClick="OthersUploadBtn_Click" Text="Upload"
                                                CssClass="blue" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
