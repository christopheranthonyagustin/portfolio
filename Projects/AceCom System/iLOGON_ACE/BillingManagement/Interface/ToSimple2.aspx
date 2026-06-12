<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ToSimple2.aspx.cs" Inherits="iWMS.Web.BillingManagement.Interface.ToSimple2" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
  <title>ToSimple(Manual Import)</title>
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
      <td colspan="2">
        <asp:Label ID="headerLbl1" runat="server" CssClass="pagetitle" Text="To Simple:"></asp:Label><br />
        <br />
      </td>
    </tr>
    <tr>
      <td>
        <asp:Label ID="ToDate" runat="server" Text="ToDate" Width="50px"></asp:Label>&nbsp; &nbsp; &nbsp;
        <asp:TextBox runat="server" ID="ToDateTxt" Width="150px" BackColor="Yellow"></asp:TextBox> <br /><br />
        <asp:Label ID="Acc_Lbl" runat="server" Text="Account" Width="50px"/>&nbsp; &nbsp; &nbsp;
        <asp:DropDownList ID="Acc_ddl" runat="server" Width="150px" />
        <asp:CalendarExtender ID="ToDate_CalendarExtender" runat="server" Enabled="True"
          TargetControlID="ToDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
          Format="dd/MMM/yyyy" /> 
        <asp:RequiredFieldValidator ID="ToDate_ReqFieldValid" runat="server" ControlToValidate="ToDateTxt" 
              ErrorMessage="*" SetFocusOnError="true" EnableClientScript="true" />
        <br />
        <br />
      </td>
    </tr>
    <tr>
      <td colspan="2" align="right">
        <asp:Button ID="RetrieveBtn" CssClass="formbtn" Text="Retrieve" runat="server" OnClick="RetrieveBtn_Click" /> &nbsp;&nbsp;
        <asp:ImageButton ID="excel_ImgBtn" runat="server" onclick="ExportExcel" ImageUrl="~/Image/excel.gif" height="20" Visible="false"/>
        <br />
        <asp:Label ID="lblErrDownload" CssClass="BlackText" runat="server" Visible="False"
          Text="Please fill in all information before clicking Retrieve." ForeColor="#FF0000"></asp:Label>
        <br />
        <br />
      </td>
    </tr>
  </table>
  <div id="div-datagrid" style="height: 90%">
    <asp:DataGrid id="ResultDG" Runat="server" AutoGenerateColumns="true" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True" ItemStyle-CssClass="preSpacing">
      <AlternatingItemStyle CssClass="DGItem"></AlternatingItemStyle>
      <ItemStyle CssClass="DGAlternateItem"></ItemStyle>
    </asp:DataGrid>    
  </div>
  </form>
</body>
</html>
