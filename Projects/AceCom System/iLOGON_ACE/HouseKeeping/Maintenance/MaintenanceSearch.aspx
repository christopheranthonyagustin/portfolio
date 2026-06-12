<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintenanceSearch.aspx.cs"
    Inherits="iWMS.Web.HouseKeeping.Maintenance.MaintenanceSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>MaintenanceSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <asp:Panel ID="NewPanel" runat="server">
        <asp:Button ID="NewSearchBtn" class="white" runat="server" OnClick="NewSearchBtn_Click" Text="NewSearch" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false"/>                       
        &nbsp;
        <asp:Button ID="CreateNewBtn" class="white" runat="server" OnClick="CreateNewBtn_Click" Text="CreateNew" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false"/>
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="SearchPanel" runat="server">
        <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
        &nbsp;
        <asp:Button ID="HideSearchBtn" class="white" runat="server" OnClick="HideBtn_Click" Text="Hide" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false"/>
        <br />
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    </asp:Panel>
    <asp:Panel ID="AddPanel" runat="server">
        <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add" 
            OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false"/>
        &nbsp;
        <asp:Button ID="HideAddBtn" class="white" runat="server" OnClick="HideBtn_Click" Text="Hide" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false"/>
        <br />
        <br />
        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
    </asp:Panel>
    &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowSorting="true" 
        Skin="Office2007" AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound"
        OnNeedDataSource="ResultDG_NeedDataSource" GroupPanelPosition="Top">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="LblEdit" ImageUrl="..\..\image\pencil.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit"
                            ToolTip="Edit Maintenance" OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="acid" SortExpression="acid" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Number">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="refno" SortExpression="refno" HeaderText="Ref.No">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="reasoncode" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="reasondescr" SortExpression="reasondescr" HeaderText="Reason">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="finalizeddate" SortExpression="finalizeddate"
                    HeaderText="Finalized Date" DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark 1">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark 2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
