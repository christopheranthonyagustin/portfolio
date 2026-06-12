<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencySummary.aspx.cs" Inherits="iWMS.Web.BillingManagement.BillingInstruction.CurrencySummary" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head id="Head1" runat="server">
  <title>CurrencySummary</title>
  <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body onload="javascript:window.focus();">
  <form id="form1" method="post" runat="server">
  <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td class="pagetitle">
        <asp:Label ID="IdLbl" runat="server" Text="CurrencySummary"></asp:Label>
      </td>
    </tr>
  </table>
  <br>
  <div id="div-datagrid" style="height: 90%">
    <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None"
      AllowSorting="true" GridLines="Both" CellPadding="2" UseAccessibleHeader="True"
      HorizontalAlign="Center">
      <AlternatingItemStyle CssClass="DGItem"></AlternatingItemStyle>
      <ItemStyle CssClass="DGAlternateItem"></ItemStyle>
      <Columns>
        <asp:BoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Cur"></asp:BoundColumn>
        <asp:BoundColumn DataField="totalamt" SortExpression="totalamt" HeaderText="Amount" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
      </Columns>
    </asp:DataGrid>
  </div>
  </form>
</body>
</html>
