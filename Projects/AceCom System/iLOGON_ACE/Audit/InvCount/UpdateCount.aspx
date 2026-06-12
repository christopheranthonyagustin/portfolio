<%@ Page Language="c#" CodeBehind="UpdateCount.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.UpdateCount" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>UpdateCount</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <table cellspacing="2" cellpadding="2" width="100%" border="0">
            <tr>
                <br />
                &nbsp;<asp:Button ID="RetrieveBtn" runat="server" Text="Retrieve" CssClass="white" OnClick="RetrieveBtn_Click"></asp:Button><br />
            </tr>
            <tr>
                <td width="15%" style="height: 25px">Inv.Count List#</td>
                <td style="height: 25px">:<asp:TextBox ID="IcIdTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="IcIdReq" runat="server" ControlToValidate="IcIdTxt" ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Reprint#</td>
                <td>:<asp:TextBox ID="ReprintTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReprintReq" runat="server" ControlToValidate="ReprintTxt" ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>From Line#</td>
                <td>:<asp:TextBox ID="FromLineTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FromLineReq" runat="server" ControlToValidate="FromLineTxt" ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>To Line#</td>
                <td>:<asp:TextBox ID="ToLineTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ToLineReq" runat="server" ControlToValidate="ToLineTxt" ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Person In Charge</td>
                <td>:<asp:TextBox ID="PicTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="PicTxt" ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;<input type="button" value="Cancel" class="white">&nbsp;
						<asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label></td>
            </tr>
        </table>
        <asp:Label ID="UpdateMsgLbl" runat="server" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <div id="div-datagrid" style="height: 50%">
            <asp:DataGrid ID="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" BorderStyle="None"
                GridLines="Both" CellPadding="2" PageSize="8" UseAccessibleHeader="True">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <Columns>
                    <asp:BoundColumn DataField="line" SortExpression="line" HeaderText="Line#">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="SKU/Description" SortExpression="skucode">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skucode") %>' ID="SkuCodeLbl" /><br>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skudescr") %>' ID="SkuDescrLbl" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Count Qty(EA)">
                        <ItemTemplate>
                            <asp:TextBox runat="server" Width="60px" ID="QtyTxt" Text='<%# DataBinder.Eval(Container.DataItem, "countedqty") %>'>
                            </asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Remark">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="RemarkTxt" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'>
                            </asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Receive Date" DataFormatString="{0:dd/MMM/yyyy}">
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
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
            </asp:DataGrid>
        </div>
        <asp:Button ID="UpdateBtn" runat="server" Text="Update Count Qty" Visible="False" CssClass="detailButton" OnClick="UpdateBtn_Click"></asp:Button></TD></TR>
    </form>
</body>
</html>
