<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutboundDeliveryConfirmationNotSet.aspx.cs" Inherits="iWMS.Web.Outbound.OutboundDelivery.OutboundDeliveryConfirmationNotSet" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmation Not Sent</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
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

    function OnClientClose(sender, args) {
        document.location.href = document.location.href;
    }
</script>
<body >
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        &nbsp;
        <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
        &nbsp;
        <asp:Button ID="SendConfirmationBtn" runat="server" Text="Send Confirmation" OnClick="SendConfirmationBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
        &nbsp;
         <asp:Button ID="ResolveEDIStatusBtn" runat="server" Text="Resolve EDI Status" OnClick="ResolveEDIStatusBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
        <br />
         <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true" 
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="IssueId" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" onclick='<%# string.Format("javascript:selectCheckbox(event,{0});", Container.ItemIndex+1) %>' runat="server" AutoPostBack="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridBoundColumn DataField="Account" AutoPostBackOnFilter="true" SortExpression="Account" HeaderText="Account"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IssueNo" AutoPostBackOnFilter="true" SortExpression="IssueNo" HeaderText="Issue No"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IssueType" AutoPostBackOnFilter="true" SortExpression="IssueType" HeaderText="Issue Type"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IssueStatus" AutoPostBackOnFilter="true" SortExpression="IssueStatus" HeaderText="Issue Status"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IssueStatusColourCode" Display="False"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OrderNo" AutoPostBackOnFilter="true" SortExpression="OrderNo" HeaderText="OrderNo"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ITEM_NO" AutoPostBackOnFilter="true" SortExpression="ITEM_NO" HeaderText="ITEM_NO" ></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUCode" AutoPostBackOnFilter="true" SortExpression="SKUCode" HeaderText="SKU Code"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Description" AutoPostBackOnFilter="true" SortExpression="Description" HeaderText="Description"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MATERIAL_DOC" AutoPostBackOnFilter="true" SortExpression="MATERIAL_DOC" HeaderText="MATERIAL_DOC" ></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MAT_DOC_YEAR" AutoPostBackOnFilter="true" SortExpression="MAT_DOC_YEAR" HeaderText="MAT_DOC_YEAR" ></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MAT_DOC_ITEM" AutoPostBackOnFilter="true" SortExpression="MAT_DOC_ITEM" HeaderText="MAT_DOC_ITEM" ></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Quantity" AutoPostBackOnFilter="true" SortExpression="Quantity" HeaderText="Quantity"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UOM" AutoPostBackOnFilter="true" SortExpression="UOM" HeaderText="UOM"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
