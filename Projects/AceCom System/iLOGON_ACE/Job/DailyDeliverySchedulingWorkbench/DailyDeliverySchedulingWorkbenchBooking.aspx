<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliverySchedulingWorkbenchBooking.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliverySchedulingWorkbench.DailyDeliverySchedulingWorkbenchBooking" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyDeliverySchedulingWorkbenchBooking</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>


    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <%--On Vehicle SelectedIndexchange, show the default driver on Driver column--%>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function VehicleList_DropDownClosed(sender, args) {
                var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var VehicleList = $telerik.findControl(currentRow, "VehicleList").get_value();

                if (VehicleList != null && VehicleList != "") {
                    var VehNoDriverPair = VehicleList.split("|");
                    var DefaultDriverId = VehNoDriverPair[1];
                    var DefaultDriverName = VehNoDriverPair[2];
                    var DefaultDriverComboItem = $telerik.findElement(currentRow, "DriverList").getElementsByTagName("input")[0].value = DefaultDriverName;
                    DefaultDriverComboItem.select();
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <style type="text/css">
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
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <%--Changed the <asp:ScriptManager> to <telerik:RadScriptManager> because Cancel Changes button in Batch Grid is not working well--%>
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="Office2007" Modal="true" EnableSkinTransparency="true" EnableEmbeddedSkins="true" MinDisplayTime="500">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager runat="server" ID="RadAjaxManager">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="ResultDG">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ResultDG" LoadingPanelID="LoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadWindowManager" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadWindowManager ID="RadWindowManager" runat="server"></telerik:RadWindowManager>
        <%-- When we used the Batch Edit in RadMultiPage, we need to set RenderSelectedPageOnly="true" beacuse of Command Item display .
             If we don't use this cannot show correctly Header commandItem--%>
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="FromDateLbl" runat="server" Text="FromDate"> </asp:Label>
                    <br />
                    <asp:Button ID="FromDatePrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="FromDatePrevBtn_Click" UseSubmitBehavior="false" />
                    <telerik:RadDatePicker ID="FromDatePicker" runat="server" Width="155"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                        OnSelectedDateChanged="FromDatePicker_SelectedDateChanged" AutoPostBack="true">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                    <asp:Button ID="FromDateNextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="FromDateNextBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="ToDateLbl" runat="server" Text="ToDate"> </asp:Label>
                    <br />
                    <asp:Button ID="ToDatePrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="ToDatePrevBtn_Click" UseSubmitBehavior="false" />
                    <telerik:RadDatePicker ID="ToDatePicker" runat="server" Width="155" Height="25"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                        OnSelectedDateChanged="ToDatePicker_SelectedDateChanged" AutoPostBack="true">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                    <asp:Button ID="ToDateNextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="ToDateNextBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Panel ID="NewTripPanel" runat="server">
                        <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" OnClick="ExcelBtn_Click" ToolTip="Export To Excel"
                            Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                            Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                            Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                            Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                            Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="PODBtn" runat="server" CssClass="white" OnClick="PODBtn_Click"
                            Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="CreateNew" runat="server" CssClass="white" OnClick="CreateNewBtn_Click"
                            Text="CreateNew" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" ShowStatusBar="true"
                    AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true"
                    OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                            OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                    </ClientSettings>
                    <HeaderStyle Wrap="false" />
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="BookingGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        PageSize="50" HeaderStyle-HorizontalAlign="Left" CommandItemDisplay="TopAndBottom" EditMode="Batch">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                ItemStyle-Width="50px" HeaderStyle-Width="50px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ReturnLbl" runat="server" /> <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="S/N" HeaderStyle-Width="40px" ItemStyle-Width="40px" AllowFiltering="false" HeaderText="S/N">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("SeqNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Account" HeaderText="Account"
                                AutoPostBackOnFilter="true" SortExpression="Account" DataField="AcCode"
                                ItemStyle-Width="140px" HeaderStyle-Width="140px" AllowFiltering="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("AcCode")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="JobNo" HeaderText="JobNo" FilterControlWidth="50px"
                                AutoPostBackOnFilter="true" SortExpression="JobNo" DataField="JobNo"
                                ItemStyle-Width="95px" HeaderStyle-Width="95px" AllowFiltering="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("JobNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="JobType" HeaderText="JobType" SortExpression="JobType" FilterControlWidth="55px"
                                ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="true" DataField="JbctnrJobType" AutoPostBackOnFilter="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("JbctnrJobType")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="JobType" runat="server" DataTextField="descr" DataValueField="item"
                                        RenderMode="Lightweight" Skin="Sunset" Width="100px" OnItemsRequested="JobTypeCBB_ItemsRequested"
                                        HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" OnClientDropDownClosed="VehicleList_DropDownClosed">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="StartTime" HeaderText="StartTime" ItemStyle-Width="80px" HeaderStyle-Width="80px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("FromTime")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="ArrivalDate" HeaderText="ArrivalTime" ItemStyle-Width="80px" HeaderStyle-Width="80px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("ArrivalDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="EndTime" HeaderText="EndTime" ItemStyle-Width="80px" HeaderStyle-Width="80px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("ToTime")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle" DataField="Vehicle" AutoPostBackOnFilter="true"
                                ItemStyle-Width="140px" HeaderStyle-Width="140px" AllowFiltering="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Vehicle")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                        RenderMode="Lightweight" Skin="Sunset" Width="120px" OnItemsRequested="VehicleList_ItemsRequested"
                                        HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" OnClientDropDownClosed="VehicleList_DropDownClosed">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="Driver" HeaderText="Driver" DataField="Driver" AutoPostBackOnFilter="true"
                                ItemStyle-Width="140px" HeaderStyle-Width="140px" AllowFiltering="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Driver")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                        RenderMode="Lightweight" Skin="Sunset" Width="120px" OnItemsRequested="DriverCBB_ItemsRequested"
                                        HighlightTemplatedItems="true" EnableLoadOnDemand="true" Filter="Contains">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="Attendant" HeaderText="Attendant"
                                ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("AltPerName")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="AttendantCombo" runat="server" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                        OnItemsRequested="AttendantCombo_ItemsRequested" HighlightTemplatedItems="true" Skin="Sunset" Width="120px"
                                        EnableLoadOnDemand="true" AllowCustomText="false" Filter="Contains">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DO" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false" HeaderText="DO">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("DO")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Consignee" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false" HeaderText="Consignee">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Consignee")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp"
                                ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("PickUp")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="FrAddrTxt" TextMode="MultiLine" Width="120px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff"
                                ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false"
                                ItemStyle-Height="80px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("DropOff")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ToAddrTxt" TextMode="MultiLine" Width="120px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PostalCode" HeaderStyle-Width="80px" ItemStyle-Width="80px" AllowFiltering="false" HeaderText="PostalCode">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("PostalCode")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="NoOfPkgNoOfPallet" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false" HeaderText="NoOfPkg<br />NoOfPallet">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="NoOfPkgLbl" Text='<%# DataBinder.Eval(Container.DataItem, "NoOfPkg")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="NoOfPalletLbl" Text='<%# DataBinder.Eval(Container.DataItem, "NoOfPallet")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="NoOfPkgTxt" Textmode="SingleLine" Width="100px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="NoOfPalletTxt" TextMode="SingleLine" Width="100px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Route" HeaderStyle-Width="80px" ItemStyle-Width="80px" AllowFiltering="false" HeaderText="Route">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Route")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DeliveryCode" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false" HeaderText="DeliveryCode">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("DeliveryCode")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("StatusDescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="JBTripId" HeaderText="JBTripId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PerId" UniqueName="PerId" Display="False" />
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="False" />
                            <telerik:GridBoundColumn DataField="IsJobTypeEqualVehType" UniqueName="IsJobTypeEqualVehType" Display="False" />
                            <telerik:GridBoundColumn DataField="ReturnAttachment" UniqueName="ReturnAttachment" Display="False" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
        <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
            <script type="text/javascript">
                function NoOfPkgNoOfPallet(NoOfPkg, NoOfPallet) {
                    this.NoOfPkg = NoOfPkg;
                    this.NoOfPallet = NoOfPallet;
                }

                NoOfPkgNoOfPallet.prototype.equals = function (val) {
                    return this.NoOfPkg === val.NoOfPkg && this.NoOfPallet === val.NoOfPallet;
                }

                NoOfPkgNoOfPallet.prototype.toString = function () {
                    return JSON.stringify({
                        NoOfPkg: this.NoOfPkg,
                        NoOfPallet: this.NoOfPallet
                    });
                }

                function GetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === "NoOfPkgNoOfPallet") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var NoOfPkg = $telerik.findElement(Container, "NoOfPkgLbl").innerHTML;
                        var NoOfPallet = $telerik.findElement(Container, "NoOfPalletLbl").innerHTML;
                        args.set_value(new NoOfPkgNoOfPallet(NoOfPkg, NoOfPallet));
                    }

                }

                function SetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === "NoOfPkgNoOfPallet") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "NoOfPkgLbl").innerHTML = Value.NoOfPkg;
                        $telerik.findElement(Container, "NoOfPalletLbl").innerHTML = Value.NoOfPallet;
                    }
                }

                function GetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "NoOfPkgNoOfPallet") {
                        args.set_cancel(true);

                        var Container = args.get_container();
                        var NoOfPkg = $telerik.findControl(Container, "NoOfPkgTxt").get_value();
                        var NoOfPallet = $telerik.findControl(Container, "NoOfPalletTxt").get_value();

                        args.set_value(new NoOfPkgNoOfPallet(NoOfPkg, NoOfPallet));

                    }
                }

                function SetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "NoOfPkgNoOfPallet") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findControl(Container, "NoOfPkgTxt").set_value(Value.NoOfPkg);
                        $telerik.findControl(Container, "NoOfPalletTxt").set_value(Value.NoOfPallet);
                    }
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
