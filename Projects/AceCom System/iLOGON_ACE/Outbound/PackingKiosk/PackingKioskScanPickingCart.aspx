<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingKioskScanPickingCart.aspx.cs" Inherits="iWMS.Web.Outbound.PackingKiosk.PackingKioskScanPickingCart" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Scan Picking Cart @ Pack Tote Station</title>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DashboardTab" Text="Dashboard" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Site" Font-Size="Medium"></asp:Label>
                            <br />
                            <telerik:RadDropDownList runat="server" ID="SiteDDL" OnLoad="SiteDDL_Load" DataTextField="Descr" DataValueField="Code"
                                Skin="WebBlue" Width="155">
                            </telerik:RadDropDownList>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Label Text="Order qualifier" Font-Size="Medium" runat="server"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="OrderQualifierTxtBox" runat="server" Skin="Sunset" Width="170" Height="40" CausesValidation="false" BackColor="#ded7c6" Font-Size="Large" UseSubmitBehavior="false" AutoPostBack="true"></telerik:RadTextBox>
                        </td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="SearchBtn" CssClass="white" runat="server" Text="Search"
                                OnClick="SearchBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <table style="width: 100%">
                    <tr>
                        <td class="style1">&nbsp;
                        <asp:Label Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                            <br /><br />
                            &nbsp;<asp:Label Text="1. To start the packing operation,you can enter any of the following information." Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label Text="a. Issue No" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label Text="b. Order No" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label Text="c. Tote Bin No" Font-Size="15px" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PackToteStationScanPickingCartDashboardRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
