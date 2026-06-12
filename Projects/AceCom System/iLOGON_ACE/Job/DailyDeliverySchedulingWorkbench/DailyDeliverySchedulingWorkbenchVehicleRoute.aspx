<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliverySchedulingWorkbenchVehicleRoute.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliverySchedulingWorkbench.DailyDeliverySchedulingWorkbenchVehicleRoute" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VehicleRoute @ DailyDeliverySchedulingWorkbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel ID="VehicleRouteUpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" OnBatchEditCommand="ResultDG_BatchEditCommand" AllowFilteringByColumn="true"
                    AllowPaging="true" AutoGenerateColumns="false" GridLines="None">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" EditMode="Batch" CommandItemDisplay="TopAndBottom" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <Columns>
                            <telerik:GridBoundColumn UniqueName="Vehicle" HeaderText="Vehicle" AllowFiltering="true" DataField="Vehicle" ReadOnly="true" HeaderStyle-Width="200px" ItemStyle-Width="200px"></telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn UniqueName="Driver" HeaderText="Driver" AllowFiltering="true">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="DriverLbl" Text='<%# string.Format("{0:}",Eval("Driver")) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="DriverDDL" runat="server"
                                        Skin="WebBlue" Width="220px" DataValueField="Item" DataTextField="Descr"
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnLoad="DriverDDL_Load">
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Route" HeaderText="Route" AllowFiltering="true">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="RouteLbl" Text='<%# string.Format("{0:}",Eval("Route")) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="RouteDDL" runat="server"
                                        Skin="WebBlue" Width="220px" DataValueField="Item" DataTextField="Descr"
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnLoad="RouteDDL_Load">
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn UniqueName="VehNo" Display="false" DataField="VehNo"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
