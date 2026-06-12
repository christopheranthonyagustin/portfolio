<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptShipmentDetlList.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.ReceiptShipmentDetlList" %>
<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReceiptDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
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

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="SKULineSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table style="width: 100%; height: 30px">
            <tr>
                <td>
                    <asp:Button ID="LineEditBtn" runat="server" CssClass="white" Text="Line Edit" OnClick="LineEditBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                     <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click" Visible="true"
                        Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
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
                        <telerik:GridTemplateColumn AllowFiltering="false">
                            <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn Display="False" DataField="id" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="acid" ItemStyle-Wrap="false" UniqueName="acid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="rcid" ItemStyle-Wrap="false" UniqueName="rcid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="rhstatus" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="sitecode" ItemStyle-Wrap="false" UniqueName="sitecode">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="rcdtid" UniqueName="rcdtid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="Receipt#" UniqueName="rcnumber" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exprcdate" SortExpression="exprcdate" HeaderText="ExpectedDate" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PoNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sucode" SortExpression="sucode" HeaderText="Supplier Code" UniqueName="sucode" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="suname" SortExpression="suname" HeaderText="Supplier Name" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustomerRef" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sealno" SortExpression="sealno" HeaderText="SealNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rhstatusdescr" SortExpression="rhstatusdescr" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            HeaderText="GRStatus" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="line" HeaderText="Line#" SortExpression="line" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skucode" HeaderText="Sku" SortExpression="skucode" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="skuid" ItemStyle-Wrap="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rcsskudescr" HeaderText="SKU Descr" SortExpression="rcsskudescr" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="rem1" HeaderText="LineRemarks" SortExpression="lineremarks" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                         </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="packing" HeaderText="Packing" SortExpression="packing" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="rcdstatus" ItemStyle-Wrap="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="rcdstatuscolor" ItemStyle-Wrap="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" HeaderText="LineStatus" SortExpression="statusdescr" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="uomdescr" HeaderText="UOM" SortExpression="uomdescr" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="expectedqty" ItemStyle-Wrap="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expecteduomqty" HeaderText="Expected" SortExpression="expecteduomqty" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="intransitqty" ItemStyle-Wrap="false" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="intransituomqty" HeaderText="In Transit" SortExpression="intransituomqty" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="receivedqty" ItemStyle-Wrap="false" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="receiveduomqty" HeaderText="Received" SortExpression="receiveduomqty" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CntSNo" HeaderText="SerialNo" SortExpression="CntSNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            Visible="false" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loccode" HeaderText="To Loc" SortExpression="loccode" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="tuno1" HeaderText="Tuno1" SortExpression="tuno1" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno2" HeaderText="Tuno2" SortExpression="tuno2" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="rcdate" HeaderText="Rcv Date" SortExpression="rcdate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="StorageZone" HeaderText="Storage Zone" SortExpression="StorageZone" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="StorageCategory" HeaderText="Storage Category" SortExpression="StorageCategory" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="lot4" HeaderText="Lot4" SortExpression="lot4" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot1" HeaderText="Lot1" SortExpression="lot1" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot5" HeaderText="Lot5" SortExpression="lot5" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot6" HeaderText="Lot6" SortExpression="lot6" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot7" HeaderText="Lot7" SortExpression="lot7" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot2" HeaderText="Lot2" SortExpression="lot2" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot3" HeaderText="Lot3" SortExpression="lot3" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot8" HeaderText="Lot8" SortExpression="lot8" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot9" HeaderText="Lot9" SortExpression="lot9" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot10 " HeaderText="Lot10" SortExpression="lot10" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot11" HeaderText="Lot11" SortExpression="lot11" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot12" HeaderText="Lot12" SortExpression="lot12" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot13" HeaderText="Lot13" SortExpression="lot13" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot14" HeaderText="Lot14" SortExpression="lot14" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot15" HeaderText="Lot15" SortExpression="lot15" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot16" HeaderText="Lot16" SortExpression="lot16" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot17" HeaderText="Lot17" SortExpression="lot17" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot18" HeaderText="Lot18" SortExpression="lot18" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot19" HeaderText="Lot19" SortExpression="lot19" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot20" HeaderText="Lot20" SortExpression="lot20" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot21" HeaderText="Lot21" SortExpression="lot21" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot22" HeaderText="Lot22" SortExpression="lot22" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot23" HeaderText="Lot23" SortExpression="lot23" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot24" HeaderText="Lot24" SortExpression="lot24" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot25" HeaderText="Lot25" SortExpression="lot25" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot26" HeaderText="Lot26" SortExpression="lot26" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot27" HeaderText="Lot27" SortExpression="lot27" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot28" HeaderText="Lot28" SortExpression="lot28" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot29" HeaderText="Lot29" SortExpression="lot29" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot30" HeaderText="Lot30" SortExpression="lot30" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot31" HeaderText="Lot31" SortExpression="lot31" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot32" HeaderText="Lot32" SortExpression="lot32" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot33" HeaderText="Lot33" SortExpression="33" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot35" HeaderText="Lot34" SortExpression="lot34" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot35" HeaderText="Lot35" SortExpression="lot35" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot36" HeaderText="Lot36" SortExpression="lot36" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot37" HeaderText="Lot37" SortExpression="lot37" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot38" HeaderText="Lot38" SortExpression="lot38" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot39" HeaderText="Lot39" SortExpression="lot39" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot40" HeaderText="Lot40" SortExpression="lot40" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot41" HeaderText="Lot41" SortExpression="lot41" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot42" HeaderText="Lot42" SortExpression="lot42" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot43" HeaderText="Lot43" SortExpression="lot43" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot44" HeaderText="Lot44" SortExpression="lot44" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot45" HeaderText="Lot45" SortExpression="lot45" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot46" HeaderText="Lot46" SortExpression="lot46" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot47" HeaderText="Lot47" SortExpression="lot47" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot48" HeaderText="Lot48" SortExpression="lot48" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot49" HeaderText="Lot49" SortExpression="lot49" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot50" HeaderText="Lot50" SortExpression="lot50" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot51" HeaderText="Lot51" SortExpression="lot51" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot52" HeaderText="Lot52" SortExpression="lot52" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot53" HeaderText="Lot53" SortExpression="53" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot54" HeaderText="Lot54" SortExpression="lot54" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot55" HeaderText="Lot55" SortExpression="lot55" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot56" HeaderText="Lot56" SortExpression="lot56" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot57" HeaderText="Lot57" SortExpression="lot57" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot58" HeaderText="Lot58" SortExpression="lot58" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot59" HeaderText="Lot59" SortExpression="lot59" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot60" HeaderText="Lot60" SortExpression="lot60" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                            ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>