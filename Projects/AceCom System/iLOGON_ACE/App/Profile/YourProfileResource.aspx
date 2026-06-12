<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YourProfileResource.aspx.cs" Inherits="iWMS.Web.App.Profile.YourProfileResource" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Your Profile</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <table width="100%">
            <tr>
                <td>
                    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
                        RenderMode="Lightweight" AutoPostBack="true" SelectedIndex="0" CausesValidation="false"
                        Skin="Windows7">
                        <Tabs>
                            <telerik:RadTab Text="Personnnel Information" Value="0" runat="server" PageViewID="PersonnelInformationRadPageView">
                            </telerik:RadTab>
                            <telerik:RadTab Text="Onboarding Kit" Value="100" runat="server" PageViewID="OnboardingKitRadPageView">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
                        RenderSelectedPageOnly="true">
                        <telerik:RadPageView runat="server" Height="850px" ID="PersonnelInformationRadPageView">
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="UpdateBtn" CssClass="white" runat="server" CausesValidation="false" OnClick="UpdateBtn_Click" UseSubmitBehavior="false" Text="Update" />
                                    </td>
                                </tr>
                            </table>
                            <br />

                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <br />

                            <table cellspacing="0" cellpadding="0" width="25%" border="0">
                                <tr>
                                    <td style="padding-top: 10px;">
                                        <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                                            BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                                            BorderWidth="1px" RepeatDirection="Horizontal" OnItemDataBound="ImageDataList_ItemDataBound">
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
                                                            <asp:ImageButton runat="server" Visible="True" ID="lnkDelete" ImageUrl="../../image/bin.gif" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" border="0" alt="Delete Image" OnClick="ImageDelete" CausesValidation="False"></asp:ImageButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                                        </asp:DataList><br>
                                        <asp:Label ID="NoImageLbl" runat="server" Visible="false" CssClass="errorLabelBig">No Image Available</asp:Label><br>
                                    </td>

                                    <td>
                                        <asp:Panel ID="FileUploadPanel" runat="server">
                                            <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                            <br />
                                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                                HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                                                <Localization Select="Add A Photo" />
                                            </telerik:RadAsyncUpload>
                                            <br />
                                            <br />
                                            &nbsp;&nbsp;
                                        <asp:Button ID="UploadBtn" runat="server" CausesValidation="false" Text="UPLOAD" UseSubmitBehavior="false"
                                            CssClass="white" OnClick="UploadBtn_Click" />
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                            <br />

                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="ConfirmYesBtn" Text="" Style="display: none;" OnClick="ConfirmYesBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>

                        <telerik:RadPageView runat="server" Height="850px" ID="OnboardingKitRadPageView" ContentUrl="~/App/Profile/OnboardingKitResource.aspx" />
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
    </form>

    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmYesBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmYesBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>

</body>
</html>
