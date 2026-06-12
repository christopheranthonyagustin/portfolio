<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningDetail3.aspx.cs"
    Inherits="iWMS.Web.Job.TripPlanning.TripPlanningDetail3" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function onGridCreated(sender, args) {
                $telerik.$(sender.GridDataDiv).on("scroll", function (a, b, e) {
                    this.scrollLeft = 0;
                });
            }
        </script>

        <%-- newly added--%>
        <%--<script type="text/javascript">
            function GridCreated(sender, args) {
                var scrollArea = sender.GridDataDiv;
                var parent = $get("gridContainer");
                var gridHeader = sender.GridHeaderDiv;
                scrollArea.style.height = parent.clientHeight - gridHeader.clientHeight + "px";
            }
        </script>--%>

        <script type="text/javascript">
            function pageLoad() {
                var grid = $find("<%= ResultRadGrid.ClientID %>");
                var columns = grid.get_masterTableView().get_columns();
                for (var i = 0; i < columns.length; i++) {
                    columns[i].resizeToFit(false, true);
                }
            }
            function selectAll(id) {
                var masterTable = $find("<%= ResultRadGrid.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = true; // for checking the checkboxes
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = false; // for unchecking the checkboxes
                    }
                }
            }
        </script>

    </telerik:RadCodeBlock>

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
        <table style="float:right">
            <tr>
                <td class="NewModuleTitle" align="right">
                        <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server">Trip Planning V3</asp:Label>
                </td>
            </tr>
        </table>
        <div id="div1">
            <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td colspan="3">
                        <asp:Label ID="MessageLbl" runat="server" Visible="false" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
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
                    <td colspan="10">
                        <table border="0" cellspacing="1" cellpadding="1">
                            <tr>
                                <td align="right">
                                    <asp:ImageButton ID="refreshBtn" runat="server" AlternateText="Refresh" OnClick="refreshBtn_Click" Width="30px"
                                        ImageUrl="~/Image/refresh.png" BorderStyle="None" ImageAlign="AbsMiddle" BackColor="Transparent"></asp:ImageButton>
                                    <asp:ImageButton ID="ExcelBtn" runat="server" AlternateText="Export to Excel" OnClick="ExcelBtn_Click"
                                        ImageUrl="~/Image/msexcel.png" BorderStyle="None" ImageAlign="AbsMiddle" BackColor="Transparent"
                                        Visible="false" Width="43px"></asp:ImageButton>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="10">
                        <asp:Label ID="volLbl" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="wtLbl" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="pkgLbl" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="pltLbl" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="TotalLbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="AccountLbl" runat="server" Height="100px">Account</asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox ID="AccountList" runat="server" Skin="WebBlue" Filter="Contains" Width="150px"
                            OnSelectedIndexChanged="AccountList_SelectedIndexChanged" AutoPostBack="True">
                        </telerik:RadComboBox>
                        <telerik:RadListBox runat="server" ID="SelectedAccountListBox" Height="100px" Width="185px"
                            ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false" Skin="WebBlue"
                            AllowDelete="true">
                        </telerik:RadListBox>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server">JobNo</asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="JobNoTxt" runat="server" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Status" runat="server">Status</asp:Label>
                    </td>
                    <td>
                        <telerik:RadDropDownList ID="StatusList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                        <br />
                    </td>
                    <td rowspan="4" colspan="4">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <td class="style5">
                                <asp:Label ID="TripType" runat="server">TripType</asp:Label>
                            </td>
                            <tr>
                                <td style="width: 400px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="TripTypeList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedTripTypeList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                    DataTextField="Descr" DataValueField="item" OnTransferred="TripTypeList_Transferred">
                                </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedTripTypeList" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <%--<td colspan="4">
                    <asp:Label ID="volLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="wtLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="pkgLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="pltLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="TotalLbl" runat="server"></asp:Label>
                </td>--%>
                </tr>
                <tr>
                    <td style="padding-top:15px">
                        <asp:Label ID="ShpTypeLbl" runat="server">ShipmentType</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="ShpTypeList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue" AutoPostBack="True" OnSelectedIndexChanged="ShpTypeList_SelectedIndexChanged">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="JobType" runat="server">JobType</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="JobTypeList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="TptTypeLbl" runat="server">TptType</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="TptTypeList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <%--<td class="style1">
                    <asp:Label ID="TripType" runat="server">TripType</asp:Label>
                </td>--%>
                    <%--<td class="style1">
                    <asp:DropDownList ID="TripTypeList" runat="server" Enabled="True" DataTextField="Descr"
                        DataValueField="item" Width="150px">
                    </asp:DropDownList>
                </td>--%>
                    <td style="padding-top:15px">
                        <asp:Label ID="ctnrnolbl" runat="server">CtnrNo</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="VehNo" runat="server">VehicleNo</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="VehNoList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="TrailerNoLbl" runat="server">TrailerNo</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="TrailerNoList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="code" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top:15px">
                        <asp:Label ID="FromDate" runat="server">FromDate</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDatePicker ID="FrDateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="155">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="CustRef" runat="server">CustRef</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadTextBox ID="CustRefTxt" runat="server" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="PICLbl" runat="server">PIC</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="PICList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top:15px">
                        <asp:Label ID="ToDate" runat="server">ToDate</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDatePicker ID="ToDateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                            DateInput-DisplayDateFormat="dd/MMM/yyyy 23:59:59" Skin="Office2007" Width="155">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="Label4" runat="server">AM/PM</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="AMPMList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="Addr" runat="server">Addr</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadTextBox ID="AddrTxt" runat="server" TextMode="MultiLine" Skin="WebBlue" Width="150px"></telerik:RadTextBox>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="RefreshLbl" runat="server">Refresh</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="RefreshList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr"
                            DataValueField="Item" Width="150px">
                        </telerik:RadDropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td style="width: 150px">&nbsp;</td>
                </tr>
                <tr>
                    <td style="padding-top:15px">
                        <asp:Label ID="Label1" runat="server">Vessel</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadTextBox runat="server" ID="VesselTxt" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="Label2" runat="server">Voyage</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadTextBox runat="server" ID="VoyageTxt" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="Label6" runat="server">ETAFrDate</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDatePicker ID="FrETADateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="155">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="Label7" runat="server">ETAToDate</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDatePicker ID="ToETADateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                            DateInput-DisplayDateFormat="dd/MMM/yyyy 23:59:59" Skin="Office2007" Width="155">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="padding-top:15px">
                        <asp:Label ID="Route" runat="server">Route</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="RouteList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </telerik:RadDropDownList>
                        <br />
                    </td>
                    <td style="padding-top:15px">
                        <asp:Label ID="Label5" runat="server">PlannedTrip</asp:Label>
                    </td>
                    <td style="padding-top:15px">
                        <telerik:RadDropDownList ID="PlannedTripDDL" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </telerik:RadDropDownList>
                    </td>
                    <td colspan="6" style="padding-top:15px">
                        <asp:CheckBox ID="leg1chkbox" runat="server" Text="Leg1Completed" />
                        &nbsp;
                    <asp:CheckBox ID="exclComp" runat="server" Checked="True" Text="ExclCompleted" />&nbsp;
                    <asp:CheckBox ID="exclCanc" runat="server" Checked="True" Text="ExclCancelled" />&nbsp;
                    <asp:CheckBox ID="exclInv" runat="server" Checked="True" Text="ExclInvoiced" />&nbsp;
                    <asp:CheckBox ID="onlyspecchkbox" runat="server" Checked="false"
                        Text="Only Special Account" />
                    </td>
                </tr>
            </table>
            <br />
            <%--Ticket #4659: SMPL : Enhancement to Trip Planning V3 module (with configurable column sequence) PT 74--%>
        </div>
        <table>
            <tr>
                <td align="left">
                    <telerik:RadButton ID="MassChangeResource" runat="server" CssClass="detailButton"
                        OnClick="ChangeResourceBtn_Click" Text="ChangeResource" Skin="WebBlue" Visible="false" />
                    &nbsp;
                <telerik:RadButton ID="MassChangeBtn" runat="server" Text="ChangeSchedule" Visible="false"
                    CssClass="detailButton" Skin="WebBlue" OnClick="MassChangeBtn_Click">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="MassDetourBtn" runat="server" Text="Detour" Visible="false"
                    CssClass="detailButton" Skin="WebBlue" OnClick="MassDetourBtn_Click">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="filteringBtn" runat="server" Text="On/Off Filtering" Visible="false"
                    CssClass="detailButton" Skin="WebBlue" OnClick="filteringBtn_Click">
                </telerik:RadButton>
                    &nbsp;
                <%--<asp:Button ID="ChangeJobBtn" runat="server" Text="ChangeJob" Visible="false" CssClass="detailButton"
                    OnClick="ChangeJobBtn_Click"></asp:Button>--%>
                    <asp:Button ID="switchEqpBtn" runat="server" Text="Switch-Eqp" Visible="False" CssClass="detailButton"
                        OnClick="switchBtn_Click"></asp:Button>&nbsp;
                <asp:Button ID="CompleteAllBtn" runat="server" BackColor="Red" CssClass="detailbutton"
                    Visible="false" Text="CompletedAll" OnClick="CompleteAllBtn_Click" ForeColor="White"
                    TabIndex="999"></asp:Button>
                    &nbsp;
                <telerik:RadButton ID="StatusOpenBtn" runat="server" OnClick="Status10OpenBtn_Click" Text="10-Open"
                    ToolTip="10-Open" ButtonType="LinkButton">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="ReleasedBtn" runat="server" OnClick="ReleasedBtn_Click" Text="11-Released"
                    ToolTip="11-Released" ButtonType="LinkButton">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="DischargedBtn" runat="server" OnClick="DischargedBtn_Click"
                    Text="12-Discharged" ToolTip="12-Discharged" ButtonType="LinkButton" Visible="true">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="WhsBtn" runat="server" OnClick="WhsBtn_Click" Text="13-WHSE"
                    ToolTip="13-WHSE" ButtonType="LinkButton" Visible="false">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="EmptiedBtn" runat="server" OnClick="EmptiedBtn_Click" Text="15-Emptied"
                    ToolTip="15-Emptied" ButtonType="LinkButton">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="ProcessedBtn" runat="server" OnClick="ProcessedBtn_Click"
                    ToolTip="17-Processed" Text="17-Processed" ButtonType="LinkButton">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="ExportBtn" runat="server" OnClick="ExportBtn_Click" Text="18-R.Export"
                    ToolTip="18-R.Export" ButtonType="LinkButton">
                </telerik:RadButton>
                    &nbsp;
                <%--<asp:Button ID="btnReleased" runat="server" Text="On/Off Filtering" Visible="false"
                    CssClass="detailButton" OnClick="btnReleased_Click"></asp:Button>--%>
                    <%--<asp:Button ID="btnProcessed" runat="server" Text="On/Off Filtering" Visible="false"
                    CssClass="detailButton" OnClick="btnProcessed_Click"></asp:Button>--%>
                </td>
            </tr>
        </table>
        <br />
        <%-- <div id="div-datagrid" style="height: 400 px">--%>
        <div style="height: 700px; width: 100%" id="gridContainer">
            <telerik:RadGrid ID="ResultRadGrid" runat="server" AutoGenerateColumns="false" OnPreRender="ResultRadGrid_PreRender"
                AllowSorting="true" BorderStyle="Solid" Skin="Metro" OnSortCommand="ResultRadGrid_SortCommand"
                OnNeedDataSource="ResultRadGrid_NeedDataSource" OnItemDataBound="ResultRadGrid_ItemDataBound"
                AllowFilteringByColumn="true">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" Selecting-AllowRowSelect="true">
                    <Scrolling AllowScroll="true" ScrollHeight="630px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle></AlternatingItemStyle>
                <ItemStyle></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <label id="completelbl">
                                </label>
                                &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <nobr>
                                <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                                <asp:Label ID="DetailLbl" runat="server" Visible="false"></asp:Label>
                                <a id="TripDetlEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="CtnrTripDetail_Edit"
                                    runat="server">
                                    <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                        title="Edit" runat="server" /></a>
                                <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm copy?')"
                                    onserverclick="CtnrTripDetail_Copy" runat="server">
                                    <img id="Img1" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy exact" title="Copy exact"
                                        runat="server" /></a> <a id="A1" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                            onclick="return confirm('Confirm copy with reverse address?')" onserverclick="CtnrTripDetail_CopyRA"
                                            runat="server">
                                            <img id="Img2" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy reverse address" title="Copy reverse address"
                                                runat="server" /></a> 
                                                <a id="A2" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="CtnrTripDetail_Detour" runat="server">
                                                    <img id="Img3" src="../../image\detour.png" width="15" height="15" border="0" alt="Detour" title="Detour" visible ="false"
                                                        runat="server" /></a>
                                                        
                                                        <%--Ticket #4659: SMPL : Enhancement to Trip Planning V3 module (with configurable column sequence) PT 68--%>
                                                        <asp:Image id="explosiveImg" src="../../image/explosive.png" width="15" height="15" border="0" alt="Explosive" title="DG"
                                                        visible="false" runat="server" />
                                                        <%--End of Added by JL--%>
                                                        
                                <asp:Label ID="AttcLbl" runat="server"></asp:Label>
                                <asp:Label ID="DMWTLbl" runat="server"></asp:Label>
                                <asp:Label ID="ESNLbl" runat="server"></asp:Label>
                                <asp:Label ID="RedFlagLbl" runat="server"></asp:Label>
                                <asp:Label ID="imptLbl" runat="server"></asp:Label>
                                <asp:Image id="lightningImg" src="../../image/lightning.png" width="15" height="15" border="0" alt="Explosive" title="DG"
                                                        visible="false" runat="server" />
                            </nobr>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="#" UniqueName="sno" Reorderable="false" AllowFiltering="false">
                            <ItemTemplate>
                                <%# (Container.ItemIndex + (ResultRadGrid.CurrentPageIndex * ResultRadGrid.PageSize) + 1).ToString()%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" ColumnGroupName="jobno"
                            SortExpression="jobno" UniqueName="JobNo" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Account" DataField="accode" ColumnGroupName="accode"
                            SortExpression="accode" UniqueName="Account" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Vsl" DataField="outvessel" ColumnGroupName="outvessel"
                            SortExpression="outvessel" UniqueName="Vsl" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Voy" DataField="outvoyage" AllowFiltering="false"
                            ColumnGroupName="outvoyage" SortExpression="outvoyage" UniqueName="Voy" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="StevedoreName" DataField="StevedoreName" AllowFiltering="false"
                            ColumnGroupName="StevedoreName" SortExpression="StevedoreName" UniqueName="StevedoreName" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ConnStevedoreName" DataField="ConnStevedoreName" AllowFiltering="false"
                            ColumnGroupName="ConnStevedoreName" SortExpression="ConnStevedoreName" UniqueName="ConnStevedoreName" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ETA" DataField="ineta" AllowFiltering="false"
                            ColumnGroupName="ineta" SortExpression="ineta" UniqueName="ETA" Reorderable="true"
                            Display="false" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CtnrNo" DataField="ctnrno" ColumnGroupName="ctnrno"
                            SortExpression="ctnrno" UniqueName="CtnrNo" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SealNo" DataField="sealno" ColumnGroupName="sealno"
                            SortExpression="sealno" UniqueName="SealNo" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="ctnrtypedescr" ColumnGroupName="ctnrtypedescr"
                            SortExpression="ctnrtypedescr" UniqueName="BillSizeType" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Wt" DataField="actwt" AllowFiltering="false"
                            ColumnGroupName="actwt" ItemStyle-HorizontalAlign="Center" SortExpression="actwt"
                            UniqueName="Wt" Reorderable="true" Display="false" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Wt" DataField="expwt" AllowFiltering="false"
                            ColumnGroupName="expwt" ItemStyle-HorizontalAlign="Center" SortExpression="expwt"
                            UniqueName="ExpWt" Reorderable="true" Display="false" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CtnrWt" DataField="ctnrwt" AllowFiltering="false"
                            ColumnGroupName="ctnrwt" ItemStyle-HorizontalAlign="Center" SortExpression="ctnrwt"
                            UniqueName="CtnrWt" Reorderable="true" Display="false" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PermitNo" DataField="permitno" ColumnGroupName="permitno"
                            SortExpression="permitno" UniqueName="PermitNo" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="FrAddr" DataField="FrSvcPtorFrAddr" AllowFiltering="false"
                            ColumnGroupName="FrSvcPtorFrAddr" SortExpression="FrSvcPtorFrAddr" UniqueName="FrAddr"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ToAddr" DataField="ToSvcPtorToAddr" AllowFiltering="false"
                            ColumnGroupName="ToSvcPtorToAddr" SortExpression="ToSvcPtorToAddr" UniqueName="ToAddr"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="YardLocation" DataField="cellno" ColumnGroupName="cellno"
                            SortExpression="cellno" UniqueName="YardLocation" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PSAStoreRent" DataField="ctnrfreestorageexpirydate"
                            ColumnGroupName="ctnrfreestorageexpirydate" SortExpression="ctnrfreestorageexpirydate"
                            UniqueName="PSAStoreRent" Reorderable="true" Display="false" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BookingRef" DataField="bookingref" ColumnGroupName="bookingref"
                            SortExpression="bookingref" UniqueName="BookingRef" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ImportDate" DataField="importdate" ColumnGroupName="importdate"
                            SortExpression="importdate" UniqueName="ImportDate" Reorderable="true" Display="false"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ImportVeh" DataField="importvehno" ColumnGroupName="importvehno"
                            SortExpression="importvehno" UniqueName="ImportVeh" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="B/L" DataField="outmshipdocno" ColumnGroupName="outmshipdocno"
                            SortExpression="outmshipdocno" UniqueName="B/L" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DetentionExpDate" DataField="ctnrdetentionexpirydate"
                            ColumnGroupName="ctnrdetentionexpirydate" SortExpression="ctnrdetentionexpirydate"
                            UniqueName="DetentionExpDate" Reorderable="true" Display="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="C/EDate" DataField="cedate" ColumnGroupName="cedate"
                            SortExpression="cedate" UniqueName="C/EDate" Reorderable="true" Display="false"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="C/EVeh" DataField="cevehno" ColumnGroupName="cevehno"
                            SortExpression="cevehno" UniqueName="C/EVeh" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Date" DataField="frexpdate" ColumnGroupName="frexpdate"
                            SortExpression="frexpdate" UniqueName="Date" Reorderable="true" Display="false"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Time" DataField="fracttimedescr" ColumnGroupName="fracttimedescr"
                            SortExpression="fracttimedescr" UniqueName="Time" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Time" DataField="frexptime" ColumnGroupName="frexptime"
                            SortExpression="frexptime" UniqueName="StartTime" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" ColumnGroupName="statusdescr"
                            SortExpression="statusdescr" UniqueName="Status" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TripType" DataField="type" ColumnGroupName="type"
                            SortExpression="type" UniqueName="TripType" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="B/L" DataField="BLNO" ColumnGroupName="BLNO"
                            SortExpression="BLNO" UniqueName="B/L" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CustRef" DataField="exref1" ColumnGroupName="exref1"
                            SortExpression="exref1" UniqueName="CustRef" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehnodescr" ColumnGroupName="vehnodescr"
                            SortExpression="vehnodescr" UniqueName="VehNo" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TrailerNo" DataField="trailerno" ColumnGroupName="trailerno"
                            SortExpression="trailerno" UniqueName="TrailerNo" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="AssignDriver" DataField="pername" ColumnGroupName="pername"
                            SortExpression="pername" UniqueName="AssignDriver" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Vol" DataField="actvol" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center" ColumnGroupName="actvol" SortExpression="actvol"
                            UniqueName="Vol" Reorderable="true" Display="false" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Pkg" DataField="actpkg" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center" ColumnGroupName="actpkg" SortExpression="actpkg"
                            UniqueName="Pkg" Reorderable="true" Display="false" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Plt" DataField="actplt" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center" ColumnGroupName="actplt" SortExpression="actplt"
                            UniqueName="Plt" Reorderable="true" Display="false" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Descr" DataField="jobdescr" AllowFiltering="false"
                            ColumnGroupName="jobdescr" SortExpression="jobdescr" UniqueName="Descr" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Reason" DataField="reasondescr" AllowFiltering="false"
                            ColumnGroupName="reasondescr" SortExpression="reasondescr" UniqueName="Reason"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Remarks(forDriver)" DataField="remarks" AllowFiltering="false"
                            ColumnGroupName="remarks" SortExpression="remarks" UniqueName="Remarks" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Remarks2" DataField="remarks2" AllowFiltering="false"
                            ColumnGroupName="remarks2" SortExpression="remarks2" UniqueName="Remarks2" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Route" DataField="route" ColumnGroupName="routedescr"
                            SortExpression="routedescr" UniqueName="Route" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TrailerAddr" DataField="traileraddr" AllowFiltering="false"
                            ColumnGroupName="traileraddr" SortExpression="traileraddr" UniqueName="TrailerAddr"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TrailerDate" DataField="trailerdate" AllowFiltering="false"
                            ColumnGroupName="trailerdate" SortExpression="trailerdate" UniqueName="TrailerDate"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="GeoLat" DataField="trailergeolat" AllowFiltering="false"
                            ColumnGroupName="trailergeolat" SortExpression="trailergeolat" UniqueName="GeoLat"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="GeoLng" DataField="trailergeolng" AllowFiltering="false"
                            ColumnGroupName="trailergeolng" SortExpression="trailergeolng" UniqueName="GeoLng"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TptType" DataField="jbctpttype" ColumnGroupName="jbctpttype"
                            SortExpression="jbctpttype" UniqueName="TptType" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ShippingLine" DataField="carriername" ColumnGroupName="carriername"
                            SortExpression="carriername" UniqueName="ShippingLine" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="JbType" DataField="jobtype" ColumnGroupName="jobtype"
                            SortExpression="jobtype" UniqueName="JbType" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PickDropDate" DataField="trailerdate" ColumnGroupName="trailerdate"
                            SortExpression="trailerdate" UniqueName="PickDropDate" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="FrSvcPt" DataField="frserviceptdescr" AllowFiltering="false"
                            ColumnGroupName="frserviceptdescr" SortExpression="frserviceptdescr" UniqueName="FrSvcPt"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ToSvcPt" DataField="toserviceptdescr" AllowFiltering="false"
                            ColumnGroupName="toserviceptdescr" SortExpression="toserviceptdescr" UniqueName="ToSvcPt"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="NoOfPkg" DataField="noofpkg" AllowFiltering="false"
                            DataFormatString="{0:#,0.##}" ColumnGroupName="noofpkg" SortExpression="noofpkg"
                            UniqueName="NoOfPkg" Reorderable="true" ItemStyle-HorizontalAlign="Center" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PickDrop" DataField="trailerpickdrop" AllowFiltering="false"
                            ColumnGroupName="trailerpickdrop" SortExpression="trailerpickdrop" UniqueName="PickDrop"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EqpRemarks" DataField="eqpremarks" AllowFiltering="false"
                            ColumnGroupName="eqpremarks" SortExpression="eqpremarks" UniqueName="EqpRemarks"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="OrderBy" DataField="orderby" ColumnGroupName="orderby"
                            SortExpression="orderby" UniqueName="OrderBy" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ConfigMode" DataField="configmode" AllowFiltering="false"
                            ColumnGroupName="configmode" SortExpression="configmode" UniqueName="ConfigMode"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ImportEdoAsn/UCI" DataField="inedoasn" AllowFiltering="false"
                            ColumnGroupName="inedoasn" SortExpression="inedoasn" UniqueName="inedoasn" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ExportEsnAsn/UCI" DataField="outesnasn" AllowFiltering="false"
                            ColumnGroupName="outesnasn" SortExpression="outesnasn" UniqueName="outesnasn"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="JobSpecialInstr" DataField="JobSpecialInstruction"
                            AllowFiltering="false" ColumnGroupName="JobSpecialInstruction" SortExpression="JobSpecialInstruction"
                            UniqueName="JobSpecialInstruction" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbctnrid" UniqueName="jbctnrid" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sindex" UniqueName="sindex" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="typedescr" UniqueName="triptypedescr" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="esnstatus" UniqueName="esn" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbceqptype" UniqueName="jbceqptype" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbid" UniqueName="jbid" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="reasoncode" UniqueName="reasoncode" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" UniqueName="statusitem" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="cellno" UniqueName="cellno" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="fracttime" UniqueName="fracttime" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="WMSStatus" UniqueName="WMSStatus" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbcshtype" UniqueName="jbcshtype" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="JobTypeIsImportant" UniqueName="JobTypeIsImportant"
                            Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DepartDate" DataField="fractdate" ColumnGroupName="fractdate"
                            SortExpression="fractdate" UniqueName="DepartDate" Reorderable="true" Display="false"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CompletedDate" DataField="toactdate" ColumnGroupName="toactdate"
                            SortExpression="toactdate" UniqueName="CompletedDate" Reorderable="true" Display="false"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ArrivalDate" DataField="frexpdate" ColumnGroupName="frexpdate"
                            SortExpression="frexpdate" UniqueName="ArrivalDate" Reorderable="true" Display="false"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ETD" DataField="outetd" ColumnGroupName="outetd"
                            SortExpression="outetd" UniqueName="ETD" Reorderable="true" Display="false" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BookingTime" DataField="jbcbookingtime" ColumnGroupName="jbcbookingtime"
                            SortExpression="jbcbookingtime" UniqueName="BookingTime" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SvcChit" DataField="svcchitno" ColumnGroupName="svcchitno"
                            SortExpression="svcchitno" UniqueName="SvcChit" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="VehPark" DataField="vehparkcode" ColumnGroupName="vehparkcode"
                            SortExpression="vehparkcode" UniqueName="VehPark" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Carrier" DataField="carriername" ColumnGroupName="carriername"
                            SortExpression="carriername" UniqueName="Carrier" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="JobGoodsDescription" DataField="jobgoodsdescr"
                            ColumnGroupName="jobgoodsdescr" SortExpression="jobgoodsdescr" UniqueName="JobGoodsDescription"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Account-OrderBy" DataField="accodeorderby" ColumnGroupName="accodeorderby"
                            SortExpression="accodeorderby" UniqueName="Account-OrderBy" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="VesselInfo" DataField="vesselinfo" ColumnGroupName="vesselinfo"
                            SortExpression="vesselinfo" UniqueName="VesselInfo" Reorderable="true" Display="false">
                            <ItemStyle Wrap="false" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BookingPOD" DataField="BKrefPOD" ColumnGroupName="BKrefPOD"
                            SortExpression="BKrefPOD" UniqueName="BookingPOD" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ImpExpASN" DataField="ImpExpASN" ColumnGroupName="ImpExpASN"
                            SortExpression="ImpExpASN" UniqueName="ImpExpASN" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ArrivalTime" DataField="ArrivalDateComp" ColumnGroupName="ArrivalDateComp"
                            SortExpression="ArrivalDateComp" UniqueName="ArrivalTime" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DepartTime" DataField="DepartDateComp" ColumnGroupName="DepartDateComp"
                            SortExpression="DepartDateComp" UniqueName="DepartTime" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CompTime" DataField="CompDateComp" ColumnGroupName="CompDateComp"
                            SortExpression="CompDateComp" UniqueName="CompTime" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Shipper" DataField="exportername" ColumnGroupName="exportername"
                            SortExpression="exportername" UniqueName="Shipper" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ActNoOfPkg" DataField="actpkg" AllowFiltering="false"
                            DataFormatString="{0:#,0.##}" ColumnGroupName="actpkg" SortExpression="actpkg"
                            UniqueName="ActNoOfPkg" Reorderable="true" ItemStyle-HorizontalAlign="Center"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="NoOfPlt" DataField="noofplt" AllowFiltering="false"
                            DataFormatString="{0:#,0.##}" ColumnGroupName="noofplt" SortExpression="noofplt"
                            UniqueName="NoOfPlt" Reorderable="true" ItemStyle-HorizontalAlign="Center" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EqpGoodsDescription" DataField="EqpGoodsDescr"
                            ColumnGroupName="EqpGoodsDescr" SortExpression="EqpGoodsDescr" UniqueName="EqpGoodsDescription"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="AllRemarks" DataField="allremarks" ItemStyle-Width="300px"
                            ColumnGroupName="allremarks" SortExpression="allremarks" UniqueName="AllRemarks"
                            Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UploadDate" DataField="frexpdate" ColumnGroupName="frexpdate"
                            SortExpression="frexpdate" UniqueName="UploadDate" Reorderable="true" Display="false"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UploadTime" DataField="frexptime" ColumnGroupName="frexptime"
                            SortExpression="frexptime" UniqueName="UploadTime" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ActualCompletedDate" DataField="fractdate" ColumnGroupName="fractdate"
                            SortExpression="fractdate" UniqueName="ActualCompletedDate" Reorderable="true"
                            Display="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ActualCompletedTime" DataField="fracttime" ColumnGroupName="fracttime"
                            SortExpression="fracttime" UniqueName="ActualCompletedTime" Reorderable="true"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbcisimpt" ColumnGroupName="jbcisimpt" SortExpression="jbcisimpt"
                            UniqueName="jbcisimpt" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PortNetNo" DataField="exref2" ColumnGroupName="exref2"
                            SortExpression="exref2" UniqueName="PortNetNo" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Escort" DataField="escort" AllowFiltering="false"
                            ColumnGroupName="escort" SortExpression="escort" UniqueName="Escort" Reorderable="true"
                            ItemStyle-HorizontalAlign="Center" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="POD" DataField="POD" ColumnGroupName="POD"
                            SortExpression="POD" UniqueName="POD" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Modal="true" VisibleStatusbar="false" 
            OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
