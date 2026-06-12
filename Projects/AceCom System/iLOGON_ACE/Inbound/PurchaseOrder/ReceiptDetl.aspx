<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page MaintainScrollPositionOnPostback="true" Language="c#" CodeBehind="ReceiptDetl.aspx.cs"
    AutoEventWireup="True" Inherits="iWMS.Web.Inbound.PurchaseOrder.ReceiptDetl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>PurchaseOrderReceiveDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
    function OnClientClose(sender, args) {
        document.location.href = document.location.href;
    }
    function RadMenuClientOnClick(sender, args) {
        if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
            args.set_cancel(true);
        }
    }

    function selectAll(invoker) {
        var inputElements = document.getElementsByTagName('input');
        for (var i = 0; i < inputElements.length; i++) {
            var myElement = inputElements[i];
            if (myElement.type === "checkbox") {
                myElement.checked = invoker.checked;
            }
            else {
                myElement.checked = invoker.UnChecked;

            }
        }
    }
</script>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
       
        <table border="0" cellspacing="5" cellpadding="0" width="100%">
            <tr>
                <td>
                     <asp:Label ID="ReceiptIdLbl" runat="server" CssClass="pagetitle"></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="true"
                    Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="true"
                    Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                 <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle" Visible="true"></asp:Label>
            
                </td>
                </tr>
            <tr>
                <td>
                &nbsp;
                <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click" CausesValidation="False" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
                    <br />
                    <br />
                </td>
                <td align="right">&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" OnColumnCreated="ResultDG_ColumnCreated" OnItemDataBound="ResultDG_ItemDataBound"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling ScrollHeight="400px" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="false"></HeaderStyle>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <SortingSettings EnableSkinSortStyles="false" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%-- <telerik:GridBoundColumn Visible="False" DataField="id">
                </telerik:GridBoundColumn>--%>
                </Columns>
            </MasterTableView>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Left" Position="TopAndBottom" ForeColor="Black"></PagerStyle>
        </telerik:RadGrid>
    </form>
</body>
</html>
