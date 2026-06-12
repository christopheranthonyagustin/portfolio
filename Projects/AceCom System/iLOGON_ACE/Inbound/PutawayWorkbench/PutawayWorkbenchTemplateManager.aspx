<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PutawayWorkbenchTemplateManager.aspx.cs" Inherits="iWMS.Web.Inbound.PutawayWorkbench.PutawayWorkbenchTemplateManager" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<!DOCTYPE html>

<html>
<head runat="server">
    <title>Putaway Template Manager</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="10" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="CreateNewBtn" runat="server" CssClass="white" Text="New"
                        OnClick="CreateNewBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                        OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />

                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
                <td>
                    <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                </td>
            </tr>
        </table>
        <br>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
            EnableLinqExpressions="false" AllowPaging="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50"
                DataKeyNames="DeckId" Name="ParentGrid">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            &nbsp;&nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ID="WPWedit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Wave Picking Workbench Templater Manager"
                                        OnClick="WPWedit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="WPWdelete"
                                ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                OnClick="WPWdelete_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="Deckname" SortExpression="Deckname" HeaderText="Deckname"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Notes" SortExpression="Notes" HeaderText="Notes"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ModifiedOn" SortExpression="ModifiedOn" HeaderText="ModifiedOn"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="DeckId" SortExpression="DeckId" Display="false" />

                    <telerik:GridBoundColumn DataField="WPTId" SortExpression="WPTId" Display="false" />

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
