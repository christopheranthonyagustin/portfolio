<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabricationOrderQuotationItem.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionFabricationOrderQuotation.FabricationOrderQuotationItem" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Fabrication Order Quotation Item</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7"  OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="ItemsTab" Text="Items" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="SubItemsTab" Text="Sub Items" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="80%" ID="HeaderRadPageView">
                <br />
                <div>
                    &nbsp;
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                                OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="AddDetailBtn" runat="server" class="white" Text="NewLine" OnClick="AddDetailBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="False" />
                            <br />
                        </td>
                    </tr>
                </table>
                </div>
                <br />

                <asp:Panel ID="UpdateItemPanel" runat="server" Visible="False">
                    <table>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />                            
 

                            <asp:Button ID="BackButton" runat="server" Text="Hide" ToolTip="Hide" OnClick="BackButton_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="False" />
                       </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                        </td>
                    </tr>
                </table>
                </asp:Panel>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="350px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="FabricationOrderQuotationItemId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="TradeMasterEdit"
                                        ImageUrl="../../image/pencil.gif" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridCalculatedColumn HeaderText="ItemCode <br/> Description" DataFields="ItemCode,ItemDescr"
                                Expression='{0} + " <br/>" + {1}' SortExpression="ItemCode" Reorderable="true">
                            </telerik:GridCalculatedColumn>
                            <telerik:GridCalculatedColumn HeaderText="Length <br/> Width <br/> Height" DataFields="Length,Width,Height"
                                Expression='{0} + " <br/>" + {1} + " <br/>" + {2}' SortExpression="Width" Reorderable="true">
                            </telerik:GridCalculatedColumn>
                            <telerik:GridCalculatedColumn HeaderText="Vol <br/> Wt <br/> NetWt" DataFields="Vol,Wt,NetWt"
                                Expression='{0} + " <br/>" + {1} + " <br/>" + {2}' SortExpression="Wt" Reorderable="true">
                            </telerik:GridCalculatedColumn>
                            <telerik:GridCalculatedColumn HeaderText="ItemQty <br/> ItemUOM" DataFields="ItemQty,ItemUOM"
                                Expression='{0} + " <br/>" + {1}' SortExpression="Wt" Reorderable="true">
                            </telerik:GridCalculatedColumn>
                            <telerik:GridCalculatedColumn HeaderText="UnitPrice <br/> Amount <br/> Currency " DataFields="UnitPrice,Amount,CurrencyCode"
                                Expression='{0} + " <br/>" + {1} + " <br/>" + {2}' SortExpression="Amount" Reorderable="true">
                            </telerik:GridCalculatedColumn>
                            <telerik:GridBoundColumn DataField="FabricationOrderQuotationItemStatusDescr" UniqueName="FabricationOrderQuotationItemStatusDescr" SortExpression="FabricationOrderQuotationItemStatusDescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" HeaderText="ModifiedOn" >
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationStatusColorCode" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="SubItemsRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>