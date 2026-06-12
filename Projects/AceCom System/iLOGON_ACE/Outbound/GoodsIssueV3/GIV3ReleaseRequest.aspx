<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3ReleaseRequest.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3ReleaseRequest" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>GIV3ReleaseRequest</title>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server">Account</asp:Label>
                </td>
                <td>
                    <telerik:RadDropDownList ID="AccountList" AutoPostBack="true" DataTextField="code" DataValueField="acid" runat="server" Width="155px" Skin="Sunset" OnSelectedIndexChanged="AccountList_SelectedIndexChanged">
                    </telerik:RadDropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="shoppingcartBtn" runat="server" Style="z-index: 0" ImageUrl="../../Image/shoppingcart2.jpg"
                        BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle" OnClick="shoppingcartBtn_Click"
                        ToolTip="ViewCart" />

                </td>
                <td>
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle" Font-Names="Helvetica"
                        Font-Size="Small"></asp:Label><br />
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultRadGrid" runat="server" Skin="Office2007" AllowPaging="True"
            OnNeedDataSource="ResultRadGrid_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="true">
            <PagerStyle Mode="NumericPages"></PagerStyle>
            <GroupingSettings CaseSensitive="false"></GroupingSettings>
            <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True"
                    SaveScrollPosition="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="lotid" CommandItemDisplay="Top"
                PageSize="50">
                <Columns>
                    <telerik:GridBoundColumn UniqueName="acid" HeaderText="acid" DataField="acid" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="accode" HeaderText="Account" DataField="accode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skucode" HeaderText="SKU" DataField="skucode"
                        FilterControlWidth="100px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="SKUDescr" HeaderText="Descr" DataField="SKUDescr"
                        FilterControlWidth="200px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot4" HeaderText="CustomsLot" DataField="lot4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot1" HeaderText="ExpiryDate" DataField="lot1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot5" HeaderText="Lot5" DataField="Lot5">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot6" HeaderText="Lot6" DataField="Lot6">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skupacking" HeaderText="Packing" DataField="skupacking">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="wholeavailqty" HeaderText="WholeQty" DataField="wholeavailqty"
                        FilterControlWidth="25px" DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="WholeUom" HeaderText="WholeUom" DataField="WholeUom"
                        FilterControlWidth="25px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="looseavailqty" HeaderText="LooseQty" DataField="looseavailqty"
                        FilterControlWidth="25px" DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="LooseUom" HeaderText="LooseUOM" DataField="LooseUom"
                        FilterControlWidth="25px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lowestavailqty" HeaderText="LowestQty" DataField="lowestavailqty"
                        FilterControlWidth="25px" DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" AllowFiltering="false">
                        <ItemTemplate>
                            <a href="#" runat="server" id="AddtoCart" onserverclick="AddtoCart_ServerClick">AddToCart </a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="skuid" HeaderText="skuid" DataField="skuid"
                        Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="LotId" HeaderText="LotId" DataField="LotId"
                        Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
                <CommandItemTemplate>
                </CommandItemTemplate>
            </MasterTableView>
            <ClientSettings>
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
        </telerik:RadGrid>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="450px" Height="350px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
