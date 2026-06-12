<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderManagerWithdrawRecords.aspx.cs" Inherits="iWMS.Web.Outbound.WorkOrderManager.WorkOrderManagerWithdraw" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Work Order Manager Withdraw Records</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
        function OnClientClose_Edit(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh" CausesValidation="false" OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp
                    <asp:Button ID="StockRequisitionBtn" runat="server" CssClass="LongLabelWhite" Text="Stock Requisition" CausesValidation="false" OnClick="StockRequisitionBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp
                    <asp:Button ID="ConversionCompletedBtn" runat="server" CssClass="LongLabelWhite" Text="Conversion Completed" CausesValidation="false" OnClick="ConversionCompleted_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp
                    <asp:Button ID="SplitBtn" runat="server" CssClass="white" Text="Split" CausesValidation="false" OnClick="Split_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp
                    <asp:Button ID="ProceedOnPickedBtn" runat="server" CssClass="LongLabelWhite" Text="Proceed On Picked" CausesValidation="false" OnClick="ProceedOnPickedBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                </td>
            </tr>
        </table>
        <br />

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="WithdrawId">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" onclick='<%# string.Format("javascript:selectCheckbox(event,{0});", Container.ItemIndex+1) %>' runat="server" AutoPostBack="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <br />
        <asp:Label runat="server" Text="Withdrawal Detail" CssClass="pagetitle"></asp:Label>
        <br />
        <br />
        <telerik:RadGrid ID="WithdrawalDetailResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="WithdrawalDetailResultDG_NeedDataSource" OnColumnCreated="WithdrawalDetailResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1200px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
