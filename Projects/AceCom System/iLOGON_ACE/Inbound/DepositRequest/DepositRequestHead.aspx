<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositRequestHead.aspx.cs" Inherits="iWMS.Web.Inbound.DepositRequest.DepositRequestHead" %>

<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReceiptHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/NewBusyBox.js" language="javascript" type="text/javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

    <script type="text/javascript">
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

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="SearchResultsTab" Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <div style="height: 92%" id="div-datagrid">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                    <table>
                        <tr>
                            <td>
                            <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M"
                                OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                        OnItemDataBound="ResultDG_ItemDataBound" OnPreRender="ResultDG_PreRender">
                        <GroupingSettings CaseSensitive="false" />
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
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
                                        <label id="completelbl">
                                        </label>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="250px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="ReceiveEdit" ImageUrl="../../image/pencil.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Receive"
                                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="RcFinalizeLbl" runat="server" />
                                        <asp:Label ID="RcCfmLbl" runat="server" />
                                        <asp:Label ID="NonBillCfmLbl" runat="server" />
                                        <asp:Label ID="WrcPopCfmLbl" runat="server" />
                                        <asp:Label ID="RcImageFound" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn Display="false" DataField="acid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="isid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="acname" SortExpression="acname" HeaderText="Account Name"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReceiptNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exprcdate" SortExpression="exprcdate" HeaderText="Expected" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="type">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustomerRef" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TeamDescr" SortExpression="TeamDescr" HeaderText="TeamDescr" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ReceivingStatusDescr" SortExpression="ReceivingStatusDescr" HeaderText="ReceivingStatus" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ZoneCode" SortExpression="ZoneCode" HeaderText="ZoneCode" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ReceiverStatusDescr" SortExpression="ReceiverStatusDescr" HeaderText="ReceiverStatus" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PONo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="podate" SortExpression="podate" HeaderText="PODate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="SupplierInvNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exref3" SortExpression="exref3" HeaderText="Exref3" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="grp" SortExpression="grp" HeaderText="Group" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="Ctnrno" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sealno" SortExpression="sealno" HeaderText="SealNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sucode" SortExpression="sucode" HeaderText="Supplier" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="suname" SortExpression="suname" HeaderText="SupplierName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="suaddr1" SortExpression="suaddr1" HeaderText="Addr1" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    HeaderText="Priority">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="SuppInvDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustomerRefDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PKONO" SortExpression="exref2" HeaderText="PackingOrderNo" UniqueName="PackingOrderNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="VslVoy" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="eta" SortExpression="eta" HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="gateindate" SortExpression="gateindate" HeaderText="GateIn" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="gateoutdate" SortExpression="gateoutdate" HeaderText="GateOut" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pano" SortExpression="pano" HeaderText="PANo" Display="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pastatusdescr" SortExpression="pastatusdescr" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    HeaderText="PAStatus" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="MoreCtnrNo" SortExpression="MoreCtnrNo" HeaderText="MoreCtnrNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="isnonbillable" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sitecode" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RCImageFound" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NonBillCfmLbl" Display="False">
                                </telerik:GridBoundColumn>

                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
