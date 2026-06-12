<%@ Page Language="c#" CodeBehind="InvoiceAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Invoice.InvoiceAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <p>
        <br />
        &nbsp;<asp:Button ID="AddBtn" runat="server" Text="  Add  " CssClass="formbtn" OnClick="AddBtn_Click">
        </asp:Button>
        <br />
        <br>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="formbtn"
            OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
        <asp:Button Style="z-index: 0" ID="AddDetailBtn" runat="server" CssClass="formbtn"
            Text="Add Detail" Visible="False" OnClick="AddDetailBtn_Click"></asp:Button></p>
    <p>
        <asp:ValidationSummary Style="z-index: 0" ID="valSummary" runat="server" CssClass="RedText"
            HeaderText="The following field(s) need to be entered correctly:" DisplayMode="BulletList"
            EnableClientScript="true"></asp:ValidationSummary>
    </p>
    </form>
</body>
</html>
