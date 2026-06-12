<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingOrderTripDetList.aspx.cs" Inherits="iWMS.Web.Job.BookingOrder.BookingOrderTripDetList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>TripDetailList</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
           <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="TripSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    <div id="div-datagrid" style="height: 92%">
        <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="true" OnItemDataBound="ResultDG1_ItemDataBound" OnNeedDataSource="ResultDG1_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="False" DataField="id" HeaderText="id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="acid" HeaderText="id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="jbid" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="jobtype">
                        </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jbcjobtypedescr" SortExpression="jbcjobtypedescr" HeaderText="JobType"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="tpttype">
                        </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="TripType"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="ContainerNumber"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="ReferenceNumber"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vehnodescr" SortExpression="vehnodescr" HeaderText="VehicleNo"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Driver"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="trailernodescr" SortExpression="trailernodescr" HeaderText="TrailerNo"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="status">
                        </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="frserviceptdescr" SortExpression="frserviceptdescr" HeaderText="FrServicePt"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="toserviceptdescr" SortExpression="toserviceptdescr" HeaderText="ToServicePt"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="FrAddr"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="ToAddr"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>                   
                    <telerik:GridBoundColumn DataField="frexpdate" HeaderText="FrArrival DateTime" SortExpression="frexpdate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="fractdate" HeaderText="FrDepart DateTime" SortExpression="fractdate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="toexpdate" HeaderText="ToArrival DateTime" SortExpression="toexpdate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="toactdate" HeaderText="ToComp DateTime" SortExpression="toactdate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                        </telerik:GridBoundColumn>                    
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
