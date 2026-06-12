<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBillingWorkbenchBillableByContainer.aspx.cs" Inherits="iWMS.Web.Job.TMSBillingWorkbench.TMSBillingWorkbenchBillableByContainer" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BillableByContainer @ TMSBillingWorkbench</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .headerbutton {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background-color: white;
            z-index: 100;
            width: 100%;
        }

        /* The switch - the box around the slider */
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 28px;
        }

            /* Hide default HTML checkbox */
            .switch input {
                display: none;
            }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #A8A8A8;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 22px;
                width: 28px;
                left: 3px;
                bottom: 3px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #393;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #393;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 5px;
        }

            .slider.round:before {
                border-radius: 20%;
            }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
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

            var previousCtnrno = '';
            function ContainerDG_RowSelecting(sender, eventArgs) {
                var selectedDataItem = eventArgs.get_gridDataItem();
                var selectedCtnrno = selectedDataItem.get_cell('ctnrno').innerText.toLowerCase();

                var showAll = false;
                if (previousCtnrno === selectedCtnrno) {
                    eventArgs.set_cancel(true);
                    showAll = true;
                    previousCtnrno = '';
                }
                else previousCtnrno = selectedCtnrno;

                var dataItemsArr = $find("<%=AdditionalInfoDG.ClientID%>").get_masterTableView().get_dataItems();
                for (var i = 0; i < dataItemsArr.length; i++) {
                    var dataItem = dataItemsArr[i];
                    dataItem.set_visible(showAll || dataItem.get_cell('ctnrno').innerText.toLowerCase() === selectedCtnrno);
                }
            }

            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>&nbsp;<asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table>
                    <tr>
                        <td align="left">
                            <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click" CausesValidation="false"
                                Visible="true" Text="Save" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="GenerateBtn" CssClass="white" runat="server"
                                OnClick="GenerateBtn_Click" Text="Generate" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="QuBtn" CssClass="white" runat="server"
                                OnClick="QuBtnBtn_Click" Text="Add" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="DelImgBtn" CssClass="white" runat="server"
                                OnClick="DeleteBtn_Click" Text="Delete" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp; 
                            <asp:Button ID="BillBtn" CssClass="white" runat="server" OnClick="BillBtn_Click" Text="Bill" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="UndoBillBtn" CssClass="white" runat="server" OnClick="UndoBillBtn_Click" Text="UndoBill" CausesValidation="false"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="InvoiceBtn" runat="server" CssClass="blue" ToolTip="Invoice" UseSubmitBehavior="false" CausesValidation="false"
                                OnClick="InvoiceBtn_Click" Text="Invoice" OnClientClick="disableBtn(this.id)" />
                            &nbsp;  
                            <asp:Button ID="PreviewBtn" runat="server" CssClass="blue" ToolTip="Preview" UseSubmitBehavior="false" CausesValidation="false"
                                OnClick="PreviewBtn_Click" Text="Preview" OnClientClick="disableBtn(this.id)" />
                            &nbsp;  
                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" OnClick="PrevItemBtn_Click" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" OnClick="NextItemBtn_Click" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" CssClass="Pagetitle"></asp:Label>
                        </td>
                        <td align="right">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td align="right">
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <div id="div3" style="height: 100%">
                    <table width="100%" style="table-layout: fixed;">
                        <tr>
                            <td style="padding-right: 10px;">
                                <telerik:RadGrid ID="ContainerDG" runat="server" AutoGenerateColumns="false" GridLines="None" Height="175px" Width="100%"
                                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                    AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ContainerDG_NeedDataSource">
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="170px" />
                                        <ClientEvents OnRowSelecting="ContainerDG_RowSelecting" />
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                    <ItemStyle Wrap="true"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" UniqueName="ctnrno" HeaderText="Containerno">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="jobtype" SortExpression="jobtype" HeaderText="JobType">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="tpttype" SortExpression="tpttype" HeaderText="TransportType">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="billsizetype" SortExpression="billsizetype" HeaderText="ContainerSize">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="billoption1" SortExpression="billoption1" HeaderText="BillOption1">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridDateTimeColumn DataField="expdate" SortExpression="expdate" HeaderText="RequiredDate" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridDateTimeColumn>
                                            <telerik:GridBoundColumn DataField="VerifiedGrossMass" SortExpression="VerifiedGrossMass" HeaderText="VGM">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridDateTimeColumn DataField="ReeferPointPlugInStartDate" SortExpression="ReeferPointPlugInStartDate" HeaderText="PlugInStartDate" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridDateTimeColumn>
                                            <telerik:GridDateTimeColumn DataField="ReeferPointPlugInEndDate" SortExpression="ReeferPointPlugInEndDate" HeaderText="PlugInEndDate" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridDateTimeColumn>
                                            <telerik:GridDateTimeColumn DataField="DetentionExpiryDate" SortExpression="DetentionExpiryDate" HeaderText="DetentionExpiry" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridDateTimeColumn>
                                            <telerik:GridDateTimeColumn DataField="StoreRentExpiryDate" SortExpression="StoreRentExpiryDate" HeaderText="FreeStorageExpiry" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridDateTimeColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <br />
                                <telerik:RadGrid ID="PayableDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" Height="175px" Width="100%"
                                    Skin="Office2007" OnNeedDataSource="PayableDG_NeedDataSource" AllowPaging="true"
                                    GroupPanelPosition="Top">
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="170px" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                    <ItemStyle Wrap="true"></ItemStyle>
                                    <HeaderStyle Wrap="true"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="cbdid" PageSize="150"
                                        AllowAutomaticUpdates="true" TableLayout="Auto">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Type" Display="false"
                                                AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="number" UniqueName="number" Display="true" SortExpression="number"
                                                AllowFiltering="false" HeaderText="ReferenceNo">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="trandate" HeaderText="Date" AllowFiltering="false"
                                                DataField="trandate">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "trandate", "{0:dd/MMM/yyyy}")%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type"
                                                AllowFiltering="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="exref1" HeaderText="VendorDocNo" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "exref1")%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="exdate1" HeaderText="VendorDocDate" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "exdate1", "{0:dd/MMM/yyyy}")%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="cbdctnrno" SortExpression="cbdctnrno" HeaderText="ContainerNo"
                                                AllowFiltering="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="chargedescr" HeaderText="Charge" AllowFiltering="false"
                                                DataField="chargedescr">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "chargedescr")%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="Charge" HeaderText="ChargeDescr" DataField="CBDETLCHARGE"
                                                AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "CBDETLCHARGE")%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="cbdqty" HeaderText="Qty" AllowFiltering="false"
                                                DataField="cbdqty">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "cbdqty", "{0:#,0.##}")%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="cbdunitrate" HeaderText="Rate" AllowFiltering="false"
                                                DataField="cbdunitrate">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "cbdunitrate", "{0:#,0.00}")%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="cbdfcamt" HeaderText="Amount" DataField="cbdfcamt"
                                                AllowFiltering="false">
                                                <HeaderStyle Wrap="false" HorizontalAlign="left" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "cbdfcamt", "{0:#,0.00}")%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="cbdrem1" HeaderText="Remark" DataField="cbdrem1"
                                                AllowFiltering="false">
                                                <HeaderStyle Wrap="false" HorizontalAlign="left" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "cbdrem1")%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn UniqueName="cbid" DataField="id" Display="false"></telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                            <td>
                                <telerik:RadGrid ID="AdditionalInfoDG" runat="server" AutoGenerateColumns="false" GridLines="None" Height="350px"
                                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                    AllowPaging="false" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="AdditionalInfoDG_NeedDataSource">
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="340px" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                    <ItemStyle Wrap="true"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" UniqueName="ctnrno" HeaderText="ContainerNo">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridDateTimeColumn DataField="TripDate" SortExpression="TripDate" UniqueName="TripDate" HeaderText="Trip Date" DataFormatString="{0:dd/MMM/yyyy}">
                                            </telerik:GridDateTimeColumn>
                                            <telerik:GridBoundColumn DataField="TripType" SortExpression="TripType" UniqueName="TripType" HeaderText="Trip Type">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Vehicle" SortExpression="Vehicle" UniqueName="Vehicle" HeaderText="Vehicle">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Driver" SortExpression="Driver" UniqueName="Driver" HeaderText="Driver">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FromAddress" SortExpression="FromAddress" UniqueName="FromAddress" HeaderText="From Address">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ToAddress" SortExpression="ToAddress" UniqueName="ToAddress" HeaderText="To Address">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <asp:Panel ID="ChargeGroupFilterPanel" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadComboBox ID="ChargeGroupCombo" runat="server" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" Width="160px" Skin="WebBlue" DataValueField="Item" DataTextField="Descr"
                                        OnLoad="ChargeGroupCombo_Load" DropDownAutoWidth="Enabled" RenderMode="Lightweight" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Filter="Contains" AllowCustomText="false">
                                    </telerik:RadComboBox>
                                </td>
                                <td>
                                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click" CausesValidation="false"
                                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                        AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG_NeedDataSource"
                        OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="JbChargeId">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                    HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                        <asp:Label ID="invnoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InvNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="JbChargeId" HeaderStyle-HorizontalAlign="Center"
                                    Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="jbchargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "JbChargeId") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="qudtid" HeaderStyle-HorizontalAlign="Center"
                                    Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qudtid") %>'></asp:Label>
                                        <asp:Label ID="DrDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "drdtid") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="SeqNo" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Left" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="SeqNoTxt" runat="server" Width="50" Value='<%# DataBinder.Eval(Container.DataItem, "sno") %>'></asp:TextBox>
                                        <asp:Label ID="quseqnoLbl" runat="server" Width="50" Text='<%# DataBinder.Eval(Container.DataItem, "quseqno") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                                    UniqueName="ChargeDescription" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="chargecodeLbl" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                        <asp:Label ID="chargeLbl" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                                        <asp:TextBox ID="chargeaccode" runat="server" ReadOnly="true" Width="200" Value='<%# DataBinder.Eval(Container.DataItem, "ChargeAcCode") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center" UniqueName="Description" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="DescrTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "jbchargedescr") %>'></asp:TextBox>
                                        <br />
                                        <telerik:RadDatePicker ID="FrExpTxt" Width="110px" runat="server" DateInput-DateFormat="dd/MMM/yyyy" DateInput-EmptyMessage="Date"
                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Visible="true">
                                            <Calendar>
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                </SpecialDays>
                                            </Calendar>
                                        </telerik:RadDatePicker>
                                        <telerik:RadTextBox ID="FrTimeTxt" Width="65px" runat="server" Visible="true" EmptyMessage="Start" Text='<%# DataBinder.Eval(Container.DataItem, "frtime") %>'></telerik:RadTextBox>
                                        <telerik:RadTextBox ID="ToTimeTxt" Width="65px" runat="server" Visible="true" EmptyMessage="End" Text='<%# DataBinder.Eval(Container.DataItem, "totime") %>'></telerik:RadTextBox>
                                        <telerik:RadTextBox ID="VehnoTxt" Width="70px" runat="server" Visible="true" EmptyMessage="VehNo" Text='<%# DataBinder.Eval(Container.DataItem, "jbchargevehno") %>'></telerik:RadTextBox>
                                        <telerik:RadTextBox ID="donoTxt" Width="70px" runat="server" Visible="true" EmptyMessage="DONo" Text='<%# DataBinder.Eval(Container.DataItem, "dono") %>'></telerik:RadTextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="QtyTxt" runat="server" Width="60"
                                            Value='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.0000}") %>'></asp:TextBox>
                                        <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="UnitRateTxt" runat="server" Width="60"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}") %>'></asp:TextBox>
                                        <asp:Label ID="CurrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Disc1" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="dis1txt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "discount1", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Disc2" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="dis2txt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "discount2", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="ExchRateTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LCAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="MinChargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="MinChargeType" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="MinChargeTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargetype", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="MinCharge2" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="MinCharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge2", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="DiscountAmt" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="true">
                                    <ItemTemplate>
                                        <asp:TextBox ID="DiscountAmtTxt" Width="70px" runat="server"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "discountamt", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Internal" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <label class="switch">
                                            <input id="ChargeTypecb" runat="server" type="checkbox" name="switch" value='<%# DataBinder.Eval(Container.DataItem, "chargeoption") %>'>
                                            <div class="slider round"></div>
                                        </label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="VehNo" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <telerik:RadComboBox ID="VehNoDDL" runat="server" DataSource='<%# VehNoDS%>' DataTextField="Descr"
                                            DataValueField="Item" RenderMode="Lightweight" Skin="WebBlue" Filter="Contains" />
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="ChargeGrpCodeDDL" runat="server" DataSource='<%# ChargeGrpDS%>' DataTextField="Descr"
                                            DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChargeGrpDS,DataBinder.Eval(Container.DataItem, "CrossChargeGrpCode").ToString())%>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="BillingAmt" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="BillingAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "billingamt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="TaxType_ddl" runat="server" DataSource='<%# TaxTypeDS%>' DataTextField="Descr"
                                            DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TaxTypeDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>' />
                                        <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxType_ddl"
                                            ErrorMessage="*" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="EstQtyTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="EstQtyTxtCompVal" runat="server" ControlToValidate="EstQtyTxt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="EstUnitCostUOM_ddl" runat="server" DataSource='<%# UomDS%>'
                                            DataTextField="Descr" DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UomDS,DataBinder.Eval(Container.DataItem, "estunitcostuom").ToString())%>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="EstUnitCost" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="EstUnitCostTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="EstUnitCostTxtCompVal" runat="server" ControlToValidate="EstUnitCostTxt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="RemarksTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="invno" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Center" Display="false" />
                                <telerik:GridBoundColumn DataField="drdtid" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="crossvehno">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="JBChargeStatusColourCode">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="AcId" SortExpression="AcId" HeaderText="AcId">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="JbId" SortExpression="JbId" HeaderText="JbId">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="FrExpDate" SortExpression="FrExpDate" HeaderText="FrExpDate">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="ChargeOption" SortExpression="ChargeOption" HeaderText="ChargeOption">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="70%" ID="ContainerNoPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="SplitRatioView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
