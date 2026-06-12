<%@ Page Language="c#" CodeBehind="IssueSkuHeadCommitted.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.Issue.IssueSkuHeadCommitted" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueSkuHead</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="SKULineSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table style="width: 100%; height: 30px">
            <tr>
                <td>
                    <asp:Button ID="LineEditBtn" runat="server" CssClass="white" Text="Line Edit" OnClick="LineEditBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="ExcelBtn" runat="server" Text="Excel" OnClick="ExcelBtn_Click" CausesValidation="false"
                        OnClientClick="(this.id,false)" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />&nbsp;
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <div id="div-datagrid" style="height: 98%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound"
                OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="isid">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="ChkIcon" AllowFiltering="false">
                            <HeaderTemplate>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="No" HeaderText="No">
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn Display="False" DataField="acid" ItemStyle-Wrap="false" UniqueName="acid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="isid" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="status" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="sitecode" ItemStyle-Wrap="false" UniqueName="sitecode">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="Issue#" UniqueName="isno"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shname" HeaderText="Name" SortExpression="shname"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sitecode" HeaderText="Site" SortExpression="sitecode"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expdate" HeaderText="ExpectedDate" SortExpression="expdate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shipdate" HeaderText="ShippedDate" SortExpression="shippeddate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustomerRef"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="ExternalRef"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="grp" SortExpression="grp" HeaderText="Group"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sealno" SortExpression="sealno" HeaderText="Sealno"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Issue Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" SortExpression="statuscolor"
                            ItemStyle-Wrap="false" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isduomdescr" SortExpression="isduomdescr" HeaderText="UOM"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ptdstatusdescr" SortExpression="ptdstatusdescr"
                            HeaderText="Picked Status" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skupackqty" SortExpression="skupackqty" HeaderText="Qty" DataFormatString="{0:#,0.##}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skupackpackedqty" SortExpression="skupackpackedqty" HeaderText="Packed Qty"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loccode" HeaderText="Location" SortExpression="loccode"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno1" HeaderText="Tuno1" SortExpression="tuno1"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno2" HeaderText="Tuno2" SortExpression="tuno2"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rcdate" HeaderText="Receive Date" SortExpression="rcdate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot4" HeaderText="Lot4" SortExpression="lot4"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot1" HeaderText="Lot1" SortExpression="lot1"
                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot5" HeaderText="Lot5" SortExpression="lot5"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot6" HeaderText="Lot6" SortExpression="lot6"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot7" HeaderText="Lot7" SortExpression="lot7"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot2" HeaderText="Lot2" SortExpression="lot2"
                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot3" HeaderText="Lot3" SortExpression="lot3"
                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot8" HeaderText="Lot8" SortExpression="lot8"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot9" HeaderText="Lot9" SortExpression="lot9"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot10 " HeaderText="Lot10" SortExpression="lot10"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot11" HeaderText="Lot11" SortExpression="lot11"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot12" HeaderText="Lot12" SortExpression="lot12"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot13" HeaderText="Lot13" SortExpression="lot13"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot14" HeaderText="Lot14" SortExpression="lot14"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot15" HeaderText="Lot15" SortExpression="lot15"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot16" HeaderText="Lot16" SortExpression="lot16"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot17" HeaderText="Lot17" SortExpression="lot17"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot18" HeaderText="Lot18" SortExpression="lot18"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot19" HeaderText="Lot19" SortExpression="lot19"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot20" HeaderText="Lot20" SortExpression="lot20"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot21" HeaderText="Lot21" SortExpression="lot21"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot22" HeaderText="Lot22" SortExpression="lot22"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot23" HeaderText="Lot23" SortExpression="lot23"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot24" HeaderText="Lot24" SortExpression="lot24"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot25" HeaderText="Lot25" SortExpression="lot25"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot26" HeaderText="Lot26" SortExpression="lot26"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot27" HeaderText="Lot27" SortExpression="lot27"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot28" HeaderText="Lot28" SortExpression="lot28"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot29" HeaderText="Lot29" SortExpression="lot29"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot30" HeaderText="Lot30" SortExpression="lot30"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot31" HeaderText="Lot31" SortExpression="lot31"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot32" HeaderText="Lot32" SortExpression="lot32"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot33" HeaderText="Lot33" SortExpression="33"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot35" HeaderText="Lot34" SortExpression="lot34"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot35" HeaderText="Lot35" SortExpression="lot35"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot36" HeaderText="Lot36" SortExpression="lot36"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot37" HeaderText="Lot37" SortExpression="lot37"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot38" HeaderText="Lot38" SortExpression="lot38"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot39" HeaderText="Lot39" SortExpression="lot39"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot40" HeaderText="Lot40" SortExpression="lot40"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot41" HeaderText="Lot41" SortExpression="lot41"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot42" HeaderText="Lot42" SortExpression="lot42"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot43" HeaderText="Lot43" SortExpression="lot43"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot44" HeaderText="Lot44" SortExpression="lot44"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot45" HeaderText="Lot45" SortExpression="lot45"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot46" HeaderText="Lot46" SortExpression="lot46"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot47" HeaderText="Lot47" SortExpression="lot47"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot48" HeaderText="Lot48" SortExpression="lot48"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot49" HeaderText="Lot49" SortExpression="lot49"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot50" HeaderText="Lot50" SortExpression="lot50"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot51" HeaderText="Lot51" SortExpression="lot51"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot52" HeaderText="Lot52" SortExpression="lot52"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot53" HeaderText="Lot53" SortExpression="53"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot54" HeaderText="Lot54" SortExpression="lot54"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot55" HeaderText="Lot55" SortExpression="lot55"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot56" HeaderText="Lot56" SortExpression="lot56"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot57" HeaderText="Lot57" SortExpression="lot57"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot58" HeaderText="Lot58" SortExpression="lot58"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot59" HeaderText="Lot59" SortExpression="lot59"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot60" HeaderText="Lot60" SortExpression="lot60"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="ISDTId" UniqueName="ISDTId">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    </form>
</body>
</html>
