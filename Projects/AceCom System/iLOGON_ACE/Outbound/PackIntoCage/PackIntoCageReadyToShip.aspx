<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackIntoCageReadyToShip.aspx.cs" Inherits="iWMS.Web.Outbound.PackIntoCage.PackIntoCageReadyToShip" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HU Not Shipped</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />        
        <br />
        <div>
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" OnColumnCreated="ResultDG_ColumnCreated"
                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="HUId">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <input id="MasterCB" name="MasterCB" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="RecordLevelCB" runat="server" />
                            </ItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
