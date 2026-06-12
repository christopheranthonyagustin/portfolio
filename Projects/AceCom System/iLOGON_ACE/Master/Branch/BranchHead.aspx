<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BranchHead.aspx.cs" Inherits="iWMS.Web.Master.Branch.BranchHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>BranchListHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <div id="div1">
                    <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"></td>
                        </tr>
                    </table>
                </div>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" ></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <asp:ImageButton runat="server" Visible="True" ID="BranchDelete" ImageUrl="../../image/bin.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="Branch_Delete" OnClientClick="return confirm('Confirm Delete?')" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="EntCode" SortExpression="EntCode" HeaderText="Entity"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="code" SortExpression="Code" HeaderText="Code"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Name" SortExpression="Name" HeaderText="Name"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Addr1" SortExpression="Addr1" HeaderText="Address#1"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Addr2" SortExpression="Addr2" HeaderText="Address#2"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Addr3" SortExpression="Addr3" HeaderText="Address#3"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Addr4" SortExpression="Addr4" HeaderText="Address#4"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ZipCode" SortExpression="ZipCode" HeaderText="ZipCode"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="CityCodeDescr" SortExpression="CityCode" HeaderText="CityCode"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="CountryCodeDescr" SortExpression="CountryCode" HeaderText="CountryCode"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Tel" SortExpression="Tel" HeaderText="Tel"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Fax" SortExpression="Fax" HeaderText="Fax"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Web" SortExpression="Web" HeaderText="Web"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Contact" SortExpression="Contact" HeaderText="Contact"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Hp" SortExpression="Hp" HeaderText="Hp"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Email" SortExpression="Email" HeaderText="Email"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Remarks" SortExpression="Remarks" HeaderText="Remarks"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
