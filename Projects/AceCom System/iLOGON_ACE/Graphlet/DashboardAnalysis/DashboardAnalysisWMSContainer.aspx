<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAnalysisWMSContainer.aspx.cs" Inherits="iWMS.Web.Graphlet.DashboardAnalysis.DashboardAnalysisWMSContainer" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WMSContainer @ Dashboard Analysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../css/Dashboard.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" CssClass="paddingBottom" Width="100%" Skin="Office2007">
            <Items>
                <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                    Style="text-align: center; font-size: 15px; font-weight: bold;">
                    <Items>
                        <telerik:RadPanelItem runat="server" Value="Panel">
                            <ItemTemplate>
                                <div style="margin-left: 8px; margin-right: 8px; margin-bottom: 8px">
                                    <table border="0" cellpadding="0" cellspacing="2" id="table1" runat="server" height="100%">
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:Button ID="PrevBtn" runat="server" CssClass="white" OnClick="PrevBtn_Click" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="FormatLbl" runat="server" Text="Format" /><br />
                                                <telerik:RadComboBox ID="FormatCombo" runat="server" Width="155px" AutoPostBack="true"
                                                    RenderMode="Lightweight" Filter="Contains" CausesValidation="false" Skin="WebBlue"
                                                    AllowCustomText="false" DropDownWidth="155px" OnSelectedIndexChanged="FormatCombo_SelectedIndexChanged">
                                                </telerik:RadComboBox>
                                            </td>
                                            <td>
                                                <br />
                                                &nbsp;
                                                <asp:Button ID="NextBtn" runat="server" CssClass="white" OnClick="NextBtn_Click" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            </td>
                                            <td style="padding-left: 15px"></td>
                                            <td>
                                                <asp:Label ID="RefreshLbl" runat="server" Text="RefreshEvery" /><br />
                                                <telerik:RadDropDownList ID="RefreshDDL" runat="server" DropDownHeight="100px" Width="150px"
                                                    Skin="WebBlue" DropDownWidth="150px" AutoPostBack="true" OnSelectedIndexChanged="RefreshDDL_SelectedIndexChanged">
                                                </telerik:RadDropDownList>
                                                <asp:Timer ID="RefreshTimer" runat="server" OnTick="RefreshTimer_Tick"></asp:Timer>
                                            </td>
                                            <td style="padding-left: 15px"></td>
                                            <td>
                                                <asp:Label ID="AutoRefreshLbl" runat="server" Text="AutoRefresh" /><br />
                                                <input type="checkbox" runat="server" id="RefreshChkBox" checked="checked" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>
        <br />
        <asp:Panel ID="Panel_13" runat="server" Visible="false">
            <table style="width: 100%; display: block;">
                <tr>
                    <td>
                        <div id="DetentionIn24HoursDiv" class="ReadyToExport" onclick="OpenRadWindow('DetentionIn24Hours')">
                            Detention in 24 Hours
                        <br />
                            <asp:Label ID="DetentionIn24HrsLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                            <asp:Label ID="DetentionIn24HrsLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </td>
                    <td>
                        <br />
                        <div id="DetentionIn48HoursDiv" class="ReadyToCollect" onclick="OpenRadWindow('DetentionIn48Hours')">
                            Detention in 48 Hours
                        <br />
                            <asp:Label ID="DetentionIn48HrsLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                            <asp:Label ID="DetentionIn48HrsLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true" Modal="true" Width="800px" Height="630px" Left="170px" Top="15px" Behaviors="Move, Close" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="false"></telerik:RadWindowManager>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
    <script type="text/javascript">
        function OpenRadWindow(DivId) {
            var Value = DivId;
            if (Value == "DetentionIn24Hours") {
                window.radopen("../DashboardAnalysis/DashboardAnalysisWMSContainerDetail.aspx?Format=" + Value);
            }
            else if (Value == "DetentionIn48Hours") {
                window.radopen("../DashboardAnalysis/DashboardAnalysisWMSContainerDetail.aspx?Format=" + Value);
            }
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</body>
</html>
