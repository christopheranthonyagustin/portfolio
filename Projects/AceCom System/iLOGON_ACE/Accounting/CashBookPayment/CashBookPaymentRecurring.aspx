<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookPaymentRecurring.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookPayment.CashBookPaymentRecurring" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recurring Journal Master @ Cash Book Payment</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>&nbsp;
                 <asp:Button ID="SetBtn" CssClass="white" runat="server" OnClick="SetBtn_Click" Visible="True" Text="Set" CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>


        <table width="100%">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <asp:Panel runat="server" ID="GridPanel1">

                                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
                                        EnableLinqExpressions="False" AllowPaging="false" EnableViewState="false"
                                        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                                        ExportSettings-UseItemStyles="true" >

                                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                        <ItemStyle Wrap="true"></ItemStyle>
                                        <HeaderStyle Wrap="true"></HeaderStyle>
                                        <SortingSettings EnableSkinSortStyles="false" />

                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                                            <Selecting AllowRowSelect="true" />
                                            <Scrolling AllowScroll="true" />
                                        </ClientSettings>

                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="QueueGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                            <Columns>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                                    HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" CssClass="BigCheckBox" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkObjective" runat="server" CssClass="BigCheckBox" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="Number" UniqueName="Number" SortExpression="Number"
                                                    HeaderText="Number">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Date" UniqueName="Date" SortExpression="Date"
                                                    HeaderText="Date">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Period" UniqueName="Period" SortExpression="Period"
                                                    HeaderText="Period">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Status" UniqueName="Status" SortExpression="Status"
                                                    HeaderText="Status">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>

                                </asp:Panel>
                            </td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr align="right" style="padding-top: 24%">
                <td style="padding-top: 24%"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
