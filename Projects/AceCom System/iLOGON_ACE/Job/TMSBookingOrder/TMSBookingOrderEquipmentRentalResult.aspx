<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderEquipmentRentalResult.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderEquipmentRentalResult" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Main @ TMS Booking Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
</head>

<body>
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Panel ID="EQRPanel" runat="server">
            <br />
            <table>
                <tr>
                    <td>&nbsp;
                        <asp:Button ID="EquipmentRentalAddBtn" runat="server" Text="Add" OnClick="EquipmentRentalAddBtn_Click"
                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                        <asp:Button ID="EQRAssignBtn" runat="server" Text="Assign" OnClick="EQRAssignBtn_Click"
                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                        <asp:Button ID="EQRCompleteBtn" runat="server" Text="Complete" OnClick="EQRCompleteBtn_Click"
                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                          <asp:Button ID="OpenBtn" runat="server" Text="Open" OnClick="OpenBtn_Click"
                              OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                          <asp:Button ID="DeleteBtn" runat="server" Text="Delete" OnClick="DeleteBtn_Click"
                              OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                          <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click"
                              OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                    </td>
                </tr>
            </table>
            <br />
            <telerik:RadGrid ID="EQRResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" EnableLinqExpressions="false" RenderMode="Lightweight" AllowFilteringByColumn="false"
                AllowPaging="true" Skin="Metro" OnNeedDataSource="EQRResultDG_NeedDataSource" OnBatchEditCommand="EQRResultDG_BatchEditCommand" OnItemDataBound="EQRResultDG_ItemDataBound">
                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                    <ClientEvents OnBatchEditGetCellValue="EQRResultDGGetCellValue" OnBatchEditSetCellValue="EQRResultDGSetCellValue" OnBatchEditGetEditorValue="EQRResultDGGetEditorValue" OnBatchEditSetEditorValue="EQRResultDGSetEditorValue" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBCtnrId" EditMode="Batch" CommandItemDisplay="TopAndBottom">
                    <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                    <CommandItemSettings ShowAddNewRecordButton="false" />
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="ChkIcon" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                            <HeaderTemplate>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="EQRCheckAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="EquipmentNo" HeaderText="EquipmentNo" HeaderStyle-Width="170px" ItemStyle-Width="170px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="EquipmentNoLbl" Text='<%# string.Format("{0:}",Eval("VehNo1Descr")) %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="EquipmentNoCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                    Skin="WebBlue" Width="155" OnClientDropDownClosed="EquipmentNo_ClientDropDownClosed"
                                    RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                    EnableLoadOnDemand="true" OnItemsRequested="EquipmentNoCombo_ItemsRequested">
                                </telerik:RadComboBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Operator" HeaderText="Operator" HeaderStyle-Width="170px" ItemStyle-Width="170px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="OperatorLbl" Text='<%# string.Format("{0:}",Eval("TpterDriverName")) %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="OperatorCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                    Skin="WebBlue" Width="155" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                    EnableLoadOnDemand="true" OnItemsRequested="OperatorCombo_ItemsRequested">
                                </telerik:RadComboBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="AddOnService" HeaderText="AddOnService" HeaderStyle-Width="170px" ItemStyle-Width="170px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="AddOnServiceLbl" Text='<%# string.Format("{0:}",Eval("BillingNotesDescr")) %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="AddOnServiceCombo" runat="server" DataTextField="Descr" DataValueField="Item" CheckBoxes="true" EnableCheckAllItemsCheckBox="true"
                                    Skin="WebBlue" Width="155" RenderMode="Lightweight" CausesValidation="false"
                                    OnLoad="AddOnServiceCombo_Load" EnableLoadOnDemand="true">
                                </telerik:RadComboBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="FromDate" HeaderText="FromDate" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <%# string.Format("{0:dd/MMM/yyyy}",Eval("ExpDate")) %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDatePicker ID="FromDateDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                    <Calendar runat="server">
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </Calendar>
                                </telerik:RadDatePicker>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="ToDate" HeaderText="ToDate" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <%# string.Format("{0:dd/MMM/yyyy}",Eval("EndDate")) %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDatePicker ID="ToDateDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                    <Calendar runat="server">
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </Calendar>
                                </telerik:RadDatePicker>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="FromServicePointAndAddr" HeaderText="FromServicePoint <br/> FromAddress" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="FromServicePointLbl" Text='<%# DataBinder.Eval(Container.DataItem, "FrServicePt")%>'></asp:Label>
                                <%# (string.IsNullOrEmpty(string.Format("{0:}",Eval("FrServicePt"))) || string.IsNullOrEmpty(string.Format("{0:}",Eval("FrAddr")))) ? "":"<br /><br />"%>
                                <asp:Label runat="server" ID="FromAddressLbl" Text='<%# DataBinder.Eval(Container.DataItem, "FrAddr")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="FromServicePointCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                    Skin="WebBlue" Width="155" OnClientDropDownClosed="FromServicePointCombo_DropDownClosed" DropDownAutoWidth="Enabled"
                                    RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                    EnableLoadOnDemand="true" OnItemsRequested="ServicePtCombo_ItemsRequested">
                                </telerik:RadComboBox>
                                <br />
                                <br />
                                <telerik:RadTextBox runat="server" ID="FromAddressTxtBox" TextMode="MultiLine" Rows="3" Width="155">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="ToServicePointAndAddr" HeaderText="ToServicePoint <br/> ToAddress" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ToServicePointLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ToServicePt")%>'></asp:Label>
                                <%# (string.IsNullOrEmpty(string.Format("{0:}",Eval("ToServicePt"))) || string.IsNullOrEmpty(string.Format("{0:}",Eval("ToAddr")))) ? "":"<br /><br />"%>
                                <asp:Label runat="server" ID="ToAddressLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ToAddr")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="ToServicePointCombo" runat="server" DataTextField="Descr" DataValueField="Item" OnClientDropDownClosed="ToServicePointCombo_DropDownClosed"
                                    RenderMode="Lightweight" Skin="WebBlue" Width="155" OnItemsRequested="ServicePtCombo_ItemsRequested" CausesValidation="false"
                                    HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                </telerik:RadComboBox>
                                <br />
                                <br />
                                <telerik:RadTextBox runat="server" ID="ToAddressTxtBox" TextMode="MultiLine" Width="155" Rows="3">
                                </telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="StatusDescr" HeaderText="Status" UniqueName="StatusDescr" ReadOnly="true" HeaderStyle-Width="130px" ItemStyle-Width="130px" />
                        <telerik:GridBoundColumn DataField="JBCtnrId" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="JBId" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="StatusColourCode" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" Display="false"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <asp:HiddenField ID="ToAddressLblHiddenField" runat="server" />
        </asp:Panel>
    </form>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            //AddOnService
            var AddOnService = function (BillingNotes, BillingNoteValue) {
                this.BillingNotes = BillingNotes;
                this.BillingNoteValue = BillingNoteValue;
            }
            AddOnService.prototype.equals = function (addonservices) {
                if (this.BillingNotes === addonservices.BillingNotes) {
                    return true;
                }
                return false;
            }
            AddOnService.prototype.toString = function () {
                return JSON.stringify({
                    BillingNotes: this.BillingNotes, BillingNoteValue: this.BillingNoteValue
                }).replaceAll("'", "\\'");
            }

            //EquipmentNo
            var Equipment = function (EquipmentNo, EquipmentNoValue) {
                this.EquipmentNo = EquipmentNo;
                this.EquipmentNoValue = EquipmentNoValue;
            }
            Equipment.prototype.equals = function (equipment) {
                if (this.EquipmentNo === equipment.EquipmentNo) {
                    return true;
                }
                return false;
            }
            Equipment.prototype.toString = function () {
                return JSON.stringify({
                    EquipmentNo: this.EquipmentNoValue, EquipmentNoDescr: this.EquipmentNo
                });
            }

            //Operator
            var Opt = function (Operator, OperatorValue) {
                this.Operator = Operator;
                this.OperatorValue = OperatorValue;
            }
            Opt.prototype.equals = function (opt) {
                if (this.Operator === opt.Operator) {
                    return true;
                }
                return false;
            }
            Opt.prototype.toString = function () {
                return JSON.stringify({
                    Operator: this.OperatorValue, OperatorDescr: this.Operator
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
            //EQRResultDG
            function EQRResultDGGetCellValue(sender, args) {
                //AddOnService
                if (args.get_columnUniqueName() === "AddOnService") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var BillingNotes = $telerik.findElement(Container, "AddOnServiceLbl").innerText;
                    args.set_value(new AddOnService(BillingNotes));
                }

                //FromServicePointAndAddr
                if (args.get_columnUniqueName() === "FromServicePointAndAddr") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Addr = $telerik.findElement(Container, "FromServicePointLbl").innerText;
                    var ServicePtDescr = $telerik.findElement(Container, "FromAddressLbl").innerText;
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                }

                //ToServicePointAndAddr
                if (args.get_columnUniqueName() === "ToServicePointAndAddr") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Addr = $telerik.findElement(Container, "ToServicePointLbl").innerText;
                    var ServicePtDescr = $telerik.findElement(Container, "ToAddressLbl").innerText;
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                }

                //EquipmentNo
                if (args.get_columnUniqueName() === "EquipmentNo") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var EquipmentNo = $telerik.findElement(Container, "EquipmentNoLbl").innerText;
                    args.set_value(new Equipment(EquipmentNo));
                }

                //Operator
                if (args.get_columnUniqueName() === "Operator") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Operator = $telerik.findElement(Container, "OperatorLbl").innerText;
                    args.set_value(new Opt(Operator));
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">
        <script type="text/javascript">
            //EQRResultDG
            function EQRResultDGSetCellValue(sender, args) {
                //AddOnService
                if (args.get_columnUniqueName() === "AddOnService") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "AddOnServiceLbl").innerText = Value.BillingNotes;
                }

                //FromServicePointAndAddr
                if (args.get_columnUniqueName() === "FromServicePointAndAddr") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "FromServicePointLbl").innerText = Value.ServicePtDescr;
                    $telerik.findElement(Container, "FromAddressLbl").innerText = Value.Addr;
                }

                //ToServicePointAndAddr
                if (args.get_columnUniqueName() === "ToServicePointAndAddr") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "ToServicePointLbl").innerText = Value.ServicePtDescr;
                    $telerik.findElement(Container, "ToAddressLbl").innerText = Value.Addr;
                }

                //EquipmentNo
                if (args.get_columnUniqueName() === "EquipmentNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "EquipmentNoLbl").innerText = Value.EquipmentNo;
                }

                //Operator
                if (args.get_columnUniqueName() === "Operator") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "OperatorLbl").innerText = Value.Operator;
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock4" runat="server">
        <script type="text/javascript">
            // EQRResultDG

            function EQRResultDGGetEditorValue(sender, args) {
                //AddOnService
                if (args.get_columnUniqueName() === "AddOnService") {
                    args.set_cancel(true);
                    var CheckedItemArr = [];
                    var BillingNotes = "", BillingNoteValue = "";
                    var Container = args.get_container();
                    var CheckedItemArr = $telerik.findControl(Container, "AddOnServiceCombo").get_checkedItems();
                    for (var i = 0; i < CheckedItemArr.length; i++) {
                        var CheckedDescrValue = $telerik.findControl(Container, "AddOnServiceCombo").get_checkedItems()[i].get_text();

                        if (BillingNotes == "") {
                            BillingNotes = CheckedDescrValue;
                        }
                        else {
                            BillingNotes = BillingNotes + "," + CheckedDescrValue;
                        }

                        var CheckedItemValue = $telerik.findControl(Container, "AddOnServiceCombo").get_checkedItems()[i].get_value();

                        if (BillingNoteValue == "") {
                            BillingNoteValue = CheckedItemValue;
                        }
                        else {
                            BillingNoteValue = BillingNoteValue + "," + CheckedItemValue;
                        }
                    }
                    args.set_value(new AddOnService(BillingNotes, BillingNoteValue));
                }

                //FromServicePointAndAddr
                if (args.get_columnUniqueName() === "FromServicePointAndAddr") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Addr = $telerik.findControl(Container, "FromAddressTxtBox").get_value(),
                        ServicePtCode = ($telerik.findControl(Container, "FromServicePointCombo").get_value().split("|"))[0],
                        ServicePtDescr = $telerik.findControl(Container, "FromServicePointCombo").get_text();
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                }

                //ToServicePointAndAddr
                if (args.get_columnUniqueName() === "ToServicePointAndAddr") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Addr = $telerik.findControl(Container, "ToAddressTxtBox").get_value(),
                        ServicePtCode = ($telerik.findControl(Container, "ToServicePointCombo").get_value().split("|"))[0],
                        ServicePtDescr = $telerik.findControl(Container, "ToServicePointCombo").get_text();
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                }

                //EquipmentNo
                if (args.get_columnUniqueName() === "EquipmentNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        EquipmentNo = $telerik.findControl(Container, "EquipmentNoCombo").get_text(),
                        EquipmentNoValue = ($telerik.findControl(Container, "EquipmentNoCombo").get_value().split("|"))[0];
                    args.set_value(new Equipment(EquipmentNo, EquipmentNoValue));
                }

                //Operator
                if (args.get_columnUniqueName() === "Operator") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Operator = $telerik.findControl(Container, "OperatorCombo").get_text(),
                        OperatorValue = $telerik.findControl(Container, "OperatorCombo").get_value();
                    args.set_value(new Opt(Operator, OperatorValue));
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock5" runat="server">
        <script type="text/javascript">
            // For EQRResultDG
            function EQRResultDGSetEditorValue(sender, args) {
                //AddOnService
                if (args.get_columnUniqueName() === "AddOnService") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    if (Value.BillingNotes != null) {
                        var MultiBillingNotes = Value.BillingNotes.split(",");

                        if ($telerik.findControl(Container, "AddOnServiceCombo")) {
                            // Start Region : Remove previous Checked Item
                            var AddOnServiceCombo = $telerik.findControl(Container, "AddOnServiceCombo");

                            for (var i = 0; i < AddOnServiceCombo.get_items().get_count(); i++) {
                                AddOnServiceCombo.get_items().getItem(i).set_checked(false);
                            }
                            AddOnServiceCombo.commitChanges();
                            // EndRegion

                            for (var i = 0; i < MultiBillingNotes.length; i++) {

                                if ($telerik.findControl(Container, "AddOnServiceCombo")) {
                                    if ($telerik.findControl(Container, "AddOnServiceCombo").findItemByText(MultiBillingNotes[i].trim())) {
                                        $telerik.findControl(Container, "AddOnServiceCombo").findItemByText(MultiBillingNotes[i].trim()).set_checked(true);
                                    }
                                }
                            }
                        }

                        $telerik.findControl(Container, "AddOnServiceCombo").set_text(Value.BillingNotes);
                    }
                }

                //FromServicePointAndAddr
                if (args.get_columnUniqueName() === "FromServicePointAndAddr") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "FromAddressTxtBox").set_value(Value.Addr);

                    if ($telerik.findControl(Container, "FromServicePointCombo") && $telerik.findControl(Container, "FromServicePointCombo").findItemByText(Value.ServicePtDescr))
                        $telerik.findControl(Container, "FromServicePointCombo").findItemByText(Value.ServicePtDescr).select();
                    else
                        $telerik.findControl(Container, "FromServicePointCombo").set_text(Value.ServicePtDescr);
                }

                //ToServicePointAndAddr
                if (args.get_columnUniqueName() === "ToServicePointAndAddr") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "ToAddressTxtBox").set_value(Value.Addr);

                    if ($telerik.findControl(Container, "ToServicePointCombo") && $telerik.findControl(Container, "ToServicePointCombo").findItemByText(Value.ServicePtDescr))
                        $telerik.findControl(Container, "ToServicePointCombo").findItemByText(Value.ServicePtDescr).select();
                    else
                        $telerik.findControl(Container, "ToServicePointCombo").set_text(Value.ServicePtDescr);
                }

                //EquipmentNo
                if (args.get_columnUniqueName() === "EquipmentNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();

                    if ($telerik.findControl(Container, "EquipmentNoCombo") && $telerik.findControl(Container, "EquipmentNoCombo").findItemByText(Value.EquipmentNo))
                        $telerik.findControl(Container, "EquipmentNoCombo").findItemByText(Value.EquipmentNo).select();
                    else
                        $telerik.findControl(Container, "EquipmentNoCombo").set_text(Value.EquipmentNo);
                }

                //Operator
                if (args.get_columnUniqueName() === "Operator") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();

                    if ($telerik.findControl(Container, "OperatorCombo") && $telerik.findControl(Container, "OperatorCombo").findItemByText(Value.Operator))
                        $telerik.findControl(Container, "OperatorCombo").findItemByText(Value.Operator).select();
                    else
                        $telerik.findControl(Container, "OperatorCombo").set_text(Value.Operator);
                }
            }

        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock6" runat="server">
        <script type="text/javascript">
            function EQRCheckAll(id) {
                var MasterTable = $find("<%= EQRResultDG.ClientID %>").get_masterTableView();
                var row = MasterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        MasterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        MasterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }

            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock7" runat="server">
        <script type="text/javascript">
            function EquipmentNo_ClientDropDownClosed(sender, eventArgs) {
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var EquipmentNo = $telerik.findControl(CurrentRow, "EquipmentNoCombo").get_value();

                if (EquipmentNo != null && EquipmentNo != "") {
                    var EquipmentNoOperatorPair = EquipmentNo.split("|");
                    var DefaultOperatorName = EquipmentNoOperatorPair[2];

                    if ($telerik.findControl(CurrentRow, "OperatorCombo") && $telerik.findControl(CurrentRow, "OperatorCombo").findItemByText(DefaultOperatorName))
                        $telerik.findControl(CurrentRow, "OperatorCombo").findItemByText(DefaultOperatorName).select();
                    else
                        $telerik.findControl(CurrentRow, "OperatorCombo").set_text(DefaultOperatorName);
                }
                else {
                    $telerik.findControl(CurrentRow, "OperatorCombo").set_text("");
                }
            }

            function FromServicePointCombo_DropDownClosed(sender, args) {
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var PickUpServicePt = $telerik.findControl(CurrentRow, "FromServicePointCombo").get_value();
                if (PickUpServicePt != null && PickUpServicePt != "") {
                    var PickUpServicePtAddrPair = PickUpServicePt.split("|");
                    $telerik.findControl(CurrentRow, "FromAddressTxtBox").set_value(PickUpServicePtAddrPair[1]);
                }
            }

            function ToServicePointCombo_DropDownClosed(sender, args) {
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var DropOffServicePt = $telerik.findControl(CurrentRow, "ToServicePointCombo").get_value();

                if (DropOffServicePt != null && DropOffServicePt != "") {
                    var DropOffServicePtAddrPair = DropOffServicePt.split("|");
                    $telerik.findControl(CurrentRow, "ToAddressTxtBox").set_value(DropOffServicePtAddrPair[1]);
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>
