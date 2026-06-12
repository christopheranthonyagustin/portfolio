<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSServiceRatesDetlHead.aspx.cs" Inherits="iWMS.Web.Sales.WarehouseServiceRates.WHSServiceRatesDetlHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>WHSServiceRatesDetlHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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

    <style type="text/css">
        .div-radgrid {
            height: 82%;
            width: 89%;
            overflow: auto;
            position: relative;
            vertical-align: top;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="3" cellpadding="3" width="100%">
            <tr>
                <td>
                    <asp:Button ID="MassChangesBtn" runat="server" Text="Update" OnClick="MassChangeBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Update Selected QuDetl(s)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="MergesBtn" runat="server" Text="Merge" OnClick="MergeBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Merge QuDetl" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <div id="div-radgrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true"
                AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand">
                <GroupingSettings CaseSensitive="false" />
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                                <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="QuDetail_Edit"
                                    runat="server">
                                    <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                        title="Edit" runat="server" /></a>
                                <asp:Label ID="DetailLbl" runat="server" Visible="false"></asp:Label>
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
                        <%-- <telerik:GridBoundColumn HeaderText="SeqNo" DataField="seqno" AllowFiltering="false"
                        AllowSorting="false" ColumnGroupName="seqno" SortExpression="seqno" UniqueName="seqno"
                        Reorderable="true">
                    </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn HeaderText="QuotationNumber" DataField="qunumber" AllowFiltering="true"
                            ColumnGroupName="qunumber" SortExpression="qunumber" UniqueName="qunumber" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                            ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ChargeCode" DataField="chargecode" AllowFiltering="true"
                            ColumnGroupName="chargecode" SortExpression="chargecode" UniqueName="chargecode"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="chargedescr" AllowFiltering="true"
                            ColumnGroupName="chargedescr" SortExpression="chargedescr" UniqueName="chargedescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UnitRate" DataField="unitrate" AllowFiltering="true"
                            ColumnGroupName="unitrate" SortExpression="unitrate" UniqueName="unitrate" Reorderable="true"
                            DataFormatString="{0:#,0.0000}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UnitRateUOM" DataField="unitrateuomdescr" AllowFiltering="true"
                            AllowSorting="true" ColumnGroupName="unitrateuomdescr" SortExpression="unitrateuomdescr"
                            UniqueName="unitrateuomdescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingMethod" DataField="billingmethoddescr"
                            AllowFiltering="true" ColumnGroupName="billingmethoddescr" SortExpression="billingmethoddescr"
                            UniqueName="billingmethoddescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingType" DataField="billingtypedescr" AllowFiltering="true"
                            ColumnGroupName="billingtypedescr" SortExpression="billingtypedescr" UniqueName="billingtypedescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn HeaderText="ARGLCODE" DataField="arglcode" AllowFiltering="true"
                            ColumnGroupName="arglcode" SortExpression="arglcode" UniqueName="arglcode"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingGrp" DataField="billinggrpdescr" AllowFiltering="true"
                            ColumnGroupName="billinggrpdescr" SortExpression="billinggrpdescr" UniqueName="billinggrpdescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingPeriod" DataField="billingperioddescr"
                            AllowFiltering="true" ColumnGroupName="billingperioddescr" SortExpression="billingperioddescr"
                            UniqueName="billingperioddescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Src" DataField="srcdescr" AllowFiltering="true"
                            ColumnGroupName="srcdescr" SortExpression="srcdescr" UniqueName="srcdescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingCalcMethod" DataField="billingcalcmethoddescr"
                            AllowFiltering="true" ColumnGroupName="billingcalcmethoddescr" SortExpression="billingcalcmethoddescr"
                            UniqueName="billingcalcmethoddescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingUOM" DataField="billinguomdescr" AllowFiltering="true"
                            ColumnGroupName="billinguomdescr" SortExpression="billinguomdescr" UniqueName="billinguomdescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CUR" DataField="currcode" AllowFiltering="false"
                            ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="MinCharge" DataField="minimumcharge" AllowFiltering="true"
                            ColumnGroupName="minimumcharge" SortExpression="minimumcharge" UniqueName="minimumcharge"
                            Reorderable="true" DataFormatString="{0:#,0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="MinChargeType" DataField="minimumchargetypedescr"
                            AllowFiltering="true" ColumnGroupName="minimumchargetypedescr" SortExpression="minimumchargetypedescr"
                            UniqueName="minimumchargetypedescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DefaultQty" DataField="defaultqty" AllowFiltering="true"
                            ColumnGroupName="defaultqty" SortExpression="defaultqty" UniqueName="defaultqty"
                            Reorderable="true" DataFormatString="{0:#,0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EffectiveDate" DataField="effectivedate" AllowFiltering="true"
                            ColumnGroupName="effectivedate" SortExpression="effectivedate" UniqueName="effectivedate"
                            Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-ForeColor="blue">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DateOption" DataField="dateoptiondescr" AllowFiltering="true"
                            ColumnGroupName="dateoptiondescr" SortExpression="dateoptiondescr" UniqueName="dateoptiondescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ShipmentType" DataField="shtype" AllowFiltering="true"
                            ColumnGroupName="shtype" SortExpression="shtype" UniqueName="shtype" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="JobType" DataField="jobtype" AllowFiltering="true"
                            ColumnGroupName="jobtype" SortExpression="jobtype" UniqueName="jobtype" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TransportType" DataField="tpttype" AllowFiltering="true"
                            ColumnGroupName="tpttype" SortExpression="tpttype" UniqueName="tpttype" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillSizeType" DataField="billsizetype" AllowFiltering="true"
                            ColumnGroupName="billsizetype" SortExpression="billsizetype" UniqueName="billsizetype"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="FromServicePoint" DataField="frservicept" AllowFiltering="true"
                            ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ToServicePoint" DataField="toservicept" AllowFiltering="true"
                            ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ApplyOption" DataField="applyoption" AllowFiltering="true"
                            ColumnGroupName="applyoption" SortExpression="applyoption" UniqueName="applyoption"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SplitOption" DataField="splitoption" AllowFiltering="true"
                            ColumnGroupName="splitoption" SortExpression="splitoption" UniqueName="splitoption"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ProfitCentre" DataField="profitctrcode" AllowFiltering="true"
                            ColumnGroupName="profitctrcode" SortExpression="profitctrcode" UniqueName="profitctrcode"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CostCentre" DataField="costctrcode" AllowFiltering="true"
                            ColumnGroupName="costctrcode" SortExpression="costctrcode" UniqueName="costctrcode"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DependencyCharge" DataField="dependencychargecode"
                            AllowFiltering="true" ColumnGroupName="dependencychargecode" SortExpression="dependencychargecode"
                            UniqueName="dependencychargecode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DependencyPercent" DataField="dependencypercent"
                            AllowFiltering="true" ColumnGroupName="dependencypercent" SortExpression="dependencypercent"
                            UniqueName="dependencypercent" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DependencyAmt" DataField="dependencyamt" AllowFiltering="true"
                            ColumnGroupName="dependencyamt" SortExpression="dependencyamt" UniqueName="dependencyamt"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Tax" DataField="taxtype" AllowFiltering="true"
                            ColumnGroupName="taxtype" SortExpression="taxtype" UniqueName="taxtype" Reorderable="true"
                            FilterControlWidth="10px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                            ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor"
                            HeaderText="Statuscolor" />
                        <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                            ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                            ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                            ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                            ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="pricebreakoption" SortExpression="pricebreakoption" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
