<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionStockAdjustmentDetail.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionStockAdjustment.DistributionStockAdjustmentDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ListDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">

    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Label ID="AjIdLbl" runat="server" Visible="false"></asp:Label>
                    </div>
                </td>
                <td align="left">
                    <br />
                    <asp:Button ID="AddDetailBtn" runat="server" Text="NewLine" Visible="True" CssClass="detailButton" OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;&nbsp;</td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <PagerStyle Mode="NextPrevAndNumeric" />
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="StockAdjustmentItemId" EditMode="InPlace">
                    <Columns>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif" Width="15"
                                    Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.StockAdjustmentItemId")%>' onclick="return confirm('Confirm delete?')" onserverclick="ResultDG_Delete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                        runat="server"></a>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent" BorderWidth="0"
                                    CausesValidation="False"></asp:ImageButton>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="line" SortExpression="line" HeaderText="Line#" ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemCode" SortExpression="ItemCode" HeaderText="ItemCode" AllowFiltering="false"  ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemDescription" SortExpression="ItemDescription" HeaderText="ItemDescription" AllowFiltering="false"  ReadOnly="True">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="LocationBinCode" SortExpression="LocationBinCode" HeaderText="LocationBinCode" AllowFiltering="false"  ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="StorageLocationCode" SortExpression="StorageLocationCode" HeaderText="StorageLocationCode" AllowFiltering="false"  ReadOnly="True">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="GoodsReceiveDate" SortExpression="GoodsReceiveDate" HeaderText="GoodsReceiveDate" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="SystemQty" SortExpression="SystemQty" HeaderText="SystemQty" AllowFiltering="false"  ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CountedQty" SortExpression="CountedQty" HeaderText="CountedQty" AllowFiltering="false"  ReadOnly="True">
                        </telerik:GridBoundColumn>


                        <telerik:GridTemplateColumn DataField="ExpectedAdjustedQty" SortExpression="AdjustedQty" UniqueName="AdjustedQty" HeaderText="AdjustedQty">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "ExpectedAdjustedQty")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="AdjQtyTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "ExpectedAdjustedQty")%>'></asp:TextBox>

                                <asp:CompareValidator ID="UpcVal" runat="server" ControlToValidate="AdjQtyTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                <asp:CompareValidator ID="UpcZeroVal" runat="server" ControlToValidate="AdjQtyTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>

                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>     

                        <telerik:GridBoundColumn DataField="ItemUOM" SortExpression="ItemUOM" HeaderText="UOM" ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Reason">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ReasonList" Enabled="True" DataTextField="Descr" DataValueField="Item" runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(reasonListDS,DataBinder.Eval(Container.DataItem, "reason").ToString())%>'
                                    DataSource='<%# reasonListDS%>' /><asp:RequiredFieldValidator ID="ReasonListReqVal" runat="server" ControlToValidate="ReasonList" ErrorMessage="*" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "reasondescr")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="Remarks" SortExpression="Remarks" HeaderText="Remarks" ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="StockAdjustmentItemstatus" Display="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="StockAdjustmentItemstatusDescr" SortExpression="StockAdjustmentItemstatusDescr" HeaderText="Status" ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="StockAdjustmentItemId" Display="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                                              
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" ReadOnly="True" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" ReadOnly="True">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" ReadOnly="True" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" ReadOnly="True">
                        </telerik:GridBoundColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
