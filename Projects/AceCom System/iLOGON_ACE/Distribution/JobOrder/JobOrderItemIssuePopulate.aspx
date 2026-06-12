<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobOrderItemIssuePopulate.aspx.cs" Inherits="iWMS.Web.Distribution.JobOrder.JobOrderItemIssuePopulate" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView ID="formCtlSize" runat="server" Height="200px">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="AddBtn" CssClass="LongLabelWhite" runat="server" OnClick="AddBtn_Click"
                                Text="Add" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, true)" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="false" AllowPaging="true"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" />
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderText="No" HeaderStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNo" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="SeqNo" SortExpression="SeqNo" HeaderText="OMS S/No" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                        ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SKUCode" SortExpression="SKUCode" HeaderText="SKUCode" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SKUDescr" SortExpression="SKUDescr" HeaderText="SKUDescription" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Qty" SortExpression="Qty" HeaderText="Qty" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UOM" SortExpression="UOM" HeaderText="UOM" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot2" SortExpression="Lot2" HeaderText="Lot2" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot3" SortExpression="Lot3" HeaderText="Lot3" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot4" SortExpression="Lot4" HeaderText="Lot4" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot6" SortExpression="Lot6" HeaderText="Lot6" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot7" SortExpression="Lot7" HeaderText="Lot7" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot8" SortExpression="Lot8" HeaderText="Lot8" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot9" SortExpression="Lot9" HeaderText="Lot9" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot10" SortExpression="Lot10" HeaderText="Lot10" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot12" SortExpression="Lot12" HeaderText="Lot12" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot13" SortExpression="Lot13" HeaderText="Lot13" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot14" SortExpression="Lot14" HeaderText="Lot14" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lot15" SortExpression="Lot15" HeaderText="Lot15" ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn Display="false" DataField="SKUId"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn Display="false" DataField="SKUGrpId"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
