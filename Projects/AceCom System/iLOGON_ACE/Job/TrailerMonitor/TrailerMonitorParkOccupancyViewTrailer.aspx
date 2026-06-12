<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrailerMonitorParkOccupancyViewTrailer.aspx.cs" Inherits="iWMS.Web.Job.TrailerMonitor.TrailerMonitorParkOccupancyViewTrailer" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TrailerMonitorParkOccupancyViewTrailer</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" Selecting-AllowRowSelect="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
