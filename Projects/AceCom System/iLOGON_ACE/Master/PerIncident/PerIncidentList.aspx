<%@ Page Language="c#" CodeBehind="PerIncidentList.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.PerIncident.PerIncidentList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PerIncident</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
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
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                        EnableLinqExpressions="false" AllowPaging="true"
                        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnEditCommand="ResultDG_EditCommand"
                        OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50"
                            DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                                        <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>

                                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                            onserverclick="PerIncidentDelete" runat="server">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete incidentDetl"
                                                runat="server"></a>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="Incident#"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="incidentdate" SortExpression="incidentdate" HeaderText="Incident Date"
                                    DataFormatString="{0:dd/MMM/yyyy}"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Personnel"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehdescr" SortExpression="vehdescr" HeaderText="Vehicle"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="jbno" SortExpression="jbno" HeaderText="JobNo"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="smancodedescr" SortExpression="smancodedescr" HeaderText="Salesman"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="findings" SortExpression="findings" HeaderText="Findings"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="resolution" SortExpression="resolution" HeaderText="Resolution"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="closedate" SortExpression="closedate" HeaderText="Closedate"
                                    DataFormatString="{0:dd/MMM/yyyy}"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Statusdescr" SortExpression="Statusdescr" HeaderText="Status"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                                    HeaderText="EditUser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="imagetype" Display="False"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" Display="False"
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
