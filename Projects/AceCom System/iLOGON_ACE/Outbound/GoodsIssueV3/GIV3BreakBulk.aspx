<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3BreakBulk.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3BreakBulk" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Goods Issue BreakBulk</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <script language="javascript" type="text/javascript">

        function OnClientClose(sender, args) {
            //document.location.href = document.location.href;
            refresh();
        }

        function refresh() {
            document.location.href = document.location.href;
        }

    </script>
</head>
<body>
    <form id="formBreakBulk" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                </td>
                <td>
                    <span style="margin-left: 50px" />
                    <asp:Label ID="RcNumberLbl" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="true" RenderMode="Lightweight"
            Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling ScrollHeight="700px" AllowScroll="true" UseStaticHeaders="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="30" Width="100%" CommandItemDisplay="Top" DataKeyNames="rcdtid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <CommandItemSettings ShowAddNewRecordButton="true" />
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.rcdtid")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="ResultDG_deleteClick" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                    title="Delete Detail" runat="server" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        <ItemStyle Wrap="true" HorizontalAlign="Center" Width="200px" />
                        <HeaderTemplate>
                            <asp:Label ID="lblSku" runat="server" Text="SKU Code"></asp:Label>
                            <br />
                            <asp:Label ID="lblDescription" runat="server" Text="SKU Description"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <p><%# DataBinder.Eval(Container.DataItem, "skucode")%></p>
                            <p><%# DataBinder.Eval(Container.DataItem, "skudescr")%></p>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="150px" />
                        <ItemStyle Wrap="true" HorizontalAlign="Center" Width="150px" />
                        <HeaderTemplate>
                            <asp:Label ID="lblQty" runat="server" Text="Qty"></asp:Label>
                            <br />
                            <asp:Label ID="lblUom" runat="server" Text="UOM"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "expectedqty")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "uomdescr")%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                        SortExpression="loccode" UniqueName="loccode" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridNumericColumn DataField="length" HeaderStyle-Width="90px" ItemStyle-Width="90px" HeaderText="Length"
                        SortExpression="qty" UniqueName="length" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn DataField="width" HeaderStyle-Width="90px" ItemStyle-Width="90px" HeaderText="Width"
                        SortExpression="qty" UniqueName="width" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn DataField="height" DataType="System.Double" NumericType="Number" HeaderStyle-Width="90px" ItemStyle-Width="90px" HeaderText="Height"
                        SortExpression="qty" UniqueName="height" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn DataField="wt" HeaderStyle-Width="90px" ItemStyle-Width="90px" HeaderText="Weight"
                        SortExpression="qty" UniqueName="weight" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn DataField="netwt" HeaderStyle-Width="90px" ItemStyle-Width="90px" HeaderText="Net Weight"
                        SortExpression="qty" UniqueName="netWeight" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridNumericColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="true" HorizontalAlign="Center" />
                        <HeaderTemplate>
                            <asp:Label ID="lblAddDate" runat="server" Text="Add Date"></asp:Label>
                            <br />
                            <asp:Label ID="lblAddUser" runat="server" Text="Add User"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "adddate")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "adduser")%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="true" HorizontalAlign="Center" />
                        <HeaderTemplate>
                            <asp:Label ID="lblEditDate" runat="server" Text="Edit Date"></asp:Label>
                            <br />
                            <asp:Label ID="lblEditUser" runat="server" Text="Edit User"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "adddate", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "adduser", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="skuid" UniqueName="skuid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="isid" UniqueName="IsId" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
