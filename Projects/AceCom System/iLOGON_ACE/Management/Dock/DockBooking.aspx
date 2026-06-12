<%@ Page Language="c#" CodeBehind="DockBooking.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Management.Dock.DockBooking" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingSchedule</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="3" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <br />
    <br>
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    &nbsp;<asp:Button ID="FetchBtn" runat="server" Text="  Fetch  " CssClass="detailButton"
        OnClick="FetchBtn_Click"></asp:Button>
    <iWMS:iForm ID="formCtl2" runat="server" Visible="false"></iWMS:iForm>
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None"
            CellPadding="2" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
            </Columns>
        </asp:DataGrid>
        <br />
        &nbsp;<asp:Button ID="BookBtn" runat="server" Text="  Book  " CssClass="detailButton"
            Visible="false" OnClick="BookBtn_Click"></asp:Button>
    </div>
    </form>
</body>
</html>
