<%@ Page Language="c#" CodeBehind="TransportTaskDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterCT.TransportTaskDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportTaskDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                <asp:Button ID="AddDetailBtn" runat="server" Text="New Line" Visible="False" CssClass="detailButton"
                    OnClick="AddDetailBtn_Click"></asp:Button>
            </td>
            <td align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="true"
        AllowFilteringByColumn="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
        OnEditCommand="ResultDG_Edit">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="TaskDetail_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                title="Delete Detail" runat="server" /></a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderText="S/N">
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="Task" DataField="taskcodedescr" AllowFiltering="true"
                    ColumnGroupName="taskcodedescr" SortExpression="taskcodedescr" UniqueName="taskcodedescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridDateTimeColumn HeaderText="Start Date" DataField="startdate" AllowFiltering="true"
                    ColumnGroupName="startdate" SortExpression="startdate" UniqueName="startdate"
                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss tt}">
                </telerik:GridDateTimeColumn>
                <telerik:GridBoundColumn HeaderText="Start Status" DataField="startstatusdescr" AllowFiltering="true"
                    ColumnGroupName="startstatusdescr" SortExpression="startstatusdescr" UniqueName="startstatusdescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Start Reason" DataField="startreason" AllowFiltering="true"
                    ColumnGroupName="startreason" SortExpression="startreason" UniqueName="startreason"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Start Remarks" DataField="startremarks" AllowFiltering="true"
                    ColumnGroupName="startremarks" SortExpression="startremarks" UniqueName="startremarks"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridDateTimeColumn HeaderText="End Date" DataField="enddate" AllowFiltering="true"
                    ColumnGroupName="enddate" SortExpression="enddate" UniqueName="enddate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy hh:mm:ss tt}">
                </telerik:GridDateTimeColumn>
                <telerik:GridBoundColumn HeaderText="End Status" DataField="endstatusdescr" AllowFiltering="true"
                    ColumnGroupName="endstatusdescr" SortExpression="endstatusdescr" UniqueName="endstatusdescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="End Reason" DataField="endreason" AllowFiltering="true"
                    ColumnGroupName="endreason" SortExpression="endreason" UniqueName="endreason"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="End Remarks" DataField="endremarks" AllowFiltering="true"
                    ColumnGroupName="endremarks" SortExpression="endremarks" UniqueName="endremarks"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Resource" DataField="resource" AllowFiltering="true"
                    ColumnGroupName="resource" SortExpression="resource" UniqueName="resource" Reorderable="true">
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
