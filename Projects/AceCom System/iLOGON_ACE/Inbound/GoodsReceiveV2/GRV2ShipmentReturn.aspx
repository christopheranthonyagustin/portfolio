<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV2ShipmentReturn.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV2.GRV2ShipmentReturn" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipmentReturn @ GoodsReceiveV2</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/NewBusyBox.js" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" type="text/javascript">
        function SelectAll(invoker) {
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ShipmentReturn" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <input id="CBSelectAll" name="CBSelectAll" type="checkbox" onclick="SelectAll(this)">
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
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                        AllowFiltering="true" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReceiptNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exprcdate" SortExpression="exprcdate" HeaderText="ReturnDate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="ShipOutDate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustomerRef">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TeamDescr" SortExpression="TeamDescr" HeaderText="TeamDescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ZoneCode" SortExpression="ZoneCode" HeaderText="ZoneCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReceiverStatusDescr" SortExpression="ReceiverStatusDescr" HeaderText="ReceiverStatus">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PONo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="podate" SortExpression="podate" HeaderText="PODate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="SupplierInvNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref3" SortExpression="exref3" HeaderText="Exref3">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="grp" SortExpression="grp" HeaderText="Group">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sealno" SortExpression="sealno" HeaderText="SealNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sucode" SortExpression="sucode" HeaderText="Supplier">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suname" SortExpression="suname" HeaderText="SupplierName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suaddr1" SortExpression="suaddr1" HeaderText="Addr1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr"
                        HeaderText="Priority">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="SuppInvDate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustomerRefDate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suaddr2" SortExpression="suaddr2" HeaderText="Addr2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suaddr3" SortExpression="suaddr3" HeaderText="Addr3">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suaddr4" SortExpression="suaddr4" HeaderText="Addr4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suzipcode" SortExpression="suzipcode" HeaderText="ZipCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sucitycode" SortExpression="sucitycode" HeaderText="City">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sucountrycode" SortExpression="sucountrycode" HeaderText="Country">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="coo" SortExpression="coo" HeaderText="COO">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="VslVoy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="eta" SortExpression="eta" HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="gateindate" SortExpression="gateindate" HeaderText="GateIn"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="gateoutdate" SortExpression="gateoutdate" HeaderText="GateOut"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pano" SortExpression="pano" HeaderText="PANo" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pastatusdescr" SortExpression="pastatusdescr"
                        HeaderText="PAStatus" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="acid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="siteCode" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
