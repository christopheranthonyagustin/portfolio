<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMConsolRegisterJobWOConsol.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsolRegister.FMConsolRegisterJobWOConsol" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>JobWOConsol</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" href="../../css/iWMStelerik.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table width="100%">
            <tr>
                <td>
                    <telerik:RadGrid ID="ResultDGConsol" runat="server" AutoGenerateColumns="false" GridLines="None" OnItemDataBound="ResultDGConsol_ItemDataBound" AllowFilteringByColumn="true"
                        OnNeedDataSource="ResultDGConsol_NeedDataSource" AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" RenderMode="Lightweight">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true" CssClass="DGItem"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <ItemStyle CssClass="DGItem"></ItemStyle>
                            <Columns>
                                <telerik:GridBoundColumn DataField="Number" UniqueName="Number" SortExpression="Number" HeaderText="Number" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Type" UniqueName="Type" SortExpression="Type" HeaderText="Type" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TransportModeDescr" UniqueName="FMCSLTransportMode" SortExpression="FMCSLTransportMode" HeaderText="FMCSLTransportMode" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CtnrMode" UniqueName="CtnrMode" SortExpression="CtnrMode" HeaderText="CtnrMode" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Voyage" UniqueName="Voyage" SortExpression="Voyage" HeaderText="Voyage" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Vessel" UniqueName="Vessel" SortExpression="Vessel" HeaderText="Vessel" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="POL" UniqueName="POL" SortExpression="POL" HeaderText="POL" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="POD" UniqueName="POD" SortExpression="POD" HeaderText="POD" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD" ItemStyle-Width="100px" HeaderStyle-Width="100px"
                                    HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA" ItemStyle-Width="100px" HeaderStyle-Width="100px"
                                    HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CarrierName" UniqueName="CarrierName" SortExpression="CarrierName" HeaderText="CarrierName" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn UniqueName="WT" HeaderText="WT <br> VOL " ItemStyle-Width="130px" AllowFiltering="false" HeaderStyle-Width="130px">
                                    <ItemTemplate>
                                        <%# string.Format("{0}",Eval("WT")) %>
                                        <br />
                                        <%# string.Format("{0}",Eval("VOL")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="cutoffDate" UniqueName="cutoffDate" SortExpression="cutoffDate" HeaderText="Cut off Date"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <br />
                    <div>
                        <asp:Button ID="AssignBtn" runat="server" CssClass="white" Text="Assign" OnClick="AssignBtn_Click" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                    </div>
                    <br />
                    <telerik:RadGrid ID="ResultDGJob" runat="server" AutoGenerateColumns="false" Skin="Metro" RenderMode="Lightweight" OnItemDataBound="ResultDGJob_ItemDataBound" AllowFilteringByColumn="true"
                        OnNeedDataSource="ResultDGJob_NeedDataSource" AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" AllowMultiRowSelection="true">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true" CssClass="DGItem"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <ItemStyle CssClass="DGItem"></ItemStyle>
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="20px" HeaderStyle-Width="20px">
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="JobNo" UniqueName="Number" SortExpression="Number" HeaderText="Number" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="HouseBill" UniqueName="HouseBill" SortExpression="HouseBill" HeaderText="HouseBill" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TransportModeDescr" UniqueName="FMJobTransportMode" SortExpression="FMJobTransportMode" HeaderText="FMJobTransportMode" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CtnrMode" UniqueName="CtnrMode" SortExpression="CtnrMode" HeaderText="CtnrMode" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ShipperName" UniqueName="Shipper" SortExpression="Shipper" HeaderText="Shipper" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ConsigneeName" UniqueName="Consignee" SortExpression="Consignee" HeaderText="Consignee" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LocalClientName" UniqueName="LocalClient" SortExpression="LocalClient" HeaderText="LocalClient" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="POL" UniqueName="POL" SortExpression="POL" HeaderText="POL" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="POD" UniqueName="POD" SortExpression="POD" HeaderText="POD" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD" HeaderStyle-Width="100px"
                                    HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA" HeaderStyle-Width="100px"
                                    HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn UniqueName="WT" HeaderText="WT <br> VOL " ItemStyle-Width="130px" AllowFiltering="false" HeaderStyle-Width="130px">
                                    <ItemTemplate>
                                        <%# string.Format("{0}",Eval("WT")) %> &nbsp; <%# string.Format("{0}",Eval("WTUOM")) %>
                                        <br />
                                        <%# string.Format("{0}",Eval("VOL")) %> &nbsp; <%# string.Format("{0}",Eval("WTUOM")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
