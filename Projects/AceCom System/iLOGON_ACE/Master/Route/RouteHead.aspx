<%@ Page Language="c#" CodeBehind="RouteHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Route.RouteHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RouteHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <div id="div-datagrid" style="height: 100%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Height="99%"
                AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
                OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound"
                OnDetailTableDataBind="ResultDG_DetailTableDataBind">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Scrolling AllowScroll="true" SaveScrollPosition="true" UseStaticHeaders="true" />
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="500" Name="ParentGrid" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <%-- <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.route")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="Route_Delete" runat="server">
                                <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Route" title="Delete Route"
                                    runat="server" /></a>--%>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="route" SortExpression="route" HeaderText="Route">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                       <%-- <telerik:GridBoundColumn DataField="frzipcode" SortExpression="frzipcode" HeaderText="Fr Zip Code" DataType="System.String">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tozipcode" SortExpression="tozipcode" HeaderText="To Zip Code">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status Descr"
                            AllowFiltering="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                            AllowFiltering="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                            AllowFiltering="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <DetailTables>
                        <telerik:GridTableView DataKeyNames="routeid" Name="ChildGrid" Width="100%" SkinID="Telerik" AllowPaging="false"
                            AllowFilteringByColumn="false">
                            <HeaderStyle Wrap="false" BackColor="#05538C" ForeColor="White" />
                            <ItemStyle Wrap="true" />
                            <AlternatingItemStyle Wrap="true" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="fakeicon" AllowFiltering="false" ItemStyle-Width="20px">
                                    <HeaderTemplate>
                                        <asp:Label ID="CheckFakeId" runat="server" Visible="false" ></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                       <asp:Label ID="CheckFakeId2" runat="server" Visible="false" ></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="seqno" SortExpression="seqno" HeaderText="SeqNo" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="FrPostalCode" SortExpression="FrPostalCode" HeaderText="FrPostalCode" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ToPostalCode" SortExpression="ToPostalCode" HeaderText="ToPostalCode" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                    AllowFiltering="false">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false" >
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                    AllowFiltering="false" >
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>                              
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
