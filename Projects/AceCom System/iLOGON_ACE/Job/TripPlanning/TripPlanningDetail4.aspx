<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningDetail4.aspx.cs" Inherits="iWMS.Web.Job.TripPlanning.TripPlanningDetail4" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
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
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function onGridCreated(sender, args) {
                $telerik.$(sender.GridDataDiv).on("scroll", function (a, b, e) {
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
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td class="NewModuleTitle" align="right">
                        <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server">Trip Planning V4</asp:Label>
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
                                    <asp:Button runat="server" ID="refreshBtn" CssClass="white" OnClick="refreshBtn_Click" Text="Refresh"></asp:Button>
                                    &nbsp;                                    
                                    <asp:Button ID="ExcelBtn" runat="server" Text="Excel" OnClick="ExcelBtn_Click" ToolTip="Export To Excel"
                                        CssClass="green"></asp:Button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <br />
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
                    <td style="padding-top:10px">
                        <asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadComboBox ID="AccountList" runat="server" Skin="WebBlue" Filter="Contains" Width="150px"
                            OnSelectedIndexChanged="AccountList_SelectedIndexChanged" AutoPostBack="True">
                        </telerik:RadComboBox>
                    </td>
                    <td style="padding-top:10px">
                        <asp:Label ID="Label3" runat="server">JobNo</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadTextBox ID="JobNoTxt" runat="server" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td style="padding-top:10px">
                        <asp:Label ID="Status" runat="server">Status</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadDropDownList ID="StatusList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                        <br />
                    </td>
                    <td rowspan="4" colspan="4" style="padding-top:10px">
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
                </tr>
                <tr>
                    <td style="padding-top:10px">
                        <asp:Label ID="ShpTypeLbl" runat="server">ShipmentType</asp:Label>
                    </td>
                    <td>
                        <telerik:RadDropDownList ID="ShpTypeList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue" AutoPostBack="True" OnSelectedIndexChanged="ShpTypeList_SelectedIndexChanged">
                        </telerik:RadDropDownList>
                    </td>
                    <td>
                        <asp:Label ID="JobType" runat="server">JobType</asp:Label>
                    </td>
                    <td>
                        <telerik:RadDropDownList ID="JobTypeList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </telerik:RadDropDownList>
                    </td>
                    <td>
                        <asp:Label ID="TptTypeLbl" runat="server">TptType</asp:Label>
                    </td>
                    <td>
                        <telerik:RadDropDownList ID="TptTypeList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ctnrnolbl" runat="server">CtnrNo</asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td>
                        <asp:Label ID="VehNo" runat="server">VehicleNo</asp:Label>
                    </td>
                    <td>
                        <telerik:RadDropDownList ID="VehNoList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                    </td>
                    <td>
                        <asp:Label ID="TrailerNoLbl" runat="server">TrailerNo</asp:Label>
                    </td>
                    <td>
                        <telerik:RadDropDownList ID="TrailerNoList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="code" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="FromDate" runat="server">FromDate</asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="FrDateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="155">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </td>
                    <td>
                        <asp:Label ID="CustRef" runat="server">CustRef</asp:Label>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="CustRefTxt" runat="server" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td>
                        <asp:Label ID="PICLbl" runat="server">PIC</asp:Label>
                    </td>
                    <td>
                        <telerik:RadDropDownList ID="PICList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top:10px">
                        <asp:Label ID="ToDate" runat="server">ToDate</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadDatePicker ID="ToDateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                            DateInput-DisplayDateFormat="dd/MMM/yyyy 23:59:59" Skin="Office2007" Width="155">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </td>
                    <td style="padding-top:10px">
                        <asp:Label ID="Label4" runat="server">AM/PM</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadDropDownList ID="AMPMList" runat="server" Enabled="True" DataTextField="Descr"
                            DataValueField="item" Width="150px" Skin="WebBlue">
                        </telerik:RadDropDownList>
                    </td>
                    <td style="padding-top:10px">
                        <asp:Label ID="Addr" runat="server">Addr</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadTextBox ID="AddrTxt" runat="server" TextMode="MultiLine" Skin="WebBlue" Width="150px"></telerik:RadTextBox>
                    </td>
                    <td style="padding-top:10px">
                        <asp:Label ID="RefreshLbl" runat="server">Refresh</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadDropDownList ID="RefreshList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr" AutoPostBack="true"
                            DataValueField="Item" Width="150px">
                        </telerik:RadDropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td style="width: 150px">&nbsp;</td>
                </tr>
                <tr>
                    <td style="padding-top:10px">
                        <asp:Label ID="Label1" runat="server">Vessel</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadTextBox runat="server" ID="VesselTxt" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td style="padding-top:10px">
                        <asp:Label ID="Label2" runat="server">Voyage</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadTextBox runat="server" ID="VoyageTxt" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                    </td>
                    <td style="padding-top:10px">
                        <asp:Label ID="Label6" runat="server">ETAFrDate</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadDatePicker ID="FrETADateTxt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="155">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </td>
                    <td style="padding-top:10px">
                        <asp:Label ID="Label7" runat="server">ETAToDate</asp:Label>
                    </td>
                    <td style="padding-top:10px">
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
                    <td style="padding-top:10px">
                        <asp:Label ID="Route" runat="server">Route</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadDropDownList ID="RouteList" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </telerik:RadDropDownList>
                        <br />
                    </td>
                    <td style="padding-top:10px">
                        <asp:Label ID="Label5" runat="server">PlannedTrip</asp:Label>
                    </td>
                    <td style="padding-top:10px">
                        <telerik:RadDropDownList ID="PlannedTripDDL" runat="server" Enabled="True" Skin="WebBlue" DataTextField="Descr"
                            DataValueField="item" Width="150px">
                        </telerik:RadDropDownList>
                    </td>
                    <td colspan="6" style="padding-top:10px">
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
        </div>
        <table>
            <tr>
                <td align="left">&nbsp;
                    <asp:Button ID="MassChangeResource" runat="server" Text="Resource" OnClick="ChangeResourceBtn_Click" Visible="false"
                        CssClass="white"></asp:Button>
                    &nbsp;               
                    <asp:Button ID="MassChangeBtn" runat="server" Text="Schedule" OnClick="MassChangeBtn_Click" Visible="false"
                        CssClass="white"></asp:Button>
                    &nbsp;              
                    <asp:Button ID="MassDetourBtn" runat="server" Text="Detour" OnClick="MassDetourBtn_Click" Visible="false"
                        CssClass="white"></asp:Button>
                    &nbsp;                
                    <asp:Button ID="filteringBtn" runat="server" Text="Filter" OnClick="filteringBtn_Click" Visible="false"
                        CssClass="white"></asp:Button>
                    &nbsp;
                    <asp:Button ID="OfferBtn" runat="server" Text="Offer" OnClick="OfferBtn_Click" Visible="false"
                        CssClass="white"></asp:Button>
                    &nbsp;                    
                    <asp:Button ID="CompleteAllBtn" runat="server" BackColor="Red" CssClass="white"
                        Visible="false" Text="CompletedAll" OnClick="CompleteAllBtn_Click" ForeColor="White"
                        TabIndex="999"></asp:Button>
                    &nbsp;                
                    <asp:Button ID="StatusOpenBtn" runat="server" Text="10-Open" OnClick="Status10OpenBtn_Click"
                        CssClass="white" Visible="false"></asp:Button>
                    &nbsp;                
                    <asp:Button ID="ReleasedBtn" runat="server" Text="11-Released" OnClick="ReleasedBtn_Click"
                        CssClass="white" Visible="false"></asp:Button>
                    &nbsp;                
                    <asp:Button ID="DischargedBtn" runat="server" Text="12-Discharged" Width="100px" OnClick="DischargedBtn_Click"
                        CssClass="white" Visible="false"></asp:Button>
                    &nbsp;                
                    <asp:Button ID="WhsBtn" runat="server" Text="13-WHSE" OnClick="WhsBtn_Click"
                        CssClass="white" Visible="false"></asp:Button>
                    &nbsp;                
                    <asp:Button ID="EmptiedBtn" runat="server" Text="15-Emptied" OnClick="EmptiedBtn_Click"
                        CssClass="white" Visible="false"></asp:Button>
                    &nbsp;                
                    <asp:Button ID="ProcessedBtn" runat="server" Text="17-Processed" Width="100px" OnClick="ProcessedBtn_Click"
                        CssClass="white" Visible="false"></asp:Button>
                    &nbsp;                
                    <asp:Button ID="ExportBtn" runat="server" Text="18-R.Export" OnClick="ExportBtn_Click"
                        CssClass="white" Visible="false"></asp:Button>
                </td>
                <td align="right" style="width: 100px;">
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                </td>
            </tr>
        </table>
        <div style="height: 700px; width: 100%" id="gridContainer">
            <telerik:RadGrid ID="ResultRadGrid" runat="server" AutoGenerateColumns="false"
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
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Display="true">
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
                                                    <img id="Img3" src="../../image/detour.png" width="15" height="15" border="0" alt="Detour" title="Detour"
                                                        runat="server" /></a>                                                        
                                                        <asp:Image id="explosiveImg" src="../../image/explosive.png" width="15" height="15" border="0" alt="Explosive" title="DG"
                                                        visible="false" runat="server" />                                                        
                                <asp:Label ID="AttcLbl" runat="server"></asp:Label>
                                <asp:Label ID="DMWTLbl" runat="server"></asp:Label>
                                <asp:Label ID="ESNLbl" runat="server"></asp:Label>
                                <asp:Label ID="RedFlagLbl" runat="server"></asp:Label>
                                <asp:Label ID="imptLbl" runat="server"></asp:Label>
                            </nobr>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="#" UniqueName="sno" Reorderable="false" AllowFiltering="false" Display="true">
                            <ItemTemplate>
                                <%# (Container.ItemIndex + (ResultRadGrid.CurrentPageIndex * ResultRadGrid.PageSize) + 1).ToString()%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="TripId" DataField="id"
                            SortExpression="id" UniqueName="id" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" ColumnGroupName="jobno"
                            SortExpression="jobno" UniqueName="JobNo" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Account" DataField="accode" ColumnGroupName="accode"
                            SortExpression="accode" UniqueName="Account" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Vsl" DataField="outvessel" ColumnGroupName="outvessel"
                            SortExpression="outvessel" UniqueName="Vsl" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Voy" DataField="outvoyage" AllowFiltering="false"
                            ColumnGroupName="outvoyage" SortExpression="outvoyage" UniqueName="Voy" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="StevedoreName" DataField="StevedoreName" AllowFiltering="false"
                            ColumnGroupName="StevedoreName" SortExpression="StevedoreName" UniqueName="StevedoreName" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ConnStevedoreName" DataField="ConnStevedoreName" AllowFiltering="false"
                            ColumnGroupName="ConnStevedoreName" SortExpression="ConnStevedoreName" UniqueName="ConnStevedoreName" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ETA" DataField="ineta" AllowFiltering="false"
                            ColumnGroupName="ineta" SortExpression="ineta" UniqueName="ETA" Reorderable="true"
                            Display="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CtnrNo" DataField="ctnrno" ColumnGroupName="ctnrno"
                            SortExpression="ctnrno" UniqueName="CtnrNo" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SealNo" DataField="sealno" ColumnGroupName="sealno"
                            SortExpression="sealno" UniqueName="SealNo" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="ctnrtypedescr" ColumnGroupName="ctnrtypedescr"
                            SortExpression="ctnrtypedescr" UniqueName="BillSizeType" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Wt" DataField="actwt" AllowFiltering="false"
                            ColumnGroupName="actwt" ItemStyle-HorizontalAlign="Center" SortExpression="actwt"
                            UniqueName="Wt" Reorderable="true" Display="true" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Wt" DataField="expwt" AllowFiltering="false"
                            ColumnGroupName="expwt" ItemStyle-HorizontalAlign="Center" SortExpression="expwt"
                            UniqueName="ExpWt" Reorderable="true" Display="true" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CtnrWt" DataField="ctnrwt" AllowFiltering="false"
                            ColumnGroupName="ctnrwt" ItemStyle-HorizontalAlign="Center" SortExpression="ctnrwt"
                            UniqueName="CtnrWt" Reorderable="true" Display="true" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PermitNo" DataField="permitno" ColumnGroupName="permitno"
                            SortExpression="permitno" UniqueName="PermitNo" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="FrAddr" DataField="FrSvcPtorFrAddr" AllowFiltering="false"
                            ColumnGroupName="FrSvcPtorFrAddr" SortExpression="FrSvcPtorFrAddr" UniqueName="FrAddr"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ToAddr" DataField="ToSvcPtorToAddr" AllowFiltering="false"
                            ColumnGroupName="ToSvcPtorToAddr" SortExpression="ToSvcPtorToAddr" UniqueName="ToAddr"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="YardLocation" DataField="cellno" ColumnGroupName="cellno"
                            SortExpression="cellno" UniqueName="YardLocation" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PSAStoreRent" DataField="ctnrfreestorageexpirydate"
                            ColumnGroupName="ctnrfreestorageexpirydate" SortExpression="ctnrfreestorageexpirydate"
                            UniqueName="PSAStoreRent" Reorderable="true" Display="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BookingRef" DataField="bookingref" ColumnGroupName="bookingref"
                            SortExpression="bookingref" UniqueName="BookingRef" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ImportDate" DataField="importdate" ColumnGroupName="importdate"
                            SortExpression="importdate" UniqueName="ImportDate" Reorderable="true" Display="true"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ImportVeh" DataField="importvehno" ColumnGroupName="importvehno"
                            SortExpression="importvehno" UniqueName="ImportVeh" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DetentionExpDate" DataField="ctnrdetentionexpirydate"
                            ColumnGroupName="ctnrdetentionexpirydate" SortExpression="ctnrdetentionexpirydate"
                            UniqueName="DetentionExpDate" Reorderable="true" Display="true" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="C/EDate" DataField="cedate" ColumnGroupName="cedate"
                            SortExpression="cedate" UniqueName="C/EDate" Reorderable="true" Display="true"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="C/EVeh" DataField="cevehno" ColumnGroupName="cevehno"
                            SortExpression="cevehno" UniqueName="C/EVeh" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Date" DataField="frexpdate" ColumnGroupName="frexpdate"
                            SortExpression="frexpdate" UniqueName="Date" Reorderable="true" Display="true"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Time" DataField="fracttimedescr" ColumnGroupName="fracttimedescr"
                            SortExpression="fracttimedescr" UniqueName="Time" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Time" DataField="frexptime" ColumnGroupName="frexptime"
                            SortExpression="frexptime" UniqueName="StartTime" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" ColumnGroupName="statusdescr"
                            SortExpression="statusdescr" UniqueName="Status" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TripType" DataField="type" ColumnGroupName="type"
                            SortExpression="type" UniqueName="TripType" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CustRef" DataField="exref1" ColumnGroupName="exref1"
                            SortExpression="exref1" UniqueName="CustRef" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehnodescr" ColumnGroupName="vehnodescr"
                            SortExpression="vehnodescr" UniqueName="VehNo" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TrailerNo" DataField="trailerno" ColumnGroupName="trailerno"
                            SortExpression="trailerno" UniqueName="TrailerNo" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Driver" DataField="pername" ColumnGroupName="pername"
                            SortExpression="pername" UniqueName="AssignDriver" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Vol" DataField="actvol" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center" ColumnGroupName="actvol" SortExpression="actvol"
                            UniqueName="Vol" Reorderable="true" Display="true" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Pkg" DataField="actpkg" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center" ColumnGroupName="actpkg" SortExpression="actpkg"
                            UniqueName="Pkg" Reorderable="true" Display="true" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Plt" DataField="actplt" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center" ColumnGroupName="actplt" SortExpression="actplt"
                            UniqueName="Plt" Reorderable="true" Display="true" DataFormatString="{0:#,0.000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Descr" DataField="jobdescr" AllowFiltering="false"
                            ColumnGroupName="jobdescr" SortExpression="jobdescr" UniqueName="Descr" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Reason" DataField="reasondescr" AllowFiltering="false"
                            ColumnGroupName="reasondescr" SortExpression="reasondescr" UniqueName="Reason"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Remarks(forDriver)" DataField="remarks" AllowFiltering="false"
                            ColumnGroupName="remarks" SortExpression="remarks" UniqueName="Remarks" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Remarks2" DataField="remarks2" AllowFiltering="false"
                            ColumnGroupName="remarks2" SortExpression="remarks2" UniqueName="Remarks2" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Route" DataField="routedescr" ColumnGroupName="routedescr"
                            SortExpression="routedescr" UniqueName="Route" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TrailerAddr" DataField="traileraddr" AllowFiltering="false"
                            ColumnGroupName="traileraddr" SortExpression="traileraddr" UniqueName="TrailerAddr"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TrailerDate" DataField="trailerdate" AllowFiltering="false"
                            ColumnGroupName="trailerdate" SortExpression="trailerdate" UniqueName="TrailerDate"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="GeoLat" DataField="trailergeolat" AllowFiltering="false"
                            ColumnGroupName="trailergeolat" SortExpression="trailergeolat" UniqueName="GeoLat"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="GeoLng" DataField="trailergeolng" AllowFiltering="false"
                            ColumnGroupName="trailergeolng" SortExpression="trailergeolng" UniqueName="GeoLng"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TptType" DataField="jbctpttype" ColumnGroupName="jbctpttype"
                            SortExpression="jbctpttype" UniqueName="TptType" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ShippingLine" DataField="carriername" ColumnGroupName="carriername"
                            SortExpression="carriername" UniqueName="ShippingLine" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="JbType" DataField="jobtype" ColumnGroupName="jobtype"
                            SortExpression="jobtype" UniqueName="JbType" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PickDropDate" DataField="trailerdate" ColumnGroupName="trailerdate"
                            SortExpression="trailerdate" UniqueName="PickDropDate" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="FrSvcPt" DataField="frserviceptdescr" AllowFiltering="false"
                            ColumnGroupName="frserviceptdescr" SortExpression="frserviceptdescr" UniqueName="FrSvcPt"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ToSvcPt" DataField="toserviceptdescr" AllowFiltering="false"
                            ColumnGroupName="toserviceptdescr" SortExpression="toserviceptdescr" UniqueName="ToSvcPt"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="NoOfPkg" DataField="noofpkg" AllowFiltering="false"
                            DataFormatString="{0:#,0.##}" ColumnGroupName="noofpkg" SortExpression="noofpkg"
                            UniqueName="NoOfPkg" Reorderable="true" ItemStyle-HorizontalAlign="Center" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PickDrop" DataField="trailerpickdrop" AllowFiltering="false"
                            ColumnGroupName="trailerpickdrop" SortExpression="trailerpickdrop" UniqueName="PickDrop"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EqpRemarks" DataField="eqpremarks" AllowFiltering="false"
                            ColumnGroupName="eqpremarks" SortExpression="eqpremarks" UniqueName="EqpRemarks"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="OrderBy" DataField="orderby" ColumnGroupName="orderby"
                            SortExpression="orderby" UniqueName="OrderBy" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ConfigMode" DataField="configmode" AllowFiltering="false"
                            ColumnGroupName="configmode" SortExpression="configmode" UniqueName="ConfigMode"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ImportEdoAsn/UCI" DataField="inedoasn" AllowFiltering="false"
                            ColumnGroupName="inedoasn" SortExpression="inedoasn" UniqueName="inedoasn" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ExportEsnAsn/UCI" DataField="outesnasn" AllowFiltering="false"
                            ColumnGroupName="outesnasn" SortExpression="outesnasn" UniqueName="outesnasn"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="JobSpecialInstr" DataField="JobSpecialInstruction"
                            AllowFiltering="false" ColumnGroupName="JobSpecialInstruction" SortExpression="JobSpecialInstruction"
                            UniqueName="JobSpecialInstruction" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbctnrid" UniqueName="jbctnrid" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sindex" UniqueName="sindex" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="typedescr" UniqueName="triptypedescr" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="esnstatus" UniqueName="esn" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbceqptype" UniqueName="jbceqptype" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbid" UniqueName="jbid" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="reasoncode" UniqueName="reasoncode" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" UniqueName="statusitem" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="cellno" UniqueName="cellno" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="fracttime" UniqueName="fracttime" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="JobTypeIsImportant" UniqueName="JobTypeIsImportant"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DepartDate" DataField="fractdate" ColumnGroupName="fractdate"
                            SortExpression="fractdate" UniqueName="DepartDate" Reorderable="true" Display="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CompletedDate" DataField="toactdate" ColumnGroupName="toactdate"
                            SortExpression="toactdate" UniqueName="CompletedDate" Reorderable="true" Display="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ArrivalDate" DataField="frexpdate" ColumnGroupName="frexpdate"
                            SortExpression="frexpdate" UniqueName="ArrivalDate" Reorderable="true" Display="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ETD" DataField="outetd" ColumnGroupName="outetd"
                            SortExpression="outetd" UniqueName="ETD" Reorderable="true" Display="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BookingTime" DataField="jbcbookingtime" ColumnGroupName="jbcbookingtime"
                            SortExpression="jbcbookingtime" UniqueName="BookingTime" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SvcChit" DataField="svcchitno" ColumnGroupName="svcchitno"
                            SortExpression="svcchitno" UniqueName="SvcChit" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="VehPark" DataField="vehparkcode" ColumnGroupName="vehparkcode"
                            SortExpression="vehparkcode" UniqueName="VehPark" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Carrier" DataField="carriername" ColumnGroupName="carriername"
                            SortExpression="carriername" UniqueName="Carrier" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="JobGoodsDescription" DataField="jobgoodsdescr"
                            ColumnGroupName="jobgoodsdescr" SortExpression="jobgoodsdescr" UniqueName="JobGoodsDescription"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Account-OrderBy" DataField="accodeorderby" ColumnGroupName="accodeorderby"
                            SortExpression="accodeorderby" UniqueName="Account-OrderBy" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="VesselInfo" DataField="vesselinfo" ColumnGroupName="vesselinfo"
                            SortExpression="vesselinfo" UniqueName="VesselInfo" Reorderable="true" Display="true">
                            <ItemStyle Wrap="false" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BookingPOD" DataField="BKrefPOD" ColumnGroupName="BKrefPOD"
                            SortExpression="BKrefPOD" UniqueName="BookingPOD" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ImpExpASN" DataField="ImpExpASN" ColumnGroupName="ImpExpASN"
                            SortExpression="ImpExpASN" UniqueName="ImpExpASN" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ArrivalTime" DataField="ArrivalDateComp" ColumnGroupName="ArrivalDateComp"
                            SortExpression="ArrivalDateComp" UniqueName="ArrivalTime" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DepartTime" DataField="DepartDateComp" ColumnGroupName="DepartDateComp"
                            SortExpression="DepartDateComp" UniqueName="DepartTime" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CompTime" DataField="CompDateComp" ColumnGroupName="CompDateComp"
                            SortExpression="CompDateComp" UniqueName="CompTime" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Shipper" DataField="exportername" ColumnGroupName="exportername"
                            SortExpression="exportername" UniqueName="Shipper" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ActNoOfPkg" DataField="actpkg" AllowFiltering="false"
                            DataFormatString="{0:#,0.##}" ColumnGroupName="actpkg" SortExpression="actpkg"
                            UniqueName="ActNoOfPkg" Reorderable="true" ItemStyle-HorizontalAlign="Center"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EqpGoodsDescription" DataField="EqpGoodsDescr"
                            ColumnGroupName="EqpGoodsDescr" SortExpression="EqpGoodsDescr" UniqueName="EqpGoodsDescription"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="AllRemarks" DataField="allremarks" ItemStyle-Width="300px"
                            ColumnGroupName="allremarks" SortExpression="allremarks" UniqueName="AllRemarks"
                            Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UploadDate" DataField="frexpdate" ColumnGroupName="frexpdate"
                            SortExpression="frexpdate" UniqueName="UploadDate" Reorderable="true" Display="true"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UploadTime" DataField="frexptime" ColumnGroupName="frexptime"
                            SortExpression="frexptime" UniqueName="UploadTime" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ActualCompletedDate" DataField="fractdate" ColumnGroupName="fractdate"
                            SortExpression="fractdate" UniqueName="ActualCompletedDate" Reorderable="true"
                            Display="true" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ActualCompletedTime" DataField="fracttime" ColumnGroupName="fracttime"
                            SortExpression="fracttime" UniqueName="ActualCompletedTime" Reorderable="true"
                            Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbcisimpt" ColumnGroupName="jbcisimpt" SortExpression="jbcisimpt"
                            UniqueName="jbcisimpt" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PortNetNo" DataField="exref2" ColumnGroupName="exref2"
                            SortExpression="exref2" UniqueName="PortNetNo" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Escort" DataField="escort" AllowFiltering="false"
                            ColumnGroupName="escort" SortExpression="escort" UniqueName="Escort" Reorderable="true"
                            ItemStyle-HorizontalAlign="Center" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="OfferStatus" DataField="offerstatusdescr" ColumnGroupName="OfferStatus"
                            SortExpression="offerstatusdescr" UniqueName="offerstatusdescr" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="OfferRemarks" DataField="OfferRemarks" ColumnGroupName="OfferRemarks"
                            SortExpression="OfferRemarks" UniqueName="OfferRemarks" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </form>
</body>
</html>
