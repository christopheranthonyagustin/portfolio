<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRQForm.aspx.cs" Inherits="iWMS.Web.Management.ChangeRequestQuotation.CRQForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Change Request Search</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        &nbsp;<asp:Label ID="HeaderLbl" runat="server" CssClass="pagetitle"></asp:Label>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="600px" ID="MainInfoRadPageView">
                <br />
                <table>
                    <tr>
                        <td>&nbsp;
                            <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <td style="position: relative;">
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                        <iWMS:iForm ID="formCtl_RemarksAndTerms" runat="server"></iWMS:iForm>
                                        <iWMS:iForm ID="formCtl_AddAndEditDate" runat="server"></iWMS:iForm>
                                    </td>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView ID="AttcRadPageView" runat="server" Height="590px">
            </telerik:RadPageView>
            <telerik:RadPageView ID="LogRadPageView" runat="server" Height="590px">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

