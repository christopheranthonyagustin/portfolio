<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyRouteSummaryByVehNo.aspx.cs"
    Inherits="iWMS.Web.Report.DailyRouteSummaryByVehNo.DailyRouteSummaryByVehNo" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function onGridCreated(sender, args) {
                $telerik.$(sender.GridDataDiv).on("scroll", function(a, b, e) {
                    this.scrollLeft = 0;
                });
            }
        </script>

        <script type="text/javascript">
            function pageLoad() {
                var grid = $find("<%= ResultRadGrid.ClientID %>");
                var columns = grid.get_masterTableView().get_columns();
                for (var i = 0; i < columns.length; i++) {
                    columns[i].resizeToFit(false, true);
                }
            }
        </script>

    </telerik:RadCodeBlock>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="NewModuleTitle" align="left">
                <div style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px; padding-top: 3px;
                    left: -37px; top: 0px; width: 316px;">
                    <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Daily Route Summary by VehNo</asp:Label>
                </div>
            </td>
        </tr>
    </table>
    <div id="div1">
        <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div align="center" id="div2">
        <asp:Label Style="z-index: 0" ID="MessageLbl1" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header">
            <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
            <asp:Label ID="lblProcessID" runat="server" Visible="False" />
        </asp:Panel>
    </div>
    <div id="div3" runat="server">
        <table id="tbl2" border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td>
                    <asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="AccountList" runat="server" Enabled="True" DataTextField="code"
                        DataValueField="acid" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="ShpTypeLbl" runat="server">ShipmentType</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="ShpTypeList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="Route" runat="server">Route</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="RouteList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="VehNo" runat="server">VehicleNo</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="VehNoList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td rowspan="2">
                    <asp:ImageButton ID="refreshBtn" runat="server" AlternateText="Refresh" OnClick="refreshBtn_Click"
                        ImageUrl="~/Image/refresh.png" BorderStyle="None" ImageAlign="AbsMiddle" BackColor="Transparent">
                    </asp:ImageButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server">AM/PM</asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="AMPMList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="FromTime" runat="server">FromTime</asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="FromTimeList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="RefreshLbl" runat="server">Refresh</asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="RefreshList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="Item" Width="150px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="CustRef" runat="server">CustRef(DN)</asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="CustrefTxt" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Date" runat="server">Date</asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="DateTxt" Width="150px"></asp:TextBox>
                    <asp:CalendarExtender ID="Date_CalendarExtender" runat="server" Enabled="True" TargetControlID="DateTxt"
                        DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy" Format="dd/MMM/yyyy">
                    </asp:CalendarExtender>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div id="div-datagrid">
        <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
            AllowSorting="false" OnSelectedIndexChanged="ResultRadGrid_SelectedIndexChanged"
            BorderStyle="Solid" Skin="Office2007" OnPreRender="ResultRadGrid_PreRender" OnItemDataBound="ResultRadGrid_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="true">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" TableLayout="Fixed"
                Name="Master">
                <Columns>
                    <telerik:GridBoundColumn HeaderText="Date" DataField="frexpdate" AllowFiltering="true"
                        UniqueName="date" ColumnGroupName="frexpdate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Route" DataField="route" AllowFiltering="true"
                        UniqueName="route" ColumnGroupName="route">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AMPM" DataField="ampm" AllowFiltering="true"
                        ColumnGroupName="ampm">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehno" AllowFiltering="true"
                        ColumnGroupName="vehno">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CustRef(DN)" DataField="custref" AllowFiltering="true"
                        ColumnGroupName="custref">
                        <ItemStyle HorizontalAlign="Left" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Wt" DataField="wt" AllowFiltering="true" ColumnGroupName="wt"
                        DataFormatString="{0:#,0.0000}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vol" DataField="vol" AllowFiltering="true" ColumnGroupName="vol"
                        DataFormatString="{0:#,0.0000}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Jobs" DataField="jobs" AllowFiltering="true"
                        ColumnGroupName="Jobs">
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DropPts" DataField="DropPts" AllowFiltering="true"
                        ColumnGroupName="DropPts">
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="NoTiming" DataField="NoTiming" AllowFiltering="true"
                        ColumnGroupName="NoTiming">
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Open" DataField="Open" AllowFiltering="true"
                        ColumnGroupName="Open">
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Assigned" DataField="Assign" AllowFiltering="true"
                        ColumnGroupName="Assign">
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Completed" DataField="Completed" AllowFiltering="true"
                        ColumnGroupName="Completed">
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Cancelled" DataField="Cancelled" AllowFiltering="true"
                        ColumnGroupName="Cancelled">
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
