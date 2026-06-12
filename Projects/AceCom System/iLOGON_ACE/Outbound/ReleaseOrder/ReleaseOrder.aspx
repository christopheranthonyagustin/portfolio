<%@ Page Language="c#" CodeBehind="ReleaseOrder.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrder" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ReleaseOrder</title>
    <style type="text/css">
        .popupHeaderR {
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            background: #859DD4;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            border-top: 2px solid GREY;
            border-right: 2px solid GREY;
            border-left: 2px solid GREY;
        }

            .popupHeaderR span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
                margin-top: 5px;
            }

            .popupHeaderR a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var ResultRadGrid = $find("<%= ResultRadGrid.ClientID %>").get_masterTableView();
                ResultRadGrid.rebind();
            }
        </script>
    </telerik:RadCodeBlock>

</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" style="height: 50%">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <%--Release Order Detl popup area start--%>
        <asp:Button runat="server" ID="btnStatusButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeReleaseOrderDetlPopup" runat="server" PopupControlID="pnlStstusBox"
            TargetControlID="btnStatusButton" RepositionMode="RepositionOnWindowScroll">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlStstusBox" BackColor="LAVENDER" Style="display: none;">
            <div class="popupHeaderR">
                <asp:Label ID="Label2" Text="Release Order Detail" runat="server" Style="size: 10px"></asp:Label>
                <asp:LinkButton ID="btnPopupCancel" runat="server" OnClick="btnStatusCancel_Click" Style="float: right; margin-right: 15px; margin-top: 5px;">X</asp:LinkButton>
            </div>
            <div style="border-right: 2px solid GREY; border-bottom: 2px solid GREY; clear: both;">
                <iframe id="ReleaseOrderDetlIFrame" scrolling="no" width="345px" height="280px" runat="server"></iframe>
            </div>
        </asp:Panel>
        <%--Release Order Detl popup area end--%>
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
                <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" ScrollHeight="430" />
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="lotid" CommandItemDisplay="Top"
                PageSize="100">
                <Columns>
                    <telerik:GridBoundColumn UniqueName="accode" HeaderText="Account" DataField="accode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skucode" HeaderText="SKU" DataField="skucode"
                        FilterControlWidth="100px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="SKUDescr" HeaderText="Descr" DataField="SKUDescr"
                        FilterControlWidth="200px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot4" HeaderText="lot4" DataField="lot4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot1" HeaderText="lot1" DataField="lot1">
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
                    <telerik:GridBoundColumn UniqueName="LowestOnHandQty" HeaderText="LowestQty" DataField="LowestOnHandQty"
                        FilterControlWidth="25px" DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="LowestUOM" HeaderText="LowestUOM" DataField="LowestUOM"
                        FilterControlWidth="25px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="InCartQty" HeaderText="InCartQty" DataField="InCartQty">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" AllowFiltering="false">
                        <ItemTemplate>
                            <a href="#" runat="server" id="AddtoCart" onserverclick="AddtoCart_ServerClick">AddToCart </a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="lot5" HeaderText="Lot5" DataField="Lot5">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot6" HeaderText="Lot6" DataField="Lot6">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skupacking" HeaderText="Packing" DataField="skupacking">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skuid" HeaderText="skuid" DataField="skuid"
                        Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="LotId" HeaderText="LotId" DataField="LotId"
                        Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="acid" HeaderText="acid" DataField="acid" Visible="false">
                    </telerik:GridBoundColumn>
                </Columns>
                <CommandItemTemplate>
                </CommandItemTemplate>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
            <Windows>
                <telerik:RadWindow ID="UserListDialog" runat="server" Title="AddItem" Height="350px"
                    CenterIfModal="false" Width="550px" Left="200px" ReloadOnShow="true" ShowContentDuringLoad="false"
                    VisibleStatusbar="false" Modal="true">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
