<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorInvoice.aspx.cs" Inherits="iWMS.Web.BillingManagement.VendorInvoice.VendorInvoice" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>BIVendorInvoice</title>
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
    <div>
      <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
          <td colspan="2">
            <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle" /><br />
          </td>
        </tr>
        <tr>
          <td>
              <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>       
          </td>
          <td valign="bottom">
            <table>
              <tr>
                <td>
                  <asp:Label ID="TotalFCLbl" runat="server" Text="TotalFCAmt" />
                  <asp:TextBox ID="TotalFCamt_Tbox" runat="server" Enabled="false"/>
                </td>
                <td>
                  <asp:Label ID="TotalLCLbl" runat="server" Text="TotalLCAmt"/>
                  <asp:TextBox ID="TotalLCamt_Tbox" runat="server" Enabled="false" />
                </td>
              </tr>            
            </table>        
          </td>
        </tr>
        <tr>
          <td align="right" colspan="2">
            <asp:Button ID="GenBtn" runat="server" Text="Generate" Visible="true" CssClass="detailButton" OnClick="GenBtn_Click" />
          </td>
        </tr>
      </table>
        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
      <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    </div>
    </form>
</body>
</html>