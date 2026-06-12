<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderManpower.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderManpower" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TMSBookingOrderManpower</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClick() {
                var Grid = $find("<%= ResultDG.ClientID %>");
                var MasterTable = Grid.get_masterTableView();

                for (var i = 0; i < MasterTable.get_dataItems().length; i++) {
                    var row = MasterTable.get_dataItems()[i];
                    if (row.get_expanded() == false) {
                        row.set_expanded(true);
                    }
                    else
                        row.set_expanded(false);
                }
                var btn = document.getElementById(id);
                btn.disabled = true;
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
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="ActivityTab" Text="Activity" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table border="0" cellspacing="0" cellpadding="0">
                    <asp:Panel runat="server" ID="NewAtvt_Panel">
                        <tr>
                            <td>
                                <asp:Button ID="NewAtvtBtn" runat="server" Text="New &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Activity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CssClass="LongLabelWhite" OnClick="NewAtvtBtn_Click"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="CollapseExpandBtn" runat="server" Text="Show/Hide" CssClass="white"
                                    OnClientClick="OnClientClick(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="DeleteAtvtBtn" runat="server" Text="Delete &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Activity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CssClass="LongLabelWhite" OnClick="DeleteAtvtBtn_Click"
                                    CausesValidation="false" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="ManagePersonnelBtn" runat="server" Text="Manage Personnel" CssClass="LongLabelWhite" OnClick="ManagePersonnelBtn_Click"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="JobSheetBtn" runat="server" CssClass="blue" Text="JobSheet" OnClick="JobSheetBtn_Click"
                                    OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CausesValidation="False" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="DeliveryNoteBtn" runat="server" CssClass="blue" Text="DeliveryNote" OnClick="DeliveryNoteBtn_Click"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="False" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy" OnClick="CopyBtn_Click"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="False" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="OpenBtn" runat="server" Text="Open" CausesValidation="false" ToolTip="Open" CssClass="white"
                                    OnClick="OpenBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="AssignBtn" runat="server" Text="Assign" CausesValidation="false" ToolTip="Assign" CssClass="blue"
                                    OnClick="AssignBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="CompleteBtn" runat="server" Text="Complete" CausesValidation="false" ToolTip="Complete" CssClass="green"
                                    OnClick="CompleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                 &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CausesValidation="false" ToolTip="Delete" CssClass="white"
                                    OnClick="Delete_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CausesValidation="false" ToolTip="Cancel" CssClass="white"
                                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>

                            <td class="pagetitle">
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                                    Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="AddAtvt_Panel">
                        <tr>
                            <td>&nbsp;
                                <asp:Button ID="SaveNextBtn" runat="server" CssClass="white" Text="Save &amp; Next" OnClick="SaveNextBtn_Click"
                                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />&nbsp;
                                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn_Click"
                                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />&nbsp;
                                <asp:Button ID="ClosePanelBtn" runat="server" CssClass="white" Text="Hide" OnClick="ClosePanelBtn_Click"
                                    UseSubmitBehavior="false" CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Metro" RenderMode="Lightweight"
                    AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                    OnCancelCommand="ResultDG_CancelCommand" OnBatchEditCommand="ResultDG_BatchEditCommand" >
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                            OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                    </ClientSettings>
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />

                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="AtvtHead" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        TableLayout="Fixed" ItemStyle-Wrap="true" HeaderStyle-Wrap="true" AlternatingItemStyle-Wrap="true"
                        HierarchyLoadMode="Client" HeaderStyle-Width="45%">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <Columns>
                            <telerik:GridTemplateColumn HeaderStyle-Width="42px" ItemStyle-Width="42px" Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    &emsp;
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="false"
                                UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="ldEdit" ImageUrl="../../image/pencil.gif" Width="15"
                                        Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                        OnClick="JBPerAtvt_Edit" CausesValidation="False"></asp:ImageButton>
                                    <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="JBPerAtvt_Copy"
                                        runat="server">
                                        <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                            title="Copy" runat="server" />
                                    </a>
                                    <a id="AddLbl" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="AddBtn_Click"
                                        runat="server">
                                        <img id="addImg" src="../../image/add.png" width="15" height="15" border="0" alt="Add PerHead"
                                            runat="server">
                                    </a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="DetailLbl" runat="server" />
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="JBPerAtvt_Delete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete JBPerAtvt"
                                            title="Delete JBPerAtvt" runat="server" />
                                    </a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="45px" ItemStyle-Width="45px" Reorderable="false" HeaderStyle-CssClass="RGridHeader_CUSTOM"
                                UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderStyle-Width="300px" ItemStyle-Width="300px" SortExpression="id"
                                HeaderText="jbperatvtid" DataField="id" UniqueName="jbperatvtid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Activity" DataField="peratvtcodedescr" AllowFiltering="true"
                                ColumnGroupName="peratvtcodedescr" SortExpression="peratvtcodedescr" UniqueName="peratvtcodedescr"
                                Reorderable="true">
                                <HeaderStyle Wrap="true" Width="120px" />
                                <ItemStyle Wrap="true" Width="120px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Activity Remarks" DataField="atvtremarks" AllowFiltering="true"
                                ColumnGroupName="atvtremarks" SortExpression="atvtremarks" UniqueName="AtvtRemarks"
                                Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true"
                                ColumnGroupName="status" SortExpression="status" UniqueName="status" Visible="false"
                                Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExpStartDate" DataField="frexpdate" AllowFiltering="true"
                                ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExpEndDate" DataField="toexpdate" AllowFiltering="true"
                                ColumnGroupName="toexpdate" SortExpression="toexpdate" UniqueName="toexpdate"
                                HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Category" DataField="cat" AllowFiltering="true"
                                ColumnGroupName="cat" SortExpression="cat" UniqueName="cat" Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FrAddr" DataField="frservicept" AllowFiltering="true"
                                ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                                Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toservicept" AllowFiltering="true"
                                ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                                Reorderable="true" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="GoodsDescr" DataField="AtvtGoodsDescr" AllowFiltering="true"
                                ColumnGroupName="AtvtGoodsDescr" SortExpression="AtvtGoodsDescr" UniqueName="AtvtGoodsDescr"
                                Reorderable="true">
                                <HeaderStyle Wrap="true" Width="130px" />
                                <ItemStyle Wrap="true" Width="130px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                                ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true"
                                Display="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ManRequired" DataField="ManRequired" AllowFiltering="true"
                                ColumnGroupName="ManRequired" SortExpression="ManRequired" UniqueName="ManRequired"
                                Reorderable="true">
                                <HeaderStyle Wrap="true" Width="130px" />
                                <ItemStyle Wrap="true" Width="130px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VehicleRequired" DataField="VehRequired" AllowFiltering="true"
                                ColumnGroupName="VehRequired" SortExpression="VehRequired" UniqueName="VehRequired"
                                Reorderable="true">
                                <HeaderStyle Wrap="true" Width="130px" />
                                <ItemStyle Wrap="true" Width="130px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                                ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}" Display="false" HeaderStyle-Width="120px"
                                ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                                ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"
                                Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                                ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}" Display="false" HeaderStyle-Width="120px"
                                ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                                ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true"
                                Display="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <DetailTables>
                            <telerik:GridTableView DataKeyNames="JPDId" Name="AtvtDetl" Width="100%" Skin="Metro" RenderMode="Lightweight"
                                runat="server" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538C" EditMode="Batch" CommandItemDisplay="TopAndBottom" OnEditCommand="ResultDG_Edit">
                                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="JPAId" MasterKeyField="id" />
                                </ParentTableRelation>
                                <Columns>
                                <telerik:GridTemplateColumn HeaderStyle-Width="42px" ItemStyle-Width="42px" Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                       <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                       </HeaderTemplate>
                                       <ItemTemplate>
                                         &emsp;
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                       </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="LineIcon" AllowFiltering="false" HeaderStyle-Width="2%">
                                        <ItemTemplate>                                        
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DelRide"
                                                ImageUrl="../../image/bin.gif" Width="16" Height="16" AlternateText="Delete"
                                                CommandName="DetailDelete" BackColor="Transparent" BorderWidth="0" OnClick="DeleteBtn_Click"></asp:ImageButton>
                                        </ItemTemplate>                                     
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="SNO" AllowFiltering="false"
                                        HeaderStyle-Width="39px" ItemStyle-Width="39px">
                                        <HeaderTemplate>
                                            S/N
                                        </HeaderTemplate>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn SortExpression="id" HeaderText="jbperhid" DataField="id"
                                        UniqueName="jbperhid" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridTemplateColumn UniqueName="FrExpDateToExpDate" HeaderText="Planned Start Time<br/>Planned End Time" HeaderStyle-Width="200px" ItemStyle-Width="200px" AllowSorting="true">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <br />
                                            <asp:Label runat="server" ID="FrExpDateLbl" HeaderStyle-Width="200px" ItemStyle-Width="200px" Text=' <%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy HH:mm}")%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="ToExpDateLbl" HeaderStyle-Width="200px" ItemStyle-Width="200px" Text=' <%# DataBinder.Eval(Container.DataItem, "toexpdate", "{0:dd/MMM/yyyy HH:mm}")%>'></asp:Label>
                                            <br />
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadDateTimePicker ID="FrExpDate" runat="server" HeaderStyle-Width="200px" ItemStyle-Width="200px" SelectedDate='<%# Convert.IsDBNull(Eval("frexpdate")) ? (DateTime?)null : Convert.ToDateTime(Eval("frexpdate")) %>' Width="180px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                            </telerik:RadDateTimePicker>
                                            <br />
                                            <telerik:RadDateTimePicker ID="ToExpDate" runat="server" HeaderStyle-Width="200px" ItemStyle-Width="200px" SelectedDate='<%# Convert.IsDBNull(Eval("toexpdate")) ? (DateTime?)null : Convert.ToDateTime(Eval("toexpdate")) %>' Width="180px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                            </telerik:RadDateTimePicker>
                                            <br />
                                            <br />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="FrActDateToActDate" HeaderText="Actual Start Time<br/>Actual End Time" HeaderStyle-Width="200px" ItemStyle-Width="200px" AllowSorting="true">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <br />
                                            <asp:Label runat="server" ID="FrActDateLbl" HeaderStyle-Width="200px" ItemStyle-Width="200px" Text='  <%# DataBinder.Eval(Container.DataItem, "fractdate", "{0:dd/MMM/yyyy HH:mm}")%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="ToActDateLbl" HeaderStyle-Width="200px" ItemStyle-Width="200px" Text=' <%# DataBinder.Eval(Container.DataItem, "toactdate", "{0:dd/MMM/yyyy HH:mm}")%>'></asp:Label>
                                            <br />
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadDateTimePicker ID="FrActDate" runat="server" HeaderStyle-Width="200px" ItemStyle-Width="200px" SelectedDate='<%# Convert.IsDBNull(Eval("fractdate")) ? (DateTime?)null : Convert.ToDateTime(Eval("fractdate")) %>' Width="180px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                            </telerik:RadDateTimePicker>
                                            <br />
                                            <telerik:RadDateTimePicker ID="ToActDate" runat="server" HeaderStyle-Width="200px" ItemStyle-Width="200px" SelectedDate='<%# Convert.IsDBNull(Eval("toactdate")) ? (DateTime?)null : Convert.ToDateTime(Eval("toactdate")) %>' Width="180px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                            </telerik:RadDateTimePicker>
                                            <br />
                                            <br />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="PerName" HeaderText="Name" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="PerNameLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PerName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="PerNameDDL" runat="server" Skin="WebBlue" Width="150px" DropDownWidth="150px" OnLoad="PerNameDDL_Load"></telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="WorkThroughLunch" HeaderText="WorkThroughLunch" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="WorkThroughLunchLbl" Text='<%# DataBinder.Eval(Container.DataItem, "WorkThruLunchDescr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="WorkThroughLunchDDL" runat="server" Skin="WebBlue" Width="150px" DropDownWidth="150px" OnLoad="WorkThroughLunchDDL_Load"></telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="AllowanceAmount" HeaderText="Allowance Amount" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                        <ItemTemplate>
                                             <%# string.Format("{0:}",Eval("AllowanceAmount")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="AllowanceAmountTxt" Text='<%# DataBinder.Eval(Container.DataItem, "AllowanceAmount") %>'
                                                TextMode="SingleLine">
                                            </telerik:RadTextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="AllowanceAmountTxt" runat="server"
                                                ErrorMessage="Number Only" ForeColor="Red" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="OTHours" HeaderText="OT Hours" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                        <ItemTemplate>
                                              <%# string.Format("{0:}",Eval("OTHours")) %>                                           
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="OTHoursTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OTHours") %>'
                                                TextMode="SingleLine">
                                            </telerik:RadTextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="OTHoursTxt" runat="server"
                                                ErrorMessage="Number Only" ForeColor="Red" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="TaskDescription" HeaderText="Task Description" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TaskDescription")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TaskDescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TaskDescription") %>'
                                                TextMode="MultiLine" Resize="Both">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("StatusDescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="NameTxt" Text='<%# DataBinder.Eval(Container.DataItem, "StatusDescr") %>'
                                                TextMode="SingleLine" Enabled="false">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                </Columns>
                            </telerik:GridTableView>
                        </DetailTables>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="JobSheetBtn" />
                <asp:PostBackTrigger ControlID="DeliveryNoteBtn" />
                <%--<asp:PostBackTrigger ControlID="SaveBtn" />--%>
            </Triggers>
        </asp:UpdatePanel>

        <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">
            <script type="text/javascript">
                //FrExpDateToExpDate
                var FrExpDateToExpDate = function (FrExpDate, ToExpDate) {
                    this.FrExpDate = FrExpDate;
                    this.ToExpDate = ToExpDate;
                }

                FrExpDateToExpDate.prototype.equals = function (tripfrtodate) {
                    if (this.FrExpDate === tripfrtodate.FrExpDate && this.ToExpDate === tripfrtodate.ToExpDate) {
                        return true;
                    }
                    return false;
                }

                FrExpDateToExpDate.prototype.toString = function () {
                    return JSON.stringify({
                        FrExpDate: this.FrExpDate, ToExpDate: this.ToExpDate
                    });
                }


                //FrActDateToActDate
                var FrActDateToActDate = function (FrActDate, ToActDate) {
                    this.FrActDate = FrActDate;
                    this.ToActDate = ToActDate;
                }

                FrActDateToActDate.prototype.equals = function (tripfrtodate) {
                    if (this.FrActDate === tripfrtodate.FrActDate && this.ToActDate === tripfrtodate.ToActDate) {
                        return true;
                    }
                    return false;
                }

                FrActDateToActDate.prototype.toString = function () {
                    return JSON.stringify({
                        FrActDate: this.FrActDate, ToActDate: this.ToActDate
                    });
                }

            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock4" runat="server">
            <script type="text/javascript">
                function GetCellValue(sender, args) {
                    //FrExpDateToExpDate
                    if (args.get_columnUniqueName() === "FrExpDateToExpDate") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrExpDate = $telerik.findElement(Container, "FrExpDateLbl").innerText;
                        var ToExpDate = $telerik.findElement(Container, "ToExpDateLbl").innerText;
                        args.set_value(new FrExpDateToExpDate(FrExpDate, ToExpDate));
                    }

                    //FrActDateToActDate
                    if (args.get_columnUniqueName() === "FrActDateToActDate") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrActDate = $telerik.findElement(Container, "FrActDateLbl").innerText;
                        var ToActDate = $telerik.findElement(Container, "ToActDateLbl").innerText;
                        args.set_value(new FrActDateToActDate(FrActDate, ToActDate));
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock5" runat="server">
            <script type="text/javascript">
                function SetCellValue(sender, args) {
                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "FrExpDateToExpDate") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "FrExpDateLbl").innerText = Value.FrExpDate;
                        $telerik.findElement(Container, "ToExpDateLbl").innerText = Value.ToExpDate;
                    }

                    //FrActDateToActDate
                    if (args.get_columnUniqueName() === "FrActDateToActDate") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "FrActDateLbl").innerText = Value.FrActDate;
                        $telerik.findElement(Container, "ToActDateLbl").innerText = Value.ToActDate;
                    }

                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock6" runat="server">
            <script type="text/javascript">
                function GetEditorValue(sender, args) {
                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "FrExpDateToExpDate") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrExpDate = $telerik.findControl(Container, "FrExpDate").get_dateInput().get_value();
                        var ToExpDate = $telerik.findControl(Container, "ToExpDate").get_dateInput().get_value();
                        args.set_value(new FrExpDateToExpDate(FrExpDate, ToExpDate));
                    }

                    //FrActDateToActDate
                    if (args.get_columnUniqueName() === "FrActDateToActDate") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrActDate = $telerik.findControl(Container, "FrActDate").get_dateInput().get_value();
                        var ToActDate = $telerik.findControl(Container, "ToActDate").get_dateInput().get_value();
                        args.set_value(new FrActDateToActDate(FrActDate, ToActDate));
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock7" runat="server">
            <script type="text/javascript">
                function SetEditorValue(sender, args) {
                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "FrExpDateToExpDate") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findControl(Container, "FrExpDate").get_dateInput().set_value(Value.FrExpDate);
                        $telerik.findControl(Container, "ToExpDate").get_dateInput().set_value(Value.ToExpDate);
                    }

                    //FrActDateToActDate
                    if (args.get_columnUniqueName() === "FrActDateToActDate") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findControl(Container, "FrActDate").get_dateInput().set_value(Value.FrActDate);
                        $telerik.findControl(Container, "ToActDate").get_dateInput().set_value(Value.ToActDate);
                    }
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>

