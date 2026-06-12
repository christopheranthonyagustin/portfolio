<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripInfoStatus.aspx.cs"
    Inherits="iWMS.Web.Report.TripInfoStatus.TripInfoStatus" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
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

    <style>
    html{
        overflow:hidden;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="NewModuleTitle" align="left">
                <div style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px; padding-top: 3px;
                    left: -37px; top: 0px; width: 316px;">
                    <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Trip Information Status</asp:Label>
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
                    <telerik:RadDropDownList ID="AccountList" runat="server" Enabled="True" DataTextField="code" Skin = "WebBlue"
                        DataValueField="acid" Width="150px">
                    </telerik:RadDropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="ShpTypeLbl" runat="server">ShipmentType</asp:Label>
                </td>
                <td class="style1">
                    <telerik:RadDropDownList ID="ShpTypeList" runat="server" Enabled="True" DataTextField="Descr" Skin = "WebBlue"
                        DataValueField="item" Width="150px">
                    </telerik:RadDropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="Route" runat="server">Route</asp:Label>
                </td>
                <td class="style1">
                    <telerik:RadDropDownList ID="RouteList" runat="server" Enabled="True" DataTextField="Descr" Skin = "WebBlue"
                        DataValueField="item" Width="150px">
                    </telerik:RadDropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="VehNo" runat="server">VehicleNo</asp:Label>
                </td>
                <td class="style1">
                    <telerik:RadDropDownList ID="VehNoList" runat="server" Enabled="True" DataTextField="Descr" Skin = "WebBlue"
                        DataValueField="item" Width="150px">
                    </telerik:RadDropDownList>
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
                    <telerik:RadDropDownList ID="AMPMList" runat="server" Enabled="True" DataTextField="Descr" Skin = "WebBlue"
                        DataValueField="item" Width="150px">
                    </telerik:RadDropDownList>
                </td>
                <td class="style1">
                    <asp:Label ID="FromTime" runat="server">FromTime</asp:Label>
                </td>
                <td class="style1">
                    <telerik:RadDropDownList ID="FromTimeList" runat="server" Enabled="True" DataTextField="Descr" Skin = "WebBlue"
                        DataValueField="item" Width="150px">
                    </telerik:RadDropDownList>
                </td>
                <td>
                    <asp:Label ID="RefreshLbl" runat="server">Refresh</asp:Label>
                </td>
                <td>
                    <telerik:RadDropDownList ID="RefreshList" runat="server" Enabled="True" DataTextField="Descr" Skin = "WebBlue"
                        DataValueField="Item" Width="150px">
                    </telerik:RadDropDownList>
                </td>
                <td>
                    <asp:Label ID="CustRef" runat="server">CustRef</asp:Label>
                </td>
                <td>
                    <telerik:RadTextBox runat="server" ID="CustrefTxt" Width="150px" Skin = "WebBlue"></telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Date" runat="server">Date</asp:Label>
                </td>
                <td>
                   <%-- <asp:TextBox runat="server" ID="DateTxt" Width="150px" Skin = "WebBlue"></asp:TextBox>
                    <asp:CalendarExtender ID="Date_CalendarExtender" runat="server" Enabled="True" TargetControlID="DateTxt"
                        DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy" Format="dd/MMM/yyyy">
                    </asp:CalendarExtender>--%>
                    
                    <telerik:RadDatePicker ID="DateTxt" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                        DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007">
                    <Calendar>
                        <SpecialDays>
                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                        </SpecialDays>
                    </Calendar>
                    </telerik:RadDatePicker>
                                                    
                </td>
                 <td>
                    <asp:Label ID="Status" runat="server">Status</asp:Label>
                </td>
                <td class="style1">
                    <telerik:RadDropDownList ID="StatusList" runat="server" Enabled="True" DataTextField="Descr" Skin = "WebBlue"
                        DataValueField="item" Width="150px">
                    </telerik:RadDropDownList>
                    <br />
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
        <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false" Height="390px" Visible="false" 
            AllowSorting="True" BorderStyle="Solid" Skin="Office2007" AllowFilteringByColumn="true" OnItemDataBound="ResultRadGrid_ItemDataBound" OnNeedDataSource="ResultRadGrid_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling UseStaticHeaders="true" SaveScrollPosition="true" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" 
                Name="Master">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="sno" HeaderText="S/N" AllowFiltering="false" >
                        <ItemTemplate>
                            <asp:Label ID="numberLabel" runat="server" Width="40px" />
                        </ItemTemplate>
                        <HeaderStyle Width="40px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderStyle Width="30px" />
                        <ItemTemplate>
                            <asp:Label ID="AttcLbl" runat="server"></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="CustRef" DataField="CustRef" AllowFiltering="true" HeaderStyle-Width = "130px"
                        ColumnGroupName="CustRef">
                    </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UploadDate" DataField="frexpdate" ColumnGroupName="frexpdate" 
                        SortExpression="frexpdate" UniqueName="UploadDate" Reorderable="true" Display="true" HeaderStyle-Width = "130px" 
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn HeaderText="UploadTime" DataField="frexptime" ColumnGroupName="frexptime"
                        SortExpression="frexptime" UniqueName="UploadTime" Reorderable="true" Display="true" HeaderStyle-Width = "130px">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn HeaderText="ActualCompletedDate" DataField="fractdate" ColumnGroupName="fractdate"
                        SortExpression="fractdate" UniqueName="ActualCompletedDate" Reorderable="true" Display="true" HeaderStyle-Width = "150px"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn HeaderText="ActualCompletedTime" DataField="fracttime" ColumnGroupName="fracttime"
                        SortExpression="fracttime" UniqueName="ActualCompletedTime" Reorderable="true" Display="true" HeaderStyle-Width = "150px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vehno" DataField="vehnodescr" AllowFiltering="true" HeaderStyle-Width = "130px"
                        ColumnGroupName="vehnodescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Date" DataField="frexpdate" AllowFiltering="true" DataFormatString="{0:dd/MMM/yyyy}"
                        ColumnGroupName="Date" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Time" DataField="fracttime" AllowFiltering="false"
                        ColumnGroupName="Time" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="From" DataField="fraddr" AllowFiltering="false"
                        ColumnGroupName="From" Display="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn HeaderText="OrderBy" DataField="orderby" AllowFiltering="false" HeaderStyle-Width = "140px"
                        ColumnGroupName="OrderBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="false" HeaderStyle-Width = "140px"
                        ColumnGroupName="ToAddr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Wt" DataField="actwt" AllowFiltering="true"
                        ColumnGroupName="Wt" DataFormatString="{0:#,0.0000}" Display="False">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vol" DataField="actvol" AllowFiltering="true"
                        ColumnGroupName="Vol" DataFormatString="{0:#,0.0000}" Display="False">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="qty"  ColumnGroupName="Qty" AllowFiltering="false" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Reason" DataField="reasondescr" AllowFiltering="false" HeaderStyle-Width = "100px"
                        ColumnGroupName="reasondescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PIC/CS" DataField="PICDescr" AllowFiltering="false" HeaderStyle-Width = "120px"
                        ColumnGroupName="PICDescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false" HeaderStyle-Width = "100px"
                        ColumnGroupName="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}"
                        ColumnGroupName="adddate" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="False" />
                    <telerik:GridBoundColumn DataField="jbid" UniqueName="jbid" Display="False" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
