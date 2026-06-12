<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BIInvoiceAdd.aspx.cs" Inherits="iWMS.Web.BillingManagement.Invoice.BIInvoiceAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
  <title>VendorInvoiceAdd</title>
  <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
  <meta name="CODE_LANGUAGE" content="C#">
  <meta name="vs_defaultClientScript" content="JavaScript">
  <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
  <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
  <form id="Form1" method="post" runat="server">
  <br />
  &nbsp
  <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="formbtn" OnClick="AddBtn_Click" /><br>
  <br />
  <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
  &nbsp;&nbsp;
  <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Font-Bold="True" Visible="False"
    CssClass="errorLabel" />
  </form>
  <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
</body>
</html>
