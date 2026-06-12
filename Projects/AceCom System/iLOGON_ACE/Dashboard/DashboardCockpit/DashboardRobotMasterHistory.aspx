<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardRobotMasterHistory.aspx.cs" Inherits="iWMS.Web.Dashboard.DashboardRobotMasterHistory" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>DashboardHistory</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <div style="height: 92%" id="div1">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="missionid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <ItemStyle></ItemStyle>
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                           <%-- <HeaderTemplate>
                                S/N
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>--%>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="missionid" SortExpression="missionid" HeaderText="MissionId"
                            ItemStyle-Wrap="False" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="missionno" SortExpression="missionno" HeaderText="MissionNo"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pickuppoint" SortExpression="pickuppoint" HeaderText="PickupPoint"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dropoffpoint" SortExpression="dropoffpoint" HeaderText="DropoffPoint"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="missionstatus" SortExpression="missionstatus" HeaderText="MissionStatus"
                            ItemStyle-Wrap="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                        </telerik:GridBoundColumn>
                      
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>