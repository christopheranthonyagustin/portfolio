<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2ShowQuotationInfo.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDPV2ShowQuotationInfo" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quotation @ Daily Deliveries Planning V2</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="550" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="ChargeCode" UniqueName="ChargeCode" SortExpression="ChargeCode" HeaderText="ChargeCode" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ChargeDescription" UniqueName="ChargeDescription" SortExpression="ChargeDescription" HeaderText="ChargeDescription" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RentalHourRate" UniqueName="RentalHourRate" SortExpression="RentalHourRate" HeaderText="RentalHourRate" AllowFiltering="false" DataFormatString="{0:0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MidnightRate" UniqueName="MidnightRate" SortExpression="MidnightRate" HeaderText="MidnightRate" AllowFiltering="false" DataFormatString="{0:0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MinimumRentalHour" UniqueName="MinimumRentalHour" SortExpression="MinimumRentalHour" HeaderText="MinimumRentalHour" AllowFiltering="false" DataFormatString="{0:0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DailyRate" UniqueName="DailyRate" SortExpression="DailyRate" HeaderText="DailyRate" AllowFiltering="false" DataFormatString="{0:0.00}">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
