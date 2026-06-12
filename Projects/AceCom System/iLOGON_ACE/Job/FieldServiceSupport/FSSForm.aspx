<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FSSForm.aspx.cs" Inherits="iWMS.Web.Job.FieldServiceSupport.FSSForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Form @ FSS</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
        </table>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table>
                    <tr>
                        <td>&nbsp;
                        <asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="white" OnClick="UpdateBtn_Click"
                            OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl_JBHead" runat="server" />
                                    <iWMS:iForm ID="formCtl_JBHead_JobDescr" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>

                <asp:Panel ID="TripPanel" runat="server">
                    <br />
                    &nbsp;
                    <asp:Label runat="server" Text="Trip" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="NewTripBtn" runat="server" Text="New Trip" CssClass="white" OnClick="NewTripBtn_Click"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="DeleteTripBtn" runat="server" Text="Delete Trip" CssClass="white" OnClick="DeleteTripBtn_Click"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                 &nbsp;
                                <asp:Button ID="CopyTripBtn" runat="server" Text="Copy Trip" CssClass="white" OnClick="CopyTripBtn_Click"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:UpdatePanel runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <telerik:RadGrid ID="TripResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                AllowSorting="true" EnableLinqExpressions="false" RenderMode="Lightweight" AllowFilteringByColumn="false"
                                AllowPaging="true" Skin="Metro" OnNeedDataSource="TripResultDG_NeedDataSource" OnBatchEditCommand="TripResultDG_BatchEditCommand"
                                OnItemDataBound="TripResultDG_ItemDataBound">
                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                    <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                        OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" EditMode="Batch" AllowFilteringByColumn="false" CommandItemDisplay="TopAndBottom" DataKeyNames="JBTripId">
                                    <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="ChkIcon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                            <HeaderTemplate>
                                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="FromDate" HeaderText="Date" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <%# string.Format("{0:dd/MMM/yyyy}",Eval("FrExpDate")) %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDatePicker ID="FromDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                    <Calendar runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#66ccff" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="FromTime" HeaderText="FromTime" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="FromTimeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripFrTimeDescr")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="FromTimeDDL" runat="server" Skin="WebBlue" DataTextField="Descr" DataValueField="Item" Width="140px" DropDownWidth="140px"
                                                    OnLoad="TimeDDL_Load">
                                                </telerik:RadDropDownList>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="ToTime" HeaderText="ToTime" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="ToTimeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripToTimeDescr")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="ToTimeDDL" runat="server" Skin="WebBlue" DataTextField="Descr" DataValueField="Item" Width="140px" DropDownWidth="140px"
                                                    OnLoad="TimeDDL_Load">
                                                </telerik:RadDropDownList>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="Vehicle <br/> Driver" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="VehicleLbl" Text='<%# DataBinder.Eval(Container.DataItem, "VehNoDescr")%>'></asp:Label>
                                                <br />
                                                <asp:Label runat="server" ID="DriverLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="VehicleCombo" runat="server" DataTextField="Descr" DataValueField="Item" OnClientDropDownClosed="VehicleCombo_DropDownClosed"
                                                    RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="VehicleCombo_ItemsRequested"
                                                    HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                                </telerik:RadComboBox>
                                                <br />
                                                <telerik:RadComboBox ID="DriverCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                                    RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="DriverCombo_ItemsRequested"
                                                    HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                                </telerik:RadComboBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="FromAddress" HeaderText="FromAddress" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="FrServicePtLbl" Text='<%# DataBinder.Eval(Container.DataItem, "FrServicePt")%>'></asp:Label>
                                                <%# (string.IsNullOrEmpty(string.Format("{0:}",Eval("FrServicePt"))) || string.IsNullOrEmpty(string.Format("{0:}",Eval("FrAddr")))) ? "":"<br />"%>
                                                <asp:Label runat="server" ID="FrAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "FrAddr")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="FrServicePtCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                                    Skin="WebBlue" Width="120px" OnClientDropDownClosed="FromAddress_DropDownClosed" DropDownAutoWidth="Enabled"
                                                    RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                    EnableLoadOnDemand="true" OnItemsRequested="ServicePtCombo_ItemsRequested">
                                                </telerik:RadComboBox>
                                                <br />
                                                <telerik:RadTextBox runat="server" ID="FrAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="ToAddress" HeaderText="ToAddress" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="ToServicePtLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ToServicePt")%>'></asp:Label>
                                                <%# (string.IsNullOrEmpty(string.Format("{0:}",Eval("ToServicePt"))) || string.IsNullOrEmpty(string.Format("{0:}",Eval("ToAddr")))) ? "":"<br />"%>
                                                <asp:Label runat="server" ID="ToAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ToAddr")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="ToServicePtCombo" runat="server" DataTextField="Descr" DataValueField="Item" OnClientDropDownClosed="ToAddress_DropDownClosed"
                                                    RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtCombo_ItemsRequested" CausesValidation="false"
                                                    HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                                </telerik:RadComboBox>
                                                <br />
                                                <telerik:RadTextBox runat="server" ID="ToAddrTxt" TextMode="MultiLine" Width="140px" Rows="3">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" />
                                        <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="false" />
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel ID="ManpowerPanel" runat="server">
                    <br />
                    &nbsp;
                    <asp:Label runat="server" Text="Manpower" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="NewAtvtBtn" runat="server" Text="NewATVT" CssClass="white" OnClick="NewAtvtBtn_Click"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="DeleteAtvtBtn" runat="server" Text="DeleteATVT" CssClass="white" OnClick="DeleteAtvtBtn_Click"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:UpdatePanel ID="ManpowerUpdatePanel" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <telerik:RadGrid ID="MPResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                AllowSorting="true" EnableLinqExpressions="false" RenderMode="Lightweight" AllowFilteringByColumn="false"
                                AllowPaging="true" Skin="Metro" OnNeedDataSource="MPResultDG_NeedDataSource" OnBatchEditCommand="MPResultDG_BatchEditCommand">
                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" EditMode="Batch" AllowFilteringByColumn="false" CommandItemDisplay="TopAndBottom" DataKeyNames="Id">
                                    <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="ChkIcon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                            <HeaderTemplate>
                                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="FromDate" HeaderText="FromDate" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <%# string.Format("{0:dd/MMM/yyyy}",Eval("FrExpDate")) %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDatePicker ID="FromDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                    <Calendar runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#66ccff" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="ToDate" HeaderText="ToDate" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <%# string.Format("{0:dd/MMM/yyyy}",Eval("ToExpDate")) %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDatePicker ID="ToDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                    <Calendar runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#66ccff" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Activity" HeaderText="Activity" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <%# Eval("PerAtvtCodeDescr") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="ActivityCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                                    Skin="WebBlue" Width="140px" DropDownAutoWidth="Enabled"
                                                    RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                    EnableLoadOnDemand="true" OnItemsRequested="ActivityCombo_ItemsRequested">
                                                </telerik:RadComboBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="ActivityDescription" HeaderText="ActivityDescription" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <%# Eval("AtvtDescr") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="ActivityDescriptionTxt" TextMode="MultiLine" Width="220px" Rows="3">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <%# Eval("AtvtRemarks") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="RemarksTxt" TextMode="MultiLine" Width="220px" Rows="3">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="Id" Display="false" />
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>

        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                //VehicleDriver
                var VehicleDriver = function (VehNo, Driver, VehNoValue, DriverValue) {
                    this.VehNo = VehNo;
                    this.VehNoValue = VehNoValue;
                    this.Driver = Driver;
                    this.DriverValue = DriverValue;
                }
                VehicleDriver.prototype.equals = function (vehicledriver) {
                    if (this.VehNo === vehicledriver.VehNo && this.Driver === vehicledriver.Driver) {
                        return true;
                    }
                    return false;
                }
                VehicleDriver.prototype.toString = function () {
                    return JSON.stringify({
                        VehNo: this.VehNoValue, VehNoDescr: this.VehNo,
                        Driver: this.DriverValue, DriverDescr: this.Driver
                    });
                }

                //ServicePtDescrAndAddr
                var ServicePtDescrAndAddr = function (ServicePtDescr, Addr, ServicePtCode) {
                    this.ServicePtDescr = ServicePtDescr;
                    this.Addr = Addr;
                    this.ServicePtCode = ServicePtCode;
                }
                ServicePtDescrAndAddr.prototype.equals = function (ServicePtDescrAddrTxt) {
                    if (this.ServicePtDescr === ServicePtDescrAddrTxt.ServicePtDescr && this.Addr === ServicePtDescrAddrTxt.Addr) {
                        return true;
                    }
                    return false;
                }
                ServicePtDescrAndAddr.prototype.toString = function () {
                    return JSON.stringify({
                        Addr: this.Addr, ServicePtCode: this.ServicePtCode,
                        ServicePtDescr: this.ServicePtDescr
                    }).replaceAll("'", "\\'");
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
            <script type="text/javascript">
                function GetCellValue(sender, args) {
                    //VehicleDriver
                    if (args.get_columnUniqueName() === "VehicleDriver") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var VehNo = $telerik.findElement(Container, "VehicleLbl").innerHTML;
                        var Driver = $telerik.findElement(Container, "DriverLbl").innerHTML;
                        args.set_value(new VehicleDriver(VehNo, Driver));
                    }

                    //FromAddress
                    if (args.get_columnUniqueName() === "FromAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Addr = $telerik.findElement(Container, "FrAddrLbl").innerHTML;
                        if (Addr.includes("&nbsp;")) {
                            Addr = $telerik.findElement(Container, "FrAddrLbl").innerText;
                        }
                        var ServicePtDescr = $telerik.findElement(Container, "FrServicePtLbl").innerHTML;
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                    }

                    //ToAddress
                    if (args.get_columnUniqueName() === "ToAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Addr = $telerik.findElement(Container, "ToAddrLbl").innerHTML;
                        if (Addr.includes("&nbsp;")) {
                            Addr = $telerik.findElement(Container, "ToAddrLbl").innerText;
                        }
                        var ServicePtDescr = $telerik.findElement(Container, "ToServicePtLbl").innerHTML;
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">
            <script type="text/javascript">
                function SetCellValue(sender, args) {
                    //VehicleDriver
                    if (args.get_columnUniqueName() === "VehicleDriver") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "VehicleLbl").innerHTML = Value.VehNo;
                        $telerik.findElement(Container, "DriverLbl").innerHTML = Value.Driver;
                    }

                    //FromAddress
                    if (args.get_columnUniqueName() === "FromAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "FrServicePtLbl").innerHTML = Value.ServicePtDescr;
                        $telerik.findElement(Container, "FrAddrLbl").innerHTML = Value.Addr;
                    }

                    //ToAddress
                    if (args.get_columnUniqueName() === "ToAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "ToServicePtLbl").innerHTML = Value.ServicePtDescr;
                        $telerik.findElement(Container, "ToAddrLbl").innerHTML = Value.Addr;
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock4" runat="server">
            <script type="text/javascript">
                function GetEditorValue(sender, args) {
                    //VehicleDriver
                    if (args.get_columnUniqueName() === "VehicleDriver") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            VehNo = $telerik.findControl(Container, "VehicleCombo").get_text(),
                            VehNoValue = ($telerik.findControl(Container, "VehicleCombo").get_value().split("|"))[0],
                            Driver = $telerik.findControl(Container, "DriverCombo").get_text(),
                            DriverValue = $telerik.findControl(Container, "DriverCombo").get_value();
                        args.set_value(new VehicleDriver(VehNo, Driver, VehNoValue, DriverValue));
                    }

                    //FromAddress
                    if (args.get_columnUniqueName() === "FromAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "FrAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "FrServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "FrServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }

                    //ToAddress
                    if (args.get_columnUniqueName() === "ToAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "ToAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "ToServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "ToServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock5" runat="server">
            <script type="text/javascript">
                function SetEditorValue(sender, args) {
                    //VehicleDriver
                    if (args.get_columnUniqueName() === "VehicleDriver") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();

                        if ($telerik.findControl(Container, "VehicleCombo") && $telerik.findControl(Container, "VehicleCombo").findItemByText(Value.VehNo))
                            $telerik.findControl(Container, "VehicleCombo").findItemByText(Value.VehNo).select();
                        else
                            $telerik.findControl(Container, "VehicleCombo").set_text(Value.VehNo);

                        if ($telerik.findControl(Container, "DriverCombo") && $telerik.findControl(Container, "DriverCombo").findItemByText(Value.Driver))
                            $telerik.findControl(Container, "DriverCombo").findItemByText(Value.Driver).select();
                        else
                            $telerik.findControl(Container, "DriverCombo").set_text(Value.Driver);
                    }

                    //FromAddress
                    if (args.get_columnUniqueName() === "FromAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "FrAddrTxt").set_value(Value.Addr);

                        if ($telerik.findControl(Container, "FrServicePtCombo") && $telerik.findControl(Container, "FrServicePtCombo").findItemByText(Value.ServicePtDescr))
                            $telerik.findControl(Container, "FrServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                        else
                            $telerik.findControl(Container, "FrServicePtCombo").set_text(Value.ServicePtDescr);
                    }

                    //ToAddress
                    if (args.get_columnUniqueName() === "ToAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "ToAddrTxt").set_value(Value.Addr);

                        if ($telerik.findControl(Container, "ToServicePtCombo") && $telerik.findControl(Container, "ToServicePtCombo").findItemByText(Value.ServicePtDescr))
                            $telerik.findControl(Container, "ToServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                        else
                            $telerik.findControl(Container, "ToServicePtCombo").set_text(Value.ServicePtDescr);
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock6" runat="server">
            <script type="text/javascript">
                <%--Start Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
                function FromAddress_DropDownClosed(sender, args) {
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var FrServicePtCombo = $telerik.findControl(CurrentRow, "FrServicePtCombo").get_value();
                    if (FrServicePtCombo != null && FrServicePtCombo != "") {
                        var FrServicePtAddrPair = FrServicePtCombo.split("|");
                        $telerik.findControl(CurrentRow, "FrAddrTxt").set_value(FrServicePtAddrPair[1]);
                    }
                }

                function ToAddress_DropDownClosed(sender, args) {
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var ToServicePtCombo = $telerik.findControl(CurrentRow, "ToServicePtCombo").get_value();
                    if (ToServicePtCombo != null && ToServicePtCombo != "") {
                        var ToServicePtAddrPair = ToServicePtCombo.split("|");
                        $telerik.findControl(CurrentRow, "ToAddrTxt").set_value(ToServicePtAddrPair[1]);
                    }
                }

                function VehicleCombo_DropDownClosed(sender, args) {
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var VehicleList = $telerik.findControl(CurrentRow, "VehicleCombo").get_value();

                    if (VehicleList != null && VehicleList != "") {
                        var VehNoDriverPair = VehicleList.split("|");
                        var DefaultDriverId = VehNoDriverPair[1];
                        var DefaultDriverName = VehNoDriverPair[2];

                        if ($telerik.findControl(CurrentRow, "DriverCombo") && $telerik.findControl(CurrentRow, "DriverCombo").findItemByText(DefaultDriverName))
                            $telerik.findControl(CurrentRow, "DriverCombo").findItemByText(DefaultDriverName).select();
                        else
                            $telerik.findControl(CurrentRow, "DriverCombo").set_text(DefaultDriverName);
                    }
                    else {
                        $telerik.findControl(CurrentRow, "DriverCombo").set_text("");
                    }
                }
                <%--End Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock7" runat="server">
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

                function OnClientClose(sender, args) {
                    document.location.href = document.location.href;
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
