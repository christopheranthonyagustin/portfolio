<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3SKULineInventoryLocation.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3SKULineInventoryLocation" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="LocationBtn" runat="server" CssClass="white" Text="Location" OnClick="LocationBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    <br />
                    <br />
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
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="ParentGrid">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    <HeaderTemplate>
                                        <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="SKU" SortExpression="SKU" HeaderText="SKU">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SKUDescription" SortExpression="SKUDescription" HeaderText="SKU Description">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Location" SortExpression="Location" HeaderText="Location">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OnHandQty" SortExpression="OnHandQty" HeaderText="OnHandQty">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AllocatedQty" SortExpression="AllocatedQty" HeaderText="AllocatedQty">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PickedQty" SortExpression="PickedQty" HeaderText="PickedQty">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AvailableQty" SortExpression="AvailableQty" HeaderText="AvailableQty">
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
