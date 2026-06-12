<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrailerMonitorMain.aspx.cs" Inherits="iWMS.Web.Job.TrailerMonitor.TrailerMonitorMain" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TrailerMonitor</title>
     <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .BigCheckBox input {
            width: 30px;
            height: 20px;
            top: -1px;
            float: right;
            right: 1px;
        }

        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="TrailerSummaryTab" Text="TrailerSummary" Value="20" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ParkSummaryTab" Text="ParkSummary" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ParkOccupancyTab" Text="ParkOccupancy" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="TrailerMovementTab" Text="TrailerMovement" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="VehicleOffTab" Text="VehicleOff" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainRadPageView" Height="700px">
                <table border="0" cellpadding="2" cellspacing="2" runat="server" width="70%">
                    <tr>
                        <td>
                            <br />
                            <asp:Panel ID="NewTripPanel" runat="server" Width="100%">
                                <table width="100%">
                                    <tr>
                                        <td width="2%" align="left">
                                            <asp:Label ID="Label1" runat="server">TrailerType</asp:Label><br />
                                            <telerik:RadComboBox ID="TrailerTypeCBB" runat="server" Skin="Sunset" Enabled="True"
                                                DataValueField="Item" DataTextField="Descr">
                                            </telerik:RadComboBox>
                                        </td>
                                        <td width="20%" align="left">
                                            <br />
                                            <asp:CheckBox ID="Undeploychk" ToolTip="SaveOnPan" runat="server" />
                                            <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="200px" Font-Size="Small" Text="Undeployed Only" ForeColor="Black" OnClientClick="disableBtn(this.id,true)"></asp:Label>

                                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <br />
               <%-- <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
                            EnableLinqExpressions="False" AllowPaging="false" EnableViewState="false"
                            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                            OnPreRender="ResultDG_PreRender" ExportSettings-UseItemStyles="true" Height="90%" AllowFilteringByColumn="true"
                            OnColumnCreated="ResultDG_ColumnCreated">

                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <SortingSettings EnableSkinSortStyles="false" />

                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                                <Selecting AllowRowSelect="true" />
                                <Scrolling AllowScroll="true" />
                            </ClientSettings>

                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="QueueGrid" DataKeyNames="JBCTNRId">
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false"
                                        HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="92%" ID="TrailerSummaryRadPageView" ContentUrl="TrailerMonitorTrailerSummary.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="92%" ID="ParkSummaryRadpageView" ContentUrl="TrailerMonitorParkSummary.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ParkOccupancyRadPageView" ContentUrl="TrailarMonitorParkOccupancy.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TrailerMovementRadPageView" ContentUrl="TrailarMonitorTrailerMovement.aspx"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="92%" ID="VehicleOffRadPageView" ContentUrl="TrailerMonitorVehicleOff.aspx"></telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
