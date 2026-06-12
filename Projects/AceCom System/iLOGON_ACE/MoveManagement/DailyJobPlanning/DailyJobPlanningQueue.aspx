<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyJobPlanningQueue.aspx.cs" Inherits="iWMS.Web.MoveManagement.DailyJobPlanning.DailyJobPlanningQueue" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyRidesPlanningQueue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>

    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self" />

    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 6%;
        }
    </style>
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
    </style>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td class="style2" colspan="4">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Label ID="frdatelbl" runat="server" Text="Date"> 
                    </asp:Label>
                    <br />
                    <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                        OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                </td>
                <td>
                    <br />
                    <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <br />
                    <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                        Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <br />
                    <asp:Button ID="excelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                        UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="AllRidesBtn" runat="server" CssClass="white" Text="AllRides" OnClick="AllRidesBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="UnpairBtn" runat="server" CssClass="white" Text="Unpair" OnClick="UnpairBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="CastingBtn" runat="server" CssClass="white" Text="Casting" OnClick="CastingBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="PairBtn" runat="server" CssClass="white" Text="Pair" OnClick="PairBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                    Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                    Text="Assigned" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                    Text="Completed" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" Width="100%" Height="200%"
                    OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" EnableViewState="false"
                    AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                    ItemStyle-Wrap="true" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="550px" />
                    </ClientSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
