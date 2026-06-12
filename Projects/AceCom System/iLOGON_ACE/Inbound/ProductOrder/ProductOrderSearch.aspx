<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="ProductOrderSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.ProductOrder.ProductOrderSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RegisterLotNo</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    &nbsp;<asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="detailbutton"
        OnClick="SearchBtn_Click"></asp:Button><br />
    <br />
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    </form>
</body>
</html>
