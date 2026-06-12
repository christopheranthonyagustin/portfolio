<%@ Page Language="c#" CodeBehind="TripServiceChitDetail.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TripServiceChit.TripServiceChitDetail" EnableEventValidation="false" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RegisterServiceChit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function () {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td align="right" class="style2">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <%-- <div align="center">
        <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header">
            <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
            <asp:Label ID="lblProcessID" runat="server" Visible="False" />
        </asp:Panel>
    </div>--%>
        <%-- <div id="div3" runat="server">--%>
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
            <Items>
                <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                    Style="text-align: center; font-size: 15px; font-weight: bold;">
                    <Items>
                        <telerik:RadPanelItem runat="server" Value="Panel">
                            <ItemTemplate>
                                <asp:Label ID="lblProcessID" runat="server" Visible="False" />
                                <table id="tbl2" border="0" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <td align="center" style="width: 100px;padding-top:10px" valign="top">
                                            <asp:Label ID="FromDate" runat="server">FromDate</asp:Label>
                                        </td>
                                        <td align="left" style="width: 100px;padding-top:10px" valign="top">
                                            <%--<asp:TextBox runat="server" ID="FrDateTxt" Width="120px"></asp:TextBox>
                                        <asp:CalendarExtender ID="FrDate_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="FrDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                            Format="dd/MMM/yyyy">
                                        </asp:CalendarExtender>--%>
                                            <telerik:RadDatePicker ID="FrDate_CalendarExtender" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td align="center" style="width: 100px;padding-top:10px" valign="top">
                                            <asp:Label ID="VehNo" runat="server">VehicleNo</asp:Label>
                                        </td>
                                        <td align="left" style="width: 100px;padding-top:10px" valign="top">
                                            <%--<asp:DropDownList ID="VehNoList" runat="server" Enabled="True" DataTextField="Descr"
                                            DataValueField="item" Width="120px">
                                        </asp:DropDownList>--%>
                                            <telerik:RadDropDownList ID="VehNoList" runat="server" DropDownHeight="100px" Width="150px"
                                                Skin="WebBlue" DataTextField="Descr" DataValueField="item" DropDownWidth="150px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td align="center" style="width: 100px;padding-top:10px" valign="top">
                                            <asp:Label ID="SvcChit" runat="server">SvcChit</asp:Label>
                                        </td>
                                        <td align="left" style="width: 100px;padding-top:10px" valign="top">
                                            <telerik:RadTextBox ID="SvcChitTxt" runat="server" Width="120px"></telerik:RadTextBox>
                                        </td>
                                        <td align="center" style="width: 100px;padding-top:10px" valign="top">
                                            <asp:Label ID="JobNo" runat="server">JobNo</asp:Label>
                                        </td>
                                        <td align="left" style="width: 100px;padding-top:10px" valign="top">
                                            <telerik:RadTextBox ID="JobNoTxt" runat="server" Width="120px"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 100px;padding-top:10px" valign="top">
                                            <asp:Label ID="ToDate" runat="server">ToDate</asp:Label>
                                        </td>
                                        <td align="left" style="width: 100px;padding-top:10px" valign="top">
                                            <%--<asp:TextBox runat="server" ID="ToDateTxt" Width="120px"></asp:TextBox>
                                        <asp:CalendarExtender ID="ToDate_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="ToDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                            Format="dd/MMM/yyyy">
                                        </asp:CalendarExtender>--%>
                                            <telerik:RadDatePicker ID="ToDate_CalendarExtender" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td align="center" style="width: 100px;padding-top:10px" valign="top">
                                            <asp:Label ID="AssignDriver" runat="server">AssignDriver</asp:Label>
                                        </td>
                                        <td align="left" style="width: 100px;padding-top:10px" valign="top">
                                            <%--<asp:DropDownList ID="AssignDriverList" runat="server" Enabled="True" DataTextField="Descr"
                                            DataValueField="item" Width="120px">
                                        </asp:DropDownList>--%>
                                            <telerik:RadDropDownList ID="AssignDriverList" runat="server" DropDownHeight="100px" Width="150px"
                                                Skin="WebBlue" DataTextField="Descr" DataValueField="item" DropDownWidth="150px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td align="center" style="width: 100px;padding-top:10px" valign="top">
                                            <asp:Label ID="Driver" runat="server">Driver</asp:Label>
                                        </td>
                                        <td align="left" style="width: 100px;padding-top:10px" valign="top">
                                            <%-- <asp:DropDownList ID="DriverList" runat="server" Enabled="True" DataTextField="Descr"
                                            DataValueField="item" Width="120px">
                                        </asp:DropDownList>--%>
                                            <telerik:RadDropDownList ID="DriverList" runat="server" DropDownHeight="100px" Width="150px"
                                                Skin="WebBlue" DataTextField="Descr" DataValueField="item" DropDownWidth="150px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td align="center" style="width: 100px;padding-top:10px" valign="top">
                                            <%--<asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="detailbutton"
                                            Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>--%>
                                            <%--<telerik:RadButton ID="refreshBtn" runat="server"  Text="Refresh" OnClick="refreshBtn_Click" Skin="WebBlue"/>--%>

                                            <asp:Button ID="refreshBtn" runat="server" CssClass="white" Text="Refresh"
                                                OnClick="refreshBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        </td>
                                        <td align="left" style="width: 100px;padding-top:10px" valign="top">
                                            <%--<a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                        <img id="excelImg" border="0" alt="Export to Excel" title="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                            height="20" runat="server" /></a>--%>
                                            <%--<asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/Excel.png"
                                            OnClick="ExportExcel" />--%>

                                            <asp:Button ID="ButtonExcel" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                                                UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
            <ExpandAnimation Type="None" />
            <CollapseAnimation Type="None" />
        </telerik:RadPanelBar>
        <%-- </div>--%>
        <div>
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnPageIndexChanged="ResultDG_PageIndexChanged"
                OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="ResultDG_GridExporting">
                <GroupingSettings CaseSensitive="false" />
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" ScrollHeight="480px" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="jctid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" AllowPaging="true" PageSize="100">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Edit"
                                    ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                    OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm to delete service chit?')"
                                    onserverclick="SvcChitDetail_Delete" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                        title="Delete" runat="server" /></a>
                                <asp:Label ID="AttcLbl" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                            <HeaderTemplate>
                                S/No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn SortExpression="frexpdate">
                            <HeaderTemplate>
                                <asp:Button ID="ExpDateLbtn" runat="server" Text="ExpectedDate" CommandName='Sort'
                                    CommandArgument='frexpdate' />
                                <%--<asp:Label runat="server" Text="ExpDate" ID="ExpDateLbl"/><br>
						    <asp:Label runat="server" Text="SvcChitDate" ID="SvcChitDateLbl"/><br>--%>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "frexpdate","{0:dd/MMM/yyyy ddd}") %>'
                                    ID="Label2" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="acc" SortExpression="accode">
                            <HeaderTemplate>
                                <asp:Button ID="AccountJobLbtn" runat="server" Text="Account" CommandName='Sort'
                                    CommandArgument='accode' />
                                <br>
                                <asp:Label ID="JobNoLbl" runat="server" Text="JobNo" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "accode") %>'
                                    ID="accodeLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "jbno") %>'
                                    ID="jbnoLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "billsizetype") %>'
                                    ID="Label1" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="acc1" Visible="false">
                            <HeaderTemplate>
                                <asp:Label runat="server" ID="acclbll" Text="Account"></asp:Label>
                                <br />
                                <asp:Label ID="JobNoLbl1" runat="server" Text="JobNo." />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "accode") %>'
                                    ID="accodeLbl1" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "jbno") %>'
                                    ID="jbnoLbl1" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "billsizetype") %>'
                                    ID="Labelbill" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Collect" SortExpression="fraddr">
                            <HeaderTemplate>
                                <asp:Button ID="CollectFromDeliverToLbtn" runat="server" Text="CollectFrom" CommandName='Sort'
                                    CommandArgument='fraddr' />
                                <br>
                                <asp:Label ID="DeliverTo" runat="server" Text="DeliverTo" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                    ID="fraddrLbl" Visible="false" />
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "frservicept") %>'
                                    ID="frsvcptLbl" Visible="false" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                    ID="toaddrLbl" Visible="false" />
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toservicept") %>'
                                    ID="tosvcptLbl" Visible="false" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Collectt1" Visible="false">
                            <HeaderTemplate>
                                <asp:Label ID="Collectfromlbl" runat="server" Text="CollectFrom" />
                                <br>
                                <asp:Label ID="DeliverToLbl" runat="server" Text="DeliverTo" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                    ID="fraddrLbl1" />
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "frservicept") %>'
                                    ID="frsvcptLbl11" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                    ID="toaddrLbl1" />
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toservicept") %>'
                                    ID="tosvcptLbl1" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Vehicle" SortExpression="vehno">
                            <HeaderTemplate>
                                <asp:Button ID="VehicleDriverLbtn" runat="server" Text="Vehicle" CommandName='Sort'
                                    CommandArgument='vehno' />
                                <br>
                                <asp:Label ID="AssignDriver1" runat="server" Text="AssignDriver" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vehno") %>'
                                    ID="vehnoLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "assigndriverdescr") %>'
                                    ID="assigndriverLbl" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Vehicle1" Visible="false">
                            <HeaderTemplate>
                                <asp:Label ID="Vehicle" runat="server" Text="Vehicle" />
                                <br>
                                <asp:Label ID="AssignDriver1Lbl" runat="server" Text="AssignDriver" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vehno") %>'
                                    ID="vehnoLbl1" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "assigndriverdescr") %>'
                                    ID="assigndriverLbl1" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Driverr" SortExpression="svcchitno">
                            <HeaderTemplate>
                                <asp:Button ID="SvcChitDriverLbtn" runat="server" Text="SvcChit" CommandName='Sort'
                                    CommandArgument='svcchitno' />
                                <br>
                                <asp:Label ID="Driver1" runat="server" Text="Driver" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "svcchitno") %>'
                                    ID="svcchitnoLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pername") %>'
                                    ID="driverLbl" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Driverr1" Visible="false">
                            <HeaderTemplate>
                                <asp:Label ID="SvcChitLbl" runat="server" Text="SvcChit" />
                                <br>
                                <asp:Label ID="DriverLbl" runat="server" Text="Driver" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "svcchitno") %>'
                                    ID="svcchitnoLbl1" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pername") %>'
                                    ID="driverLbl1" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Trip" SortExpression="tripcount">
                            <HeaderTemplate>
                                <asp:Button ID="TonTripCntLbtn" runat="server" Text="Ton" CommandName='Sort' CommandArgument='tripcount' />
                                <br>
                                <asp:Label ID="TripCnt" runat="server" Text="TripCnt" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tonnage") %>'
                                    ID="tonnageLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tripcount") %>'
                                    ID="tripcountLbl" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Trip1" Visible="false">
                            <HeaderTemplate>
                                <asp:Label ID="Ton" runat="server" Text="Ton" />
                                <br>
                                <asp:Label ID="TripCnt1" runat="server" Text="TripCnt" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tonnage") %>'
                                    ID="tonnageLbl1" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tripcount") %>'
                                    ID="tripcountLbl1" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False">
                            <HeaderTemplate>
                                <asp:Label runat="server" Text="1stHalfFr" ID="fstHalfFrLbl" /><br>
                                <asp:Label runat="server" Text="1stHalfTo" ID="fstHalfToLbl" /><br>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "frtime1") %>'
                                    ID="frtime1Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totime1") %>'
                                    ID="totime1Lbl" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False">
                            <HeaderTemplate>
                                <asp:Label runat="server" Text="2ndHalfFr" ID="sndHalfFrLbl" /><br />
                                <asp:Label runat="server" Text="2ndHalfTo" ID="sndHalfToLbl" /><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "frtime2") %>'
                                    ID="frtime2Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totime2") %>'
                                    ID="totime2Lbl" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False">
                            <HeaderTemplate>
                                <asp:Label runat="server" Text="3rdHalfFr" ID="trdHalfFrLbl" /><br />
                                <asp:Label runat="server" Text="3rdHalfTo" ID="trdHalfToLbl" /><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "frtime3") %>'
                                    ID="frtime3Lbl" /><br />
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totime3") %>'
                                    ID="totime3Lbl" /><br />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False">
                            <HeaderTemplate>
                                <asp:Label runat="server" Text="1stTripAmt" ID="fstTripAmtLbl" /><br />
                                <asp:Label runat="server" Text="ExtraCharge" ID="ExtraChargeLbl" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "trip1amt") %>'
                                    ID="trip1amtLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "extracharge") %>'
                                    ID="extrachargeLbl" /><br>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False">
                            <HeaderTemplate>
                                <asp:Label runat="server" Text="OTHour" ID="OThrLbl" /><br />
                                <asp:Label runat="server" Text="OTAmt" ID="OTAmtLbl" /><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "overtimehrs") %>'
                                    ID="overtimehrsLbl" /><br />
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "overtimeamt") %>'
                                    ID="overtimeamtLbl" /><br />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-Wrap="False">
                            <HeaderTemplate>
                                <asp:Label runat="server" Text="Remarks" ID="RemarksLbl" /><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'
                                    ID="remarksLbl" /><br />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Container" SortExpression="ctnrno" AllowFiltering="true">
                            <HeaderTemplate>
                                <asp:Button ID="ContainerChassisLbtn" runat="server" Text="ContainerNo" CommandName='Sort'
                                    CommandArgument='ctnrno' />
                                <br />
                                <asp:Label ID="Chassis" runat="server" Text="Chassis" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrno") %>'
                                    ID="ctnrnoLbl" /><br />
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "trailerno") %>'
                                    ID="trailernoLbl" /><br />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Container1" Visible="false">
                            <HeaderTemplate>
                                <asp:Label ID="Containerno" runat="server" Text="ContainerNo" />
                                <br />
                                <asp:Label ID="Chassis1" runat="server" Text="Chassis" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrno") %>'
                                    ID="ctnrnoLbl1" /><br />
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "trailerno") %>'
                                    ID="trailernoLbl1" /><br />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="svcchitno" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbid" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
