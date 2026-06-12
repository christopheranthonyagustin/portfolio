<%@ Page Language="c#" CodeBehind="VehOffList.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.VehOff.VehOffList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<title>VehOff</title>
<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
<meta name="CODE_LANGUAGE" content="C#">
<meta name="vs_defaultClientScript" content="JavaScript">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
<link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
<html>
<head runat="server">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
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
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <div id="div-datagrid" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                        OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
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
                                        <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                            onserverclick="VehOffDelete" runat="server">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete vehOff"
                                                runat="server"></a>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Driver"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vofftypedescr" SortExpression="vofftypedescr"
                                    HeaderText="Type" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="frdate" SortExpression="frdate" HeaderText="FrDate"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="todate" SortExpression="todate" HeaderText="ToDate"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="voffdeploydescr" SortExpression="voffdeploydescr"
                                    HeaderText="CanDeploy" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="voffsatusdescr" SortExpression="voffsatusdescr"
                                    HeaderText="Status" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
