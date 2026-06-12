<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrGateOutV2Head.aspx.cs" Inherits="iWMS.Web.Outbound.CtnrGateOutV2.CtnrGateOutV2Head" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CtnrGateOutV2Head</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script src="../../js/CastleBusyBox.js" language="javascript" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <p>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
    </p>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="skucode" AllowFiltering="true"
                    SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ContainerType" DataField="skusizetype" AllowFiltering="true"
                    SortExpression="skusizetype" UniqueName="skusizetype" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Empty/Laden" DataField="lot4" AllowFiltering="true"
                    SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="GradeType" DataField="lot5" AllowFiltering="true"
                    SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Condition" DataField="lot6" AllowFiltering="true"
                    SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ReleaseDate" DataField="lot1" AllowFiltering="true"
                    SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                    SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                    SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                    SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                    SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="False" DataField="isid" />
                <telerik:GridBoundColumn Display="False" DataField="id" />
                <telerik:GridBoundColumn Display="False" DataField="status" />
                <telerik:GridBoundColumn Display="False" DataField="isid" />
                <telerik:GridBoundColumn Display="False" DataField="statuscolor" />
                <telerik:GridBoundColumn Display="False" DataField="skuid" />
                <telerik:GridBoundColumn Display="False" DataField="skustatus" />
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
