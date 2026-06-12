<%@ Page Language="c#" CodeBehind="PeriodicCtnrItemDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Periodic.PeriodicCtnrItemDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PeriodicCtnrItemDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
            </td>
            <td align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label><asp:Button ID="AddDetailBtn" runat="server" Text="+ Item"
                        Visible="False" CssClass="detailButton" OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div style="height: 80%" id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" PageSize="8" GridLines="Both" CellPadding="2"
            AutoGenerateColumns="False" DataKeyField="id" OnItemCommand="CtnrItemDetail_Edit"
            AllowSorting="True" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="CtnrItemDetail_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                runat="server"></a>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU Code">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SKU Description">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="skupacking" SortExpression="skupacking" HeaderText="Packing">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="outerqty" SortExpression="outerqty" HeaderText="Billable Qty"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="outeruom" SortExpression="outeruom" HeaderText="Billable UOM">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="currlotno" SortExpression="currlotno" HeaderText="LOT">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="inmostqty" SortExpression="inmostqty" HeaderText="LHU Qty"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="TopAndBottom" Mode="NumericPages">
            </PagerStyle>
        </asp:DataGrid></div>
    </form>
</body>
</html>
