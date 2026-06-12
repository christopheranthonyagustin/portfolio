<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BOMRegisterLoan.aspx.cs" Inherits="iWMS.Web.VAS.BOMRegister.BOMRegisterLoan" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>BOMRegisterLoan</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">BOMRegisterLoan</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MsgLbl" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <br />
                &nbsp;<telerik:RadButton ID="ConfirmBtn" runat="server" Skin="WebBlue" Text="  Ok  "
                OnClick="ConfirmBtn_Click" SingleClick="true" SingleClickText="Processing..."></telerik:RadButton>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
