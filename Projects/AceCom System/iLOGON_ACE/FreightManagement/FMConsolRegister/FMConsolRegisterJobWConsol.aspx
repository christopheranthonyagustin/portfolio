<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMConsolRegisterJobWConsol.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsolRegister.FMConsolRegisterJobWConsol" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>FMConsolRegisterJobWConsol</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
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
    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <div>
            <asp:Button ID="UnAssignBtn" runat="server" CssClass="white" Text="UnAssign" OnClick="UnAssignBtn_Click" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
        </div>
        <br />
        <table width="100%">
            <tr>
                <td>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                        <telerik:RadPageView runat="server" Height="700px" ID="GeneralRadPageView">
                            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowSorting="true" AllowFilteringByColumn="true"
                                        AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                                        OnItemDataBound="ResultDG_ItemDataBound" ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" />
                                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" Name="ParentGrid" PageSize="50" HeaderStyle-HorizontalAlign="Center"
                                            HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
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
                                                <telerik:GridBoundColumn DataField="POL" UniqueName="LoadPort" SortExpression="LoadPort" HeaderText="LoadPort" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="POD" UniqueName="DischargePort" SortExpression="DischargePort" HeaderText="DischargePort" ItemStyle-Width="100px" HeaderStyle-Width="100px">
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
                                            <DetailTables>
                                                <telerik:GridTableView DataKeyNames="Id" Name="ChildGrid" SkinID="Telerik" Width="100%" AllowSorting="true"
                                                    HeaderStyle-HorizontalAlign="Center" RetainExpandStateOnRebind="true" AllowFilteringByColumn="true"
                                                    InsertItemDisplay="Bottom" AllowAutomaticInserts="true">
                                                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                                                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                                                    <AlternatingItemStyle Wrap="true" />
                                                    <Columns>
                                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="10px">
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
                                                        <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD"
                                                            HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA"
                                                            HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="100px" HeaderStyle-Width="100px">
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
                                                        <telerik:GridBoundColumn DataField="FMCSLId" Display="false">
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                </telerik:GridTableView>
                                            </DetailTables>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
