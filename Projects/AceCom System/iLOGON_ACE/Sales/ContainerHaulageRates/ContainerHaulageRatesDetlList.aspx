<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerHaulageRatesDetlList.aspx.cs" Inherits="iWMS.Web.Sales.ContainerHaulageRates.ContainerHaulageRatesDetlList" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ContainerHaulageRatesForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        // originally taken from https://vanillajstoolkit.com/polyfills/stringreplaceall/
        /**
         * String.prototype.replaceAll() polyfill
         * https://gomakethings.com/how-to-replace-a-section-of-a-string-with-another-one-with-vanilla-js/
         * @author Chris Ferdinandi
         * @license MIT
         */
        if (!String.prototype.replaceAll) {
            String.prototype.replaceAll = function (str, newStr) {

                // If a regex pattern
                if (Object.prototype.toString.call(str).toLowerCase() === '[object regexp]') {
                    return this.replace(str, newStr);
                }

                // If a string
                return this.replace(new RegExp(str, 'g'), newStr);

            };
        }

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
    <style type="text/css">
        .break-text {
            /* Ref: https://forums.asp.net/post/4135657.aspx 
            word-wrap: normal; */
            white-space: normal;
            word-break: break-all;
        }

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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <br />
                <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
                    <Tabs>
                        <telerik:RadTab ID="ResultTap" Text="RatesGrid" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab ID="LogTap" Text="Log" Value="50" runat="server">
                        </telerik:RadTab>

                    </Tabs>
                </telerik:RadTabStrip>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">

                <asp:Panel ID="NewBtnPanel" runat="server"><br />
                    <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New" CausesValidation="false"
                        OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit" CausesValidation="false"
                        OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                    <asp:Button ID="Button1" runat="server" CssClass="white" Text="Resequence" CausesValidation="false"
                        OnClick="ReSeqBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="DeleteBtn" runat="server" CssClass="white" Text="Delete" CausesValidation="false"
                        OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </asp:Panel>

                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand"
                            OnBatchEditCommand="ResultDG_BatchEditCommand">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <ClientSettings>
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="450px" />
                                <Selecting AllowRowSelect="true" />
                                <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                    OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                                HeaderStyle-HorizontalAlign="Center" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true" CommandItemDisplay="Top" EditMode="Batch">
                                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="checkbox" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                        HeaderStyle-Width="46px" ItemStyle-Width="46px">
                                        <HeaderTemplate>
                                            <label id="completelbl">
                                            </label>
                                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                onserverclick="MakeaQuote_Delete" runat="server">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                    runat="server"></a>

                                            <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Copy?')"
                                                onserverclick="MakeaQuote_Copy" runat="server">
                                                <img id="cpyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                                    runat="server"></a>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="ChargeCodeAndDescription" HeaderText="ChargeCode <br/> Description " HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblChargeCode" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode")%>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblChargeDescr" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="ChargeCodeCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="ChargeCode_DropDownClosed"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ChargeCodeCombo_ItemsRequested"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="ChargeDescrTxt" TextMode="MultiLine" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr")%>'>
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="SeqNo" HeaderText="SeqNo <br/> AutoGen <br/> OutlayType" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px"
                                        HeaderStyle-Width="150px" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblSeqNo" Text='<%# string.Format("{0:}",Eval("seqno"))%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblAutoGen" Text='<%# string.Format("{0:}",Eval("autogendescr"))%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblOutlayType" Text='<%# string.Format("{0:}",Eval("outlaytype"))%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;&nbsp;
                                            <telerik:RadTextBox runat="server" ID="SeqNoTxt"
                                                TextMode="SingleLine" Enabled="true" Width="140px">
                                            </telerik:RadTextBox>
                                            <asp:CompareValidator ID="SeqNoTxtCompVal" runat="server" ControlToValidate="SeqNoTxt"
                                                EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" />
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblAutoGen"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblOutlayType"></asp:Label>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ShipmentType" HeaderText="ShipmentType <br/> JobType" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblShipmentType" Text='<%# string.Format("{0:}",Eval("shtypedescr")) %>' Width="153px" CssClass="break-text"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblJobType" Text='<%# string.Format("{0:}",Eval("jobtypedescr")) %>' Width="153px" CssClass="break-text"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="ShipmentTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="ShipmentTypeCB_Load"
                                                DropDownWidth="140px" CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="JobTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="WebBlue" Width="140px"
                                                DropDownWidth="140px" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" OnLoad="JobTypeCB_Load">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="BillMethod <br/> UOM" UniqueName="BillMethod" HeaderStyle-Width="170px" ItemStyle-Width="170px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblBillMethod" Text='<%# string.Format("{0:}",Eval("billingmethoddescr")) %>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblUom" Text='<%# string.Format("{0:}",Eval("unitrateuomdescr")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="BillMethodDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="Sunset" Width="140px"
                                                DropDownWidth="140px" OnLoad="BillMethodDDL_Load">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="BillMethodDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillMethodDDL" ErrorMessage="*" ForeColor="Red" />
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="UOMDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="Sunset" Width="70px"
                                                DropDownWidth="70px" OnLoad="UOMDDL_Load">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="UOMDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="UOMDDL" ErrorMessage="*" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="UnitRate <br/> Currency" UniqueName="UnitRate" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblUnitRate" Text='<%# string.Format("{0:}",Eval("unitrate")) %>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblCurrency" Text='<%# string.Format("{0:}",Eval("CurrCode")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="UnitRateTxt" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>'
                                                TextMode="SingleLine" Enabled="true" Width="150px">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblCurrency"></asp:Label>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Transport" HeaderText="TransportType <br/> BillSizeType <br/> TripType" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblTptType" Text='<%# string.Format("{0:}",Eval("tpttypedescr")) %>' Width="153px" CssClass="break-text"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblBillSizeType" Text='<%# string.Format("{0:}",Eval("billsizetypedescr")) %>' Width="153px" CssClass="break-text"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblTripType" Text='<%# string.Format("{0:}",Eval("TripTypeDescr")) %>' Width="153px" CssClass="break-text"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="TptTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="TptTypeCB_Load"
                                                DropDownWidth="140px" CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="BillSizeTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="BillSizeTypeCB_Load"
                                                DropDownWidth="140px" CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="TripTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up" Enabled="true"
                                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="TripTypeCB_Load"
                                                DropDownWidth="140px" CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
                                            </telerik:RadComboBox>

                                        </EditItemTemplate>

                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="BillOptionType" HeaderText="BillOption1 <br/> BillOption2" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblBillOption1" Text='<%# string.Format("{0:}",Eval("billoption1descr")) %>' Width="153px" CssClass="break-text"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblBillOption2" Text='<%# string.Format("{0:}",Eval("billoption2descr")) %>' Width="153px" CssClass="break-text"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="BillOption1CB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="BillOption1CB_Load"
                                                DropDownWidth="140px" CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="BillOption2CB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="BillOption2CB_Load"
                                                DropDownWidth="140px" CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CalcMethod" HeaderText="CalcMethod <br/> CalcFactor" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCalcMethod" Text='<%# string.Format("{0:}",Eval("BillingCalcMethodDescr")) %>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="lblCalcFactor" Text='<%# string.Format("{0:}",Eval("BillingCalcMethodFactor")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="BillingCalcMethodDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="BillingCalcMethodDDL_Load"
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            &nbsp;&nbsp;
                                            <telerik:RadTextBox runat="server" ID="BillingCalcMethodFactorTxt" Text='<%# DataBinder.Eval(Container.DataItem, "BillingCalcMethodFactor") %>'
                                                TextMode="SingleLine" Enabled="true" Width="140px">
                                            </telerik:RadTextBox>
                                            <asp:CompareValidator ID="BillingCalcMethodFactorTxtCompVal" runat="server" ControlToValidate="BillingCalcMethodFactorTxt"
                                                EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="FreeDays" HeaderText="FreeDays" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="250px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="250px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("FreeDays")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ServicePt" HeaderText="FrCity <br/> ToCity" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("FrCityCode")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToCityCode")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ChargeCode" HeaderText="ChargeCode <br/> Description" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="250px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="250px" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Chargeid")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("chargedescr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="SupportedServiceItem" HeaderText="SupportedServiceItem" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSupportedServiceItem" runat="server" Text='<%# string.Format("{0:}",Eval("SupportedServiceItemDescr")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="SupportedServiceItemCB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="SupportedServiceItemCB_Load"
                                                DropDownWidth="140px" CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TaxType" HeaderText="LeadTimeNotes <br/> TaxType <br/> Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("LeadTimeNotes")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TaxTypeDescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="AddDate <br/> AddUser" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("adddate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("adduser")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Edit" HeaderText="EditDate <br/> EditUser" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("editdate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("edituser")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="LogTabView" Height="700px" />
        </telerik:RadMultiPage>
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
        <telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
            <script type="text/javascript">
                // this function checks if both array are equal. Used in array.prototype.equals function
                // ref: https://stackoverflow.com/questions/4025893/how-to-check-identical-array-in-most-efficient-way
                function arraysEqual(arr1, arr2) {
                    if (arr1.length != arr2.length)
                        return false;

                    // sort the array first to ensure the array can be compared using index
                    arr1.sort();
                    arr2.sort();

                    for (var i = 0; i < arr1.length; i++) {
                        if (arr1[i] != arr2[i])
                            return false;
                    }

                    return true;
                }

                // clear RadComboBox checkboxes
                function clearCheckboxComboBox(control) {
                    control.clearSelection();
                    var checkedItems = control.get_checkedItems();
                    for (var i = 0; i < checkedItems.length; i++)
                        checkedItems[i].set_checked(false);
                }
                var ChargecodeAnddescription = function (ChargeCode, Description, Chargeid) {
                    this.ChargeCode = ChargeCode;
                    this.Description = Description;
                    this.Chargeid = Chargeid;
                }
                var SeqNo_AutoGen_OutlayType = function (seqNo, autoGen, outlayType) {
                    // to display the text to user
                    this.seqNo = seqNo;
                    this.autoGen = autoGen;
                    this.outlayType = outlayType;
                }
                SeqNo_AutoGen_OutlayType.prototype.equals = function (data) {
                    if (this.seqNo === data.seqNo) {
                        return true;
                    }
                    return false;
                }
                SeqNo_AutoGen_OutlayType.prototype.toString = function () {
                    return this.seqNo; // only this value is editable
                }

                var ShipmentType_JobType = function (shipmentTypeArr, jobTypeArr, shipmentTypeCodeArr, jobTypeCodeArr) {
                    // to display the text to user
                    this.shipmentTypeArr = shipmentTypeArr;
                    this.jobTypeArr = jobTypeArr;

                    // check if it's empty
                    if (shipmentTypeArr.length === 1 && shipmentTypeArr[0] === '')
                        this.shipmentTypeArr = [];
                    if (jobTypeArr.length === 1 && jobTypeArr[0] === '')
                        this.jobTypeArr = [];

                    // for server use
                    this.shipmentTypeCodeArr = shipmentTypeCodeArr;
                    this.jobTypeCodeArr = jobTypeCodeArr;
                }
                ShipmentType_JobType.prototype.equals = function (data) {
                    return arraysEqual(this.shipmentTypeArr, data.shipmentTypeArr) &&
                        arraysEqual(this.jobTypeArr, data.jobTypeArr);
                }
                ShipmentType_JobType.prototype.toString = function () {
                    return JSON.stringify({
                        shipmentTypeArr: this.shipmentTypeCodeArr, jobTypeArr: this.jobTypeCodeArr,
                        shipmentTypeDescrArr: this.shipmentTypeArr, jobTypeDescrArr: this.jobTypeArr // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
                    });
                }

                var BillMethod_Uom = function (billMethod, uom, billMethodCode, uomCode) {
                    // to display the text to user
                    this.billMethod = billMethod;
                    this.uom = uom;

                    // for server use
                    this.billMethodCode = billMethodCode;
                    this.uomCode = uomCode;
                }
                BillMethod_Uom.prototype.equals = function (data) {
                    if (this.billMethod === data.billMethod &&
                        this.uom === data.uom) {
                        return true;
                    }
                    return false;
                }
                BillMethod_Uom.prototype.toString = function () {
                    return JSON.stringify({
                        billMethod: this.billMethodCode, uom: this.uomCode,
                        billMethodDescr: this.billMethod, uomDescr: this.uom // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
                    });
                }

                var UnitRate_Currency = function (unitRate, currency) {
                    // to display the text to user
                    this.unitRate = unitRate;
                    this.currency = currency;
                }
                UnitRate_Currency.prototype.equals = function (data) {
                    if (this.unitRate === data.unitRate) {
                        return true;
                    }
                    return false;
                }
                UnitRate_Currency.prototype.toString = function () {
                    return this.unitRate;
                }

                var TptType_BillSizeType_TripType = function (tptTypeArr, billSizeTypeArr, tripTypeArr, tptTypeCodeArr, billSizeTypeCodeArr, tripTypeCodeArr) {
                    // to display the text to user
                    this.tptTypeArr = tptTypeArr;
                    this.billSizeTypeArr = billSizeTypeArr;
                    this.tripTypeArr = tripTypeArr;

                    // check if it's empty
                    if (tptTypeArr.length === 1 && tptTypeArr[0] === '')
                        this.tptTypeArr = [];
                    if (billSizeTypeArr.length === 1 && billSizeTypeArr[0] === '')
                        this.billSizeTypeArr = [];
                    if (tripTypeArr.length === 1 && tripTypeArr[0] === '')
                        this.tripTypeArr = [];

                    // for server use
                    this.tptTypeCodeArr = tptTypeCodeArr;
                    this.billSizeTypeCodeArr = billSizeTypeCodeArr;
                    this.tripTypeCodeArr = tripTypeCodeArr;
                }
                TptType_BillSizeType_TripType.prototype.equals = function (data) {
                    return arraysEqual(this.tptTypeArr, data.tptTypeArr) &&
                        arraysEqual(this.billSizeTypeArr, data.billSizeTypeArr) &&
                        arraysEqual(this.tripTypeArr, data.tripTypeArr);
                }
                TptType_BillSizeType_TripType.prototype.toString = function () {
                    return JSON.stringify({
                        tptTypeArr: this.tptTypeCodeArr, billSizeTypeArr: this.billSizeTypeCodeArr, tripTypeArr: this.tripTypeCodeArr,
                        tptTypeDescrArr: this.tptTypeArr, billSizeTypeDescrArr: this.billSizeTypeArr, tripTypeDescrArr: this.tripTypeArr // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
                    });
                }
                ChargecodeAnddescription.prototype.equals = function (chargecodedescription) {
                    if (this.ChargeCode === chargecodedescription.ChargeCode && this.Description === chargecodedescription.Description) {
                        return true;
                    }
                    return false;
                }
                var BillOptions = function (billOption1Arr, billOption2Arr, billOption1CodeArr, billOption2CodeArr) {
                    // to display the text to user
                    this.billOption1Arr = billOption1Arr;
                    this.billOption2Arr = billOption2Arr;

                    // check if array is empty
                    if (billOption1Arr.length === 1 && billOption1Arr[0] === '')
                        this.billOption1Arr = [];
                    if (billOption2Arr.length === 1 && billOption2Arr[0] === '')
                        this.billOption2Arr = [];

                    // for server use
                    this.billOption1CodeArr = billOption1CodeArr;
                    this.billOption2CodeArr = billOption2CodeArr;
                }

                BillOptions.prototype.equals = function (data) {
                    return arraysEqual(this.billOption1Arr, data.billOption1Arr) &&
                        arraysEqual(this.billOption2Arr, data.billOption2Arr);
                }
                BillOptions.prototype.toString = function () {
                    return JSON.stringify({
                        billOption1Arr: this.billOption1CodeArr, billOption2Arr: this.billOption2CodeArr,
                        billOption1DescrArr: this.billOption1Arr, billOption2DescrArr: this.billOption2Arr // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
                    });
                }
                ChargecodeAnddescription.prototype.toString = function () {
                    return JSON.stringify({
                        Description: this.Description, Chargeid: this.Chargeid,
                        ChargeCode: this.ChargeCode
                    }).replaceAll("'", "\\'");
                }
                var CalcMethod_CalcFactor = function (calcMethod, calcFactor, calcMethodCode) {
                    this.calcMethod = calcMethod;
                    this.calcFactor = calcFactor;

                    // for server use
                    this.calcMethodCode = calcMethodCode;
                }
                CalcMethod_CalcFactor.prototype.equals = function (data) {
                    if (this.calcMethod === data.calcMethod &&
                        this.calcFactor === data.calcFactor) {
                        return true;
                    }
                    return false;
                }
                CalcMethod_CalcFactor.prototype.toString = function () {
                    return JSON.stringify({
                        calcMethod: this.calcMethodCode, calcFactor: this.calcFactor,
                        calcMethodDescr: this.calcMethod // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
                    });
                }

                var SupportedServiceItem = function (supportedServiceItemArr, supportedServiceItemCodeArr) {
                    this.supportedServiceItemArr = supportedServiceItemArr;

                    // for server use
                    this.supportedServiceItemCodeArr = supportedServiceItemCodeArr;
                }
                SupportedServiceItem.prototype.equals = function (data) {
                    return arraysEqual(this.supportedServiceItemArr, data.supportedServiceItemArr);
                }
                SupportedServiceItem.prototype.toString = function () {
                    return JSON.stringify({
                        supportedServiceItemArr: this.supportedServiceItemCodeArr,
                        supportedServiceItemDescrArr: this.supportedServiceItemArr // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
                    });
                }

                function GetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === "ChargeCodeAndDescription") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Description = $telerik.findElement(Container, "lblChargeDescr").innerText;
                        var ChargeCode = $telerik.findElement(Container, "lblChargeCode").innerHTML;
                        args.set_value(new ChargecodeAnddescription(ChargeCode, Description));
                    }
                    if (args.get_columnUniqueName() === "SeqNo") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var seqNo = $telerik.findElement(container, "lblSeqNo").innerText;
                        var autoGen = $telerik.findElement(container, "lblAutoGen").innerText;
                        var outlayType = $telerik.findElement(container, "lblOutlayType").innerText;
                        args.set_value(new SeqNo_AutoGen_OutlayType(seqNo, autoGen, outlayType));
                    }
                    if (args.get_columnUniqueName() === "ShipmentType") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var shipmentTypeArr = $telerik.findElement(container, "lblShipmentType").innerText.split(',');
                        var jobTypeArr = $telerik.findElement(container, "lblJobType").innerText.split(',');
                        args.set_value(new ShipmentType_JobType(shipmentTypeArr, jobTypeArr));
                    }
                    if (args.get_columnUniqueName() === "BillMethod") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var billMethod = $telerik.findElement(container, "lblBillMethod").innerText;
                        var uom = $telerik.findElement(container, "lblUom").innerText;
                        args.set_value(new BillMethod_Uom(billMethod, uom));
                    }
                    if (args.get_columnUniqueName() === "UnitRate") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var unitRate = $telerik.findElement(container, "lblUnitRate").innerText;
                        var currency = $telerik.findElement(container, "lblCurrency").innerText;
                        args.set_value(new UnitRate_Currency(unitRate, currency));
                    }
                    if (args.get_columnUniqueName() === "Transport") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var tptTypeArr = $telerik.findElement(container, "lblTptType").innerText.split(',');
                        var billSizeTypeArr = $telerik.findElement(container, "lblBillSizeType").innerText.split(',');
                        var tripTypeArr = $telerik.findElement(container, "lblTripType").innerText.split(',');
                        args.set_value(new TptType_BillSizeType_TripType(tptTypeArr, billSizeTypeArr, tripTypeArr));
                    }
                    if (args.get_columnUniqueName() === "BillOptionType") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var billOption1Arr = $telerik.findElement(container, "lblBillOption1").innerText.split(',');
                        var billOption2Arr = $telerik.findElement(container, "lblBillOption2").innerText.split(',');
                        args.set_value(new BillOptions(billOption1Arr, billOption2Arr));
                    }
                    if (args.get_columnUniqueName() === "CalcMethod") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var calcMethod = $telerik.findElement(container, "lblCalcMethod").innerText;
                        var calcFactor = $telerik.findElement(container, "lblCalcFactor").innerText;
                        args.set_value(new CalcMethod_CalcFactor(calcMethod, calcFactor));
                    }
                    if (args.get_columnUniqueName() === "SupportedServiceItem") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var supportedServiceItemArr = $telerik.findElement(container, "lblSupportedServiceItem").innerText.split(',');
                        args.set_value(new SupportedServiceItem(supportedServiceItemArr));
                    }
                }

                function SetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === "ChargeCodeAndDescription") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "lblChargeCode").innerHTML = Value.ChargeCode;
                        $telerik.findElement(Container, "lblChargeDescr").innerText = Value.Description;
                    }
                    if (args.get_columnUniqueName() === "SeqNo") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblSeqNo").innerText = value.seqNo;
                        $telerik.findElement(container, "lblAutoGen").innerText = value.autoGen;
                        $telerik.findElement(container, "lblOutlayType").innerText = value.outlayType;
                    }
                    if (args.get_columnUniqueName() === "ShipmentType") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblShipmentType").innerText = value.shipmentTypeArr.join(',');
                        $telerik.findElement(container, "lblJobType").innerText = value.jobTypeArr.join(',');
                    }
                    if (args.get_columnUniqueName() === "BillMethod") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblBillMethod").innerText = value.billMethod;
                        $telerik.findElement(container, "lblUom").innerText = value.uom;
                    }
                    if (args.get_columnUniqueName() === "UnitRate") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblUnitRate").innerText = value.unitRate;
                        $telerik.findElement(container, "lblCurrency").innerText = value.currency;
                    }
                    if (args.get_columnUniqueName() === "Transport") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblTptType").innerText = value.tptTypeArr.join(',');
                        $telerik.findElement(container, "lblBillSizeType").innerText = value.billSizeTypeArr.join(',');
                        $telerik.findElement(container, "lblTripType").innerText = value.tripTypeArr.join(',');
                    }
                    if (args.get_columnUniqueName() === "BillOptionType") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblBillOption1").innerText = value.billOption1Arr.join(',');
                        $telerik.findElement(container, "lblBillOption2").innerText = value.billOption2Arr.join(',');
                    }
                    if (args.get_columnUniqueName() === "CalcMethod") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblCalcMethod").innerText = value.calcMethod;
                        $telerik.findElement(container, "lblCalcFactor").innerText = value.calcFactor;
                    }
                    if (args.get_columnUniqueName() === "SupportedServiceItem") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblSupportedServiceItem").innerText = value.supportedServiceItemArr.join(',');
                    }
                }

                function GetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "ChargeCodeAndDescription") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Description = $telerik.findControl(Container, "ChargeDescrTxt").get_value(),
                            Chargeid = ($telerik.findControl(Container, "ChargeCodeCombo").get_value().split("|"))[0],
                            ChargeCode = $telerik.findControl(Container, "ChargeCodeCombo").get_text();
                        args.set_value(new ChargecodeAnddescription(ChargeCode, Description, Chargeid));
                    }
                    if (args.get_columnUniqueName() === "SeqNo") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            seqNo = $telerik.findControl(container, "SeqNoTxt").get_value(),
                            autoGen = $telerik.findElement(container, "lblAutoGen").innerText,
                            outlayType = $telerik.findElement(container, "lblOutlayType").innerText;
                        args.set_value(new SeqNo_AutoGen_OutlayType(seqNo, autoGen, outlayType));
                    }
                    if (args.get_columnUniqueName() === "ShipmentType") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            shipmentTypeItems = $telerik.findControl(container, "ShipmentTypeCB").get_checkedItems(),
                            jobTypeItems = $telerik.findControl(container, "JobTypeCB").get_checkedItems();

                        // Get array of text and value
                        var shipmentTypeArr = shipmentTypeItems.map(function (x) {
                            return x.get_text();
                        });
                        var shipmentTypeValueArr = shipmentTypeItems.map(function (x) {
                            return x.get_value();
                        });
                        var jobTypeArr = jobTypeItems.map(function (x) {
                            return x.get_text();
                        });
                        var jobTypeValueArr = jobTypeItems.map(function (x) {
                            return x.get_value();
                        });

                        args.set_value(new ShipmentType_JobType(shipmentTypeArr, jobTypeArr, shipmentTypeValueArr, jobTypeValueArr));
                    }
                    if (args.get_columnUniqueName() === "BillMethod") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            billMethod = $telerik.findControl(container, "BillMethodDDL").get_selectedItem().get_text(),
                            billMethodValue = $telerik.findControl(container, "BillMethodDDL").get_selectedItem().get_value(),
                            uom = $telerik.findControl(container, "UOMDDL").get_selectedItem().get_text(),
                            uomValue = $telerik.findControl(container, "UOMDDL").get_selectedItem().get_value();
                        args.set_value(new BillMethod_Uom(billMethod, uom, billMethodValue, uomValue));
                    }
                    if (args.get_columnUniqueName() === "UnitRate") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            unitRate = $telerik.findControl(container, "UnitRateTxt").get_value(),
                            currency = $telerik.findElement(container, "lblCurrency").innerText;
                        args.set_value(new UnitRate_Currency(unitRate, currency));
                    }
                    if (args.get_columnUniqueName() === "Transport") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            tptTypeItems = $telerik.findControl(container, "TptTypeCB").get_checkedItems(),
                            billSizeTypeItems = $telerik.findControl(container, "BillSizeTypeCB").get_checkedItems(),
                            tripTypeItems = $telerik.findControl(container, "TripTypeCB").get_checkedItems();

                        // Get array of text and value
                        var tptTypeArr = tptTypeItems.map(function (x) {
                            return x.get_text();
                        });
                        var tptTypeValueArr = tptTypeItems.map(function (x) {
                            return x.get_value();
                        });
                        var billSizeTypeArr = billSizeTypeItems.map(function (x) {
                            return x.get_text();
                        });
                        var billSizeTypeValueArr = billSizeTypeItems.map(function (x) {
                            return x.get_value();
                        });
                        var tripTypeArr = tripTypeItems.map(function (x) {
                            return x.get_text();
                        });
                        var tripTypeValueArr = tripTypeItems.map(function (x) {
                            return x.get_value();
                        });
                        args.set_value(new TptType_BillSizeType_TripType(tptTypeArr, billSizeTypeArr, tripTypeArr, tptTypeValueArr, billSizeTypeValueArr, tripTypeValueArr));
                    }
                    if (args.get_columnUniqueName() === "BillOptionType") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            billOption1Items = $telerik.findControl(container, "BillOption1CB").get_checkedItems(),
                            billOption2Items = $telerik.findControl(container, "BillOption2CB").get_checkedItems();

                        // Get array of text and value
                        var billOption1Arr = billOption1Items.map(function (x) {
                            return x.get_text();
                        });
                        var billOption1ValueArr = billOption1Items.map(function (x) {
                            return x.get_value();
                        });
                        var billOption2Arr = billOption2Items.map(function (x) {
                            return x.get_text();
                        });
                        var billOption2ValueArr = billOption2Items.map(function (x) {
                            return x.get_value();
                        })

                        args.set_value(new BillOptions(billOption1Arr, billOption2Arr, billOption1ValueArr, billOption2ValueArr));
                    }
                    if (args.get_columnUniqueName() === "CalcMethod") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            calcMethod = $telerik.findControl(container, "BillingCalcMethodDDL").get_selectedItem().get_text(),
                            calcMethodValue = $telerik.findControl(container, "BillingCalcMethodDDL").get_selectedItem().get_value(),
                            calcFactor = $telerik.findControl(container, "BillingCalcMethodFactorTxt").get_value();
                        args.set_value(new CalcMethod_CalcFactor(calcMethod, calcFactor, calcMethodValue));
                    }
                    if (args.get_columnUniqueName() === "SupportedServiceItem") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            supportedServiceItems = $telerik.findControl(container, "SupportedServiceItemCB").get_checkedItems();

                        var supportedServiceItemArr = supportedServiceItems.map(function (x) {
                            return x.get_text();
                        });
                        var supportedServiceItemValueArr = supportedServiceItems.map(function (x) {
                            return x.get_value();
                        });

                        args.set_value(new SupportedServiceItem(supportedServiceItemArr, supportedServiceItemValueArr));
                    }
                }

                function SetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "ChargeCodeAndDescription") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "ChargeDescrTxt").set_value(Value.Description);

                        if ($telerik.findControl(Container, "ChargeCodeCombo") && $telerik.findControl(Container, "ChargeCodeCombo").findItemByText(Value.ChargeCode))
                            $telerik.findControl(Container, "ChargeCodeCombo").findItemByText(Value.ChargeCode).select();
                        else
                            $telerik.findControl(Container, "ChargeCodeCombo").set_text(Value.ChargeCode);
                    }
                    if (args.get_columnUniqueName() === "SeqNo") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        $telerik.findControl(container, "SeqNoTxt").set_value(value.seqNo);
                        $telerik.findElement(container, "lblAutoGen").innerText = value.autoGen;
                        $telerik.findElement(container, "lblOutlayType").innerText = value.outlayType;
                    }
                    if (args.get_columnUniqueName() === "ShipmentType") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        var ShipmentTypeCB = $telerik.findControl(container, "ShipmentTypeCB");
                        clearCheckboxComboBox(ShipmentTypeCB);
                        for (var i = 0; i < value.shipmentTypeArr.length; i++)
                            if (ShipmentTypeCB && ShipmentTypeCB.findItemByText(value.shipmentTypeArr[i]))
                                ShipmentTypeCB.findItemByText(value.shipmentTypeArr[i]).set_checked(true);

                        var JobTypeCB = $telerik.findControl(container, "JobTypeCB");
                        clearCheckboxComboBox(JobTypeCB);
                        for (var i = 0; i < value.jobTypeArr.length; i++)
                            if (JobTypeCB && JobTypeCB.findItemByText(value.jobTypeArr[i]))
                                JobTypeCB.findItemByText(value.jobTypeArr[i]).set_checked(true);
                    }
                    if (args.get_columnUniqueName() === "BillMethod") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        $telerik.findControl(container, "BillMethodDDL").findItemByText(value.billMethod).select();
                        /*var billMethodDDLItem = $telerik.findControl(container, "BillMethodDDL").findItemByText(value.billMethod);
                        if (billMethodDDLItem)
                            billMethodDDLItem.select();
                        else {
                            var item = $telerik.findControl(container, "BillMethodDDL").get_selectedItem();
                            if (item)
                                item.unselect();
                            $telerik.findControl(container, "BillMethodDDL").findItemByText("").select(); // select empty item
                        }*/

                        $telerik.findControl(container, "UOMDDL").findItemByText(value.uom).select();
                        /*var uomDDLItem = $telerik.findControl(container, "UOMDDL").findItemByText(value.uom);
                        if (uomDDLItem)
                            uomDDLItem.select();
                        else {
                            var item = $telerik.findControl(container, "UOMDDL").get_selectedItem();
                            if (item)
                                item.unselect();
                            $telerik.findControl(container, "UOMDDL").findItemByText("").select();
                        }*/
                    }
                    if (args.get_columnUniqueName() === "UnitRate") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        $telerik.findControl(container, "UnitRateTxt").set_value(value.unitRate);
                        $telerik.findElement(container, "lblCurrency").innerText = value.currency;
                    }
                    if (args.get_columnUniqueName() === "Transport") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        var TptTypeCB = $telerik.findControl(container, "TptTypeCB");
                        clearCheckboxComboBox(TptTypeCB);
                        for (var i = 0; i < value.tptTypeArr.length; i++)
                            if (TptTypeCB && TptTypeCB.findItemByText(value.tptTypeArr[i]))
                                TptTypeCB.findItemByText(value.tptTypeArr[i]).set_checked(true);

                        var BillSizeTypeCB = $telerik.findControl(container, "BillSizeTypeCB");
                        clearCheckboxComboBox(BillSizeTypeCB);
                        for (var i = 0; i < value.billSizeTypeArr.length; i++)
                            if (BillSizeTypeCB && BillSizeTypeCB.findItemByText(value.billSizeTypeArr[i]))
                                BillSizeTypeCB.findItemByText(value.billSizeTypeArr[i]).set_checked(true);

                        var TripTypeCB = $telerik.findControl(container, "TripTypeCB");
                        clearCheckboxComboBox(TripTypeCB);
                        for (var i = 0; i < value.tripTypeArr.length; i++)
                            if (TripTypeCB && TripTypeCB.findItemByText(value.tripTypeArr[i]))
                                TripTypeCB.findItemByText(value.tripTypeArr[i]).set_checked(true);
                    }
                    if (args.get_columnUniqueName() === "BillOptionType") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        var BillOption1CB = $telerik.findControl(container, "BillOption1CB");
                        clearCheckboxComboBox(BillOption1CB);
                        for (var i = 0; i < value.billOption1Arr.length; i++)
                            if (BillOption1CB && BillOption1CB.findItemByText(value.billOption1Arr[i]))
                                BillOption1CB.findItemByText(value.billOption1Arr[i]).set_checked(true);

                        var BillOption2CB = $telerik.findControl(container, "BillOption2CB");
                        clearCheckboxComboBox(BillOption2CB);
                        for (var i = 0; i < value.billOption2Arr.length; i++)
                            if (BillOption2CB && BillOption2CB.findItemByText(value.billOption2Arr[i]))
                                BillOption2CB.findItemByText(value.billOption2Arr[i]).set_checked(true);
                    }
                    if (args.get_columnUniqueName() === "CalcMethod") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        $telerik.findControl(container, "BillingCalcMethodDDL").findItemByText(value.calcMethod).select();
                        /*var calcMethodItem = $telerik.findControl(container, "BillingCalcMethodDDL").findItemByText(value.calcMethod)
                        if (calcMethodItem)
                            calcMethodItem.select();
                        else {
                            var item = $telerik.findControl(container, "BillingCalcMethodDDL").get_selectedItem();
                            if (item)
                                item.unselect();
                            $telerik.findControl(container, "BillingCalcMethodDDL").findItemByText("").select();
                        }*/

                        $telerik.findControl(container, 'BillingCalcMethodFactorTxt').set_value(value.calcFactor);
                    }
                    if (args.get_columnUniqueName() === "SupportedServiceItem") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        var SupportedServiceItemCB = $telerik.findControl(container, "SupportedServiceItemCB");
                        clearCheckboxComboBox(SupportedServiceItemCB);
                        for (var i = 0; i < value.supportedServiceItemArr.length; i++)
                            if (SupportedServiceItemCB && SupportedServiceItemCB.findItemByText(value.supportedServiceItemArr[i]))
                                SupportedServiceItemCB.findItemByText(value.supportedServiceItemArr[i]).set_checked(true);
                    }
                }
                 <%--Start Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
                function ChargeCode_DropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var ChargeCode = $telerik.findControl(currentRow, "ChargeCodeCombo").get_value();
                    if (ChargeCode != null && ChargeCode != "") {
                        var ChargeCodeDescrPair = ChargeCode.split("|");
                        $telerik.findControl(currentRow, "ChargeDescrTxt").set_value(ChargeCodeDescrPair[1]);
                    }
                }
                <%--End Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
