<%@ Page Language="c#" CodeBehind="ControlHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Control.ControlHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Search Results</title>
    <link rel="stylesheet" href="../../css/iWMS.css" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                    AllowFilteringByColumn="false" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="ControlEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Control"
                                        OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="name" SortExpression="name" HeaderText="Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ExpiryDate" SortExpression="ExpiryDate" HeaderText="License Expiry Date">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DaysToExpiry" SortExpression="DaysToExpiry" HeaderText="Days to Expiry">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NumberOfUsers" SortExpression="NumberOfUsers" HeaderText="Number Of Users">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="addr1" SortExpression="addr1" HeaderText="Address#1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="addr2" SortExpression="addr2" HeaderText="Address#2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="addr3" SortExpression="addr3" HeaderText="Address#3">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="addr4" SortExpression="addr4" HeaderText="Address#4">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="web" SortExpression="web" HeaderText="Web" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="crno" SortExpression="crno" HeaderText="CR/UEI Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
