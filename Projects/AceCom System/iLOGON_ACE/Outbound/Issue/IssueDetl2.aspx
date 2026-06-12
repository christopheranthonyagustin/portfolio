<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="IssueDetl2.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Issue.IssueDetl2" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueDetl2</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <br />
                &nbsp;<iWMS:iPopup ID="InputPopup" runat="server" Type="BTN" PageUrl="DetailInput.aspx"
                    InputBoxHeight="230" InputBoxWidth="500" ButtonText="+ Detail" Mode="ADD" Visible="False">
                </iWMS:iPopup>
                <asp:Label ID="IssueIdLbl" runat="server" CssClass="pagetitle"></asp:Label><br />
                <br />
            </td>
            <td align="right">
                &nbsp;
                <asp:Button Style="z-index: 0" ID="InputPopupMultipleBtn" runat="server" Visible="False"
                    CssClass="detailButton" Text="+ Details" OnClick="InputPopupMultipleBtn_Click">
                </asp:Button>&nbsp;&nbsp;
                <asp:Button Style="z-index: 0" ID="MoreFunctionBtn" runat="server" Visible="False"
                    Text="+ More Functions" CssClass="detailButton" OnClick="MoreFunctionBtn_Click">
                </asp:Button>
                &nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" AllowSorting="False" PageSize="8" BorderStyle="None"
            GridLines="Both" CellPadding="2" AutoGenerateColumns="False" DataKeyField="id"
            UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn Visible="False">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="lnkBOM" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="BOM_Explode"
                            onclick="return confirm('Confirm Explode BOM?')" runat="server">
                            <img id="BOMImg" src="..\..\image\BOM.png" width="15" height="15" border="0" alt="Explode BOM"
                                runat="server"></a> <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                    onclick="return confirm('Confirm delete Issue Detail?')" onserverclick="IsDetail_Delete"
                                    runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Issue Detail"
                                        runat="server"></a>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="line" SortExpression="line" HeaderText="Line#" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="skuid" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                    Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shelflife" SortExpression="shelflife" HeaderText="Shelf Life"
                    Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="expecteduomqty" SortExpression="expecteduomqty" HeaderText="Expected"
                    DataFormatString="{0:0.00}">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="allocateduomqty" SortExpression="allocateduomqty" HeaderText="Allocated"
                    DataFormatString="{0:0.00}" Visible="False">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="pickeduomqty" SortExpression="pickeduomqty" HeaderText="Picked"
                    DataFormatString="{0:0.00}" Visible="False">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="packeduomqty" SortExpression="packeduomqty" HeaderText="Packed"
                    DataFormatString="{0:0.00}" Visible="False">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shippeduomqty" SortExpression="shippeduomqty" HeaderText="Shipped"
                    DataFormatString="{0:0.00}" Visible="False">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Rcv Date"
                    DataFormatString="{0:dd/MMM/yyyy}" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot 1" DataFormatString="{0:dd/MMM/yyyy}"
                    Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot 2" DataFormatString="{0:dd/MMM/yyyy}"
                    Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot 3" DataFormatString="{0:dd/MMM/yyyy}"
                    Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot 4" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot 5" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot 6" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot 7" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot 8" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
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
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                    Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="bom_sku" Visible="False"></asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </asp:DataGrid></div>
    </form>
</body>
</html>
