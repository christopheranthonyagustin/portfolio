<%@ Page Language="c#" CodeBehind="TipAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.App.Tip.TipAdd" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TipAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:radtabstrip runat="server" id="RadTabStrip1" multipageid="RadMultiPage1" causesvalidation="false"
            autopostback="true" selectedindex="0" skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:radtabstrip>
        <br />
        <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="white" OnClick="AddBtn_Click"></asp:Button><br />
        <br>
        <iWMS:iForm id="formCtl" runat="server"></iWMS:iForm>&nbsp;
			<asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="formbtn" OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
    </form>
</body>
</html>
