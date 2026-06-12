<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSManPowerPlanningSchedule.aspx.cs" Inherits="iWMS.Web.Job.TMSManPowerPlanning.TMSManPowerPlanningSchedule" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TMSManpowerSchedulingWorkbenchSchedule</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding: 0 12px;">
            <tr>
                <td>
                    <div style="display: inline-block">
                        <asp:Label ID="DateLbl" runat="server" Text="Date" />
                        <br />
                        <telerik:RadDatePicker runat="server" ID="DateDP" Width="150px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy">
                            <Calendar runat="server">
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque"></telerik:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </div>
                    <div style="display: inline-block; text-align: left">
                        <br />
                        <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" CausesValidation="false" ToolTip="Refresh" CssClass="white" OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro"
                    OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" EnableViewState="false"
                    AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                    ItemStyle-Wrap="true" Width="100%" Height="90%">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" />
                    </ClientSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%" Height="90%" TableLayout="Fixed" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <Columns>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
