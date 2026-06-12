<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterV4HeadDetl.aspx.cs" Inherits="iWMS.Web.Job.JobTripRegisterV4.JobTripRegisterV4HeadDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title id="JTListTitle" runat="server"></title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <style type="text/css">
        .style1 {
            width: 700px;
        }
    </style>
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function selectAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
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
    <style type="text/css">
        .style2 {
            width: 125px;
        }

        .break-word {
            max-width: 200px !important;
            white-space: normal;
            word-wrap: break-word;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <table border="0" id="table1" runat="server" width="100%">
            <tr id="TR" runat="server" class="tab">
                <td runat="server" valign="bottom" id="TD" class="style1"></td>
                <td class="NewModuleTitle" align="right" valign="bottom" id="TDM">
                    <asp:Label ID="Label1" runat="server">Job Trip Register V4</asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="MainPanel" runat="server">
            <table border="0">
                <tr>
                    <td>
                        <asp:Button ID="ExportExcelLnk" runat="server" Text="Excel" OnClick="ExportExcel"
                            CssClass="green" ToolTip="Export To Excel" />
                        &nbsp; 
                    </td>
                    <td>
                        <asp:Button ID="OpenBtn" CssClass="white" runat="server" OnClick="OpenBtn_Click"
                            Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="AssignBtn" CssClass="white" runat="server" OnClick="AssignBtn_Click"
                            Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="CompletedBtn" CssClass="white" runat="server" OnClick="CompletedBtn_Click"
                            Text="Completed" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="VoidBtn" CssClass="white" runat="server" OnClick="VoidBtn_Click"
                            Text="Void" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="CancelledBtn" CssClass="white" runat="server" OnClick="CancelledBtn_Click"
                            Text="Cancelled" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click"
                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="JobsheetBtn" CssClass="Blue" runat="server" OnClick="JobsheetBtn_Click"
                            Text="Jobsheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="DOBtn" CssClass="Blue" runat="server" OnClick="DOBtn_Click"
                            Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="ChangeResourceBtn" CssClass="white" runat="server" OnClick="ChangeResourceBtn_Click"
                            Text="Resource" ToolTip="ChangeResource" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="ChangeScheduleBtn" CssClass="white" runat="server" OnClick="ChangeScheduleBtn_Click"
                            Text="Schedule" ToolTip="ChangeSchedule" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="OfferBtn" CssClass="white" runat="server" OnClick="OfferBtn_Click"
                            Text="Offer" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;            
                    </td>
                    <%--<td>
                        <asp:Button ID="MergeBtn" CssClass="white" runat="server" OnClick="MergeBtn_Click"
                            Text="Merge" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;            
                    </td>--%>
                    <td>
                        <asp:Button ID="ShowHideBtn" runat="server" Text="Show/Hide" OnClick="ShowHideBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                        &nbsp;            
                    </td>
                    <td>
                        <asp:Button ID="PODRecvdBtn" runat="server" Text="POD" OnClick="PODRecvdBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                        &nbsp;            
                    </td>
                </tr>
            </table>

            <table border="0">
                <tr>
                    <td>
                        <br />
                        <asp:LinkButton class="btn btn-info btn-xs" runat="server" ID="PrevBtn" OnClick="PrevBtn_Click"><span class="glyphicon glyphicon-triangle-left"></span></asp:LinkButton>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Label ID="frdatelbl" runat="server" Text="StartDate"> 
                        </asp:Label>
                        <br />
                        <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
                            DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                            OnSelectedDateChanged="FromDateTxt_DateChanged" AutoPostBack="true">
                            <Calendar runat="server">
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </td>
                    <td>
                        <br />
                        <asp:LinkButton class="btn btn-info btn-xs" runat="server" ID="NextBtn" OnClick="NextBtn_Click"><span class="glyphicon glyphicon-triangle-right"></span></asp:LinkButton>
                        &nbsp;
                    </td>
                    <td>
                        <br />
                        <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
                            Text="CreateNew" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>&nbsp;  
              <br />

                        <asp:Label ID="ShTypeLbl" runat="server" class="pagetitle"></asp:Label>
                        <asp:Label ID="ShTypeHD" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblProcessID" runat="server" Visible="false">
                        </asp:Label>
                    </td>
                    <%--<td align="right" style="width: 710px;">
                        <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    </td>--%>
                </tr>
            </table>
            <br />
            <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
                CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
                <Tabs>
                    <telerik:RadTab ID="TripTab" Text="Trip" Value="0" readonly="readonly" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab ID="TripInfoTab" Text="TripInfo" Value="100" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab ID="ChargeTab" Text="Charge" Value="200" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab ID="ResourceTab" Text="Resource" Value="300" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab ID="PaymentTab" Text="Payment" Value="400" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab ID="AttcTab" Text="Attc" Value="500" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab ID="NotCompletedTab" Text="NotCompleted" Value="550" runat="server">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <br />
            <asp:Label ID="JobLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                <telerik:RadPageView runat="server" Height="90%" ID="TripRadPageView">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting" AllowPaging="false" AllowSorting="true"
                        Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                        OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" AllowAutomaticInserts="True" OnPreRender="ResultDG_PreRender"
                        OnItemCommand="ResultDG_ItemCommand" OnCancelCommand="ResultDG_Cancel" Width="200%">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true" ColumnsReorderMethod="Reorder">
                            <Selecting AllowRowSelect="true"></Selecting>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="jbtripid" Name="ParentGrid"
                            EditMode="InPlace" Width="100%" AllowFilteringByColumn="true">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                    HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    <HeaderTemplate>
                                        <label id="completelbl">
                                        </label>
                                        &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                                        <%-- <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PerHeadEdit"
                                            ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                            CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>--%>
                                        <asp:ImageButton runat="server" ID="TripInfoBtns" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="TripInfoDetail"
                                            CommandName="TripInfoDetail"></asp:ImageButton>
                                        <asp:ImageButton runat="server" ID="AddBtn" ImageUrl="../../image/add.png" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="AddDetail"
                                            CommandName="AddDetail"></asp:ImageButton>
                                        <asp:ImageButton runat="server" ID="AttcBtn" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="AttcDetail"
                                            CommandName="AttcDetail"></asp:ImageButton>
                                        <asp:ImageButton runat="server" ID="ChargeBtn" ImageUrl="../../image/Charge.png" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="ChargeDetail"
                                            CommandName="ChargeDetail"></asp:ImageButton>
                                        <asp:ImageButton runat="server" ID="PaymentBtn" ImageUrl="../../image/dollarsign.png" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="Payment"
                                            CommandName="Payment"></asp:ImageButton>
                                        <asp:Label ID="DetailLbl" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderText="" UniqueName="Cautionicon" AllowFiltering="false">
                                    <ItemStyle Wrap="True"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="CautionLbl" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn AllowFiltering="false" ItemStyle-Width="50" HeaderStyle-Width="50">
                                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                    <HeaderTemplate>
                                        S/No
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="AcJobNo" HeaderText="Account <br/> JobNo" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1}", Eval("accode"), Eval("jobno")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status <br/> OfferStatus">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1}", Eval("statusdescr"), Eval("OfferStatusDescr")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Addr" HeaderText="FrAddr <br/> ToAdd" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1}", Eval("POLPlantAddr"), Eval("PODPlantAddr")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="ShBillSizeType" HeaderText="ShType <br/> BillSizeType" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1}", Eval("ShipmentTypeDescr"), Eval("BillSizeTypeDescr")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="JobType" HeaderText="JobType <br/> TptType">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1}", Eval("JobTypeDescr"), Eval("TptTypeDescr")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="BillOption" HeaderText="BillOption1 <br/> BillOption2">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1}", Eval("BillOption1"), Eval("BillOption2")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="DateTime" HeaderText="StartDateTime <br/> EndDateTime">
                                    <ItemTemplate>
                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm}<br/>{1:dd/MMM/yyyy HH:mm}", Eval("frexpdate"), Eval("toexpdate")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="VehnoDriver" HeaderText="Vehno <br/> Driver">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1}", Eval("vehno"), Eval("driver")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                              <%--  <telerik:GridTemplateColumn UniqueName="AltVehno" HeaderText="AltVehno <br/> AltDriver <br/> AltDriverMobileNo">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("altvehno"), Eval("altpername"), Eval("altpermobileno")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>--%>
                                <telerik:GridTemplateColumn UniqueName="CustRef" HeaderText="CustRef <br/> CustRef2" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1}", Eval("CustReference"), Eval("CustReference2")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="OrderBy" HeaderText="OrderBy <br/> PIC">
                                    <ItemTemplate>
                                        <%# string.Format("{0} <br/> {1}", Eval("CustName"), Eval("piccodedescr")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Pallets" HeaderText="Pallets <br/> Packages">
                                    <ItemTemplate>
                                        <%# string.Format("{0:#,0} <br/> {0:#,0}", Eval("actplt"), Eval("actpkg")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight <br/> Volume">
                                    <ItemTemplate>
                                        <%# string.Format("{0:#,0.000} <br/> {0:#,0.000}", Eval("actwt"), Eval("actvol")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="SpecialInstruction" DataField="JobSpecialInstruction" 
                                    UniqueName="jobspecialinstruction" Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                </telerik:GridBoundColumn> 
                                <telerik:GridBoundColumn HeaderText="GoodsDescription" DataField="jobgoodsdescr" 
                                    UniqueName="jobgoodsdescr" Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                </telerik:GridBoundColumn>  
                                <telerik:GridBoundColumn HeaderText="Remarks1" DataField="Remarks1" 
                                    UniqueName="Remarks1" Reorderable="true">
                                </telerik:GridBoundColumn>  
                                <telerik:GridBoundColumn HeaderText="Remarks2" DataField="Remarks2" 
                                    UniqueName="Remarks2" Reorderable="true">
                                </telerik:GridBoundColumn>  
                                <telerik:GridBoundColumn HeaderText="OfferRemarks" DataField="OfferRemarks" 
                                    UniqueName="OfferRemarks" Reorderable="true">
                                </telerik:GridBoundColumn>  
                                <telerik:GridTemplateColumn UniqueName="EditDate" HeaderText="EditDate <br/> EditUser">
                                    <ItemTemplate>
                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}<br/>{1}", Eval("editdate"), Eval("edituser")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="ShType" DataField="jbshtypedescr" AllowFiltering="true"
                                    ColumnGroupName="jbshtype" SortExpression="jbshtype" UniqueName="jbshtype" Reorderable="true"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px" ReadOnly="True" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Auto-Gen Incentive" DataField="AutoGenIncentive" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="AutoGenIncentive" SortExpression="AutoGenIncentive" UniqueName="AutoGenIncentive"
                                    Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>                           
                                          
                                <telerik:GridBoundColumn DataField="ShType" UniqueName="ShType" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="jbtripid" DataField="jbtripid" AllowFiltering="true" ReadOnly="True"
                                    ColumnGroupName="jbtripid" SortExpression="jbtripid" UniqueName="jbtripid" Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="JBCTptTypeIsImportant" UniqueName="JBCTptTypeIsImportant" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Date" DataField="frexpdate" ColumnGroupName="frexpdate"
                                    SortExpression="frexpdate" UniqueName="Date" Reorderable="true"
                                    DataFormatString="{0:dd/MMM/yyyy}" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Time" DataField="fracttimedescr" ColumnGroupName="fracttimedescr"
                                    SortExpression="fracttimedescr" UniqueName="Time" Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Descr" DataField="jobdescr" AllowFiltering="false"
                                    ColumnGroupName="jobdescr" SortExpression="jobdescr" UniqueName="Descr" Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="NoOfPlt" DataField="noofplt" AllowFiltering="false"
                                    DataFormatString="{0:#,0.##}" ColumnGroupName="noofplt" SortExpression="noofplt"
                                    UniqueName="NoOfPlt" Reorderable="true" ItemStyle-HorizontalAlign="Center" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="NoOfPkg" DataField="noofpkg" AllowFiltering="false"
                                    DataFormatString="{0:#,0.##}" ColumnGroupName="noofpkg" SortExpression="noofpkg"
                                    UniqueName="NoOfPkg" Reorderable="true" ItemStyle-HorizontalAlign="Center" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Wt" DataField="actwt" AllowFiltering="false"
                                    ColumnGroupName="actwt" ItemStyle-HorizontalAlign="Center" SortExpression="actwt"
                                    UniqueName="Wt" Reorderable="true" DataFormatString="{0:#,0.000}" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Wt" DataField="expwt" AllowFiltering="false"
                                    ColumnGroupName="expwt" ItemStyle-HorizontalAlign="Center" SortExpression="expwt"
                                    UniqueName="ExpWt" Reorderable="true" DataFormatString="{0:#,0.000}" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="EqpRemarks" DataField="eqpremarks" AllowFiltering="false"
                                    ColumnGroupName="eqpremarks" SortExpression="eqpremarks" UniqueName="EqpRemarks"
                                    Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ImportEdoAsn/UCI" DataField="inedoasn" AllowFiltering="false"
                                    ColumnGroupName="inedoasn" SortExpression="inedoasn" UniqueName="inedoasn" Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ExportEsnAsn/UCI" DataField="outesnasn" AllowFiltering="false"
                                    ColumnGroupName="outesnasn" SortExpression="outesnasn" UniqueName="outesnasn"
                                    Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Time" DataField="frexptime" ColumnGroupName="frexptime"
                                    SortExpression="frexptime" UniqueName="StartTime" Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>                                
                                <telerik:GridBoundColumn HeaderText="JobType" DataField="jbcjobtypedescr" AllowFiltering="true"
                                    ColumnGroupName="jbcjobtypedescr" SortExpression="jbcjobtypedescr" UniqueName="jbcjobtypedescr"
                                    ReadOnly="True" Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Attendant" DataField="noofperdetl" AllowFiltering="false"
                                    ColumnGroupName="noofperdetl" SortExpression="noofperdetl" UniqueName="noofperdetl"
                                    ReadOnly="True" Reorderable="true" Display="false">
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="accode" UniqueName="accode" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" UniqueName="statusdescr" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status1" DataField="status" UniqueName="status1" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="BillSizeTypeDescr" UniqueName="BillSizeType" Display="False"/>
                                <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False"/>
                                <telerik:GridBoundColumn DataField="driver" UniqueName="driver" Display="False"/>
                                <telerik:GridBoundColumn DataField="accode" UniqueName="Account" Display="False"/>
                                <telerik:GridBoundColumn DataField="jobno" UniqueName="jobno" Display="False"/>
                            </Columns>
                            <DetailTables>
                                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                                    CommandItemDisplay="Top" Width="50%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true"
                                    AllowAutomaticInserts="true">
                                    <HeaderStyle Wrap="false" BackColor="#05538C" ForeColor="White" />
                                    <ItemStyle Wrap="false" />
                                    <AlternatingItemStyle Wrap="false" />
                                    <CommandItemSettings ShowRefreshButton="false" AddNewRecordText="Add Personnel" />
                                    <ParentTableRelation>
                                        <telerik:GridRelationFields DetailKeyField="jbcttrid" MasterKeyField="id" />
                                    </ParentTableRelation>
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="Detailicon" AllowFiltering="false"
                                            HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PackEdit"
                                                    ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                                    CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                    runat="server" onserverclick="PerDetlDetail_Delete">
                                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Charge"
                                                        title="Delete Charge" runat="server" /></a>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:ImageButton runat="server" Visible="True" ID="PackUpdate" ImageUrl="../../image/floppy.gif"
                                                    Width="15" Height="15" AlternateText="Update" CommandName="DetailUpdate" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>
                                                <asp:ImageButton runat="server" Visible="True" ID="PackCancel" ImageUrl="../../image/arrow6.gif"
                                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            </EditItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="id" UniqueName="id" SortExpression="id" HeaderText="id" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="jbcttrid" UniqueName="jbcttrid" SortExpression="jbcttrid" HeaderText="jbcttrid"
                                            Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn UniqueName="type" HeaderText="PersonnelType">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="150px"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "typedescr")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="pertypeList" runat="server" DropDownHeight="150px" DataTextField="descr"
                                                    DataValueField="item" DataSource='<%# pertypeListDS%>' Skin="WebBlue" Width="120px"
                                                    DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(pertypeListDS,DataBinder.Eval(Container.DataItem, "id").ToString()) %>'>
                                                </telerik:RadComboBox>
                                                <asp:TextBox ID="pertypeListTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "typedescr") %>' />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="pername" HeaderText="Name">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="150px"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "pername")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="manpowerList" runat="server" DropDownHeight="150px" DataTextField="name"
                                                    DataValueField="id" DataSource='<%# manpowerListDS%>' Skin="WebBlue" Width="200px"
                                                    DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(manpowerListDS,DataBinder.Eval(Container.DataItem, "id").ToString()) %>'>
                                                </telerik:RadComboBox>
                                                <asp:TextBox ID="pertypeNameListTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "pername") %>' />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn UniqueName="ManpowerOption" HeaderText="ManpowerOption">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="150px"></ItemStyle>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "ManpowerOptionDescr")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="manpowerOptionDDL" runat="server" ExpandDirection="Up"
                                                    DataTextField="descr" DataValueField="Item" DataSource='<%# manpowerOptionListDS%>' Skin="WebBlue" Width="150px"
                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(manpowerOptionListDS, DataBinder.Eval(Container.DataItem, "ManpowerOption").ToString())%>'
                                                    DropDownWidth="150px">
                                                </telerik:RadDropDownList>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="StartTime" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "fractdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDateTimePicker ID="InctStartDateTimePicker" Width="170px" runat="server"
                                                    DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="BottomRight"
                                                    AutoPostBackControl="both">
                                                    <Calendar>
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                    <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                                </telerik:RadDateTimePicker>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="toactdate" HeaderText="EndTime">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "toactdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDateTimePicker ID="InctEndDateTimePicker" Width="170px" runat="server"
                                                    DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="BottomRight"
                                                    AutoPostBackControl="both">
                                                    <Calendar>
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                    <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                                </telerik:RadDateTimePicker>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </telerik:GridTableView>
                            </DetailTables>
                        </MasterTableView>
                    </telerik:RadGrid>
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="TripInfoPageView" Height="700px" />
                <telerik:RadPageView runat="server" ID="ChargeRadPageView" Height="700px" />
                <telerik:RadPageView runat="server" Height="70%" ID="ResourceRadPageView">
                    <div>
                        <br />
                        <div class="NewModuleTitle">
                            <asp:Label ID="Label2" labelclass="NewModuleTitle" runat="server">Vehicle</asp:Label>
                        </div>
                        <br />
                        <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowPaging="false" Skin="Metro" Visible="false" OnItemDataBound="ResultDG1_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true">
                                <Columns>
                                    <telerik:GridTemplateColumn AllowFiltering="false" ItemStyle-Width="50" HeaderStyle-Width="50">
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                        <HeaderTemplate>
                                            S/No
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="VehNo" DataField="VehNo" AllowFiltering="true"
                                        ColumnGroupName="VehNo" SortExpression="VehNo" UniqueName="VehNo" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Descr" DataField="Descr" AllowFiltering="true"
                                        ColumnGroupName="Descr" SortExpression="Descr" UniqueName="Descr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="TripCount" DataField="TripCount" AllowFiltering="true" DataFormatString="{0:#,0.#}"
                                        ColumnGroupName="TripCount" SortExpression="TripCount" UniqueName="TripCount" Reorderable="true">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="On/Off" DataField="onoff" AllowFiltering="true"
                                        ColumnGroupName="onoff" SortExpression="onoff" UniqueName="onoff" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Duration" DataField="Duration" AllowFiltering="true"
                                        ColumnGroupName="Duration" SortExpression="Duration" UniqueName="Duration" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Reason" DataField="Reason" AllowFiltering="true"
                                        ColumnGroupName="Reason" SortExpression="Reason" UniqueName="Reason" Reorderable="true"
                                        HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="500" HeaderStyle-Width="500">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <br />
                        <br />
                        <div class="NewModuleTitle">
                            <asp:Label ID="Label3" labelclass="NewModuleTitle" runat="server">Personnel</asp:Label>
                        </div>
                        <br />
                        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowPaging="false" Skin="Metro" Visible="false" OnItemDataBound="ResultDG2_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true">
                                <Columns>
                                    <telerik:GridTemplateColumn AllowFiltering="false" ItemStyle-Width="50" HeaderStyle-Width="50">
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                        <HeaderTemplate>
                                            S/No
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="Personnel" DataField="Personnel" AllowFiltering="true"
                                        ColumnGroupName="Personnel" SortExpression="Personnel" UniqueName="Personnel" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Name" DataField="Name" AllowFiltering="true"
                                        ColumnGroupName="Name" SortExpression="Name" UniqueName="Name" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="TripCount" DataField="TripCount" AllowFiltering="true" DataFormatString="{0:#,0.#}"
                                        ColumnGroupName="TripCount" SortExpression="TripCount" UniqueName="TripCount" Reorderable="true">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="On/Off" DataField="onoff" AllowFiltering="true"
                                        ColumnGroupName="onoff" SortExpression="onoff" UniqueName="onoff" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Duration" DataField="Duration" AllowFiltering="true"
                                        ColumnGroupName="Duration" SortExpression="Duration" UniqueName="Duration" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Reason" DataField="Reason" AllowFiltering="true"
                                        ColumnGroupName="Reason" SortExpression="Reason" UniqueName="Reason" Reorderable="true"
                                        HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="500" HeaderStyle-Width="500">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="PaymentRadPageView" Height="700px" />
                <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
                <telerik:RadPageView runat="server" ID="NotCompletedPageView" Height="700px">
                <br /><telerik:RadGrid ID="ResultDG3" runat="server" AutoGenerateColumns="true"
                EnableLinqExpressions="False" AllowPaging="True" GridLines="Both"
                Skin="Metro" OnNeedDataSource="ResultDG3_NeedDataSource" OnItemDataBound="ResultDG3_ItemDataBound" OnColumnCreated="ResultDG3_ColumnCreated"
                ExportSettings-UseItemStyles="true">
                <ClientSettings>
                <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <ExportSettings UseItemStyles="True">
                </ExportSettings>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-Width="100px" ItemStyle-Width="100px" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
               
                    <Columns>
                    </Columns>
                 </MasterTableView>
               </telerik:RadGrid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </asp:Panel>
        <asp:Panel ID="UploadPanel" runat="server" Visible="false">
        <table border="0">
            <telerik:RadTabStrip runat="server" ID="RadTabStrip_Upl" MultiPageID="RadMultiPage_Upl" RenderMode="Lightweight"
                CausesValidation="false" SelectedIndex="0" Skin="Windows7">
                <Tabs>
                    <telerik:RadTab ID="RadTabUpload" Text="Upload" Value="0" readonly="readonly" runat="server">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage runat="server" ID="RadMultiPage_Upl" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="UploadRadPageView_Upl">
            </telerik:RadPageView>
            </telerik:RadMultiPage>
        </table>
        </asp:Panel>

        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
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
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
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
