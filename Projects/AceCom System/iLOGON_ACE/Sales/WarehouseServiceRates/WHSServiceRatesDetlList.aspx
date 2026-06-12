<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSServiceRatesDetlList.aspx.cs" Inherits="iWMS.Web.Sales.WarehouseServiceRates.WHSServiceRatesDetlList" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>QuotationDetlList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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

        .style1 {
            width: 95px;
            height: 31px;
        }

        .style2 {
            height: 31px;
        }

        .style3 {
            height: 31px;
            width: 170px;
        }

        .style4 {
            width: 750px;
        }
    </style>

    <script language="javascript" type="text/javascript">
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

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip" MultiPageID="RadMultipg" OnTabClick="RadTabStrip_TabClick"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="All" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Storage" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="System" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Adhoc" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Fixed" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table border="0" cellspacing="12" cellpadding="0">
            <tr>
                <td align="left">
                    <asp:Button ID="AddDetailsBtn" runat="server" Text="New" OnClick="AddDetailBtn_Click" CssClass="white" UseSubmitBehavior="false" />
                </td>
                <td align="left">
                    <asp:Button ID="reseqBtn" runat="server" Text="Reseq" OnClick="ReSeqBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" CssClass="white" UseSubmitBehavior="false" />
                </td>
                <td align="left">
                    <asp:Button ID="DelImgBtn" runat="server" Text="Delete" OnClick="DeleteAllBtn_Click"
                        OnClientClick="disableBtn(this.id,false)"
                        CssClass="white" ToolTip="Delete Selected Quotation Line(s)" UseSubmitBehavior="false" />
                </td>
                <td align="left">
                    <asp:Button ID="MassChangeBtn" runat="server" Text="Update" OnClick="MassChangeBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Update Selected QuDetl(s)" UseSubmitBehavior="false" />
                </td>
                <td align="right" class="style4">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" RenderMode="Lightweight"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true" AllowMultiRowSelection="false"
            AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
            OnItemCommand="ResultDG_ItemCommand" OnPreRender="ResultDG_PreRender" OnRowDrop="ResultDG_RowDrop" OnBatchEditCommand="ResultDG_BatchEditCommand">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowAutoScrollOnDragDrop="false" AllowRowsDragDrop="true">
                <Scrolling AllowScroll="True" ScrollHeight="380px" EnableVirtualScrollPaging="False"
                    UseStaticHeaders="True" SaveScrollPosition="True" />
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top" EditMode="Batch">
                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                <CommandItemSettings ShowAddNewRecordButton="false" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="QuDetail_Edit"
                                runat="server">
                                <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                    title="Edit" runat="server" /></a> <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        onserverclick="QUDetail_Copy" runat="server">
                                        <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                            title="Copy" runat="server" /></a> <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onclick="return confirm('Confirm delete?')" onserverclick="QuDetail_Delete" runat="server">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                                    title="Delete Detail" runat="server" /></a>
                            <%--<asp:Label ID="DetailLbl" runat="server" Visible="false"></asp:Label>--%>
                            <asp:ImageButton runat="server" ID="pricebreak_ImgBtn" ImageUrl="../../image/detail.gif" BorderWidth="0" OnClick="pricebreak_ImgBtn_Click1"
                                BackColor="Transparent" Width="15" Height="15" AlternateText="PriceBreak" Visible="false"></asp:ImageButton>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="SN" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="BillingType" DataField="billingtypedescr" AllowFiltering="true"
                        ColumnGroupName="billingtypedescr" SortExpression="billingtypedescr" UniqueName="billingtypedescr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("billingtypedescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="BillingPeriod" DataField="billingperioddescr"
                        AllowFiltering="true" ColumnGroupName="billingperioddescr" SortExpression="billingperioddescr"
                        UniqueName="billingperioddescr" Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("billingperioddescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="SeqNo" DataField="seqno" AllowFiltering="false"
                        AllowSorting="false" ColumnGroupName="seqno" SortExpression="seqno" UniqueName="seqno"
                        Reorderable="true" HeaderStyle-Width="65px" ItemStyle-Width="65px">
                        <ItemTemplate>
                            <%# Eval("seqno") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="SeqNoTxt" TextMode="SingleLine" Width="60px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="SeqNoTxtCompVal" runat="server" ControlToValidate="SeqNoTxt"
                                EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="BillingGrp" DataField="billinggrpdescr" AllowFiltering="false"
                        ColumnGroupName="billinggrpdescr" SortExpression="billinggrpdescr" UniqueName="billinggrpdescr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("billinggrpdescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ChargeCode" DataField="chargecode" AllowFiltering="true"
                        ColumnGroupName="chargecode" SortExpression="chargecode" UniqueName="chargecode"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("chargecode") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="ChargeCodeCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="ChargeCode_DropDownClosed"
                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnLoad="ChargeCodeCombo_Load"
                                HighlightTemplatedItems="true" Filter="Contains">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ChargeDescr" DataField="chargedescr" AllowFiltering="true"
                        ColumnGroupName="chargedescr" SortExpression="chargedescr" UniqueName="chargedescr"
                        Reorderable="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <%# Eval("chargedescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="ChargeDescrTxt" TextMode="MultiLine" Width="140px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="DependencyChargeCode-SeqNo" DataField="DependencyQU" AllowFiltering="true"
                        ColumnGroupName="DependencyQU" SortExpression="DependencyQU" UniqueName="DependencyQU"
                        Reorderable="true" HeaderStyle-Width="250px" ItemStyle-Width="250px">
                        <ItemTemplate>
                            <%# Eval("DependencyQU") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="UnitRate" DataField="unitrate" AllowFiltering="false"
                        ColumnGroupName="unitrate" SortExpression="unitrate" UniqueName="unitrate" Reorderable="true"
                         HeaderStyle-Width="75px" ItemStyle-Width="75px">
                        <%-- DataFormatString="{0:#,0.0000}" --%>
                        <ItemStyle HorizontalAlign="Right" />
                        <ItemTemplate>
                            <%# string.Format("{0:#,0.0000}", Eval("unitrate")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="UnitRateTxt" TextMode="SingleLine" Enabled="true" Width="70px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="UnitRateUOM" DataField="unitrateuomdescr" AllowFiltering="false"
                        AllowSorting="false" ColumnGroupName="unitrateuomdescr" SortExpression="unitrateuomdescr"
                        UniqueName="unitrateuomdescr" Reorderable="true" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <%# Eval("unitrateuomdescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="UnitRateUOMDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" Skin="Sunset" Width="70px"
                                DropDownWidth="70px" OnLoad="UOMDDL_Load">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="UOMDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="UnitRateUOMDDL" ErrorMessage="*" ForeColor="Red" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="BillingMethod" DataField="billingmethoddescr"
                        AllowFiltering="true" ColumnGroupName="billingmethoddescr" SortExpression="billingmethoddescr"
                        UniqueName="billingmethoddescr" Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("billingmethoddescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="BillMethodDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" Skin="Sunset" Width="140px"
                                DropDownWidth="140px" OnLoad="BillMethodDDL_Load">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="BillMethodDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillMethodDDL" ErrorMessage="*" ForeColor="Red" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="BillingCalcMethod" DataField="billingcalcmethod"
                        AllowFiltering="false" ColumnGroupName="billingcalcmethod" SortExpression="billingcalcmethod"
                        UniqueName="billingcalcmethod" Reorderable="true" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                        <ItemTemplate>
                            <%# Eval("billingcalcmethod") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="BCMFactor" DataField="BillingCalcMethodfactor"
                        AllowFiltering="false" ColumnGroupName="BillingCalcMethodfactor" SortExpression="BillingCalcMethodfactor"
                        UniqueName="BillingCalcMethodfactor" Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("BillingCalcMethodfactor") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="DefaultQty" DataField="defaultqty" AllowFiltering="false"
                        ColumnGroupName="defaultqty" SortExpression="defaultqty" UniqueName="defaultqty"
                        Reorderable="true" HeaderStyle-Width="85px" ItemStyle-Width="85px">
                        <%-- DataFormatString="{0:#,0.00}" --%>
                        <ItemTemplate>
                            <%# string.Format("{0:#,0.00}", Eval("defaultqty")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ShipmentType" DataField="ShTypeDescr" AllowFiltering="true"
                        ColumnGroupName="ShTypeDescr" SortExpression="ShTypeDescr" UniqueName="ShTypeDescr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("ShTypeDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="ShipmentTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="ShipmentTypeCB_Load"
                                DropDownWidth="140px">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="JobType" DataField="JobTypeDescr" AllowFiltering="false"
                        ColumnGroupName="JobTypeDescr" SortExpression="JobTypeDescr" UniqueName="JobTypeDescr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("JobTypeDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="JobTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" Skin="WebBlue" Width="140px"
                                DropDownWidth="140px" OnLoad="JobTypeCB_Load">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="TransportType" DataField="TptTypeDescr" AllowFiltering="false"
                        ColumnGroupName="TptTypeDescr" SortExpression="TptTypeDescr" UniqueName="TptTypeDescr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("TptTypeDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="TptTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="TptTypeCB_Load"
                                DropDownWidth="140px">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="BillSizeType" DataField="billsizetype" AllowFiltering="false"
                        ColumnGroupName="billsizetype" SortExpression="billsizetype" UniqueName="billsizetype"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("billsizetype") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="BillSizeTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="BillSizeTypeCB_Load"
                                DropDownWidth="140px">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="TripType" DataField="TripTypeDescr" AllowFiltering="false"
                        ColumnGroupName="TripTypeDescr" SortExpression="TripTypeDescr" UniqueName="TripTypeDescr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("TripTypeDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="TripTypeCB" runat="server" DataTextField="descr" ExpandDirection="Up" Enabled="true"
                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="TripTypeCB_Load"
                                DropDownWidth="140px">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ARGLCODE" DataField="arglcode" AllowFiltering="false"
                        ColumnGroupName="arglcode" SortExpression="arglcode" UniqueName="arglcode" Reorderable="true"
                        HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("arglcode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Src" DataField="srcdescr" AllowFiltering="false"
                        ColumnGroupName="srcdescr" SortExpression="srcdescr" UniqueName="srcdescr" Reorderable="true"
                        HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("srcdescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="BillingUOM" DataField="billinguomdescr" AllowFiltering="false"
                        ColumnGroupName="billinguomdescr" SortExpression="billinguomdescr" UniqueName="billinguomdescr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("billinguomdescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="CUR" DataField="currcode" AllowFiltering="false"
                        ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true"
                        HeaderStyle-Width="60px" ItemStyle-Width="60px">
                        <ItemTemplate>
                            <%# Eval("currcode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="MinCharge" DataField="minimumcharge" AllowFiltering="false"
                        ColumnGroupName="minimumcharge" SortExpression="minimumcharge" UniqueName="minimumcharge"
                        Reorderable="true" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                        <%-- DataFormatString="{0:#,0.00}" --%>
                        <ItemTemplate>
                            <%# string.Format("{0:#,0.00}", Eval("minimumcharge")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="MinChargeType" DataField="minimumchargetypedescr"
                        AllowFiltering="false" ColumnGroupName="minimumchargetypedescr" SortExpression="minimumchargetypedescr"
                        UniqueName="minimumchargetypedescr" Reorderable="true" HeaderStyle-Width="115px" ItemStyle-Width="115px">
                        <ItemTemplate>
                            <%# Eval("minimumchargetypedescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%-- <telerik:GridTemplateColumn HeaderText="DefaultQty" DataField="defaultqty" AllowFiltering="false"
                        ColumnGroupName="defaultqty" SortExpression="defaultqty" UniqueName="defaultqty"
                        Reorderable="true">
                        <ItemTemplate>
                            <%# string.Format("{0:#,0.00}", Eval("defaultqty")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn> --%>
                    <telerik:GridTemplateColumn HeaderText="EffectiveDate" DataField="effectivedate" AllowFiltering="false"
                        ColumnGroupName="effectivedate" SortExpression="effectivedate" UniqueName="effectivedate"
                        Reorderable="true" ItemStyle-ForeColor="blue" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                        <%-- DataFormatString="{0:dd/MMM/yyyy}" --%>
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MMM/yyyy}", Eval("effectivedate")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="DateOption" DataField="dateoptiondescr" AllowFiltering="false"
                        ColumnGroupName="dateoptiondescr" SortExpression="dateoptiondescr" UniqueName="dateoptiondescr"
                        Reorderable="true" HeaderStyle-Width="95px" ItemStyle-Width="95px">
                        <ItemTemplate>
                            <%# Eval("dateoptiondescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="FromServicePoint" DataField="frservicept" AllowFiltering="false"
                        ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("frservicept") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ToServicePoint" DataField="toservicept" AllowFiltering="false"
                        ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("toservicept") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ApplyOption" DataField="applyoption" AllowFiltering="false"
                        ColumnGroupName="applyoption" SortExpression="applyoption" UniqueName="applyoption"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("applyoption") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="SplitOption" DataField="splitoption" AllowFiltering="false"
                        ColumnGroupName="splitoption" SortExpression="splitoption" UniqueName="splitoption"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("splitoption") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ProfitCentre" DataField="profitctrcode" AllowFiltering="false"
                        ColumnGroupName="profitctrcode" SortExpression="profitctrcode" UniqueName="profitctrcode"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("profitctrcode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="CostCentre" DataField="costctrcode" AllowFiltering="false"
                        ColumnGroupName="costctrcode" SortExpression="costctrcode" UniqueName="costctrcode"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("costctrcode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="DependencyCharge" DataField="dependencychargecode"
                        AllowFiltering="false" ColumnGroupName="dependencychargecode" SortExpression="dependencychargecode"
                        UniqueName="dependencychargecode" Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("dependencychargecode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="DependencyPercent" DataField="dependencypercent"
                        AllowFiltering="false" ColumnGroupName="dependencypercent" SortExpression="dependencypercent"
                        UniqueName="dependencypercent" Reorderable="true" HeaderStyle-Width="95px" ItemStyle-Width="95px">
                        <ItemTemplate>
                            <%# Eval("dependencypercent") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="DependencyAmt" DataField="dependencyamt" AllowFiltering="false"
                        ColumnGroupName="dependencyamt" SortExpression="dependencyamt" UniqueName="dependencyamt"
                        Reorderable="true" Display="false" HeaderStyle-Width="95px" ItemStyle-Width="95px">
                    </telerik:GridBoundColumn>
                    <%-- Added by WL on 22/8/16--%>
                    <telerik:GridTemplateColumn HeaderText="BillOption1" DataField="BillOption1Descr" AllowFiltering="false"
                        ColumnGroupName="BillOption1Descr" SortExpression="BillOption1Descr" UniqueName="BillOption1Descr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("BillOption1Descr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="BillOption1CB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="BillOption1CB_Load"
                                DropDownWidth="140px">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="BillOption2" DataField="BillOption2Descr" AllowFiltering="false"
                        ColumnGroupName="BillOption2Descr" SortExpression="BillOption2Descr" UniqueName="BillOption2Descr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("BillOption2Descr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="BillOption2CB" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" Skin="WebBlue" Width="140px" OnLoad="BillOption2CB_Load"
                                DropDownWidth="140px">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%--   22/8/16--%>
                    <telerik:GridTemplateColumn HeaderText="Tax" DataField="taxtype" AllowFiltering="false"
                        ColumnGroupName="taxtype" SortExpression="taxtype" UniqueName="taxtype" Reorderable="true"
                        FilterControlWidth="10px" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("taxtype") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ActivityCode" DataField="peratvtcode" AllowFiltering="false"
                        ColumnGroupName="peratvtcode" SortExpression="peratvtcode" UniqueName="peratvtcode"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("peratvtcode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="TaskCode" DataField="taskdescr" AllowFiltering="false"
                        ColumnGroupName="taskdescr" SortExpression="taskdescr" UniqueName="taskdescr"
                        Reorderable="true" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("taskdescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false"
                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                        Reorderable="true" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <%# Eval("statusdescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor"
                        HeaderText="Statuscolor" />
                    <telerik:GridTemplateColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="false"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                        HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <%-- DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" --%>
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}", Eval("adddate")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="false"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"
                        HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("adduser") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="false"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                        HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <%-- DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" --%>
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}", Eval("editdate")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="false"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true"
                        HeaderStyle-Width="145px" ItemStyle-Width="145px">
                        <ItemTemplate>
                            <%# Eval("edituser") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="False" DataField="pricebreakoption" SortExpression="pricebreakoption" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
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
        <telerik:RadMultiPage runat="server" ID="RadMultiPg" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="89%" ID="StorageRadPageView" />
            <telerik:RadPageView runat="server" Height="89%" ID="SystemRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="AdhocRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="FixedRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
