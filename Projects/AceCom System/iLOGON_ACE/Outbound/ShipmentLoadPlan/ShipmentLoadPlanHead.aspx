<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipmentLoadPlanHead.aspx.cs" Inherits="iWMS.Web.Outbound.ShipmentLoadPlan.ShipmentLoadPlanHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>Shipment Load Plan</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
     <style type="text/css">
        .break-word
        {
           max-width: 370px !important;
           white-space:normal;
           word-break: break-all !important;
           word-wrap: break-word !important;
        }
    </style>
    <style type="text/css">
        .break-word1
        {
           max-width: 200px !important;
           white-space:normal;                 
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <p>
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
        </p>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" AllowSorting="True"
            AllowFilteringByColumn="False" EnableLinqExpressions="False" AllowPaging="True" Height="540px"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GroupPanelPosition="Top">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling AllowScroll="True" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />  
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="40px" AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>                           
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                         <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="AcId" SortExpression="AcId" Display="false">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ISID" SortExpression="ISID" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AcCode" SortExpression="AcCode" HeaderText="Account">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipmentNo" SortExpression="ShipmentNo" HeaderText="ShipmentNo">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GIStatus" SortExpression="GIStatus" HeaderText="GIStatus" ItemStyle-CssClass="break-word1">
                        <HeaderStyle Wrap="True"></HeaderStyle>
                        <ItemStyle Wrap="True"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ContainerNo" SortExpression="ContainerNo" HeaderText="ContainerNo" ItemStyle-CssClass="break-word">
                        <HeaderStyle Wrap="True"></HeaderStyle>
                        <ItemStyle Wrap="True"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ContainerStatus" SortExpression="ContainerStatus" HeaderText="ContainerStatus">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustRef" SortExpression="CustRef" HeaderText="CustRef" ItemStyle-CssClass="break-word">
                        <HeaderStyle Wrap="True"></HeaderStyle>
                        <ItemStyle Wrap="True"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GINO" SortExpression="GINO" HeaderText="GINO" ItemStyle-CssClass="break-word">
                        <HeaderStyle Wrap="True"></HeaderStyle>
                        <ItemStyle Wrap="True"></ItemStyle>
                    </telerik:GridBoundColumn>                   
                </Columns>
            </MasterTableView>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </telerik:RadGrid>
    </form>
</body>
</html>
