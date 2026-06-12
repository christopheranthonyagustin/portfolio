<%@ Page Language="c#" CodeBehind="Additional.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.Additional" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Additional</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <br />
                        &nbsp;<asp:Button ID="SaveBtn" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn_Click"></asp:Button><br />
                    </div>
                </td>
                <td align="right">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <table border="0" cellspacing="2" cellpadding="2">
                        <tr>
                            <td>Inv.Count#</td>
                            <td>:
									<asp:TextBox ID="IcIdTxt" runat="server" AutoPostBack="True" BackColor="Yellow"></asp:TextBox><asp:RequiredFieldValidator ID="IcIdReq" runat="server" ControlToValidate="IcIdTxt" ErrorMessage="*"></asp:RequiredFieldValidator><asp:CompareValidator ID="IcIdVal" runat="server" ControlToValidate="IcIdTxt" ErrorMessage="#" Operator="DataTypeCheck"
                                        Type="Integer"></asp:CompareValidator></td>
                        </tr>
                        <tr>
                            <td>Person In Charge</td>
                            <td>:
									<asp:TextBox ID="PicTxt" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <asp:Panel ID="detailPanel" runat="server" Visible="False">
                        <table id="Table1" border="0" cellspacing="0" cellpadding="2">
                            <tr>
                                <td colspan="4">
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                            </tr>
                            <tr>
                                <td nowrap>SKU:
										<asp:RequiredFieldValidator ID="SkuVal" runat="server" ErrorMessage="*" ControlToValidate="SkuTxt"></asp:RequiredFieldValidator><br>
                                    <asp:TextBox ID="SkuTxt" runat="server" BackColor="Yellow"></asp:TextBox></td>
                                <td nowrap>Counted Qty(EA):
										<asp:RequiredFieldValidator ID="QtyReqVal" runat="server" ErrorMessage="*" ControlToValidate="QtyTxt"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="QtyVal" runat="server" ErrorMessage="#" ControlToValidate="QtyTxt" Type="Integer"
                                        Operator="DataTypeCheck"></asp:CompareValidator><br>
                                    <asp:TextBox ID="QtyTxt" runat="server" BackColor="Yellow"></asp:TextBox></td>
                                <td nowrap>
                                    <p>
                                        Remark:<br>
                                        <asp:TextBox ID="RemarkTxt" runat="server"></asp:TextBox>
                                    </p>
                                </td>
                                <td nowrap></td>
                            </tr>
                            <tr>
                                <td>Location:
										<asp:RequiredFieldValidator ID="LocReq" runat="server" ErrorMessage="*" ControlToValidate="LocTxt"></asp:RequiredFieldValidator><br>
                                    <asp:TextBox ID="LocTxt" runat="server" BackColor="Yellow"></asp:TextBox></td>
                                <td>TU#1:
										<asp:RequiredFieldValidator ID="Tu1Req" runat="server" ErrorMessage="*" ControlToValidate="Tu1Txt"></asp:RequiredFieldValidator><br>
                                    <asp:TextBox ID="Tu1Txt" runat="server" BackColor="Yellow"></asp:TextBox></td>
                                <td>TU#2 :
										<asp:RequiredFieldValidator ID="Tu2Req" runat="server" ErrorMessage="*" ControlToValidate="Tu2Txt"></asp:RequiredFieldValidator><br>
                                    <asp:TextBox ID="Tu2Txt" runat="server" BackColor="Yellow"></asp:TextBox></td>
                                <td>Receive Date:<br>
                                    <asp:TextBox ID="RcDateTxt" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Lot 1:<br>
                                    <asp:TextBox ID="Lot1Txt" runat="server"></asp:TextBox></td>
                                <td>Lot 2:<br>
                                    <asp:TextBox ID="Lot2Txt" runat="server"></asp:TextBox></td>
                                <td>Lot 3:<br>
                                    <asp:TextBox ID="Lot3Txt" runat="server"></asp:TextBox></td>
                                <td>Lot 4:<br>
                                    <asp:TextBox ID="Lot4Txt" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Lot 5:<br>
                                    <asp:TextBox ID="Lot5Txt" runat="server"></asp:TextBox></td>
                                <td>Lot 6:<br>
                                    <asp:TextBox ID="Lot6Txt" runat="server"></asp:TextBox></td>
                                <td>Lot 7:<br>
                                    <asp:TextBox ID="Lot7Txt" runat="server"></asp:TextBox></td>
                                <td>Lot 8:<br>
                                    <asp:TextBox ID="Lot8Txt" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <div style="height: 50%" id="div-datagrid">
            <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" GridLines="Both" BorderStyle="None"
                PageSize="8" AutoGenerateColumns="False" DataKeyField="id" UseAccessibleHeader="True">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <Columns>
                    <asp:TemplateColumn>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete inv.count?')" onserverclick="ICDetl_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
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
                    <asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot ID">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="tuno1" SortExpression="tuno2" HeaderText="TU#1">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="countedqty" SortExpression="countedqty" HeaderText="Counted Qty">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Rcv.Date" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot 1" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot 2" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot 3" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot 4">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot 5">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot 6">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot 7">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot 8">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>
