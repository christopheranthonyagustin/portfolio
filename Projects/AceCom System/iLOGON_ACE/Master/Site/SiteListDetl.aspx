<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="SiteListDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Site.SiteListDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head runat="server">
    <title>SiteListDetl</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <telerik:RadScriptBlock runat="server">
        <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    </telerik:RadScriptBlock>
    
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0"
            Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server"
                    Selected="True">
                </telerik:RadTab>
                <telerik:RadTab ID="SeriesTab" Text="Series" Value="50" readonly="readonly" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Text="Notify" Value="100" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="150" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <br />
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView" Height="700px">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                                Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" ToolTip="Update" />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="MainUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="SeriesRadPageView" Height="700px">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="UpdateBtn2" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                                Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                            &nbsp;
                            <asp:Button ID="ReserveLotBtn" CssClass="white" runat="server" Text="ReserveLot" Visible="true"
                                OnClick="ReserveLotBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="NotifyRadPageView" Height="700px">
                <br />
                <asp:Button ID="UpdateBtn5" class="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                    Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="LogRadPageView" Height="700px">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
