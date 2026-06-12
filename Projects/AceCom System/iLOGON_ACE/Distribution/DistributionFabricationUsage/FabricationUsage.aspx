<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabricationUsage.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionFabricationUsage.FabricationUsage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Fabrication Usage</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="../../css/style.css">--%>
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle">Fabrication Usage (Step 3 of 3)</asp:Label>
                </td>
                <td align="right">&nbsp;
                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">

                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <PagerStyle Mode="NextPrevAndNumeric" />
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="LotInventoryId" EditMode="InPlace" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <Columns>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="ItemCode" SortExpression="ItemCode" HeaderText="ItemCode">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemDescription" SortExpression="ItemDescription" HeaderText="ItemDescription">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn HeaderText="FromWarehouseCode">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <telerik:RadDropDownList ID="FromWarehouseCodeList" DataTextField="descr" DataValueField="item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(FromWarehouseCodeDS,DataBinder.Eval(Container.DataItem, "WarehouseCode").ToString())%>'
                                                DataSource='<%# FromWarehouseCodeDS%>' runat="server" Width="100" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="FromLocationBinCode">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <telerik:RadDropDownList ID="FromLocationBinCodeList" DataTextField="descr" DataValueField="item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(FromLocationBinCodeDS,DataBinder.Eval(Container.DataItem, "LocationBinCode").ToString())%>'
                                                DataSource='<%# FromLocationBinCodeDS%>' runat="server" Width="100" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="ToWarehouseCode">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <telerik:RadDropDownList ID="ToWarehouseCodeList" DataTextField="descr" DataValueField="item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ToWarehouseCodeDS,DataBinder.Eval(Container.DataItem, "WarehouseCode").ToString())%>'
                                                DataSource='<%# ToWarehouseCodeDS%>' runat="server" Width="100" AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="ToWarehouseCodeList_SelectedIndexChanged" />
                                            <asp:RequiredFieldValidator ID="ToWarehouseCodeListReqVal" runat="server" ControlToValidate="ToWarehouseCodeList" Enabled="true"
                                                    ErrorMessage="*" ForeColor="Red" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="ToLocationBinCode">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <telerik:RadDropDownList ID="ToLocationBinCodeList" DataTextField="descr" DataValueField="item"
                                                runat="server" Width="100" AutoPostBack="true" />
                                             <asp:RequiredFieldValidator ID="ToLocationBinCodeListReqVal" runat="server" ControlToValidate="ToLocationBinCodeList" Enabled="true"
                                                    ErrorMessage="*" ForeColor="Red" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="StorageLocationCode" SortExpression="StorageLocationCode" HeaderText="StorageLocationCode">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemOnhandQty" SortExpression="ItemOnhandQty" HeaderText="On Hand Qty">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemReservedQty" SortExpression="ItemReservedQty" HeaderText="Reserved Qty">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemAllocatedQty" SortExpression="ItemAllocatedQty" HeaderText="Allocated Qty">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemAvailableQty" SortExpression="ItemAvailableQty" HeaderText="Available Qty">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="ItemQty" SortExpression="ItemQty">
                            <ItemTemplate>
                                <asp:TextBox runat="server" Width="60px" ID="ItemQtyTxt" BackColor="Yellow"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QtyReq" runat="server" ErrorMessage="*" ControlToValidate="ItemQtyTxt">
                                </asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="ItemUOM">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <telerik:RadDropDownList ID="UOMList" DataTextField="descr" DataValueField="item"
                                                runat="server" Width="100" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="ItemCost" SortExpression="ItemCost" HeaderText="ItemCost">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="GoodsReceiveDate" SortExpression="GoodsReceiveDate" HeaderText="Receive Date" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <%-- <telerik:GridBoundColumn DataField="Type" SortExpression="Type" HeaderText="Type">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>--%>

                        <telerik:GridTemplateColumn HeaderText="Type">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <telerik:RadDropDownList ID="TypeList" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# TypeListDS%>' runat="server" Width="100" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Remarks" SortExpression="Remarks">
                            <ItemTemplate>
                                <asp:TextBox runat="server" Width="120px" ID="RemarksTxt"></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="LotInventoryId" Display="false" />
                        <telerik:GridBoundColumn DataField="WarehouseCode" Display="false" />
                        <telerik:GridBoundColumn DataField="LocationBinCode" Display="false" />
                        <telerik:GridBoundColumn DataField="ItemId" Display="false" />
                        <telerik:GridBoundColumn DataField="ItemUOM" Display="false" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
