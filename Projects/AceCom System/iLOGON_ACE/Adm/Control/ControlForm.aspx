<%@ Page Language="c#" CodeBehind="ControlForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Control.ControlForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>LicenseForm</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Windows7" AutoPostBack="True" CausesValidation="False">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Control" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NameLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView" Height="700px">
                <br />
                &nbsp;
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" class="white" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="ControlRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="LogRadPageView" Height="700px">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
