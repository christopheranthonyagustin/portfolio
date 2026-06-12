<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryRegisterSearch.aspx.cs" Inherits="iWMS.Web.Outbound.DeliveryRegister.DeliveryRegisterSearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>DeliveryRegisterSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <asp:Panel ID="BtnPanel" runat="server">
                    &nbsp;
                    <asp:ImageButton ID="NewSearchBtn" runat="server" ImageUrl="../../Image/NewSearch.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="NewSearchBtn_Click" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="newPanel" runat="server" Visible="False">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td>
                                <asp:ImageButton ID="SearchBtn" runat="server" ImageUrl="../../Image/Search.png"
                                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                                    OnClick="SearchBtn_Click" />
                                &nbsp;&nbsp;
                                <asp:ImageButton ID="HideSearchBtn" runat="server" ImageUrl="../../Image/Hide.png"
                                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                                    OnClick="HideSearchBtn_Click" />
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
            </td>
        </tr>
    </table>
    <div id="div2" style="width: 100%; height: 100%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowSorting="true"
            Skin="Office2007" AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound"
            OnNeedDataSource="ResultDG_NeedDataSource" OnPageIndexChanged="ResultDG_PageIndexChanged">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="20" DataKeyNames="id" EditMode="InPlace">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                            <%--<iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="number" HeaderText="Number" SortExpression="number"
                        UniqueName="number" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" HeaderText="Type" SortExpression="type"
                        UniqueName="type" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HandOverDate" HeaderText="HandOverDate" SortExpression="HandOverDate"
                        UniqueName="HandOverDate" DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="HandOverName" HeaderText="HandOverName" SortExpression="HandOverName"
                        UniqueName="HandOverName" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TakeOverName" HeaderText="TakeOverName" SortExpression="TakeOverName"
                        UniqueName="TakeOverName" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TakeOverDept" HeaderText="TakeOverDept" SortExpression="TakeOverDept"
                        UniqueName="TakeOverDept" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TakeOverDate" HeaderText="TakeOverDate" SortExpression="TakeOverDate"
                        UniqueName="TakeOverDate" DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Rem1" HeaderText="Rem1" SortExpression="Rem1"
                        UniqueName="Rem1" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" HeaderText="Status" SortExpression="status"
                        ItemStyle-Wrap="false" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="statusdescr"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>    
    </form>
</body>
</html>
