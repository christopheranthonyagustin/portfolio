<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipPlanCageContent.aspx.cs" Inherits="iWMS.Web.Outbound.ShipPlan.ShipPlanCageContent" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShipPlan HandlingUnit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>&nbsp;
                    <asp:Button ID="RemoveCartonBtn" runat="server" Text="Remove Carton" OnClick="RemoveCartonBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                </td>
            </tr>
        </table>
        <br />
        <div>
            <telerik:RadGrid ID="HUContentInShipPlanResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                AllowMultiRowSelection="true" OnNeedDataSource="HUContentInShipPlanResultDG_NeedDataSource" AllowFilteringByColumn="True" OnColumnCreated="HUContentInShipPlanResultDG_ColumnCreated" Height="500px"
                AllowPaging="true">
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="HUId" TableLayout="Fixed" Name="InShipPlanContentHUGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="CheckALLInShipPlanHUContentResultDG(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="HUContentInShipPlanchk" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <br />
        </div>
    </form>
</body>
</html>
