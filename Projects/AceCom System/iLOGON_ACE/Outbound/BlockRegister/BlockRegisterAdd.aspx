<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockRegisterAdd.aspx.cs" Inherits="iWMS.Web.Outbound.BlockRegister.BlockRegisterAdd" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>InvHoldAdd</title>
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
    &nbsp;<telerik:RadButton ID="AddBtn" runat="server" Text="   Add   " CssClass="formbtn" Skin="WebBlue"
        OnClick="AddBtn_Click"></telerik:RadButton><br />
    <br />
    <span class="pagetitle">&nbsp;</span>
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    &nbsp;
    <%--<telerik:RadButton ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="formbtn" Skin="WebBlue"
        OnClick="UpdateBtn_Click"></telerik:RadButton>--%>&nbsp;
    <%--<telerik:RadButton ID="AddDetailBtn" runat="server" Text="Add Detail" Visible="False" CssClass="formbtn" Skin="WebBlue"
        OnClick="AddDetailBtn_Click"></telerik:RadButton>--%>
    </form>
</body>
</html>

