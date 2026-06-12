<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SIVEDI.aspx.cs" Inherits="iWMS.Web.Outbound.SIV.SIVEDI" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>SIVEDI</title>
 <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />

</head>

<form id="form1" method="post" runat="server">
<asp:ScriptManager id="ToolkitScriptManager1" runat="server" />
<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td>
        <br />
        <br />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </td>
    </tr>
</table>
 <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>       
            <td align="center">               
                <telerik:radbutton id="CloseBtn" runat="server" text="Close" visible="true"
                    cssclass="detailButton" onclick="CloseBtn_Click" skin="WebBlue">
                </telerik:radbutton>                 
            </td>
      </tr>
     </table>

</form>
</body>
</html>
