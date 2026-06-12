<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="InLotValueSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InLotValue.InLotValueSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InLotValueSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <telerik:radtabstrip runat="server" id="RadTabStrip1" multipageid="RadMultiPage1" causesvalidation="false"
        autopostback="true" selectedindex="0" skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:radtabstrip>
    <br />
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">

        <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="white" OnClick="SearchBtn_Click"></asp:Button>&nbsp;<asp:Label ID="RemarkLbl" runat="server">(At least 1 search content needed)</asp:Label><br>
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
			&nbsp;
			<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    </form>
</body>
</html>
