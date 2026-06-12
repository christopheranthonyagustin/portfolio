<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingStationScanPack.aspx.cs" Inherits="iWMS.Web.Outbound.PackingStation.PackingStationScanPack" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Scan Pack @ Packing Station</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Dashboard.css" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Id="ScanPackTab" Text="Scan Pack" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="98%" ID="ScanPackRadPageView">
                <table style="margin-left: 10px">
                    <tr>
                        <td>
                            <asp:Button ID="NewWaveBtn" runat="server" OnClick="NewWaveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false"
                                CssClass="white" Text="New Wave" />
                        </td>
                    </tr>
                </table>

                <asp:Panel runat="server">
                </asp:Panel>
                <asp:Panel ID="WavePanel" runat="server" CssClass="Panel">
                    <asp:TextBox ID="WPNTxtBox" runat="server" OnTextChanged="WPNTxtBox_TextChanged" CssClass="Tile TxtBoxText" BackColor="Yellow" AutoPostBack="true" CausesValidation="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="WPNTxtBoxReqVal" runat="server" ControlToValidate="WPNTxtBox" ForeColor="Red" ErrorMessage="*" Font-Size="XX-Large" Enabled="true"></asp:RequiredFieldValidator>
                    <div id="ParentWaveDiv" runat="server" class="ParentTile" style="width: 78%">
                    </div>
                </asp:Panel>
                <br />
                <asp:Panel ID="SKUPanel" runat="server" Visible="false" CssClass="Panel">
                    <asp:TextBox ID="SKUTxtBox" runat="server" OnTextChanged="SKUTxtBox_TextChanged" BackColor="Yellow" AutoPostBack="true" CausesValidation="false" CssClass="Tile TxtBoxText"></asp:TextBox>
                    <div style="margin-top: 2.5%; padding-left: 20%">
                        <asp:Label runat="server" ID="SKUDescrLbl" Font-Bold="true" Font-Size="X-Large" Visible="false"></asp:Label>
                    </div>
                </asp:Panel>
                <br />
                <asp:Panel ID="DeliveryTrackingIdPanel" runat="server" Visible="false" CssClass="Panel">
                    <asp:Label runat="server" ID="DeliveryTrackingLbl" Font-Bold="true" Font-Size="X-Large" Style="margin-left: 1%"></asp:Label>
                    <br />
                    <div id="ParentBoxSizeDiv" runat="server" class="ParentTile" style="width: 80%">
                    </div>
                </asp:Panel>
                <br />
                <asp:Panel ID="SKUSummaryPanel" runat="server" Visible="false" CssClass="Panel">
                    <div id="ParentSKUSummaryDiv" runat="server" class="ParentTile" style="width: 100%">
                    </div>
                </asp:Panel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
