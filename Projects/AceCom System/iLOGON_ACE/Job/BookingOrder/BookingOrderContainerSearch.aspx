<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingOrderContainerSearch.aspx.cs" Inherits="iWMS.Web.Job.BookingOrder.BookingOrderContainerSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingOrderContainerSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" href="../../css/style.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="ContainerSearch" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table width="20%" id="report" runat="server">
                    <tr>
                        <td class="style1">
                            <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click"
                                Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Search" />
                            &nbsp;              
                <asp:Button ID="excelImgBtn" CssClass="green" runat="server" OnClick="ExportExcel"
                    Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
                        </td>
                    </tr>
                </table>
                <br />
                <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="ResultDGUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight" AllowFilteringByColumn="true"
                                        OnNeedDataSource="ResultDG_NeedDataSource" OnBatchEditCommand="ResultDG_BatchEditCommand" AllowPaging="true" Visible="false"
                                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound">
                                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                            <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                                            <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                                OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <HeaderStyle Wrap="false" HorizontalAlign="Left"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBCTNRId" Name="ParentGrid" PageSize="50" ItemStyle-HorizontalAlign="Left"
                                            EditMode="Batch" CommandItemDisplay="TopAndBottom">
                                            <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                            <CommandItemSettings ShowAddNewRecordButton="false" />
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                            <Columns>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="EditIcon" AllowFiltering="false" HeaderStyle-Width="60px" ItemStyle-Width="60px">
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" Visible="True" ID="ContainerEditImgBtn"
                                                            ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                                            OnClick="ContainerEditImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                        &nbsp;
                                                <asp:ImageButton runat="server" Visible="True" ID="ShowTripInfoImgBtn"
                                                    ImageUrl="../../image/Note12.ico" Width="15" Height="15" AlternateText="Show Trip Info"
                                                    OnClick="ShowTripInfoImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account" ReadOnly="true" AllowFiltering="true" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn UniqueName="ContainerNo" DataField="ContainerNo" HeaderStyle-Width="150px" ItemStyle-Width="150px" HeaderText="ContainerNo" AllowFiltering="true">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="TripContainerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <telerik:RadTextBox runat="server" ID="ContainerNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="TransportType" UniqueName="TransportType" SortExpression="TransportType" HeaderText="Transport Type" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ContainerStatus" UniqueName="ContainerStatus" SortExpression="ContainerStatus" HeaderText="Container Status" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Carrier" UniqueName="Carrier" SortExpression="Carrier" HeaderText="Carrier" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Yard" UniqueName="Yard" SortExpression="Yard" HeaderText="Yard" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ContainerCompletionDate" UniqueName="ContainerCompletionDate" SortExpression="ContainerCompletionDate" HeaderText="ContainerCompletionDate" ReadOnly="true" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy HH:mm}" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Shipper" UniqueName="Shipper" SortExpression="Shipper" HeaderText="Shipper" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn UniqueName="RequiredDate" HeaderText="RequiredDate" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="RequiredDateLbl" Text='<%# Eval("RequiredDate", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <telerik:RadDateTimePicker ID="RequiredDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                            DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-Display="true">
                                                        </telerik:RadDateTimePicker>
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Vessel" UniqueName="Vessel" SortExpression="Vessel" HeaderText="Vessel" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Voyage" UniqueName="Voyage" SortExpression="Voyage" HeaderText="Voyage" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA" HeaderText="ETA" ReadOnly="true" DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn UniqueName="WarehouseAddress" HeaderText="WarehouseAddress" SortExpression="WarehouseAddress" AllowFiltering="false" ItemStyle-Width="180px"
                                                    HeaderStyle-Width="180px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblWarehouseServicePtDescr" Text='<%# DataBinder.Eval(Container.DataItem, "WarehouseServiceptDescr")%>' Style="display: none;"></asp:Label>
                                                        <br />
                                                        <asp:Label runat="server" ID="lblWarehouseAddr" Text='<%# Eval("WarehouseAddress") %>' Width="140px" CssClass="wordwrap"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <telerik:RadComboBox ID="WarehouseServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                            Skin="WebBlue" Width="140px" OnClientDropDownClosed="WarehouseServicePtList_DropDownClosed"
                                                            DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                            OnLoad="ServicePtList_Load">
                                                        </telerik:RadComboBox>
                                                        <br />
                                                        <br />
                                                        <telerik:RadTextBox runat="server" ID="WarehouseAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                                        </telerik:RadTextBox>
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="Released" UniqueName="Released" SortExpression="Released" HeaderText="Released" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Discharged" UniqueName="Discharged" SortExpression="Discharged" HeaderText="Discharged" ReadOnly="true" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PlugInStartDate" UniqueName="PlugInStartDate" SortExpression="PlugInStartDate" HeaderText="PlugInStartDate" ReadOnly="true" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PlugInEndDate" UniqueName="PlugInEndDate" SortExpression="PlugInEndDate" HeaderText="PlugInEndDate" ReadOnly="true" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="AcId" UniqueName="AcId" Display="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>

                <script type="text/javascript">
                    function WarehouseServicePtList_DropDownClosed(sender, args) {
                        var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                        var WarehouseServicePtList = $telerik.findControl(currentRow, "WarehouseServicePtList").get_value();

                        if (WarehouseServicePtList != null && WarehouseServicePtList != "") {
                            var warehouseServicePtAddrPair = WarehouseServicePtList.split("|");
                            $telerik.findControl(currentRow, "WarehouseAddrTxt").set_value(warehouseServicePtAddrPair[1]); // set the default address in the TextBox
                        }
                    }

                    var ServicePtDescr_AddrTxt = function (servicePtDescr, addrTxt, servicePtCode) {
                        // to display the text to user
                        this.servicePtDescr = servicePtDescr;
                        this.addrTxt = addrTxt;

                        // for server use
                        this.servicePtCode = servicePtCode;
                    }
                    ServicePtDescr_AddrTxt.prototype.equals = function (servicePtDescr_AddrTxt) {
                        if (this.servicePtDescr === servicePtDescr_AddrTxt.servicePtDescr &&
                            this.addrTxt === servicePtDescr_AddrTxt.addrTxt) {
                            return true;
                        }
                        return false;
                    }
                    ServicePtDescr_AddrTxt.prototype.toString = function () {
                        return JSON.stringify({
                            addr: this.addrTxt, servicePtCode: this.servicePtCode,
                            servicePtDescr: this.servicePtDescr
                        }).replaceAll("'", "\\'");
                    }

                    function GetCellValue(sender, args) {
                        if (args.get_columnUniqueName() === "WarehouseAddress") {
                            args.set_cancel(true);
                            var container = args.get_container();
                            var addrTxt = $telerik.findElement(container, "lblWarehouseAddr").innerText;
                            var servicePtDescr = $telerik.findElement(container, "lblWarehouseServicePtDescr").innerText;
                            args.set_value(new ServicePtDescr_AddrTxt(servicePtDescr, addrTxt));
                        }
                    }

                    function SetCellValue(sender, args) {
                        if (args.get_columnUniqueName() === "WarehouseAddress") {
                            args.set_cancel(true);
                            var container = args.get_container(),
                                value = args.get_value();
                            $telerik.findElement(container, "lblWarehouseServicePtDescr").innerText = value.servicePtDescr;
                            $telerik.findElement(container, "lblWarehouseAddr").innerText = value.addrTxt;
                        }
                    }

                    function GetEditorValue(sender, args) {
                        if (args.get_columnUniqueName() === "WarehouseAddress") {
                            args.set_cancel(true);
                            var container = args.get_container(),
                                addrTxt = $telerik.findControl(container, "WarehouseAddrTxt").get_value(),
                                servicePtCode = ($telerik.findControl(container, "WarehouseServicePtList").get_value().split("|"))[0],
                                servicePtDescr = $telerik.findControl(container, "WarehouseServicePtList").get_text();
                            args.set_value(new ServicePtDescr_AddrTxt(servicePtDescr, addrTxt, servicePtCode));
                        }
                    }

                    function SetEditorValue(sender, args) {
                        if (args.get_columnUniqueName() === "WarehouseAddress") {
                            args.set_cancel(true);
                            var container = args.get_container(),
                                value = args.get_value();

                            $telerik.findControl(container, "WarehouseAddrTxt").set_value(value.addrTxt);

                            if ($telerik.findControl(container, "WarehouseServicePtList") && $telerik.findControl(container, "WarehouseServicePtList").findItemByText(value.servicePtDescr))
                                $telerik.findControl(container, "WarehouseServicePtList").findItemByText(value.servicePtDescr).select();
                            else
                                $telerik.findControl(container, "WarehouseServicePtList").set_text(value.servicePtDescr);
                        }
                    }
                </script>

                <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                    <script type="text/javascript">
                        function OnClientCloseShowTripInfo(sender, args) {
                            var MasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                            MasterTable.rebind();
                        }
                    </script>
                </telerik:RadCodeBlock>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
