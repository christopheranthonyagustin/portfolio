<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TunoAdd.aspx.cs" Inherits="iWMS.Web.Master.TUNO.TunoAdd" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>TunoAdd</title> <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    &nbsp;<telerik:RadButton ID="AddBtn" runat="server" Text=" Add " CssClass="detailbutton" Skin="WebBlue"
        OnClick="AddBtn_Click"></telerik:RadButton>
    <br />
    <br>
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    &nbsp;
    <telerik:RadButton ID="UpdateBtn" runat="server" Text="Update" CssClass="detailbutton" Skin="WebBlue" Visible="False"
        OnClick="UpdateBtn_Click"></telerik:RadButton>    
    </form>
</body>
</html>