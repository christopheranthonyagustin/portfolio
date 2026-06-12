<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EASGL.aspx.cs" Inherits="iWMS.Web.BillingManagement.Interface.EASGL" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
  <title>EASGL</title>
	<script src="../../js/CastleBusyBox.js" language="javascript"></script>
  <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
  <meta content="C#" name="CODE_LANGUAGE">
  <meta content="JavaScript" name="vs_defaultClientScript">
  <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
  <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
  <style type="text/css">
    .preSpacing
    {
        white-space:pre;
    }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
  <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
  <form id="Form1" method="post" runat="server" style="z-index: 0">
  <table id="FormTable" border="0" cellspacing="2" cellpadding="2" width="100%" runat="server">
    <tr>
    <td align="left">
      <asp:button id="RetrieveBtn" runat="server" Text="Retrieve" CssClass="detailbutton" onclick="RetrieveBtn_Click" OnClientClick="busyBox.Show();"/>
    </td>
    <td align="right">
      <asp:ImageButton ID="excel_ImgBtn" runat="server" onclick="ExportExcel" ImageUrl="~/Image/excel.gif" height="20" Visible="false"/>
			<%--<A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
					height="20" runat="server"></A>--%>
		</td>
    </tr>
  </table>
	<div style="HEIGHT: 90%" id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" UseAccessibleHeader="True" CellPadding="2"
			GridLines="Both" BorderStyle="None" AutoGenerateColumns="True">
			<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
			<ItemStyle CssClass="DGItem"></ItemStyle>
		</asp:datagrid></div>  
  </form>
		<iframe id="BusyBoxIFrame" ondrop="return false;" frameBorder="0" name="BusyBoxIFrame" scrolling="no"></iframe>
   <script>
       // Instantiate our BusyBox object
       var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
   </script>
</body>
</html>
