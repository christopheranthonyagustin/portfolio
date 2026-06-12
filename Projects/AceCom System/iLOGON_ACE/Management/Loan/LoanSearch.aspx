<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanSearch.aspx.cs" Inherits="iWMS.Web.Management.Loan.LoanSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Loan Search</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <br />
    <asp:Panel ID="NewPanel" runat="server">
        <asp:Button ID="NewSearchBtn" class="white" runat="server" OnClick="NewSearchBtn_Click" Text="NewSearch" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false"/>
        &nbsp;&nbsp;
        <asp:Button ID="CreateNewBtn" class="white" runat="server" OnClick="CreateNewBtn_Click" Text="CreateNew" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false"/>
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="SearchPanel" runat="server">
        <table border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
                    &nbsp;
                    <asp:Button ID="HideSearchBtn" class="white" runat="server" OnClick="HideBtn_Click" Text="Hide" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false"/>
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="AddPanel" runat="server">
        <table border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td>
                    <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add" 
                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false"/>
                    &nbsp;
                    <asp:Button ID="HideAddBtn" class="white" runat="server" OnClick="HideBtn_Click" Text="Hide" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false"/>
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="false" AllowSorting="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowAutomaticInserts="True" Width="200%">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid"
            EditMode="InPlace" Width="100%" AllowFilteringByColumn="true" HierarchyLoadMode="Client">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="LoanEdit" ImageUrl="..\..\image\pencil.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Loan"
                            ToolTip="Edit LoanHead" OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                    </ItemTemplate>
                    <ItemStyle Wrap="false" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                    ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Site" DataField="sitecode" AllowFiltering="true"
                    ColumnGroupName="sitecode" SortExpression="sitecode" UniqueName="sitecode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Number" DataField="number" AllowFiltering="true"
                    ColumnGroupName="number" SortExpression="number" UniqueName="number" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                    ColumnGroupName="type" SortExpression="type" UniqueName="type" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Name" DataField="name" AllowFiltering="true"
                    ColumnGroupName="name" SortExpression="name" UniqueName="name" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="NRIC" DataField="nric" AllowFiltering="true"
                    ColumnGroupName="nric" SortExpression="nric" UniqueName="nric" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ContactNo" DataField="contactno" AllowFiltering="true"
                    ColumnGroupName="contactno" SortExpression="contactno" UniqueName="contactno"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Rank" DataField="rank" AllowFiltering="true"
                    ColumnGroupName="rank" SortExpression="rank" UniqueName="rank" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Unit" DataField="unit" AllowFiltering="true"
                    ColumnGroupName="unit" SortExpression="unit" UniqueName="unit" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="true"
                    ColumnGroupName="status" SortExpression="status" UniqueName="status" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Email" DataField="email" AllowFiltering="true"
                    ColumnGroupName="email" SortExpression="email" UniqueName="email" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="DueDate" DataField="duedate" AllowFiltering="true"
                    ColumnGroupName="duedate" SortExpression="duedate" UniqueName="duedate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Remarks" DataField="remarks" AllowFiltering="true"
                    ColumnGroupName="remarks" SortExpression="remarks" UniqueName="remarks" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="LoanLoc" DataField="loanloccode" AllowFiltering="true"
                    ColumnGroupName="loanloccode" SortExpression="loanloccode" UniqueName="loanloccode"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ReturnLoc" DataField="returnloccode" AllowFiltering="true"
                    ColumnGroupName="returnloccode" SortExpression="returnloccode" UniqueName="returnloccode"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                    ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                    ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                    ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                    ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <br />
    <br />
    <br />
    &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
