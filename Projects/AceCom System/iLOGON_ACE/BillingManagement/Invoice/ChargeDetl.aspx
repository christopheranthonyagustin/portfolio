<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChargeDetl.aspx.cs" Inherits="iWMS.Web.BillingManagement.Invoice.ChargeDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Charge</title>
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
      <table id="tbl2" border="0" cellspacing="1" cellpadding="1" width="100%">
        <tr>          
          <td align="left">
            <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="true" CssClass="detailButton"
                OnClick="UpdateBtn_Click"></asp:Button>
          </td>
        </tr>
        <tr>
          <td>
            <table border="0" cellpadding="2" cellspacing="2">
              <tr>
                <td Width="160px" > <asp:Label ID="ChargeLbl" runat="server" Text="ChargeCode" />  <br />
                  <asp:DropDownList ID="ChargeCodeList" runat="server" Enabled="false" DataTextField="chargecode" DataValueField="chargeid" Width="160px" />
                </td>
                <td Width="160px" > <asp:Label ID="doinvLbl" runat="server" Text="DO/Inv" /> <br />
                  <asp:DropDownList ID="DOInvList" runat="server" Enabled="false" DataTextField="doinvno" DataValueField="id" Width="160px" />
                </td>
                <td Width="160px" > <asp:Label ID="AccLbl" runat="server" Text="Customer" />  <br />
                  <asp:DropDownList ID="AccountList" runat="server" Enabled="false" DataTextField="code" DataValueField="id" Width="160px" />
                </td>
                <td Width="160px" > <asp:Label ID="DivLbl" runat="server" Text="Division" />  <br />
                  <asp:DropDownList ID="DivisionList" runat="server" Enabled="false" DataTextField="divname" DataValueField="divcode" Width="160px" />
                </td>
              </tr>
            </table>           
          </td>
        </tr>
        <tr>
          <td>
            <iwms:iform id="formCtl" runat="server"></iwms:iform>
          </td>
        </tr>
      </table>
    </div>
    </form>
</body>
</html>
