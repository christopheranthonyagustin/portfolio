<%@ Page Language="c#" CodeBehind="TransportAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Transporter2.TransportAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    <asp:DataGrid AutoGenerateColumns="False" ID="ResultDG" runat="server" AllowPaging="false"
        BorderStyle="None" CellPadding="2" DataKeyField="id" AllowSorting="True" UseAccessibleHeader="True">
        <AlternatingItemStyle CssClass="DGAlternateItem_MedFont"></AlternatingItemStyle>
        <ItemStyle CssClass="DGItem_MedFont"></ItemStyle>
        <Columns>
            <asp:TemplateColumn>
                <ItemStyle Wrap="False"></ItemStyle>
                <ItemTemplate>
                    <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:BoundColumn Visible="true" DataField="descr" SortExpression="descr" HeaderText="JobType">
                <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn Visible="false" DataField="usrdef02" SortExpression="usrdef02" HeaderText="Type">
                <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn Visible="false" DataField="item" SortExpression="item" HeaderText="Item">
                <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
        </Columns>
    </asp:DataGrid>
    <br />
    <br />
    </form>
</body>
</html>
