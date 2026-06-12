<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerAccountDetl.aspx.cs" Inherits="iWMS.Web.Master.CustomerAccount.CustomerAccountDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>CustomerAccountDetl</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Instruction" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Site" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Route" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Division" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Entity" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Control" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Contact" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Vessel" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Personnel" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Accounting" Value="550" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Text="Consignee" Value="650" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="450" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <br />
                    &nbsp;
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView" Height="700px">
                <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
                    <tr>
                        <td>
                            <br />
                        <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="StandingOrderRadPageView">
                <br />
                &nbsp;&nbsp;
            <asp:Button ID="UpdateBtn2" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <br />
                &nbsp;
            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                <br />
                &nbsp;&nbsp;
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="SiteRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="RouteRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="DivisionRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="EntityRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ControlRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="360px" ID="ContactRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="VesselRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="PersonnelRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AccountAccountingRadPageView">
                <br />
                &nbsp;&nbsp;
            <asp:Button ID="UpdateBtn3" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <br />
                &nbsp;
            <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                <br />
                &nbsp;&nbsp;
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ConsigneeRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
