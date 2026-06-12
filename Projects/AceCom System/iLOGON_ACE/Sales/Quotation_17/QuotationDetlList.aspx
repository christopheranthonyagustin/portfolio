<%@ Page Language="c#" CodeBehind="QuotationDetlList.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Sales.Quotation_17.QuotationDetlList" %>

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
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
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
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true" AllowMultiRowSelection="false"
            AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
            OnItemCommand="ResultDG_ItemCommand" OnPreRender="ResultDG_PreRender" OnRowDrop="ResultDG_RowDrop">
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
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
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
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="BillingType" DataField="billingtypedescr" AllowFiltering="true"
                        ColumnGroupName="billingtypedescr" SortExpression="billingtypedescr" UniqueName="billingtypedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingPeriod" DataField="billingperioddescr"
                        AllowFiltering="true" ColumnGroupName="billingperioddescr" SortExpression="billingperioddescr"
                        UniqueName="billingperioddescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SeqNo" DataField="seqno" AllowFiltering="false"
                        AllowSorting="false" ColumnGroupName="seqno" SortExpression="seqno" UniqueName="seqno"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingGrp" DataField="billinggrpdescr" AllowFiltering="false"
                        ColumnGroupName="billinggrpdescr" SortExpression="billinggrpdescr" UniqueName="billinggrpdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ChargeCode" DataField="chargecode" AllowFiltering="true"
                        ColumnGroupName="chargecode" SortExpression="chargecode" UniqueName="chargecode"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="chargedescr" AllowFiltering="true"
                        ColumnGroupName="chargedescr" SortExpression="chargedescr" UniqueName="chargedescr"
                        Reorderable="true">
                      </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DependencyChargeCode-SeqNo" DataField="DependencyQU" AllowFiltering="true"
                        ColumnGroupName="DependencyQU" SortExpression="DependencyQU" UniqueName="DependencyQU"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnitRate" DataField="unitrate" AllowFiltering="false"
                        ColumnGroupName="unitrate" SortExpression="unitrate" UniqueName="unitrate" Reorderable="true"
                        DataFormatString="{0:#,0.0000}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnitRateUOM" DataField="unitrateuomdescr" AllowFiltering="false"
                        AllowSorting="false" ColumnGroupName="unitrateuomdescr" SortExpression="unitrateuomdescr"
                        UniqueName="unitrateuomdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingMethod" DataField="billingmethoddescr"
                        AllowFiltering="true" ColumnGroupName="billingmethoddescr" SortExpression="billingmethoddescr"
                        UniqueName="billingmethoddescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingCalcMethod" DataField="billingcalcmethod"
                        AllowFiltering="false" ColumnGroupName="billingcalcmethod" SortExpression="billingcalcmethod"
                        UniqueName="billingcalcmethod" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BCMFactor" DataField="BillingCalcMethodfactor"
                        AllowFiltering="false" ColumnGroupName="BillingCalcMethodfactor" SortExpression="BillingCalcMethodfactor"
                        UniqueName="BillingCalcMethodfactor" Reorderable="true">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn HeaderText="DefaultQty" DataField="defaultqty" AllowFiltering="false"
                    ColumnGroupName="defaultqty" SortExpression="defaultqty" UniqueName="defaultqty"
                    Reorderable="true" DataFormatString="{0:#,0.00}">
                </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipmentType" DataField="ShTypeDescr" AllowFiltering="true"
                        ColumnGroupName="ShTypeDescr" SortExpression="ShTypeDescr" UniqueName="ShTypeDescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="JobType" DataField="JobTypeDescr" AllowFiltering="false"
                        ColumnGroupName="JobTypeDescr" SortExpression="JobTypeDescr" UniqueName="JobTypeDescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TransportType" DataField="TptTypeDescr" AllowFiltering="false"
                        ColumnGroupName="TptTypeDescr" SortExpression="TptTypeDescr" UniqueName="TptTypeDescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="billsizetype" AllowFiltering="false"
                        ColumnGroupName="billsizetype" SortExpression="billsizetype" UniqueName="billsizetype"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TripType" DataField="TripTypeDescr" AllowFiltering="false"
                        ColumnGroupName="TripTypeDescr" SortExpression="TripTypeDescr" UniqueName="TripTypeDescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ARGLCODE" DataField="arglcode" AllowFiltering="false"
                        ColumnGroupName="arglcode" SortExpression="arglcode" UniqueName="arglcode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Src" DataField="srcdescr" AllowFiltering="false"
                        ColumnGroupName="srcdescr" SortExpression="srcdescr" UniqueName="srcdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingUOM" DataField="billinguomdescr" AllowFiltering="false"
                        ColumnGroupName="billinguomdescr" SortExpression="billinguomdescr" UniqueName="billinguomdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CUR" DataField="currcode" AllowFiltering="false"
                        ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="MinCharge" DataField="minimumcharge" AllowFiltering="false"
                        ColumnGroupName="minimumcharge" SortExpression="minimumcharge" UniqueName="minimumcharge"
                        Reorderable="true" DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="MinChargeType" DataField="minimumchargetypedescr"
                        AllowFiltering="false" ColumnGroupName="minimumchargetypedescr" SortExpression="minimumchargetypedescr"
                        UniqueName="minimumchargetypedescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DefaultQty" DataField="defaultqty" AllowFiltering="false"
                        ColumnGroupName="defaultqty" SortExpression="defaultqty" UniqueName="defaultqty"
                        Reorderable="true" DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EffectiveDate" DataField="effectivedate" AllowFiltering="false"
                        ColumnGroupName="effectivedate" SortExpression="effectivedate" UniqueName="effectivedate"
                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-ForeColor="blue">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DateOption" DataField="dateoptiondescr" AllowFiltering="false"
                        ColumnGroupName="dateoptiondescr" SortExpression="dateoptiondescr" UniqueName="dateoptiondescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FromServicePoint" DataField="frservicept" AllowFiltering="false"
                        ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ToServicePoint" DataField="toservicept" AllowFiltering="false"
                        ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ApplyOption" DataField="applyoption" AllowFiltering="false"
                        ColumnGroupName="applyoption" SortExpression="applyoption" UniqueName="applyoption"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SplitOption" DataField="splitoption" AllowFiltering="false"
                        ColumnGroupName="splitoption" SortExpression="splitoption" UniqueName="splitoption"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ProfitCentre" DataField="profitctrcode" AllowFiltering="false"
                        ColumnGroupName="profitctrcode" SortExpression="profitctrcode" UniqueName="profitctrcode"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CostCentre" DataField="costctrcode" AllowFiltering="false"
                        ColumnGroupName="costctrcode" SortExpression="costctrcode" UniqueName="costctrcode"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DependencyCharge" DataField="dependencychargecode"
                        AllowFiltering="false" ColumnGroupName="dependencychargecode" SortExpression="dependencychargecode"
                        UniqueName="dependencychargecode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DependencyPercent" DataField="dependencypercent"
                        AllowFiltering="false" ColumnGroupName="dependencypercent" SortExpression="dependencypercent"
                        UniqueName="dependencypercent" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DependencyAmt" DataField="dependencyamt" AllowFiltering="false"
                        ColumnGroupName="dependencyamt" SortExpression="dependencyamt" UniqueName="dependencyamt"
                        Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <%-- Added by WL on 22/8/16--%>
                    <telerik:GridBoundColumn HeaderText="BillOption1" DataField="BillOption1Descr" AllowFiltering="false"
                        ColumnGroupName="BillOption1Descr" SortExpression="BillOption1Descr" UniqueName="BillOption1Descr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillOption2" DataField="BillOption2Descr" AllowFiltering="false"
                        ColumnGroupName="BillOption2Descr" SortExpression="BillOption2Descr" UniqueName="BillOption2Descr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <%--   22/8/16--%>
                    <telerik:GridBoundColumn HeaderText="Tax" DataField="taxtype" AllowFiltering="false"
                        ColumnGroupName="taxtype" SortExpression="taxtype" UniqueName="taxtype" Reorderable="true"
                        FilterControlWidth="10px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ActivityCode" DataField="peratvtcode" AllowFiltering="false"
                        ColumnGroupName="peratvtcode" SortExpression="peratvtcode" UniqueName="peratvtcode"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TaskCode" DataField="taskdescr" AllowFiltering="false"
                        ColumnGroupName="taskdescr" SortExpression="taskdescr" UniqueName="taskdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false"
                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor"
                        HeaderText="Statuscolor" />
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="false"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="false"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="false"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="false"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                    </telerik:GridBoundColumn>
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
        <telerik:RadMultiPage runat="server" ID="RadMultiPg" SelectedIndex="0"  CssClass="outerMultiPage">
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
