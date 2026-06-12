<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderPAndL.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderPAndL" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookingOrderP&L</title>
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
        .breakWord {
            width: 500px !important;
            white-space: normal;
        }

        .commandHeader {
            width: 10px;
        }

        .RadGrid_Default {
            border: 1px solid;
            border-color: #a0a0a0;
            color: #333;
            background-color: #fff;
            font-family: "Segoe UI",Arial,Helvetica,sans-serif;
            font-size: 12px;
            line-height: 16px;
        }

        .RadGrid table.rgMasterTable tr .rgExpandCol {
            padding-left: 0;
            padding-right: 0;
            text-align: center;
        }

        .style1 {
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
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="CollapseExpandBtn" runat="server" Text="Show/Hide"
                        CssClass="white" OnClientClick="OnClientClick();"></asp:Button>&nbsp;
                </td>
                <td class="pagetitle" align="left">&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            OnDetailTableDataBind="ResultDG_DetailTableDataBind">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JobNo" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                Name="ParentGrid" TableLayout="Fixed" ItemStyle-Wrap="true" HeaderStyle-Wrap="true"
                AlternatingItemStyle-Wrap="true" HierarchyLoadMode="Client">
                <DetailTables>
                    <telerik:GridTableView Name="ChildGrid" AutoGenerateColumns="false" Width="100%"
                        SkinID="Telerik" AllowFilteringByColumn="false">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="ChargeDescrJob" SortExpression="ChargeDescrJob"
                                HeaderText="ChargeDescrJob" Visible="true" ItemStyle-Wrap="False"
                                AllowFiltering="false" ItemStyle-CssClass="breakWord" HeaderStyle-HorizontalAlign="Left"
                                ItemStyle-Width="400px" HeaderStyle-Width="400px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DocNo" SortExpression="DocNo" HeaderText="DocNo"
                                UniqueName="DocNo" ItemStyle-Wrap="False" AllowFiltering="false"
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DocDate" SortExpression="DocDate" HeaderText="DocDate"
                                UniqueName="DocDate" DataFormatString="{0:dd/MMM/yyyy}"
                                ItemStyle-Wrap="False" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DocType" SortExpression="DocType" UniqueName="DocType"
                                HeaderText="DocType" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AccVendorCode" SortExpression="AccVendorCode" HeaderText="AccVendor"
                                UniqueName="AccVendorCode" ItemStyle-Wrap="False" AllowFiltering="false"
                                HeaderStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SalesAmt"
                                DataField="salesamt" DataFormatString="{0:#,0.00##}" AllowFiltering="true" Aggregate="sum"
                                FooterText="SalesAmtTotal:  " UniqueName="salesamt">
                                <ItemStyle HorizontalAlign="Right" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="CostsAmt"
                                DataField="costsamt" DataFormatString="{0:#,0.00##}" AllowFiltering="true" Aggregate="sum" FooterText="CostAmtTotal:  ">
                                <FooterStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-BackColor="#05538C"
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
                        UniqueName="jobno" Display="false" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" UniqueName="id"
                        Display="false" ItemStyle-Width="100px" HeaderStyle-Width="600px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Left" HeaderText="ChargeCode"
                        DataField="chargecode" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Left" ItemStyle-CssClass="breakWord"
                        HeaderStyle-Wrap="true" HeaderText="ChargeDescr"
                        DataField="chargedescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Right" HeaderText="SalesAmt"
                        DataField="salesamt" AllowFiltering="true" Aggregate="sum"
                        FooterText="SalesAmtTotal:  " DataFormatString="{0:#,0.00##}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Right" HeaderText="CostsAmt"
                        DataField="costamt" AllowFiltering="true" Aggregate="sum"
                        FooterText="CostAmtTotal:  " DataFormatString="{0:#,0.00##}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Right" HeaderText="P&LAmt"
                        DataField="PnLAmt" AllowFiltering="true" Aggregate="sum"
                        FooterText="P&LAmtTotal:  " DataFormatString="{0:#,0.00##}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridCalculatedColumn HeaderStyle-HorizontalAlign="Right" HeaderText="Margin%"
                        DataType="System.Double" DataFields="PnLAmt, salesamt " Expression="iif({1} = 0, 0,{0}/{1})*100"
                        DataFormatString="{0:N2}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridCalculatedColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
