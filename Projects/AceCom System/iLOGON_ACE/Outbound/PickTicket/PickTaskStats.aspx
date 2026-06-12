<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PickTaskStats.aspx.cs" Inherits="iWMS.Web.Outbound.PickTicket.PickTaskStats" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Pick Task Stats</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">  
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">   
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>    
     <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="PickTaskStats" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>               
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="PTStatsRadPageView">  
                    <div id="div-datagrid" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" Width="100%" Height="82%"
                        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                            <Selecting AllowRowSelect="true"></Selecting>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        S/No
                                    </HeaderTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10" />
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>                                                           
                                <telerik:GridBoundColumn DataField="Account" SortExpression="Account" HeaderText="Account"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>                               
                                <telerik:GridBoundColumn DataField="Picker" SortExpression="Picker" HeaderText="PickerCode"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="GINO" SortExpression="GINO" HeaderText="GINO"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PTNO" SortExpression="PTNO" HeaderText="PTNO"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PickDate" SortExpression="PickDate" HeaderText="PickDate"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn> 
                                <telerik:GridBoundColumn DataField="NoOfSKU" SortExpression="NoOfSKU" HeaderText="NoOfSKU" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TotalPickLines" SortExpression="TotalPickLines" HeaderText="TotalPickLines" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StartTime" SortExpression="StartTime" HeaderText="StartTime"  DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" 
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="EndTime" SortExpression="EndTime" HeaderText="EndTime"  DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>                                                                                            
                                <telerik:GridBoundColumn DataField="TotalPickTime" SortExpression="TotalPickTime" HeaderText="TotalPickTime" ItemStyle-HorizontalAlign="Center"                                   
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>                                                                                              
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>           
        </telerik:RadMultiPage>        
    </form>
</body>
</html>
