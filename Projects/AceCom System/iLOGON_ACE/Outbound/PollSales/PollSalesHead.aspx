<%@ Page Language="c#" CodeBehind="PollSalesHead.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.PollSales.PollSalesHead" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PollWRRHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:DataGrid ID="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False"
        AllowPaging="False" BorderStyle="None" GridLines="Both" CellPadding="2">
        <AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
        <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
        <HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
        <Columns>
            <asp:TemplateColumn>
                <ItemTemplate>
                    <asp:CheckBox ID="SelectCB" runat="server"></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn>
                <ItemTemplate>
                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Indicator">
                <ItemTemplate>
                    <img src='../../Image/<%# DataBinder.Eval(Container.DataItem, "SkusNotInAcc") %>.png'
                        alt="SKUs Indicator">
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateColumn>
            <asp:BoundColumn DataField="SkusNotInAcc" Visible="False"></asp:BoundColumn>
            <asp:BoundColumn DataField="acid" Visible="False"></asp:BoundColumn>
            <asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="id" SortExpression="id" HeaderText="Receipt#">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="priority" SortExpression="priority" HeaderText="Priority">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="exprcdate" SortExpression="exprcdate" HeaderText="Expected Date"
                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark 1">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark 2">
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
                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
        </Columns>
    </asp:DataGrid>
    <br>
    <asp:Button ID="PopulateBtn" runat="server" Text="Populate Sales" OnClick="PopulateBtn_Click">
    </asp:Button>
    </form>
</body>
</html>
