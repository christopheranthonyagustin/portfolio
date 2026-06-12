<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="APILOGHead.aspx.cs" Inherits="iWMS.Web.Interface.APILOG.APILOGHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>APILOGHead</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/checkbox.js"></script>
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_Click"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="ResultTab" Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="IncomingMessageTab" Text="View Incoming & Return Message" Value="25" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table align="right">
            <tr>
                <td>
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="560px" ID="HeaderRadPageView">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" VirtualItemCount="1000"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" AllowPaging="true" Skin="Metro"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="True" ScrollHeight="510" EnableVirtualScrollPaging="true" UseStaticHeaders="true" SaveScrollPosition="true"/>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView DataKeyNames="Id" PageSize="1000">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="35px" HeaderStyle-Width="35px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="ApiId" SortExpression="ApiId" HeaderText="Request Id" UniqueName="ApiId" ItemStyle-Width="120px" HeaderStyle-Width="120px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ipaddress" SortExpression="ipaddress" HeaderText="IP Address" UniqueName="ipaddress" ItemStyle-Width="120px" HeaderStyle-Width="120px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="apiurl" SortExpression="apiurl" HeaderText="API URL" UniqueName="apiurl" ItemStyle-Width="500px" HeaderStyle-Width="500px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="apitype" SortExpression="apitype" HeaderText="API Type" UniqueName="apitype" ItemStyle-Width="130px" HeaderStyle-Width="130px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="apirequestor" SortExpression="apirequestor" HeaderText="API Requested By" UniqueName="apirequestor" ItemStyle-Width="150px" HeaderStyle-Width="150px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="accountcode" SortExpression="accountcode" HeaderText="Account Code" UniqueName="accountcode" ItemStyle-Width="220px" HeaderStyle-Width="220px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="documentno" SortExpression="documentno" HeaderText="Document No" UniqueName="documentno" ItemStyle-Width="170px" HeaderStyle-Width="170px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="incomingcode" SortExpression="incomingcode" HeaderText="Incoming Code" UniqueName="incomingcode" ItemStyle-Width="250px" HeaderStyle-Width="180px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="returncode" SortExpression="returncode" HeaderText="Return Code" UniqueName="returncode" ItemStyle-Width="120px" HeaderStyle-Width="120px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Width="160px" HeaderStyle-Width="160px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="Add User" UniqueName="AddUser" ItemStyle-Width="120px" HeaderStyle-Width="120px" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Id" Display="false" UniqueName="Id">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReturnCodeColour" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="MessageRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
