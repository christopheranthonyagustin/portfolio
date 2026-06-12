<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportProfitandLost.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterCTNR.TransportProfitandLost" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransportProfitandLost</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
        .breakWord
        {
            width: 500px !important;
            white-space: normal;
        }
        .commandHeader
        {
            width: 10px;
        }
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
        .RadGrid_Default
        {
            border: 1px solid;
            border-color: #a0a0a0;
            color: #333;
            background-color: #fff;
            font-family: "Segoe UI" ,Arial,Helvetica,sans-serif;
            font-size: 12px;
            line-height: 16px;
        }
        .RadGrid table.rgMasterTable tr .rgExpandCol
        {
            padding-left: 0;
            padding-right: 0;
            text-align: center;
        }
        .style1
        {
            border-color: #d9d9d9;
            background: #d9d9d9;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function OnClientClick() {
                var Grid = $find("<%= ResultDG.ClientID %>");
                var MasterTable = Grid.get_masterTableView();

                for (var i = 0; i < MasterTable.get_dataItems().length; i++) {
                    var row = MasterTable.get_dataItems()[i];
                    if (row.get_expanded() == false) {
                        row.set_expanded(true);
                    }
                    else
                        row.set_expanded(false);
                }
            } 
            
        </script>

    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                 <asp:Button ID="CollapseExpandBtn" runat="server" Text="Show/Hide"
                        CssClass="white" OnClientClick="OnClientClick();"></asp:Button>&nbsp;&nbsp;
            </td>
            <br />
            <td class="pagetitle" align="left">
                &nbsp;
            </td>
        </tr>
    </table>
        <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        OnDetailTableDataBind="ResultDG_DetailTableDataBind">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JobNo"
            Name="ParentGrid" TableLayout="Fixed" ItemStyle-Wrap="true" HeaderStyle-Wrap="true"
            AlternatingItemStyle-Wrap="true" HierarchyLoadMode="Client">
            <DetailTables>
                <telerik:GridTableView Name="ChildGrid" AutoGenerateColumns="false" Width="100%"
                    SkinID="Telerik" AllowFilteringByColumn="false">
                    <HeaderStyle Wrap="false" />
                    <ItemStyle Wrap="false" />
                    <AlternatingItemStyle Wrap="false" />
                    <Columns>
                        <telerik:GridBoundColumn DataField="ChargeDescr" SortExpression="ChargeDescr" HeaderText="ChargeDescr"
                            Visible="true" ItemStyle-Width="100px" ItemStyle-Wrap="False" AllowFiltering="false"
                            ItemStyle-CssClass="breakWord" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="500px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="VendorCode" SortExpression="VendorCode" HeaderText="VendorCode"
                            UniqueName="VendorCode" ItemStyle-Width="100px" ItemStyle-Wrap="False" AllowFiltering="false"
                            HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Amount" SortExpression="Amount" HeaderText="Amount"
                            ItemStyle-Width="100px" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Right"
                            UniqueName="Amount" ItemStyle-HorizontalAlign="Right">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="VendorInvNo" SortExpression="VendorInvNo" HeaderText="VendorInvNo"
                            UniqueName="VendorInvNo" ItemStyle-Width="100px" ItemStyle-Wrap="False" AllowFiltering="false"
                            HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="VendorDocNo" SortExpression="VendorDocNo" HeaderText="VendorDocNo"
                            UniqueName="VendorDocNo" ItemStyle-Width="100px" ItemStyle-Wrap="False" AllowFiltering="false"
                            HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Remarks" SortExpression="Remarks" HeaderText="Remarks"
                            UniqueName="Remarks" ItemStyle-Width="400px" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Driver" SortExpression="Driver" HeaderText="Driver"
                            Visible="true" ItemStyle-Width="200px" ItemStyle-Wrap="False" AllowFiltering="false"
                            HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FrExpDate" SortExpression="FrExpDate" HeaderText="FrExpDate"
                            UniqueName="FrExpDate" DataFormatString="{0:dd/MMM/yyyy HH:MM}" ItemStyle-Width="200px"
                            ItemStyle-Wrap="False" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ToActDate" SortExpression="ToActDate" HeaderText="ToActDate"
                            UniqueName="ToActDate" DataFormatString="{0:dd/MMM/yyyy HH:MM}" ItemStyle-Width="200px"
                            ItemStyle-Wrap="False" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TripOptionDescr" SortExpression="TripOptionDescr"
                            UniqueName="TripOptionDescr" HeaderText="TripOptionDescr" ItemStyle-Width="200px"
                            ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="VehNo" SortExpression="VehNo" HeaderText="VehNo"
                            UniqueName="VehNo" ItemStyle-Width="200px" ItemStyle-Wrap="False" AllowFiltering="false"
                            HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TotalAmt" SortExpression="TotalAmt" HeaderText="TotalAmt"
                            UniqueName="TotalAmt" ItemStyle-Width="200px" ItemStyle-Wrap="False" AllowFiltering="false"
                            HeaderStyle-HorizontalAlign="Left">
                            <ItemStyle HorizontalAlign="Right" />
                        </telerik:GridBoundColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderStyle-CssClass="commandHeader">
                    <HeaderTemplate>
                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                    <ItemStyle Width="2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-Width="40px">
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="10" />
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" AllowFiltering="true"
                    UniqueName="jobno" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" UniqueName="id"
                    Display="false" ItemStyle-Width="100px" HeaderStyle-Width="500px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Left" HeaderText="ChargeCode"
                    DataField="chargecode" AllowFiltering="true" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Left" ItemStyle-CssClass="breakWord"
                    ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="true" HeaderText="ChargeDescr"
                    DataField="chargedescr">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Right" HeaderText="SalesAmt"
                    ItemStyle-Width="100px" DataField="salesamt" AllowFiltering="true" Aggregate="sum"
                    FooterText="SalesAmtTotal:  " UniqueName="salesamt">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Right" HeaderText="CostsAmt"
                    DataField="costamt" AllowFiltering="true" Aggregate="sum" FooterText="CostAmtTotal:  ">
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Right" HeaderText="P&LAmt"
                    DataField="PnLAmt" AllowFiltering="true" Aggregate="sum" FooterText="P&LAmtTotal:  ">
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridCalculatedColumn HeaderStyle-HorizontalAlign="Right" HeaderText="Margin%"
                    DataType="System.Double" DataFields="PnLAmt, salesamt " Expression="iif({1} = 0, 0,{0}/{1})*100"
                    DataFormatString="{0:N2}">
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridCalculatedColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
