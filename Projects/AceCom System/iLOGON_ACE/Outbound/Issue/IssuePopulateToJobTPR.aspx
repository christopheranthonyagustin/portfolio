<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="IssuePopulateToJobTPR.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.Issue.IssuePopulateToJobTPR" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Book Transport @ Goods Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function callbackFn(arg) //the value indicates how the dialog was closed
        {
            GetRadWindow().close();
        }
    </script>
    <style type="text/css">
        .rwPopupButton {
            margin-left: 100px !important;
            margin-top: 30px !important;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td valign="top" width="30%">
                    <table id="Table2">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true" AutoSize="true" CenterIfModal="true" Modal="true"></telerik:RadWindowManager>
                    <br />
                    <br />
                    &nbsp;<asp:Button ID="PopulateBtn" runat="server" CssClass="white" Text="Populate"
                        OnClick="PopulateBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                    &nbsp;<br />
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="ResultGridPanel" runat="server">
                        <asp:Label ID="BackOrderLbl" runat="server" Style="z-index: 0" Font-Size="Medium" Text="<b>Back Order</b>"></asp:Label>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true">
                            <GroupingSettings CaseSensitive="false" />
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" AllowFilteringByColumn="true">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SKUDescription" HeaderText="SKUDescription" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ExpectedQty" HeaderText="ExpectedQty" AllowFiltering="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UOM" HeaderText="UOM" AllowFiltering="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="NoteLbl" runat="server" Style="z-index: 0" Font-Size="Medium" Text="<b>Note</b> : If you have accidentally selected a record that had already gone through the Book Transport process, this record will be ignored. "></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
