<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionItemMasterHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionItemMaster.DistributionItemMasterHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ ItemMaster</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
        <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table style="width: 100%; height: 30px">
                    <tr>
                        <br />
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                                OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="PriceUpdateBtn" runat="server" CssClass="white" Text="PriceUpdate"
                                OnClick="PriceUpdateBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="ItemId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="50px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    &nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradeMasterEdit"
                                        ImageUrl="../../image/pencil.gif" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>                          
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntityCode" HeaderText="Entity" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>        
                             <telerik:GridBoundColumn DataField="ItemCode" UniqueName="ItemCode" SortExpression="ItemCode" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="Code">
                            </telerik:GridBoundColumn>  
                            <telerik:GridBoundColumn DataField="ItemDescription" UniqueName="ItemDescription" SortExpression="ItemDescription" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="Description">
                            </telerik:GridBoundColumn>
                            
                            <telerik:GridBoundColumn DataField="Fabrication" UniqueName="Fabrication" SortExpression="Fabrication" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="Fabrication">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ItemAvgCost" UniqueName="ItemAvgCost" SortExpression="ItemAvgCost" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="ItemAvgCost">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ItemAvgCostDate" UniqueName="ItemAvgCostDate" SortExpression="ItemAvgCostDate" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="ItemAvgCostDate">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ItemStatusDescr" UniqueName="ItemStatusDescr" SortExpression="ItemStatusDescr" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>  
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>  
                              <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>                                                     
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn> 
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
