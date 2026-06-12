<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMSeaConsoleRegisterJob.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsoleRegister.FMSeaConsoleRegisterJob" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMSeaConsoleRegisterJob</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="false" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Id="ListTab" Text="List" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="FormTab"  Text="Form" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="100px" ID="RidesPageView">
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="5px" Width="100%" ID="HeaderRadPageView">
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" >
                                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <HeaderTemplate>
                                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
<%--                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" OnClick="ldEdit_Click"
                                                         BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>--%>
                                            <telerik:GridBoundColumn DataField="Number" UniqueName="Number" HeaderText="Consol No" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ShipmentNo" UniqueName="ShipmentNo" SortExpression="ShipmentNo" HeaderText="Shipment Number">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Type" UniqueName="Type" ShowFilterIcon="true" AllowFiltering="true" HeaderText="Type" >
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="TransportMode" UniqueName="TransportMode" ShowFilterIcon="true" AllowFiltering="true" HeaderText="Freight Mode">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CtnrMode" UniqueName="CtnrMode" ShowFilterIcon="true" AllowFiltering="true" HeaderText="Ctnr Mode">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ConsignorName" UniqueName="ConsignorName" HeaderText="Consignor" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ConsigneeName" UniqueName="ConsigneeName" HeaderText="Consignee" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="LocalClientName" UniqueName="LocalClientName" HeaderText="Local Client" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="HouseBill" UniqueName="HouseBill" HeaderText="House Bill" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="POL" UniqueName="POL" HeaderText="LoadPort" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="POD" UniqueName="POD" HeaderText="DischargePort" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="LoadPort" UniqueName="LoadPort" HeaderText="Load Port" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DischargePort" UniqueName="DischargePort" HeaderText="Discharge Port" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD" HeaderText="ETD" AllowFiltering="false"
                                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA" HeaderText="ETA" AllowFiltering="false"
                                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="INCOTerm" UniqueName="INCOTerm" HeaderText="INCO Term" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="WT" UniqueName="WT" SortExpression="WT" ShowFilterIcon="true" AllowFiltering="true"
                                                HeaderText="Gross Weight">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="VOL" UniqueName="Volume" SortExpression="VOL" ShowFilterIcon="true" AllowFiltering="false"
                                                HeaderText="VOL">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="status" Display="false">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                            </ContentTemplate>
                            <Triggers>
                            </Triggers>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="100%" ID="JobRadPageView" />
                </telerik:RadMultiPage>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
