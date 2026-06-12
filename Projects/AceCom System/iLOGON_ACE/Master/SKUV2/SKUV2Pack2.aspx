<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUV2Pack2.aspx.cs" Inherits="iWMS.Web.Master.SKUV2.SKUV2Pack2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuPack</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Label ID="SkuLbl" runat="server"></asp:Label>
                    </div>
                    <asp:Label ID="PackLbl" Font-Italic="True" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                 <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="white" OnClick="SaveBtn_Click"></asp:Button>
                    &nbsp;
                </td>
            </tr>
        </table>
        <br>
        <div>
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="true" OnItemDataBound="ResultDG_ItemDataBound"
                AllowFilteringByColumn="true" Skin="Metro">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <PagerStyle Mode="NextPrevAndNumeric" />
                <GroupingSettings CaseSensitive="false" />
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <Columns>
                        <telerik:GridBoundColumn HeaderText="SKU" DataField="skuId" AllowFiltering="true" Visible="false"
                            ColumnGroupName="skuId" SortExpression="skuId" UniqueName="skuId" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UOM" DataField="uom" AllowFiltering="false" ItemStyle-HorizontalAlign="Center"
                            ColumnGroupName="uom" SortExpression="uom" UniqueName="uom" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="Unit Type" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:CheckBox ID="UnitTypeCB" runat="server"></asp:CheckBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Sell Unit" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:CheckBox ID="SellUnitCB" runat="server"></asp:CheckBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Qty" HeaderText="Qty" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <telerik:RadTextBox runat="server" ID="QtyTxt" Skin="Office2007" Rows="2" Width="70px" Text='<%# DataBinder.Eval(Container.DataItem, "qty")%>'>
                                </telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="ReqQtyVal" runat="server" ControlToValidate="QtyTxt"
                                    ErrorMessage="*" />
                                <asp:CompareValidator ID="QtyVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                <asp:CompareValidator ID="ZeroVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="UPC" HeaderText="UPC" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <telerik:RadTextBox runat="server" ID="UPCTxt" Skin="Office2007" Rows="2" Width="80"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "upc")%>'>
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Length" HeaderText="Length" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <telerik:RadTextBox runat="server" ID="LengthTxt" Skin="Office2007" Rows="2" Width="70px"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "length","{0:0.###}")%>'>
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="LengthVal" runat="server" ControlToValidate="LengthTxt" EnableClientScript="True"
                                    ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Width" HeaderText="Width" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <telerik:RadTextBox runat="server" ID="WidthTxt" Skin="Office2007" Rows="2" Width="70px"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "width","{0:0.###}")%>'>
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="WidthVal" runat="server" ControlToValidate="WidthTxt" EnableClientScript="True"
                                    ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Height" HeaderText="Height" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <telerik:RadTextBox runat="server" ID="HeightTxt" Skin="Office2007" Rows="2" Width="70px"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "height","{0:0.###}")%>'>
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="HeightVal" runat="server" ControlToValidate="HeightTxt" EnableClientScript="True"
                                    ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="Volume" HeaderText="Volume" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <telerik:RadTextBox runat="server" ID="VolTxt" Skin="Office2007" Rows="2" Width="70px"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "vol","{0:0.###}")%>'>
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="VolVal" runat="server" ControlToValidate="VolTxt" EnableClientScript="True"
                                    ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="GrossWeight" HeaderText="Gross Weight" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <telerik:RadTextBox runat="server" ID="WeightTxt" Skin="Office2007" Rows="2" Width="70px"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "wt","{0:0.###}")%>'>
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="WeightVal" runat="server" ControlToValidate="WeightTxt" EnableClientScript="True"
                                    ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="NetWeight" HeaderText="Net Weight" AllowFiltering="false">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <telerik:RadTextBox runat="server" ID="NetWeightTxt" Skin="Office2007" Rows="2" Width="70px"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "netwt","{0:0.###}")%>'>
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="NetWeightVal" runat="server" ControlToValidate="NetWeightTxt" EnableClientScript="True"
                                    ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
