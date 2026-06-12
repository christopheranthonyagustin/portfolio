<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NCCPARLog.aspx.cs" Inherits="iWMS.Web.Master.NCCPAR.NCCPARLog" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>NCCPARLog</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>

<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="true" AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" Width="100%">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
