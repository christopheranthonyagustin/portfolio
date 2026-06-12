<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportPerHeadDetl.aspx.cs" Inherits="iWMS.Web.Job.TransporterCTNR.TransportPerHeadDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransportManpowerDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <asp:Button ID="AddDetailBtn" runat="server" Text="NewLine" Visible="False" CssClass="detailButton"
                    OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>&nbsp;
            </td>
            <td class="pagetitle">
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
        Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
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
                        <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="PerHeadDetail_Edit"
                            runat="server">
                            <img id="editImg" src="../../image/pencil.gif" width="15" height="15" border="0"
                                alt="Edit" title="Edit" runat="server" /></a>
                        <asp:Label ID="DetailLbl" runat="server" />
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="PerHeadDetail_Delete" runat="server">
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
                <telerik:GridBoundColumn HeaderText="Reference" DataField="perhno" AllowFiltering="true"
                    ColumnGroupName="perhno" SortExpression="perhno" UniqueName="perhno" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Type" DataField="perhtypedescr" AllowFiltering="true"
                    ColumnGroupName="perhtypedescr" SortExpression="perhtypedescr" UniqueName="perhtypedescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ExpDate" DataField="expdate" AllowFiltering="true"
                    ColumnGroupName="expdate" SortExpression="expdate" UniqueName="expdate" Reorderable="true"
                    DataFormatString="{0:dd-MMM-yy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="CollectFr" DataField="frservicept" AllowFiltering="true"
                    ColumnGroupName="frservicept" SortExpression="frservicept" UniqueName="frservicept"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FrAddr" DataField="fraddr" AllowFiltering="true"
                    ColumnGroupName="fraddr" SortExpression="fraddr" UniqueName="fraddr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="DeliverTo" DataField="toservicept" AllowFiltering="true"
                    ColumnGroupName="toservicept" SortExpression="toservicept" UniqueName="toservicept"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ToAddr" DataField="toaddr" AllowFiltering="true"
                    ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Remarks" DataField="remarks" AllowFiltering="true"
                    ColumnGroupName="remarks" SortExpression="remarks" UniqueName="remarks" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="GoodsWt" DataField="goodswt" AllowFiltering="true"
                    ColumnGroupName="goodswt" SortExpression="goodswt" UniqueName="goodswt" Reorderable="true"
                    ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.000}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="GoodsVol" DataField="goodsvol" AllowFiltering="true"
                    ColumnGroupName="goodsvol" SortExpression="goodsvol" UniqueName="goodsvol" Reorderable="true"
                    ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.000}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="NoOfPackages" DataField="noofpkg" AllowFiltering="true"
                    ColumnGroupName="noofpkg" SortExpression="noofpkg" UniqueName="noofpkg" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="NoOfPallets" DataField="noofplt" AllowFiltering="true"
                    ColumnGroupName="noofplt" SortExpression="noofplt" UniqueName="noofplt" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="VendorCode" DataField="tptercode" AllowFiltering="true"
                    ColumnGroupName="tptercode" SortExpression="tptercode" UniqueName="tptercode"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="VendorName" DataField="tptername" AllowFiltering="true"
                    ColumnGroupName="tptername" SortExpression="tptername" UniqueName="tptername"
                    Reorderable="true">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
