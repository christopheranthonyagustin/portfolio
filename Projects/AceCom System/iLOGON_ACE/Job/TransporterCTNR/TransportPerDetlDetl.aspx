<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportPerDetlDetl.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterCTNR.TransportPerDetlDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransportPersonnelDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <asp:Button ID="GenerateTripBtn" runat="server" CssClass="detailButton" OnClick="GenerateManpower_Click"
                    Text="GenerateManpower" />
                &nbsp;<asp:Button ID="VoidAllBtn" runat="server" CssClass="detailButton" OnClientClick="return confirm('Confirm VoidAll?')"
                    OnClick="VoidAllBtn_Click" Text="VoidAll" />
                <asp:Button ID="AddDetailBtn" runat="server" Text="+ Item" Visible="False" CssClass="detailButton">
                </asp:Button>&nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>
            </td>
            <td class="pagetitle">
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
        Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" PageSize="200">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="PerDetlDetail_Edit"
                            runat="server">
                            <img id="editImg" src="../../image/pencil.gif" width="15" height="15" border="0"
                                alt="Edit" title="Edit" runat="server" /></a> <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                    onclick="return confirm('Confirm copy?')" onserverclick="PerDetlDetail_Copy"
                                    runat="server">
                                    <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                        title="Copy" runat="server" /></a> <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                            onclick="return confirm('Confirm delete?')" onserverclick="PerDetlDetail_Delete"
                                            runat="server">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                                title="Delete Detail" runat="server" /></a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="ReferenceNo" DataField="perhno" AllowFiltering="true"
                    ColumnGroupName="perhno" SortExpression="perhno" UniqueName="perhno" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                    ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="typedescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Personnel" DataField="pername" AllowFiltering="true"
                    ColumnGroupName="pername" SortExpression="pername" UniqueName="pername" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ExpDate" DataField="frexpdate" AllowFiltering="true"
                    ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FrActTime" DataField="fracttime" AllowFiltering="true"
                    ColumnGroupName="fracttime" SortExpression="fracttime" UniqueName="fracttime"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ToActTime" DataField="toacttime" AllowFiltering="true"
                    ColumnGroupName="toacttime" SortExpression="toacttime" UniqueName="toacttime"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TotHours" DataField="tothours" AllowFiltering="true"
                    ColumnGroupName="tothours" SortExpression="tothours" UniqueName="tothours" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem1" AllowFiltering="true"
                    ColumnGroupName="rem1" SortExpression="rem1" UniqueName="rem1" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FrSvcPt" DataField="frservicept" AllowFiltering="true"
                    ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="true"
                    ColumnGroupName="fraddr" SortExpression="fraddr" UniqueName="fraddr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ToSvcPt" DataField="toservicept" AllowFiltering="true"
                    ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="true"
                    ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
