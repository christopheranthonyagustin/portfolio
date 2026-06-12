<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderCollection.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderCollection" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution SalesOrder Collection</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        html .RadMenu .rmGroup .rmItem a.rmLink {
            background-color: #ffffff !important;
            text-decoration: none;
            color: black;
        }

            html .RadMenu .rmGroup .rmItem a.rmLink:hover {
                background-color: #ebebe0 !important;
                font-weight: bold;
            }

        .rmItem:hover {
            background-color: white !important;
        }
    </style>
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

        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="550px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Panel ID="formCtl_SearchPanel" runat="server" Visible="True">
                                <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                                    OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                              <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Text="Excel"
                                  OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To Excel" />
                                <br /><br />
                                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <iWMS:iForm ID="formCtl_Search" runat="server"></iWMS:iForm>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                             <asp:Panel ID="formCtl_UpdatePanel" runat="server" Visible="false">
                                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                 <asp:Button ID="HideBtn" runat="server" CssClass="white" Text="Hide" ValidateRequestMode="Disabled" CausesValidation="false"
                                    OnClick="HideBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <br />
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <iWMS:iForm ID="formCtl_Update" runat="server"></iWMS:iForm>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SalesOrderCollectedItemId" >
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Visible="false" Reorderable="false" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="TradeMasterEdit"
                                        ImageUrl="../../image/pencil.gif" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0">
                                    </asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="SalesOrderNo" HeaderText="SalesOrderNo <br/> SalesOrderDate" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1:dd/MMM/yyyy}", Eval("SalesOrderNo"), Eval("SalesOrderDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn UniqueName="ItemCode" HeaderText="ItemCode <br/> Description" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("ItemCode"), Eval("ItemDescription")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="CollectedQty" HeaderText="CollectedQty <br/> DeliveredQty" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("ItemCollectedQty"), Eval("ItemDeliveredQty")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn UniqueName="itemqty" HeaderText="Item Qty <br/> UOM" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("ItemQty"), Eval("ItemUOM")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ItemCollectedDate" HeaderText="ExpectedCollectionDate <br/> ItemCollectedDate" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy} <br/> {1:dd/MMM/yyyy}", Eval("ExpectedCollectionDate"), Eval("ItemCollectedDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn  UniqueName="Dimensions" HeaderText="Length <br/> Width <br/> Height" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("itemLength"), Eval("itemWidth"), Eval("itemHeight")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>            
                            <telerik:GridBoundColumn DataField="ItemCollectionStatus" UniqueName="ItemCollectionStatus" SortExpression="ItemCollectionStatus" AllowFiltering="false"
                                HeaderText="ItemCollectionStatus" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" AllowFiltering="false"
                                HeaderText="ModifiedOn" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="SalesOrderCollectedItemId" Display="False" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>                        
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>