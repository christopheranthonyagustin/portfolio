<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PKWReadyToPack.aspx.cs" Inherits="iWMS.Web.Outbound.PackingWorkbench.PKWReadyToPack" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Add @ Packing Workbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<script type="text/javascript">
    function OnClientClose(sender, args) {
        document.location.href = document.location.href;
    }
    function RadMenuClientOnClick(sender, args) {
        if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
            args.set_cancel(true);
        }
    }
    function selectAll(invoker) {
        var inputElements = document.getElementsByTagName('input');
        for (var i = 0; i < inputElements.length; i++) {
            var myElement = inputElements[i];
            if (myElement.type === "checkbox") {
                myElement.checked = invoker.checked;
            }
            else {
                myElement.checked = invoker.UnChecked;

            }
        }
    }
</script>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                            OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp; 
                    </td>
                    <td>
                        <asp:Button ID="StartPackingBtn" runat="server" CssClass="LongLabelWhite" Text="Start Packing"
                            OnClick="StartPackingBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <br />
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
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
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="380px" Height="250px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
