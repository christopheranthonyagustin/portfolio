<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3ReleaseRequestDetlList.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3ReleaseRequestDetlList" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ReleaseOrderDetlList</title>
    <script src="../../js/NewBusyBox.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Label ID="Label1" runat="server">Account</asp:Label>
        <telerik:RadDropDownList ID="AccountList" AutoPostBack="true" DataTextField="code" DataValueField="acid" runat="server" Width="155px" Skin="Sunset" OnSelectedIndexChanged="AccountList_SelectedIndexChanged">
        </telerik:RadDropDownList>
        &nbsp;&nbsp;
        <asp:Button ID="homeBtn" runat="server" Text="Add" OnClick="homeBtn_Click"
            OnClientClick="busyBox.Show();" CssClass="white" ToolTip="AddOrderItem" />
        <br />
        <br />
        <telerik:RadGrid ID="ResultRadGrid" runat="server" Skin="Metro" AllowPaging="True" OnPreRender="ResultRadGrid_PreRender"
            AllowMultiRowSelection="true" OnNeedDataSource="ResultRadGrid_NeedDataSource" OnItemDataBound="ResultRadGrid_ItemDataBound"
            AllowSorting="true" OnDeleteCommand="ResultRadGrid_DeleteCommand" AllowFilteringByColumn="false">
            <PagerStyle Mode="NumericPages"></PagerStyle>
            <GroupingSettings CaseSensitive="false"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" Width="100%" CommandItemDisplay="Top" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                PageSize="20">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="SelectCB" Display="false">
                    </telerik:GridClientSelectColumn>
                    <telerik:GridBoundColumn UniqueName="id" DataField="id" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="acid" DataField="acid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="status" DataField="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="statuscolor" DataField="statuscolor" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skuid" HeaderText="skuid" DataField="skuid"
                        Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skudescr2" HeaderText="Descr" DataField="skudescr2" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="accode" HeaderText="Account" DataField="accode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skucode3" HeaderText="SKU/CustomsLot" DataField="skucode3">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="statusdescr" HeaderText="Status" DataField="statusdescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot4" HeaderText="CustomsLot" DataField="lot4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Lot5" HeaderText="Lot5" DataField="Lot5">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Lot6" HeaderText="Lot6" DataField="Lot6">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="uomqty" HeaderText="Qty" DataField="uomqty"
                        DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="uomdescr" HeaderText="UOM" DataField="uomdescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="SpecialInstruction" HeaderText="SpecialInstruction"
                        DataField="SpecialInstruction">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Remarks" HeaderText="Remarks" DataField="Remarks">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="adddate" HeaderText="AddDate" DataField="adddate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="editdate" HeaderText="EditDate" DataField="editdate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" AllowFiltering="false">
                        <ItemTemplate>
                            <a href="#" id="EditCart" runat="server" onserverclick="EditCart_ServerClick">Edit </a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridButtonColumn ButtonType="LinkButton" CommandName="Delete" Text="Remove"
                        UniqueName="DeleteColumn" Resizable="false" ConfirmText="Delete Order?">
                    </telerik:GridButtonColumn>
                </Columns>
                <CommandItemTemplate>
                </CommandItemTemplate>
            </MasterTableView>
            <ClientSettings>
                <Selecting AllowRowSelect="true" UseClientSelectColumnOnly="true"></Selecting>
            </ClientSettings>
        </telerik:RadGrid>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="450px" Height="350px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
