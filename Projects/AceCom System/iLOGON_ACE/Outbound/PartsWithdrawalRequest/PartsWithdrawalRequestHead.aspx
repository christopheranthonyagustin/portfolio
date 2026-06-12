<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartsWithdrawalRequestHead.aspx.cs" Inherits="iWMS.Web.Outbound.PartsWithdrawalRequest.PartsWithdrawalRequestHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PartsWithdrawalRequestHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <style type="text/css">
        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="SearchResultsTab" Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>

                <asp:Label Style="z-index: 0" ID="isstatusLbl" runat="server" Visible="False"></asp:Label>
                <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="ShipEDIBtn" runat="server" Text="Ship EDI" OnClick="ShipEDIBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" CausesValidation="False"
                                UseSubmitBehavior="false" CssClass="green" ToolTip="Ship Confirmation" />
                        </td>
                         <td align="right">
                            <br />
                            &nbsp;
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ConfirmShipEDIBtn" Text="" Style="display: none;" OnClick="ConfirmShipEDIBtn_Click1" runat="server" />
                        </td>
                    </tr>
                </table>
                <div id="div-datagrid">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                        OnItemDataBound="ResultDG_ItemDataBound">
                        <GroupingSettings CaseSensitive="false" />
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                        <asp:ImageButton runat="server" Visible="True" ID="GoodsIssueEdit" ImageUrl="../../image/pencil.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Issue"
                                            OnClick="GoodsIssueEdit_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:Label ID="ShippedEDIStatusLbl" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="accode" HeaderText="Account" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn DataField="acname" HeaderText="Account Name" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="shtocode" HeaderText="Bank" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="route" HeaderText="Branch" AllowFiltering="false">
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn DataField="sitedescr" HeaderText="Site" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="number" HeaderText="IssueNo" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="Department" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehno" SortExpression="statusdescr" HeaderText="Vehicle" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OrderBy" SortExpression="OrderBy" HeaderText="EmployeeID" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn DataField="podstatus" SortExpression="podstatus" HeaderText="POD status" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn DataField="shname" SortExpression="shname" HeaderText="ConsigneeName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>--%>
                                <%--<telerik:GridBoundColumn DataField="Route" SortExpression="Route" HeaderText="Route" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    HeaderText="Priority">
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn DataField="shippeddate" SortExpression="shippeddate" HeaderText="ShippedOn"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OrderPlanNo">
                                </telerik:GridBoundColumn>--%>
                                <%--<telerik:GridBoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustRefDate"
                                    DataFormatString="{0:dd/MMM/yyyy}" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PKONO" SortExpression="PKONO" HeaderText="PackingOrderNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="WholeQty" SortExpression="WholeQty" HeaderText="WholeQty" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:#.####}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LooseQty" SortExpression="LooseQty" HeaderText="LooseQty" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:#.####}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OrdVol" SortExpression="OrdVol" HeaderText="OrdVol" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OrdWt" SortExpression="OrdWt" HeaderText="OrdWt" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="hauliername" SortExpression="hauliername" HeaderText="Courier" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <%--<telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="jobno">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="acid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="sitecode">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="rcid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="type" SortExpression="type" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="BookTransportDone" SortExpression="BookTransportDone" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ISImageFound" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="IsNonBillable" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ApproveAllocateStatus" Display="False" />
                                <telerik:GridBoundColumn DataField="ShippedEDIStatus" Display="False" />
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
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
    <script type="text/javascript">
        function OnClientItemBlurMenu(sender, args) {
            sender.close(true);
        }
        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
        function OnClientItemBlurMenu(sender, args) {
            setTimeout(function () {
                sender.close(true);
            }, 200);
        }

        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
</body>
</html>
