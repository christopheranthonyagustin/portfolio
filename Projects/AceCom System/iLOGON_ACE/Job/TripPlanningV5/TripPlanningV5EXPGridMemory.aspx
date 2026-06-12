<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV5EXPGridMemory.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV5.TripPlanningV5EXPGridMemory" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Grid Memory @ Trip Planning V5 EXP</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="90%">
            <tr>
                <td class="pagetitle">
                    <asp:Label ID="TitleLbl" Text="Grid Memory" runat="server"></asp:Label>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click"
                        Text="Save" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td valign="top" align="left">
                    <br />
                    <telerik:RadGrid ID="ResultDGAvailable" runat="server" AutoGenerateColumns="false" GridLines="None" Width="260px" Height="480px"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" OnRowDrop="ResultDGAvailable_RowDrop"
                        OnItemDataBound="ResultDGAvailable_ItemDataBound" UseAccessibleHeader="true" AllowFilteringByColumn="false"
                        OnNeedDataSource="ResultDGAvailable_NeedDataSource" AllowMultiRowSelection="true">
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                            <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="UniqueColumn" SortExpression="UniqueColumn" HeaderText="Available Columns"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
                <td valign="top" align="left">
                    <br />
                    <telerik:RadGrid ID="ResultDGPriority" runat="server" AutoGenerateColumns="false" GridLines="None" Width="260px" Height="480px"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" OnRowDrop="ResultDGPriority_RowDrop"
                        OnItemDataBound="ResultDGPriority_ItemDataBound" UseAccessibleHeader="true" AllowFilteringByColumn="false"
                        OnNeedDataSource="ResultDGPriority_NeedDataSource" AllowMultiRowSelection="true">
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                            <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="UniqueColumn" SortExpression="UniqueColumn" HeaderText="Rotation Priority"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
