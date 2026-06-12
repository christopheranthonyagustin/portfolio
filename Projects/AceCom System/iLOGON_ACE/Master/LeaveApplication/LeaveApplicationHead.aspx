<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveApplicationHead.aspx.cs" Inherits="iWMS.Web.Master.LeaveApplication.LeaveApplicationHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
<html>

<head runat="server">
    <title></title>
    <meta content="JavaScript" name="vs_defaultClientScript">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />

        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="CancelBtn" runat="server" CssClass="LONGLABELWHITE" Text="Cancel"
                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ApproveBtn" runat="server" CssClass="LONGLABELWHITE" Text="Approve"
                                OnClick="ApproveBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="RejectBtn" runat="server" CssClass="LONGLABELWHITE" Text="Reject"
                                OnClick="RejectBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="RequestApprovalBtn" runat="server" CssClass="LONGLABELWHITE" Text="Request Approval"
                                OnClick="RequestApprovalBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="LeaveRequestId" Name="MainGrid" TableLayout="Auto">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="60px" ItemStyle-Width="60px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="LeaveApplicationEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Leave Application"
                                        OnClick="LeaveApplicationEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="LeaveApplicationDelete" ImageUrl="../../image/bin.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="LeaveApplicationDelete_Click" OnClientClick="return confirm('Confirm Delete?')" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="LeaveRequestId" UniqueName="LeaveRequestId" SortExpression="LeaveRequestId" HeaderText="Leave Request Id" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PersonnelId" UniqueName="PersonnelId" SortExpression="PersonnelId" HeaderText="Staff Id" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PersonnelName" UniqueName="PersonnelName" SortExpression="PersonnelName" HeaderText="Staff Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BranchCode" UniqueName="BranchCode" SortExpression="BranchCode" HeaderText="Branch Code">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DepartmentCode" UniqueName="DepartmentCode" SortExpression="DepartmentCode" HeaderText="Department Code">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LeaveType" UniqueName="LeaveType" SortExpression="LeaveType" HeaderText="Leave Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Remarks" UniqueName="Remarks" HeaderText="Remarks">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StartDate" UniqueName="StartDate" HeaderText="Start Date" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EndDate" UniqueName="EndDate" HeaderText="End Date" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DaysApplied" UniqueName="DaysApplied" HeaderText="Days Applied">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LeaveSession1" UniqueName="LeaveSession" SortExpression="Leave Session" AllowFiltering="false" HeaderText="Leave Session">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LeaveRequestStatus" UniqueName="LeaveRequestStatus" HeaderText="Status" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" HeaderText="Add Date" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" AllowFiltering="false" HeaderText="Add User" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EndDate" UniqueName="EndDate" HeaderText="End Date" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EndUser" UniqueName="EndUser" SortExpression="End User" AllowFiltering="false" HeaderText="End User" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode"
                                SortExpression="StatusColourCode" UniqueName="StatusColourCode" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
