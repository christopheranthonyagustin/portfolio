<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripVehicleDetails.aspx.cs"
    Inherits="iWMS.Web.Job.TripPlanning.TripVehicleDetails" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
    <style type="text/css">
        .style2 {
            width: 125px;
        }
    </style>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        function popupDetail(id) {
            if (id.toString().trim() != "0")
                window.showModalDialog("TripDetail2.aspx?id=" + id, "myWindow", "dialogWidth:1400px;dialogHeight:800px;status:no;dialogHide:true;help:no;scroll:yes;resizable=yes;")
        }
        function popupSchedule(id, date) {
            var strReturn;
            strReturn = window.showModalDialog("VehBookingSchedule.aspx?vehno=" + id + "&date=" + date, "myWindow", "dialogWidth:1000px;dialogHeight:500px;status:no;dialogHide:true;help:no;scroll:yes;resizable=yes;")
            if (strReturn != null) document.getElementById('HIDDEN_date').value = strReturn;
            window.reload(true);
        }

        $(document).ready(function () {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function () {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>
    <script type="text/javascript">

        //     function OnChildWindowClosed(sender, eventArgs) {
        //        document.location.reload(); // there may be a cleaner way to do the refresh
        //    }
        //    
    </script>
</head>
<body id="bdy" bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" runat="server">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
<%--                <td class="style1">
                    <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                        ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a>
                </td>--%>
                <td class="NewModuleTitle" align="right">
                    <asp:Label ID="MenuLbl" runat="server">Trip Queue</asp:Label>
                </td>
            </tr>
        </table>
        <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header" align="center">
            <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
            <asp:Label ID="lblProcessID" runat="server" Visible="False"></asp:Label>
        </asp:Panel>
        <br />
        <div id="div1" runat="server">
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="style2">
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        <input id="HIDDEN_date" type="hidden" runat="server" />
                    </td>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="30%">
                                    <asp:CheckBox ID="showTdy_cbox" runat="server" Text="ShowOnlyToday" />
                                </td>
                                <td width="30%">
                                    <asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="white"
                                        Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                                    &nbsp;&nbsp;&nbsp;
                                </td>
                                <td width="40%">
                                    <asp:Button ID="ExcelBtn" runat="server" Text="Excel" Visible="false" CssClass="white"
                                        OnClick="ExcelBtn_Click"></asp:Button>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td colspan="2" height="5px">
                                    <br />
                                    <asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                                <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>


        <div id="div3" style="height: 80%">
            <telerik:RadGrid ID="RadDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true"
                EnableLinqExpressions="false" AllowPaging="false"
                Skin="Metro" OnNeedDataSource="RadDG_NeedDataSource"
                OnItemDataBound="RadDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <HeaderStyle Wrap="false" HorizontalAlign="Center" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                S/No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="true">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="vehno1" runat="server" Text='<%#Eval("Value01") %>' OnCommand="RadWindow_Popup"
                                    CommandArgument='<%# Eval("TypeID01") + "," + Eval("TripDate") %>' />
                                <asp:Label ID="vehtripno1" Text='<%#Eval("Value01") %>' runat="server" Visible="false" />
                                <asp:Label ID="vehtripid1" Text='<%#Eval("TypeID01") %>' runat="server" Visible="false" />
                                <asp:Label ID="type1" Text='<%#Eval("Type01") %>' runat="server" Visible="false" />
                                <asp:Label ID="clr1" Text='<%#Eval("Clr01") %>' runat="server" Visible="false" />
                                <asp:Label ID="Jobdesc1" Text='<%#Eval("Jobdesc01") %>' runat="server" Visible="false" />
                                <asp:Label ID="Specinst1" Text='<%#Eval("Specinst01") %>' runat="server" Visible="false" />
                                <asp:LinkButton ForeColor="Black" ID="lnkname1" runat="server" Text='<%#Eval("Value01") %>'
                                    ToolTip='Click to modify this trip' CommandArgument='<%# Eval("TypeID01") %>' OnCommand="RadWindow_PopupDetail"
                                    Visible="false" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="B" ItemStyle-Wrap="true">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="vehno2" runat="server" Text='<%#Eval("Value02") %>' OnCommand="RadWindow_Popup"
                                    CommandArgument='<%# Eval("TypeID02") + "," + Eval("TripDate") %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="vehno2" runat="server" Text='<%#Eval("Value02") %>'
                            ToolTip='Click to modify this trip' OnClientClick='<%# String.Format("return popupSchedule(\"{0}\",\"{1}\")", Eval("TypeID02").ToString(), Eval("TripDate").ToString()) %>' />--%>
                                <asp:Label ID="vehtripno2" Text='<%#Eval("Value02") %>' runat="server" Visible="false" />
                                <asp:Label ID="vehtripid2" Text='<%#Eval("TypeID02") %>' runat="server" Visible="false" />
                                <asp:Label ID="type2" Text='<%#Eval("Type02") %>' runat="server" Visible="false" />
                                <asp:Label ID="clr2" Text='<%#Eval("Clr02") %>' runat="server" Visible="false" />
                                <asp:Label ID="Jobdesc2" Text='<%#Eval("Jobdesc02") %>' runat="server" Visible="false" />
                                <asp:Label ID="Specinst2" Text='<%#Eval("Specinst02") %>' runat="server" Visible="false" />
                                <asp:LinkButton ForeColor="Black" ID="lnkname2" runat="server" Text='<%#Eval("Value02") %>'
                                    ToolTip='Click to modify this trip' CommandArgument='<%# Eval("TypeID02") %>' OnCommand="RadWindow_PopupDetail"
                                    Visible="false" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="C" ItemStyle-Wrap="true">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="vehno3" runat="server" Text='<%#Eval("Value03") %>' OnCommand="RadWindow_Popup" CommandName="RowClick"
                                    CommandArgument='<%# Eval("TypeID03") + "," + Eval("TripDate") %>' />
                                <asp:Label ID="vehtripno3" Text='<%#Eval("Value03") %>' runat="server" Visible="false" />
                                <asp:Label ID="vehtripid3" Text='<%#Eval("TypeID03") %>' runat="server" Visible="false" />
                                <asp:Label ID="type3" Text='<%#Eval("Type03") %>' runat="server" Visible="false" />
                                <asp:Label ID="clr3" Text='<%#Eval("Clr03") %>' runat="server" Visible="false" />
                                <asp:Label ID="Jobdesc3" Text='<%#Eval("Jobdesc03") %>' runat="server" Visible="false" />
                                <asp:Label ID="Specinst3" Text='<%#Eval("Specinst03") %>' runat="server" Visible="false" />
                                <asp:LinkButton ForeColor="Black" ID="lnkname3" runat="server" Text='<%#Eval("Value03") %>'
                                    ToolTip='Click to modify this trip' CommandArgument='<%# Eval("TypeID03") %>' OnCommand="RadWindow_PopupDetail"
                                    Visible="false" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="D" ItemStyle-Wrap="true">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="vehno4" runat="server" Text='<%#Eval("Value04") %>' OnCommand="RadWindow_Popup" CommandName="RowClick"
                                    CommandArgument='<%# Eval("TypeID04") + "," + Eval("TripDate") %>' />
                                <asp:Label ID="vehtripno4" Text='<%#Eval("Value04") %>' runat="server" Visible="false" />
                                <asp:Label ID="vehtripid4" Text='<%#Eval("TypeID04") %>' runat="server" Visible="false" />
                                <asp:Label ID="type4" Text='<%#Eval("Type04") %>' runat="server" Visible="false" />
                                <asp:Label ID="clr4" Text='<%#Eval("Clr04") %>' runat="server" Visible="false" />
                                <asp:Label ID="Jobdesc4" Text='<%#Eval("Jobdesc04") %>' runat="server" Visible="false" />
                                <asp:Label ID="Specinst4" Text='<%#Eval("Specinst04") %>' runat="server" Visible="false" />
                                <asp:LinkButton ForeColor="Black" ID="lnkname4" runat="server" Text='<%#Eval("Value04") %>'
                                    ToolTip='Click to modify this trip' CommandArgument='<%# Eval("TypeID04") %>' OnCommand="RadWindow_PopupDetail"
                                    Visible="false" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="E" ItemStyle-Wrap="true">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="vehno5" runat="server" Text='<%#Eval("Value05") %>' OnCommand="RadWindow_Popup" CommandName="RowClick"
                                    CommandArgument='<%# Eval("TypeID05") + "," + Eval("TripDate") %>' />
                                <asp:Label ID="vehtripno5" Text='<%#Eval("Value05") %>' runat="server" Visible="false" />
                                <asp:Label ID="vehtripid5" Text='<%#Eval("TypeID05") %>' runat="server" Visible="false" />
                                <asp:Label ID="type5" Text='<%#Eval("Type05") %>' runat="server" Visible="false" />
                                <asp:Label ID="clr5" Text='<%#Eval("Clr05") %>' runat="server" Visible="false" />
                                <asp:Label ID="Jobdesc5" Text='<%#Eval("Jobdesc05") %>' runat="server" Visible="false" />
                                <asp:Label ID="Specinst5" Text='<%#Eval("Specinst05") %>' runat="server" Visible="false" />
                                <asp:LinkButton ForeColor="Black" ID="lnkname5" runat="server" Text='<%#Eval("Value05") %>'
                                    ToolTip='Click to modify this trip' CommandArgument='<%# Eval("TypeID05") %>' OnCommand="RadWindow_PopupDetail"
                                    Visible="false" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
