<%@ Page Language="c#" CodeBehind="ReleaseOrder3.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrder3" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReleaseOrder3</title>
    <link href="../../css/iWMStelerik.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadGrid ID="ResultRadGrid" runat="server" OnNeedDataSource="ResultRadGrid_NeedDataSource"
        Skin="Office2007" AllowMultiRowSelection="true" AllowFilteringByColumn="true"
        AllowSorting="true" PageSize="20" OnItemCommand="ResultRadGrid_ItemCommand">
        <GroupingSettings CaseSensitive="false"></GroupingSettings>
        <MasterTableView AutoGenerateColumns="false" DataKeyNames="lotid">
            <Columns>
                <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn1">
                </telerik:GridClientSelectColumn>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                </telerik:GridEditCommandColumn>
                <telerik:GridBoundColumn UniqueName="lotid" HeaderText="lotid" DataField="lotid"
                    Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="acid" HeaderText="acid" DataField="acid" Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="skuid" HeaderText="skuid" DataField="skuid"
                    Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="skucode" HeaderText="SKU" DataField="skucode">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="skudescr2" HeaderText="Descr" DataField="skudescr2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="lot4" HeaderText="CustomsLot" DataField="lot4">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="ttllhuavailqty" HeaderText="LHUQty" DataField="ttllhuavailqty"
                    DataFormatString="{0:#,0.##}">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="Book" ColumnGroupName="BookingInformation"
                    AllowFiltering="false">
                    <HeaderStyle Width="102px" />
                    <ItemTemplate>
                        <asp:LinkButton ID="BookButton" runat="server" Text="Order Now"/>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings>
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
    </telerik:RadGrid>
    </form>
</body>
</html>
