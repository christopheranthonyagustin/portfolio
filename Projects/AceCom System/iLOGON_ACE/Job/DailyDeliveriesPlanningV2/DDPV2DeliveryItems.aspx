<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2DeliveryItems.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDpV2DeliveryItems" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>DeliveryItems @ DDPV2</title>
    <link rel="stylesheet" href="../../css/iWMStelerik.css" type="text/css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True" GridLines="Both"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true">
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
