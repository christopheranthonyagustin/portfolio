<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionPurchaseReturnItem.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionPurchaseReturn.DistributionPurchaseReturnItem" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DistributionPurchaseReturnItem</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        &nbsp;
        <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
            OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="PurchaseReturnItemId">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="LineNo" SortExpression="LineNo" UniqueName="LineNo"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ItemCode" DataField="ItemCode" SortExpression="ItemCode" UniqueName="ItemCode"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ItemDescription" DataField="ItemDescription" SortExpression="ItemDescription" UniqueName="ItemDescription"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ItemType" DataField="ItemType" SortExpression="ItemType" UniqueName="ItemType"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ItemQty" DataField="expecteduomqty" SortExpression="ItemQty" UniqueName="ItemQty"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ItemUOM" DataField="ItemUOM" SortExpression="ItemUOM" UniqueName="ItemUOM"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ItemUnitPrice" DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" UniqueName="ItemUnitPrice"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ItemUnitLandedCost" DataField="ItemUnitLandedCost" SortExpression="ItemUnitLandedCost" UniqueName="ItemUnitLandedCost"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Notes" DataField="Notes" SortExpression="Notes" UniqueName="Notes"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PurchaseReturnItemStatus" DataField="PurchaseReturnItemStatusDescr" SortExpression="PurchaseReturnItemStatus" UniqueName="PurchaseReturnItemStatus"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
