<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2Schedule.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDPV2Schedule" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Schedule @ DDPV2</title>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <link rel="stylesheet" href="../../css/iWMStelerik.css" type="text/css">
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" Text="VehicleType"></asp:Label>
                    <br />
                    <telerik:RadDropDownList ID="VehicleTypeDDL" runat="server" Skin="WebBlue"
                        DataValueField="Item" DataTextField="Descr" DropDownWidth="140px" OnLoad="VehicleTypeDDL_Load">
                    </telerik:RadDropDownList>
                </td>
                <td>
                    <br />
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click" Text="Search" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True" GridLines="None" ItemStyle-Wrap="true"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" Width="230%"
            ExportSettings-UseItemStyles="true">
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%" Height="90%" TableLayout="Fixed">
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
