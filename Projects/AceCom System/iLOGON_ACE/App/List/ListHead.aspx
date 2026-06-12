<%@ Page Language="c#" CodeBehind="ListHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.App.List.ListHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Search Results @ Listing</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <p>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                </p>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" Font-Bold="true"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="200" DataKeyNames="code">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="220px" Reorderable="false">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.code")%>' onclick="return confirm('Confirm delete list?')"
                                        onserverclick="ListHead_Delete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete List Header" title="Delete List Header"
                                            runat="server" /></a>
                                </ItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="code" SortExpression="code" HeaderText="Code">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef01" SortExpression="usrdef01" HeaderText="UserDef.01">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef02" SortExpression="usrdef02" HeaderText="UserDef.02">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef03" SortExpression="usrdef03" HeaderText="UserDef.03">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef04" SortExpression="usrdef04" HeaderText="UserDef.04">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef05" SortExpression="usrdef05" HeaderText="UserDef.05">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef06" SortExpression="usrdef06" HeaderText="UserDef.06">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef07" SortExpression="usrdef07" HeaderText="UserDef.07">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef08" SortExpression="usrdef08" HeaderText="UserDef.08">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef09" SortExpression="usrdef09" HeaderText="UserDef.09">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef10" SortExpression="usrdef10" HeaderText="UserDef.10">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="usrdef11" SortExpression="usrdef11" HeaderText="UserDef.11">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef12" SortExpression="usrdef12" HeaderText="UserDef.12">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef13" SortExpression="usrdef13" HeaderText="UserDef.13">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef14" SortExpression="usrdef14" HeaderText="UserDef.14">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef15" SortExpression="usrdef15" HeaderText="UserDef.15">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef16" SortExpression="usrdef16" HeaderText="UserDef.16">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef17" SortExpression="usrdef17" HeaderText="UserDef.17">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef18" SortExpression="usrdef18" HeaderText="UserDef.18">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef19" SortExpression="usrdef19" HeaderText="UserDef.19">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef20" SortExpression="usrdef20" HeaderText="UserDef.20">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="techspec" SortExpression="techspec" HeaderText="Tech.Spec">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
