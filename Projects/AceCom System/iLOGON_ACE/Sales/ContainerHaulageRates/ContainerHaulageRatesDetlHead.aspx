<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerHaulageRatesDetlHead.aspx.cs" Inherits="iWMS.Web.Sales.ContainerHaulageRates.ContainerHaulageRatesDetlHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ContainerHaulageRatesDetlHead</title>
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="LineSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
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
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
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

                                  <asp:ImageButton runat="server" Visible="False" ID="EditImgBtn" ImageUrl="..\..\image\detail.gif"
                                        Width="15" Height="15" AlternateText="Edit" BackColor="Transparent" OnClick="EditImgBtn_Click"
                                        BorderWidth="0"></asp:ImageButton>
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
                        <telerik:GridBoundColumn HeaderText="MinCharge" DataField="minimumcharge" AllowFiltering="true"
                            ColumnGroupName="minimumcharge" SortExpression="minimumcharge" UniqueName="minimumcharge"
                            Reorderable="true" DataFormatString="{0:#,0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EffectiveDate" DataField="effectivedate" AllowFiltering="true"
                            ColumnGroupName="effectivedate" SortExpression="effectivedate" UniqueName="effectivedate"
                            Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-ForeColor="blue">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DefaultQty" DataField="defaultqty" AllowFiltering="true"
                            ColumnGroupName="defaultqty" SortExpression="defaultqty" UniqueName="defaultqty"
                            Reorderable="true" DataFormatString="{0:#,0.00}">
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
                        <telerik:GridBoundColumn Display="False" DataField="QUId" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
