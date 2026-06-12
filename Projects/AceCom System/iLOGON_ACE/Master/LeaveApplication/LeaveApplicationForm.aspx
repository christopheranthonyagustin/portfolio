<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveApplicationForm.aspx.cs" Inherits="iWMS.Web.Master.LeaveApplication.LeaveApplicationForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>LeaveApplicationForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attachment" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:Panel ID="CurrencyPanel" runat="server">
                    <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" Enable="true"
                                            OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                                        &nbsp;
                                    </td>
                                    <br />
                                </tr>
                                <tr>
                                    <td>

                                        <br />
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>

                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowFilteringByColumn="true"
                    AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Bootstrap"
                    OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="LeaveBalanceId" UniqueName="LeaveBalanceId" SortExpression="LeaveBalanceId" HeaderText="Leave Balance Id" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PersonnelId" UniqueName="PersonnelId" SortExpression="PersonnelId" HeaderText="Staff Id" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LeaveType" UniqueName="LeaveType" SortExpression="LeaveType" HeaderText="Leave Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Year" UniqueName="Year" SortExpression="Year" HeaderText="Year">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BroughtForwardLastYear" UniqueName="BroughtForwardLastYear" SortExpression="BroughtForwardLastYear" HeaderText="Brought Forward Last Year">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AnnualEntitlement" UniqueName="AnnualEntitlement" SortExpression="AnnualEntitlement" HeaderText="Annual Entitlement">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Forfeited" UniqueName="Forfeited" HeaderText="Forfeited">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AppliedTillDate" UniqueName="AppliedTillDate" HeaderText="Applied Till Date">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TotalLeft" UniqueName="TotalLeft" HeaderText="Total Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" HeaderText="Add Date" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" AllowFiltering="false" HeaderText="Add User" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EndDate" UniqueName="EndDate" HeaderText="End Date" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EndUser" UniqueName="EndUser" SortExpression="End User" AllowFiltering="false" HeaderText="End User" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="Attachment" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
