<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SkuMvmtSchedule.aspx.cs"
    Inherits="iWMS.Web.Master.Sku.SkuMvmtSchedule" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SKU Movement Schedule</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <table width="93%">
        <tr>
            <td>
                <div class="NewModuleTitle">
                    <asp:Label ID="Label1" runat="server">SKU Movement Schedule</asp:Label>
                </div>
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td class="style2" style="width:80%;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="width: 20%">
                                <asp:Label ID="SiteLbl" runat="server" Text="Site" /><br />
                                <telerik:RadDropDownList ID="SiteList" runat="server" DefaultMessage="Select a Site"
                                    DropDownHeight="150px" DropDownWidth="120px" Skin="WebBlue" Width="120px">
                                </telerik:RadDropDownList>
                            </td>
                            <td style="width: 20%">
                                <asp:Label ID="FrDateLbl" runat="server" Text="FromDate" /><br />
                                <telerik:RadDatePicker ID="frDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007">
                                    <Calendar>
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </Calendar>
                                </telerik:RadDatePicker>
                            </td>
                            <td style="width: 20%">
                                <asp:Label ID="ToDateLbl" runat="server" Text="ToDate" /><br />
                                <telerik:RadDatePicker ID="toDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007">
                                    <Calendar>
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </Calendar>
                                </telerik:RadDatePicker>
                            </td>
                            <td style="width: 20%">
                                <telerik:RadButton ID="refreshBtn" runat="server" OnClick="refreshBtn_Click" Text="Refresh"
                                    Skin="WebBlue">
                                </telerik:RadButton>
                            </td>
                            <td style="width: 20%">
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width:20%;">
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        function pageLoad() {
            var grid = $find("<%= ResultDG.ClientID %>");
            var columns = grid.get_masterTableView().get_columns();
            for (var i = 0; i < columns.length; i++) {
                columns[i].resizeToFit(false, true);
            }

            var grid2 = $find("<%= LegendDG.ClientID %>");
            var columns2 = grid2.get_masterTableView().get_columns();
            for (var i = 0; i < columns2.length; i++) {
                columns2[i].resizeToFit(false, true);
            }
        }
     </script>
    </telerik:RadCodeBlock>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
        AllowSorting="false" EnableLinqExpressions="false" Skin="Office2007" AllowPaging="false"
        OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColCreated">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="false">
        </MasterTableView>
    </telerik:RadGrid>
    <br />
    <telerik:RadGrid ID="LegendDG" runat="server" GridLines="None" Skin="Office2007" AutoGenerateColumns="true" Visible="false">
        <ClientSettings>
            <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
        </ClientSettings>
        <ItemStyle Wrap="false"></ItemStyle>
    </telerik:RadGrid>
    </form>
</body>
</html>
