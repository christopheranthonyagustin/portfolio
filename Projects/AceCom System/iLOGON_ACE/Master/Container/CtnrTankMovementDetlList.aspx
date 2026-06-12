<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrTankMovementDetlList.aspx.cs" Inherits="iWMS.Web.Master.Container.CtnrTankMovementDetlList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">

    <title>TankShipmentDetails</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <div id="div-radgrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true"
                AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
                <GroupingSettings CaseSensitive="false" />
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" />
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
