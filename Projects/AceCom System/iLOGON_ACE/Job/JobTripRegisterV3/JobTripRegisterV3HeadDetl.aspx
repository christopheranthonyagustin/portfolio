<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterV3HeadDetl.aspx.cs" Inherits="iWMS.Web.Job.JobTripRegisterV3.JobTripRegisterV3HeadDetl" %>

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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <table border="0" id="table1" runat="server" width="100%">
            <tr id="TR" runat="server" class="tab">
                <td runat="server" valign="bottom" id="TD" class="style1"></td>
                <td class="NewModuleTitle" align="right" valign="bottom" id="TDM">
                    <asp:Label ID="Label1" runat="server">Job Trip Register V3</asp:Label>
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
                    <td>
                        <asp:Button ID="MergeBtn" CssClass="white" runat="server" OnClick="MergeBtn_Click"
                            Text="Merge" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;            
                    </td>
                    <td>
                        <asp:Button ID="ShowHideBtn" runat="server" Text="Show/Hide" OnClick="ShowHideBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                        &nbsp;            
                    </td>
                    <td>
                        <asp:Button ID="SMSBtn" CssClass="white" runat="server" OnClick="SMSBtn_Click"
                            Text="SMS" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                      <%--  <asp:Button ID="SMSBtn" CssClass="white" runat="server" OnClick="SMSBtn_Click" OnClientClick="disableBtn(this.id)" 
                            Text="SMS"/>--%>
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
                    <td align="right" style="width: 710px;">
                        <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    </td>
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
                     <telerik:RadTab ID="MapTab" Text="Map" Value="600" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab ID="PodTab" Text="POD" Value="650" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab ID="jobSearchTab" Text="JobSearch" Value="700" runat="server">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <asp:Label ID="JobLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                <telerik:RadPageView runat="server" Height="90%" ID="TripRadPageView">
                    <br />
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
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid"
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
                                        <asp:ImageButton runat="server" ID="MapBtn" ImageUrl="../../image/map.png" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="Map" CommandArgument="Map"
                                            CommandName="Map"></asp:ImageButton>
                                        <asp:ImageButton runat="server" ID="PODBtn" ImageUrl="../../image/pod.png" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="POD" CommandArgument="POD"
                                            CommandName="POD"></asp:ImageButton>
                                        <asp:Label ID="DetailLbl" runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="ParentUpdate" ImageUrl="../../image/floppy.gif"
                                            Width="15" Height="15" AlternateText="Update" CommandName="ParentUpdate" BackColor="Transparent"
                                            BorderWidth="0"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="True" ID="ParentCancel" ImageUrl="../../image/arrow6.gif"
                                            Width="15" Height="15" AlternateText="Cancel" CommandName="ParentCancel" BackColor="Transparent"
                                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                    </EditItemTemplate>
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
                                <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                                    ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true"
                                    ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="true" ItemStyle-CssClass="break-word"
                                    ColumnGroupName="fraddr" SortExpression="fraddr" UniqueName="fraddr" Reorderable="true"
                                    HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "fraddr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="fraddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                            TextMode="MultiLine" Enabled="true">
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="true" ItemStyle-CssClass="break-word"
                                    ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" Reorderable="true"
                                    HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "toaddr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="toddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                            TextMode="MultiLine" Enabled="true">
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="CustRef" DataField="exref1" AllowFiltering="true"
                                    ColumnGroupName="exref1" SortExpression="exref1" UniqueName="exref1" ItemStyle-CssClass="break-word"
                                    Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "exref1")%>
                                        <br />
                                        <label style="color:blue; font-size:15px"><%# DataBinder.Eval(Container.DataItem, "offerstatusdescr")%></label>
                                        <br />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="exref1txt" Text='<%# DataBinder.Eval(Container.DataItem, "exref1") %>'
                                            TextMode="MultiLine" Enabled="true">
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="Auto-Gen Incentive" DataField="AutoGenIncentive" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="AutoGenIncentive" SortExpression="AutoGenIncentive" UniqueName="AutoGenIncentive"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Route" DataField="route" AllowFiltering="true"
                                    ColumnGroupName="route" SortExpression="route" UniqueName="route" Reorderable="true"
                                    ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="TptType" DataField="jbctpttypedescr" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="jbctpttype" SortExpression="jbctpttype" UniqueName="jbctpttype"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <%--   <telerik:GridBoundColumn HeaderText="Packages" DataField="actpkg" AllowFiltering="true"
                                    ColumnGroupName="actpkg" SortExpression="actpkg" UniqueName="actpkg" Reorderable="true"
                                    ReadOnly="True">
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridTemplateColumn HeaderText="Packages" DataField="actpkg" AllowFiltering="true" ItemStyle-CssClass="break-word"
                                    ColumnGroupName="actpkg" SortExpression="actpkg" UniqueName="actpkg" Reorderable="true"
                                    HeaderStyle-Width="20px" ItemStyle-Width="20px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "actpkg","{0:#,0}")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="actpkgTxt" Text='<%# DataBinder.Eval(Container.DataItem, "actpkg", "{0:#}") %>'
                                            TextMode="MultiLine" Enabled="true">
                                        </telerik:RadTextBox>
                                        <asp:CompareValidator ID="CompareValidator22" runat="server" Operator="DataTypeCheck"
                                            Type="Double" ControlToValidate="actpkgTxt" ErrorMessage="#" />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Pallets" DataField="actplt" AllowFiltering="true" ItemStyle-CssClass="break-word"
                                    ColumnGroupName="actplt" SortExpression="actplt" UniqueName="actplt" Reorderable="true"
                                    HeaderStyle-Width="20px" ItemStyle-Width="20px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "actplt","{0:#,0}")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="actpltTxt" Text='<%# DataBinder.Eval(Container.DataItem, "actplt", "{0:#}") %>'
                                            TextMode="MultiLine" Enabled="true">
                                        </telerik:RadTextBox>
                                        <asp:CompareValidator ID="actpltCompareValidator" runat="server" Operator="DataTypeCheck"
                                            Type="Double" ControlToValidate="actpkgTxt" ErrorMessage="#" />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Weight" DataField="ActWt" AllowFiltering="true" ItemStyle-CssClass="break-word"
                                    ColumnGroupName="ActWt" SortExpression="ActWt" UniqueName="ActWt" Reorderable="true"
                                    HeaderStyle-Width="20px" ItemStyle-Width="20px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "ActWt","{0:#,0.000}")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="ActWtTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ActWt") %>'
                                            TextMode="MultiLine" Enabled="true">
                                        </telerik:RadTextBox>
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" Operator="DataTypeCheck"
                                            Type="Double" ControlToValidate="ActWtTxt" ErrorMessage="#" />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="Volume" DataField="actvol" AllowFiltering="false"
                                    ItemStyle-HorizontalAlign="Center" ColumnGroupName="actvol" SortExpression="actvol"
                                    UniqueName="Vol" Reorderable="true" DataFormatString="{0:#,0.000}">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="BillSizeType" HeaderStyle-Width="130px" ItemStyle-Width="130px" UniqueName="BillSizeType"
                                    DataField="BillSizeTypeDescr">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="billsizetypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillSizeTypeDescr")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadComboBox ID="billsizetypeList" runat="server" DataTextField="descr" DataValueField="item"
                                            DataSource='<%# billsizetypeDS%>' Skin="WebBlue" Width="150px"
                                            DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains">
                                        </telerik:RadComboBox>
                                        <asp:RequiredFieldValidator ID="CBBillSizeTypeReqVal" runat="server" ControlToValidate="billsizetypeList"
                                            ErrorMessage="*" />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="StartDateTime" UniqueName="StartDateTime">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="frexpdateLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy HH:mm}")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadDateTimePicker ID="FrDateTimePicker" Width="170px" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "frexpdate")  %>'
                                            DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                                            <Calendar>
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                </SpecialDays>
                                            </Calendar>
                                            <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                        </telerik:RadDateTimePicker>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Vehno" HeaderStyle-Width="130px" ItemStyle-Width="130px" UniqueName="VehNo"
                                    DataField="vehno">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="vehnoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "vehno")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadComboBox ID="vehDDL" runat="server" DataTextField="item" DataValueField="item"
                                            DataSource='<%# vehListDS%>' Skin="WebBlue" Width="150px"
                                            DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                            OnSelectedIndexChanged="VehNoSelectedIndex_changed">
                                        </telerik:RadComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="AssignDriver" HeaderText="Driver" ItemStyle-CssClass="break-word"
                                    DataField="pername">
                                    <HeaderStyle Wrap="true" />
                                    <ItemStyle Wrap="true" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="perLbl" Text='<%# DataBinder.Eval(Container.DataItem, "pername")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadComboBox ID="perList" runat="server" DropDownHeight="150px" DataTextField="descr"
                                            DataValueField="item" DataSource='<%# perListDS%>' Skin="WebBlue" Width="120px"
                                            DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains">
                                        </telerik:RadComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="SpecialInstruction" DataField="jobspecialinstruction"
                                    AllowFiltering="true" ColumnGroupName="jobspecialinstruction" SortExpression="jobspecialinstruction"
                                    UniqueName="jobspecialinstruction" Reorderable="true" HeaderStyle-Width="70px" ItemStyle-CssClass="break-word"
                                    ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "jobspecialinstruction")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="jobspecialinstructiontxt" Text='<%# DataBinder.Eval(Container.DataItem, "jobspecialinstruction") %>'
                                            TextMode="MultiLine" Enabled="true">
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Remarks" DataField="remarks" AllowFiltering="true"
                                    ColumnGroupName="jbremarks" SortExpression="jbremarks" UniqueName="remarks" ItemStyle-CssClass="break-word"
                                    Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "remarks")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="jbremarkstxt" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'
                                            TextMode="MultiLine" Enabled="true">
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="OrderBy" DataField="orderby" AllowFiltering="true"
                                    ReadOnly="True" ColumnGroupName="orderby" SortExpression="orderby" UniqueName="orderby"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="EndDateTime" UniqueName="EndDateTime">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="toactdateLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "toactdate", "{0:dd/MMM/yyyy HH:mm}")%>' />

                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadDateTimePicker ID="ToDateTimePicker" Width="170px" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "toactdate")  %>'
                                            DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" PopupDirection="TopRight">
                                            <Calendar>
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                </SpecialDays>
                                            </Calendar>
                                            <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                                        </telerik:RadDateTimePicker>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="SvcChitNo" DataField="svcchitno" AllowFiltering="true"
                                    ColumnGroupName="svcchitno" SortExpression="svcchitno" UniqueName="svcchitno"
                                    Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "svcchitno")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="SvcchitTxt" Text='<%# DataBinder.Eval(Container.DataItem, "svcchitno") %>'
                                            Enabled="true">
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="LabourCount" DataField="LabourCount" AllowFiltering="true" ItemStyle-CssClass="break-word"
                                    ColumnGroupName="LabourCount" SortExpression="LabourCount" UniqueName="LabourCount" Reorderable="true"
                                    HeaderStyle-Width="20px" ItemStyle-Width="20px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "LabourCount", "{0:#}")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <br />
                                        <telerik:RadTextBox runat="server" ID="LabourCountTxt" Text='<%# DataBinder.Eval(Container.DataItem, "LabourCount", "{0:#}") %>' Enabled="true">
                                        </telerik:RadTextBox>
                                        <asp:CompareValidator ID="LabourCountCompareValidator" runat="server" Operator="DataTypeCheck"
                                            Type="Double" ControlToValidate="LabourCountTxt" ErrorMessage="#" />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>


                                <telerik:GridTemplateColumn HeaderText="TripOption" HeaderStyle-Width="130px" UniqueName="sector"
                                    DataField="sector" ItemStyle-Width="130px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "sector")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadDropDownList ID="SectorDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                            DataValueField="Item" DataSource='<%# sectorDS%>' Skin="Sunset" Width="200px"
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(sectorDS,DataBinder.Eval(Container.DataItem, "sector").ToString())%>'
                                            DropDownWidth="150px">
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="SectorDDLReqVal" runat="server" ControlToValidate="SectorDDL"
                                            ErrorMessage="*" ForeColor="Red" />
                                        <asp:TextBox ID="SectorTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "sector") %>' />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" AllowFiltering="true"
                                    ColumnGroupName="jobno" SortExpression="jobno" UniqueName="jobno" Reorderable="true"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="OfferStatus" DataField="OfferStatusDescr" UniqueName="OfferStatusDescr" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="OfferRemarks" DataField="OfferRemarks" UniqueName="OfferRemarks" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" UniqueName="statusdescr" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                  <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>

                                <telerik:GridBoundColumn HeaderText="Pic" DataField="piccodedescr" AllowFiltering="true"
                                    ColumnGroupName="piccodedescr" SortExpression="piccodedescr" UniqueName="piccodedescr"
                                    ReadOnly="True" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <%-- For shtype --%>

                                <telerik:GridBoundColumn DataField="jbcshtype" UniqueName="jbcshtype" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" ReadOnly="True"
                                    ColumnGroupName="id" SortExpression="id" UniqueName="id" Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="JBCTptTypeIsImportant" UniqueName="JBCTptTypeIsImportant" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" ReadOnly="True">
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
                                <telerik:GridBoundColumn HeaderText="Remarks2" DataField="remarks2" AllowFiltering="false"
                                    ColumnGroupName="remarks2" SortExpression="remarks2" UniqueName="Remarks2" Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ShType" DataField="jbshtypedescr" AllowFiltering="true"
                                    ColumnGroupName="jbshtype" SortExpression="jbshtype" UniqueName="jbshtype" Reorderable="true"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px" ReadOnly="True" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="JobType" DataField="jbcjobtypedescr" AllowFiltering="true"
                                    ColumnGroupName="jbcjobtypedescr" SortExpression="jbcjobtypedescr" UniqueName="jbcjobtypedescr"
                                    ReadOnly="True" Reorderable="true" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="WorkThruLunch" HeaderStyle-Width="130px" UniqueName="WorkThruLunchDescr"
                                    DataField="WorkThruLunchDescr" ItemStyle-Width="130px" Display="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "WorkThruLunchDescr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadDropDownList ID="WorkThruLunghDDL" runat="server" DataTextField="Descr" ExpandDirection="Up"
                                            DataValueField="Item" DataSource='<%# WorkThruLunghDS%>' Skin="WebBlue" Width="200px"
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(WorkThruLunghDS,DataBinder.Eval(Container.DataItem, "WorkThruLunch").ToString())%>'
                                            DropDownWidth="150px">
                                        </telerik:RadDropDownList>
                                        <asp:TextBox ID="WorkThruLunghTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "WorkThruLunch") %>' />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="TrailerNo" UniqueName="TrailerNo" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                    DataField="trailernodescr" Display="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "trailernodescr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadComboBox ID="TrailerDDL" DataTextField="Descr" DataValueField="Item"
                                            DataSource='<%# TrailerListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TrailerListDS,DataBinder.Eval(Container.DataItem, "trailerno").ToString()) %>'
                                            runat="server" DropDownHeight="150px" RenderMode="Lightweight" Skin="WebBlue"
                                            Width="120px" DropDownWidth="150px" CausesValidation="false" Filter="Contains">
                                        </telerik:RadComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="Attendant" DataField="noofperdetl" AllowFiltering="false"
                                    ColumnGroupName="noofperdetl" SortExpression="noofperdetl" UniqueName="noofperdetl"
                                    ReadOnly="True" Reorderable="true" Display="false">
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="GoodsDescr" DataField="jobgoodsdescr" AllowFiltering="true"
                                    ColumnGroupName="jobgoodsdescr" SortExpression="jobgoodsdescr" UniqueName="jobgoodsdescr" ItemStyle-CssClass="break-word"
                                    Reorderable="true" HeaderStyle-Width="70px" ItemStyle-Width="70px" Display="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "jobgoodsdescr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="jobgoodsdescrtxt" Text='<%# DataBinder.Eval(Container.DataItem, "jobgoodsdescr") %>'
                                            TextMode="MultiLine" Enabled="true">
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="accode" UniqueName="accode" Display="False">
                                </telerik:GridBoundColumn>
                            </Columns>
                            <DetailTables>
                                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                                    CommandItemDisplay="Top" Width="40%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true"
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
                        <br />&nbsp;
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
                    <telerik:RadGrid ID="ResultDG3" runat="server" AutoGenerateColumns="true"
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
                <telerik:RadPageView runat="server" ID="MapRadPageView" Height="700px" />
                <telerik:RadPageView runat="server" ID="PODInfoRadPageView" Height="700px" />
                <telerik:RadPageView runat="server" ID="JobSearchRadPageView" Height="700px" />
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
