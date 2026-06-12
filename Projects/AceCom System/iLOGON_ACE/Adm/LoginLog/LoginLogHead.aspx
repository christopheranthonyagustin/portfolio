<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginLogHead.aspx.cs" Inherits="iWMS.Web.Adm.LoginLog.LoginLogHead" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>LoginLogHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Label Style="z-index: 0" ID="Label2" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
        OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridBoundColumn DataField="adduser" ItemStyle-Wrap="false" SortExpression="adduser"
                    HeaderText="Login">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="type" ItemStyle-Wrap="false" SortExpression="type"
                    HeaderText="Type">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="remarks" ItemStyle-Wrap="false" SortExpression="remarks"
                    HeaderText="Remarks">
                </telerik:GridBoundColumn>                
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
